package handlers

import (
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

	role := req.Role
	if role == "" {
		role = "student"
	}
	if role != "student" && role != "examiner" && role != "admin" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid role"})
		return
	}

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

	session, err := h.repo.StartSession(userID, testID)
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

	if err := h.repo.GradeAnswer(req.AnswerID, req.Score, req.Feedback); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to grade answer"})
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
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create test"})
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
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create section"})
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
		QuestionType  string   `json:"question_type" binding:"required"`
		QuestionText  string   `json:"question_text" binding:"required"`
		Options       []string `json:"options"`
		CorrectAnswer string   `json:"correct_answer"`
		Points        int      `json:"points"`
		OrderIndex    int      `json:"order_index"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if req.Points <= 0 {
		req.Points = 1
	}

	q, err := h.repo.CreateQuestion(secID, req.QuestionType, req.QuestionText, req.Options, req.CorrectAnswer, req.Points, req.OrderIndex)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create question"})
		return
	}

	c.JSON(http.StatusCreated, q)
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
