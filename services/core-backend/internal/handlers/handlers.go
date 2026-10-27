package handlers

import (
	"database/sql"
	"net/http"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"

	"cefr-core-backend/internal/auth"
	"cefr-core-backend/internal/models"
	"cefr-core-backend/internal/repository"
)

type Handler struct {
	repo      *repository.Repository
	jwtSecret string
}

func NewHandler(repo *repository.Repository, jwtSecret string) *Handler {
	return &Handler{
		repo:      repo,
		jwtSecret: jwtSecret,
	}
}

// Auth Handlers
func (h *Handler) Register(c *gin.Context) {
	var req models.RegisterRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Yangi ro'yxatdan o'tuvchilar har doim standart 'student' rolini oladi
	role := "student"

	hash, err := auth.HashPassword(req.Password)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to hash password"})
		return
	}

	user, err := h.repo.CreateUser(req.Email, hash, req.FullName, role)
	if err != nil {
		c.JSON(http.StatusConflict, gin.H{"error": "Email already registered or database error"})
		return
	}

	token, err := auth.GenerateToken(user.ID, user.Email, user.Role, h.jwtSecret)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to generate token"})
		return
	}

	c.JSON(http.StatusCreated, models.AuthResponse{
		Token: token,
		User:  *user,
	})
}

func (h *Handler) Login(c *gin.Context) {
	var req models.LoginRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	user, err := h.repo.GetUserByEmail(req.Email)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid email or password"})
		return
	}

	if !auth.CheckPassword(req.Password, user.PasswordHash) {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid email or password"})
		return
	}

	token, err := auth.GenerateToken(user.ID, user.Email, user.Role, h.jwtSecret)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to generate token"})
		return
	}

	c.JSON(http.StatusOK, models.AuthResponse{
		Token: token,
		User:  *user,
	})
}

func (h *Handler) Me(c *gin.Context) {
	userID := c.GetInt("user_id")
	user, err := h.repo.GetUserByID(userID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "User not found"})
		return
	}
	c.JSON(http.StatusOK, user)
}

// Student Test Handlers
func (h *Handler) ListTests(c *gin.Context) {
	tests, err := h.repo.GetActiveTests()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch tests"})
		return
	}
	c.JSON(http.StatusOK, tests)
}

func (h *Handler) GetTestDetails(c *gin.Context) {
	testID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid test ID"})
		return
	}

	// For student, hide correct answers
	role, _ := c.Get("user_role")
	isAdmin := role == "admin"

	test, err := h.repo.GetTestDetails(testID, isAdmin)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Test not found"})
		return
	}
	c.JSON(http.StatusOK, test)
}

func (h *Handler) StartSession(c *gin.Context) {
	userID := c.GetInt("user_id")
	testID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid test ID"})
		return
	}

	var targetSec *int
	if secParam := c.Query("section"); secParam != "" {
		if secIdx, err := strconv.Atoi(secParam); err == nil && secIdx >= 0 {
			targetSec = &secIdx
		}
	}

	forceNew := c.Query("force_new") == "true"
	if c.Request.Body != nil && c.Request.ContentLength > 0 {
		var body struct {
			ForceNew           bool `json:"force_new"`
			TargetSectionIndex *int `json:"target_section_index"`
		}
		if err := c.ShouldBindJSON(&body); err == nil {
			if body.ForceNew {
				forceNew = true
			}
			if body.TargetSectionIndex != nil {
				targetSec = body.TargetSectionIndex
			}
		}
	}

	session, err := h.repo.StartSession(userID, testID, forceNew, targetSec)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, session)
}

func (h *Handler) StartRandomMockSession(c *gin.Context) {
	userID := c.GetInt("user_id")
	if userID <= 0 {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
		return
	}

	forceNew := c.Query("force_new") == "true"
	var body struct {
		ForceNew bool `json:"force_new"`
	}
	if err := c.ShouldBindJSON(&body); err == nil && body.ForceNew {
		forceNew = true
	}

	session, err := h.repo.StartRandomMockSession(userID, forceNew)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusOK, session)
}

