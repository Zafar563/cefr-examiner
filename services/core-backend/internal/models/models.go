package models

import (
	"time"
)

type User struct {
	ID           int       `json:"id"`
	Email        string    `json:"email"`
	PasswordHash string    `json:"-"`
	FullName     string    `json:"full_name"`
	Role         string    `json:"role"` // 'student', 'examiner', 'admin'
	CreatedAt    time.Time `json:"created_at"`
}

type Question struct {
	ID           int      `json:"id"`
	SectionID    int      `json:"section_id"`
	QuestionType string   `json:"question_type"` // 'single_choice', 'multiple_choice', 'text_input', 'essay', 'speaking_prompt'
	QuestionText string   `json:"question_text"`
	Options      []string `json:"options"`
	CorrectAnswer string  `json:"correct_answer,omitempty"` // hidden from student during test
	Points       int      `json:"points"`
	OrderIndex   int      `json:"order_index"`
}

type Section struct {
	ID           int        `json:"id"`
	TestID       int        `json:"test_id"`
	Type         string     `json:"type"` // 'listening', 'reading', 'writing', 'speaking'
	Title        string     `json:"title"`
	Instructions string     `json:"instructions"`
	AudioURL     *string    `json:"audio_url,omitempty"`
	PassageText  *string    `json:"passage_text,omitempty"`
	OrderIndex   int        `json:"order_index"`
	Questions    []Question `json:"questions,omitempty"`
}

type Test struct {
	ID              int       `json:"id"`
	Title           string    `json:"title"`
	Description     string    `json:"description"`
	Level           string    `json:"level"`
	DurationMinutes int       `json:"duration_minutes"`
	IsActive        bool      `json:"is_active"`
	CreatedAt       time.Time `json:"created_at"`
	Sections        []Section `json:"sections,omitempty"`
}

type Answer struct {
	ID               int       `json:"id"`
	SessionID        int       `json:"session_id"`
	QuestionID       int       `json:"question_id"`
	UserAnswerText   string    `json:"user_answer_text"`
	AudioFileURL     string    `json:"audio_file_url"`
	Score            float64   `json:"score"`
	ExaminerFeedback string    `json:"examiner_feedback"`
	IsGraded         bool      `json:"is_graded"`
	CreatedAt        time.Time `json:"created_at"`
	QuestionText     string    `json:"question_text,omitempty"`
	SectionType      string    `json:"section_type,omitempty"`
	CorrectAnswer    string    `json:"correct_answer,omitempty"`
}

type TestSession struct {
	ID                  int         `json:"id"`
	UserID              int         `json:"user_id"`
	TestID              int         `json:"test_id"`
	TestTitle           string      `json:"test_title,omitempty"`
	StudentName         string      `json:"student_name,omitempty"`
	StudentEmail        string      `json:"student_email,omitempty"`
	Status              string      `json:"status"` // 'in_progress', 'submitted', 'graded'
	StartedAt           time.Time   `json:"started_at"`
	ExpiresAt           time.Time   `json:"expires_at"`
	SubmittedAt         *time.Time  `json:"submitted_at,omitempty"`
	CurrentSectionIndex int         `json:"current_section_index"`
	Answers             []Answer    `json:"answers,omitempty"`
	Result              *TestResult `json:"result,omitempty"`
}

type TestResult struct {
	ID              int       `json:"id"`
	SessionID       int       `json:"session_id"`
	ListeningScore  float64   `json:"listening_score"`
	ReadingScore    float64   `json:"reading_score"`
	WritingScore    float64   `json:"writing_score"`
	SpeakingScore   float64   `json:"speaking_score"`
	TotalScore      float64   `json:"total_score"`
	MaxScore        float64   `json:"max_score"`
	Percentage      float64   `json:"percentage"`
	CEFRLevel       string    `json:"cefr_level"` // 'A1', 'A2', 'B1', 'B2', 'C1'
	IsFinal         bool      `json:"is_final"`
	FeedbackSummary string    `json:"feedback_summary"`
	CreatedAt       time.Time `json:"created_at"`
}

// Request and Response DTOs
type RegisterRequest struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required,min=6"`
	FullName string `json:"full_name" binding:"required"`
	Role     string `json:"role"` // default student
}

type LoginRequest struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required"`
}

type AuthResponse struct {
	Token string `json:"token"`
	User  User   `json:"user"`
}

type SubmitAnswerRequest struct {
	QuestionID     int    `json:"question_id" binding:"required"`
	UserAnswerText string `json:"user_answer_text"`
	AudioFileURL   string `json:"audio_file_url"`
}

type GradeAnswerRequest struct {
	AnswerID int     `json:"answer_id" binding:"required"`
	Score    float64 `json:"score"`
	Feedback string  `json:"feedback"`
}

type CreateTestRequest struct {
	Title           string `json:"title" binding:"required"`
	Description     string `json:"description"`
	Level           string `json:"level"`
	DurationMinutes int    `json:"duration_minutes"`
}