func (h *Handler) GetSession(c *gin.Context) {
	sessionID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid session ID"})
		return
	}

	session, err := h.repo.GetSessionDetails(sessionID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Session not found"})
		return
	}

	// Security check: only session owner, examiner or admin can view
	userID := c.GetInt("user_id")
	role := c.GetString("user_role")
	if session.UserID != userID && role != "admin" && role != "examiner" {
		c.JSON(http.StatusForbidden, gin.H{"error": "Access denied"})
		return
	}

	c.JSON(http.StatusOK, session)
}

func (h *Handler) SaveAnswer(c *gin.Context) {
	sessionID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid session ID"})
		return
	}

	var req models.SubmitAnswerRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	session, err := h.repo.GetSessionDetails(sessionID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Session not found"})
		return
	}

	// Check if session is expired or already submitted
	if session.Status != "in_progress" || time.Now().After(session.ExpiresAt) {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Session has expired or already submitted"})
		return
	}

	if err := h.repo.SaveAnswer(sessionID, req.QuestionID, req.UserAnswerText, req.AudioFileURL); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to save answer"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Answer saved"})
}

func (h *Handler) SubmitSession(c *gin.Context) {
	sessionID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid session ID"})
		return
	}

	if err := h.repo.SubmitSession(sessionID); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to submit session: " + err.Error()})
		return
	}

	// Return updated session with results
	session, err := h.repo.GetSessionDetails(sessionID)
	if err != nil {
		c.JSON(http.StatusOK, gin.H{"message": "Submitted successfully"})
		return
	}

	c.JSON(http.StatusOK, session)
}

func (h *Handler) GetStudentResults(c *gin.Context) {
	userID := c.GetInt("user_id")
	sessions, err := h.repo.GetStudentResults(userID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch student results"})
		return
	}
	c.JSON(http.StatusOK, sessions)
}

// Examiner Handlers
func (h *Handler) GetPendingSubmissions(c *gin.Context) {
	subs, err := h.repo.GetPendingSubmissions()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch submissions"})
		return
	}
	c.JSON(http.StatusOK, subs)
}

func (h *Handler) GradeAnswer(c *gin.Context) {
	var req models.GradeAnswerRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if req.AnswerID <= 0 && (req.SessionID <= 0 || req.QuestionID <= 0) {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Either answer_id or (session_id and question_id) must be provided"})
		return
	}

	if err := h.repo.GradeAnswerOrUpsert(req.AnswerID, req.SessionID, req.QuestionID, req.Score, req.Feedback); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to grade answer: " + err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Grade and feedback recorded successfully"})
}

// Admin Handlers
func (h *Handler) CreateTest(c *gin.Context) {
	var req models.CreateTestRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if req.Level == "" {
		req.Level = "Multi-level (A1-C1)"
	}
	if req.DurationMinutes <= 0 {
		req.DurationMinutes = 120
	}

	test, err := h.repo.CreateTest(req.Title, req.Description, req.Level, req.DurationMinutes)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create test: " + err.Error()})
		return
	}

	c.JSON(http.StatusCreated, test)
}

func (h *Handler) CreateSection(c *gin.Context) {
	testID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid test ID"})
		return
	}

	var req struct {
		Type         string  `json:"type" binding:"required"`
		Title        string  `json:"title" binding:"required"`
		Instructions string  `json:"instructions"`
		AudioURL     *string `json:"audio_url"`
		PassageText  *string `json:"passage_text"`
		OrderIndex   int     `json:"order_index"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	sec, err := h.repo.CreateSection(testID, req.Type, req.Title, req.Instructions, req.AudioURL, req.PassageText, req.OrderIndex)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create section: " + err.Error()})
		return
	}

	c.JSON(http.StatusCreated, sec)
}

func (h *Handler) CreateQuestion(c *gin.Context) {
	secID, err := strconv.Atoi(c.Param("sectionId"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid section ID"})
		return
	}

	var req struct {
		QuestionType        string   `json:"question_type" binding:"required"`
		QuestionText        string   `json:"question_text" binding:"required"`
		Options             []string `json:"options"`
		CorrectAnswer       string   `json:"correct_answer"`
		Points              int      `json:"points"`
		OrderIndex          int      `json:"order_index"`
		ExplanationText     string   `json:"explanation_text"`
		ExplanationAudioURL string   `json:"explanation_audio_url"`
		ExplanationVideoURL string   `json:"explanation_video_url"`
		ExplanationImageURL string   `json:"explanation_image_url"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if req.Points <= 0 {
		req.Points = 1
	}

	q, err := h.repo.CreateQuestion(secID, req.QuestionType, req.QuestionText, req.Options, req.CorrectAnswer, req.Points, req.OrderIndex,
		req.ExplanationText, req.ExplanationAudioURL, req.ExplanationVideoURL, req.ExplanationImageURL)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create question: " + err.Error()})
		return
	}

	c.JSON(http.StatusCreated, q)
}

func (h *Handler) UpdateQuestionExplanation(c *gin.Context) {
	qID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid question ID"})
		return
	}

	var req struct {
		ExplanationText     string `json:"explanation_text"`
		ExplanationAudioURL string `json:"explanation_audio_url"`
		ExplanationVideoURL string `json:"explanation_video_url"`
		ExplanationImageURL string `json:"explanation_image_url"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if err := h.repo.UpdateQuestionExplanation(qID, req.ExplanationText, req.ExplanationAudioURL, req.ExplanationVideoURL, req.ExplanationImageURL); err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"error": "Question not found"})
			return
		}
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to update explanation: " + err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Explanation updated successfully"})
}

func (h *Handler) DeleteTest(c *gin.Context) {
	testID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid test ID"})
		return
	}

	if err := h.repo.DeleteTest(testID); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to delete test"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Test deleted successfully"})
}

func (h *Handler) ListUsers(c *gin.Context) {
	users, err := h.repo.GetAllUsers()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch users"})
		return
	}
	c.JSON(http.StatusOK, users)
}

func (h *Handler) UpdateUserRole(c *gin.Context) {
	idStr := c.Param("id")
	userID, err := strconv.Atoi(idStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user ID"})
		return
	}

	var req struct {
		Role string `json:"role" binding:"required"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Role is required"})
		return
	}

	if req.Role != "student" && req.Role != "examiner" && req.Role != "admin" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Role must be student, examiner, or admin"})
		return
	}

	if err := h.repo.UpdateUserRole(userID, req.Role); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Foydalanuvchi roli muvaffaqiyatli yangilandi", "user_id": userID, "role": req.Role})
}


// Profile handlers
func (h *Handler) GetUserProfile(c *gin.Context) {
	userID := c.GetInt("user_id")
	user, err := h.repo.GetUserByID(userID)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Foydalanuvchi topilmadi"})
		return
	}
	c.JSON(http.StatusOK, user)
}

func (h *Handler) UpdateUserProfile(c *gin.Context) {
	userID := c.GetInt("user_id")
	var req models.UpdateProfileRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	user, err := h.repo.UpdateUserProfile(userID, req)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Profilni yangilashda xatolik"})
		return
	}
	c.JSON(http.StatusOK, user)
}

func (h *Handler) ChangePassword(c *gin.Context) {
	userID := c.GetInt("user_id")
	var req models.ChangePasswordRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var currentHash string
	if err := h.repo.GetDB().QueryRow("SELECT password_hash FROM users WHERE id = $1", userID).Scan(&currentHash); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Foydalanuvchi parolini tekshirib bo'lmadi"})
		return
	}
	if !auth.CheckPassword(req.CurrentPassword, currentHash) {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Hozirgi parol noto‘g‘ri kiritildi"})
		return
	}
	if len(req.NewPassword) < 6 {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Yangi parol kamida 6 belgidan iborat bo‘lishi lozim"})
		return
	}
	newHash, err := auth.HashPassword(req.NewPassword)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Parolni shifrlashda xatolik"})
		return
	}
	if err := h.repo.UpdateUserPassword(userID, newHash); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Parolni saqlashda xatolik"})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Parol muvaffaqiyatli o‘zgartirildi!"})
}

// Admin CRUD handlers
func (h *Handler) UpdateTest(c *gin.Context) {
	testID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid test ID"})
		return
	}
	var req models.UpdateTestRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	test, err := h.repo.UpdateTest(testID, req.Title, req.Description, req.Level, req.DurationMinutes)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Testni yangilashda xatolik: " + err.Error()})
		return
	}
	c.JSON(http.StatusOK, test)
}

func (h *Handler) UpdateSection(c *gin.Context) {
	secID, err := strconv.Atoi(c.Param("sectionId"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid section ID"})
		return
	}
	var req models.UpdateSectionRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	sec, err := h.repo.UpdateSection(secID, req.Title, req.Instructions, req.AudioURL, req.PassageText)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Bo'limni yangilashda xatolik: " + err.Error()})
		return
	}
	c.JSON(http.StatusOK, sec)
}

func (h *Handler) DeleteSection(c *gin.Context) {
	secID, err := strconv.Atoi(c.Param("sectionId"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid section ID"})
		return
	}
	if err := h.repo.DeleteSection(secID); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Bo'limni o'chirishda xatolik: " + err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Bo'lim muvaffaqiyatli o'chirildi"})
}

func (h *Handler) UpdateQuestion(c *gin.Context) {
	qID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid question ID"})
		return
	}
	var req models.UpdateQuestionRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	q, err := h.repo.UpdateQuestion(qID, req)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Savolni yangilashda xatolik: " + err.Error()})
		return
	}
	c.JSON(http.StatusOK, q)
}

func (h *Handler) DeleteQuestion(c *gin.Context) {
	qID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid question ID"})
		return
	}
	if err := h.repo.DeleteQuestion(qID); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Savolni o'chirishda xatolik: " + err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Savol muvaffaqiyatli o'chirildi"})
}

// ==========================================
// EXAM ROOM & GROUP TESTING HANDLERS
// ==========================================

func (h *Handler) CreateExamRoom(c *gin.Context) {
	userID := c.GetInt("user_id")
	userRole := c.GetString("user_role")
	if userRole != "examiner" && userRole != "admin" {
		c.JSON(http.StatusForbidden, gin.H{"error": "Only examiners and admins can create exam rooms"})
		return
	}

	var req models.CreateRoomRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	room, err := h.repo.CreateExamRoom(userID, req.Title, req.ModuleType, req.TestID, req.TargetSectionIndex, req.DurationMinutes)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create exam room: " + err.Error()})
		return
	}

	c.JSON(http.StatusCreated, room)
}

func (h *Handler) GetExamRoom(c *gin.Context) {
	pin := c.Param("pin")
	if pin == "" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "PIN code required"})
		return
	}

	room, err := h.repo.GetExamRoomByPin(pin)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Exam room not found"})
		return
	}

	c.JSON(http.StatusOK, room)
}

func (h *Handler) ListExaminerRooms(c *gin.Context) {
	userID := c.GetInt("user_id")
	rooms, err := h.repo.ListExaminerRooms(userID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to list rooms: " + err.Error()})
		return
	}
	c.JSON(http.StatusOK, rooms)
}

func (h *Handler) JoinExamRoom(c *gin.Context) {
	userID := c.GetInt("user_id")

	var req models.JoinRoomRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "PIN code required"})
		return
	}

	room, participant, err := h.repo.JoinExamRoom(req.PinCode, userID)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"room":        room,
		"participant": participant,
	})
}

func (h *Handler) StartExamRoom(c *gin.Context) {
	userID := c.GetInt("user_id")
	userRole := c.GetString("user_role")
	if userRole != "examiner" && userRole != "admin" {
		c.JSON(http.StatusForbidden, gin.H{"error": "Unauthorized"})
		return
	}

	roomID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid room ID"})
		return
	}

	room, err := h.repo.StartExamRoom(roomID, userID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to start room: " + err.Error()})
		return
	}

	c.JSON(http.StatusOK, room)
}

func (h *Handler) CompleteExamRoom(c *gin.Context) {
	userID := c.GetInt("user_id")
	userRole := c.GetString("user_role")
	if userRole != "examiner" && userRole != "admin" {
		c.JSON(http.StatusForbidden, gin.H{"error": "Unauthorized"})
		return
	}

	roomID, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid room ID"})
		return
	}

	room, err := h.repo.CompleteExamRoom(roomID, userID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to complete room: " + err.Error()})
		return
	}

	c.JSON(http.StatusOK, room)
}

