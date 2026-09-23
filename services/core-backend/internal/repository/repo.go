package repository

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"time"

	"cefr-core-backend/internal/models"
	"cefr-core-backend/internal/scoring"
)

type Repository struct {
	db *sql.DB
}

func NewRepository(db *sql.DB) *Repository {
	return &Repository{db: db}
}

// User operations
func (r *Repository) CreateUser(email, passwordHash, fullName, role string) (*models.User, error) {
	query := `
		INSERT INTO users (email, password_hash, full_name, role)
		VALUES ($1, $2, $3, $4)
		RETURNING id, email, full_name, role, created_at
	`
	var u models.User
	err := r.db.QueryRow(query, email, passwordHash, fullName, role).Scan(
		&u.ID, &u.Email, &u.FullName, &u.Role, &u.CreatedAt,
	)
	if err != nil {
		return nil, err
	}
	return &u, nil
}

func (r *Repository) GetUserByEmail(email string) (*models.User, error) {
	query := `SELECT id, email, password_hash, full_name, role, created_at FROM users WHERE email = $1`
	var u models.User
	err := r.db.QueryRow(query, email).Scan(&u.ID, &u.Email, &u.PasswordHash, &u.FullName, &u.Role, &u.CreatedAt)
	if err != nil {
		return nil, err
	}
	return &u, nil
}

func (r *Repository) GetUserByID(id int) (*models.User, error) {
	query := `SELECT id, email, full_name, role, created_at FROM users WHERE id = $1`
	var u models.User
	err := r.db.QueryRow(query, id).Scan(&u.ID, &u.Email, &u.FullName, &u.Role, &u.CreatedAt)
	if err != nil {
		return nil, err
	}
	return &u, nil
}

// Test operations
func (r *Repository) GetActiveTests() ([]models.Test, error) {
	query := `SELECT id, title, description, level, duration_minutes, is_active, created_at FROM tests WHERE is_active = true ORDER BY id ASC`
	rows, err := r.db.Query(query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	tests := make([]models.Test, 0)
	for rows.Next() {
		var t models.Test
		if err := rows.Scan(&t.ID, &t.Title, &t.Description, &t.Level, &t.DurationMinutes, &t.IsActive, &t.CreatedAt); err != nil {
			return nil, err
		}
		tests = append(tests, t)
	}
	return tests, nil
}

func (r *Repository) GetTestDetails(testID int, includeAnswers bool) (*models.Test, error) {
	var t models.Test
	query := `SELECT id, title, description, level, duration_minutes, is_active, created_at FROM tests WHERE id = $1`
	err := r.db.QueryRow(query, testID).Scan(&t.ID, &t.Title, &t.Description, &t.Level, &t.DurationMinutes, &t.IsActive, &t.CreatedAt)
	if err != nil {
		return nil, err
	}

	// Fetch sections
	secQuery := `SELECT id, test_id, type, title, instructions, audio_url, passage_text, order_index FROM sections WHERE test_id = $1 ORDER BY order_index ASC`
	secRows, err := r.db.Query(secQuery, testID)
	if err != nil {
		return nil, err
	}
	defer secRows.Close()

	for secRows.Next() {
		var s models.Section
		if err := secRows.Scan(&s.ID, &s.TestID, &s.Type, &s.Title, &s.Instructions, &s.AudioURL, &s.PassageText, &s.OrderIndex); err != nil {
			return nil, err
		}

		// Fetch questions for section
		qQuery := `SELECT id, section_id, question_type, question_text, options, correct_answer, points, order_index FROM questions WHERE section_id = $1 ORDER BY order_index ASC`
		qRows, err := r.db.Query(qQuery, s.ID)
		if err != nil {
			return nil, err
		}

		for qRows.Next() {
			var q models.Question
			var optionsJSON []byte
			var rawAnswer sql.NullString
			if err := qRows.Scan(&q.ID, &q.SectionID, &q.QuestionType, &q.QuestionText, &optionsJSON, &rawAnswer, &q.Points, &q.OrderIndex); err != nil {
				qRows.Close()
				return nil, err
			}
			_ = json.Unmarshal(optionsJSON, &q.Options)
			if includeAnswers && rawAnswer.Valid {
				q.CorrectAnswer = rawAnswer.String
			}
			s.Questions = append(s.Questions, q)
		}
		qRows.Close()

		t.Sections = append(t.Sections, s)
	}

	return &t, nil
}

// Session operations
func (r *Repository) StartSession(userID, testID int) (*models.TestSession, error) {
	// Check existing in_progress session
	var existing models.TestSession
	err := r.db.QueryRow(`
		SELECT id, user_id, test_id, status, started_at, expires_at, current_section_index
		FROM test_sessions
		WHERE user_id = $1 AND test_id = $2 AND status = 'in_progress'
		ORDER BY id DESC LIMIT 1
	`, userID, testID).Scan(
		&existing.ID, &existing.UserID, &existing.TestID, &existing.Status,
		&existing.StartedAt, &existing.ExpiresAt, &existing.CurrentSectionIndex,
	)
	if err == nil {
		// Session already active
		return &existing, nil
	}

	// Fetch test duration
	var durationMinutes int
	err = r.db.QueryRow(`SELECT duration_minutes FROM tests WHERE id = $1`, testID).Scan(&durationMinutes)
	if err != nil {
		return nil, fmt.Errorf("test not found: %w", err)
	}

	now := time.Now()
	expiresAt := now.Add(time.Duration(durationMinutes) * time.Minute)

	var s models.TestSession
	query := `
		INSERT INTO test_sessions (user_id, test_id, status, started_at, expires_at, current_section_index)
		VALUES ($1, $2, 'in_progress', $3, $4, 0)
		RETURNING id, user_id, test_id, status, started_at, expires_at, current_section_index
	`
	err = r.db.QueryRow(query, userID, testID, now, expiresAt).Scan(
		&s.ID, &s.UserID, &s.TestID, &s.Status, &s.StartedAt, &s.ExpiresAt, &s.CurrentSectionIndex,
	)
	if err != nil {
		return nil, err
	}
	return &s, nil
}

func (r *Repository) GetSessionDetails(sessionID int) (*models.TestSession, error) {
	var s models.TestSession
	query := `
		SELECT s.id, s.user_id, s.test_id, t.title, u.full_name, u.email, s.status, s.started_at, s.expires_at, s.submitted_at, s.current_section_index
		FROM test_sessions s
		JOIN tests t ON s.test_id = t.id
		JOIN users u ON s.user_id = u.id
		WHERE s.id = $1
	`
	err := r.db.QueryRow(query, sessionID).Scan(
		&s.ID, &s.UserID, &s.TestID, &s.TestTitle, &s.StudentName, &s.StudentEmail,
		&s.Status, &s.StartedAt, &s.ExpiresAt, &s.SubmittedAt, &s.CurrentSectionIndex,
	)
	if err != nil {
		return nil, err
	}

	// Fetch answers
	ansQuery := `
		SELECT a.id, a.session_id, a.question_id, COALESCE(a.user_answer_text, ''), COALESCE(a.audio_file_url, ''),
		       a.score, COALESCE(a.examiner_feedback, ''), a.is_graded, a.created_at,
		       q.question_text, sec.type, COALESCE(q.correct_answer, '')
		FROM answers a
		JOIN questions q ON a.question_id = q.id
		JOIN sections sec ON q.section_id = sec.id
		WHERE a.session_id = $1
	`
	rows, err := r.db.Query(ansQuery, sessionID)
	if err == nil {
		defer rows.Close()
		for rows.Next() {
			var ans models.Answer
			if err := rows.Scan(
				&ans.ID, &ans.SessionID, &ans.QuestionID, &ans.UserAnswerText, &ans.AudioFileURL,
				&ans.Score, &ans.ExaminerFeedback, &ans.IsGraded, &ans.CreatedAt,
				&ans.QuestionText, &ans.SectionType, &ans.CorrectAnswer,
			); err == nil {
				s.Answers = append(s.Answers, ans)
			}
		}
	}

	// Fetch result if exists
	var res models.TestResult
	resQuery := `
		SELECT id, session_id, listening_score, reading_score, writing_score, speaking_score, total_score, max_score, percentage, cefr_level, is_final, COALESCE(feedback_summary, ''), created_at
		FROM test_results WHERE session_id = $1
	`
	err = r.db.QueryRow(resQuery, sessionID).Scan(
		&res.ID, &res.SessionID, &res.ListeningScore, &res.ReadingScore, &res.WritingScore,
		&res.SpeakingScore, &res.TotalScore, &res.MaxScore, &res.Percentage, &res.CEFRLevel,
		&res.IsFinal, &res.FeedbackSummary, &res.CreatedAt,
	)
	if err == nil {
		s.Result = &res
	}

	return &s, nil
}

func (r *Repository) SaveAnswer(sessionID, questionID int, answerText, audioURL string) error {
	query := `
		INSERT INTO answers (session_id, question_id, user_answer_text, audio_file_url)
		VALUES ($1, $2, $3, $4)
		ON CONFLICT (session_id, question_id)
		DO UPDATE SET
			user_answer_text = EXCLUDED.user_answer_text,
			audio_file_url = EXCLUDED.audio_file_url
	`
	_, err := r.db.Exec(query, sessionID, questionID, answerText, audioURL)
	return err
}

func (r *Repository) SubmitSession(sessionID int) error {
	tx, err := r.db.Begin()
	if err != nil {
		return err
	}
	defer tx.Rollback()

	now := time.Now()
	_, err = tx.Exec(`UPDATE test_sessions SET status = 'submitted', submitted_at = $1 WHERE id = $2`, now, sessionID)
	if err != nil {
		return err
	}

	// Automatic grading for listening and reading
	autoGradeQuery := `
		UPDATE answers a
		SET score = CASE
			WHEN LOWER(TRIM(a.user_answer_text)) = LOWER(TRIM(COALESCE(q.correct_answer, ''))) THEN q.points
			ELSE 0
		END,
		is_graded = true
		FROM questions q
		JOIN sections s ON q.section_id = s.id
		WHERE a.question_id = q.id
		  AND a.session_id = $1
		  AND s.type IN ('listening', 'reading')
	`
	if _, err := tx.Exec(autoGradeQuery, sessionID); err != nil {
		return err
	}

	if err := tx.Commit(); err != nil {
		return err
	}

	// Calculate and update preliminary results
	return r.RecalculateSessionResults(sessionID)
}

func (r *Repository) RecalculateSessionResults(sessionID int) error {
	query := `
		SELECT 
			COALESCE(SUM(CASE WHEN s.type = 'listening' THEN a.score ELSE 0 END), 0) as listening_score,
			COALESCE(SUM(CASE WHEN s.type = 'reading' THEN a.score ELSE 0 END), 0) as reading_score,
			COALESCE(SUM(CASE WHEN s.type = 'writing' THEN a.score ELSE 0 END), 0) as writing_score,
			COALESCE(SUM(CASE WHEN s.type = 'speaking' THEN a.score ELSE 0 END), 0) as speaking_score,
			COALESCE(SUM(q.points), 0) as max_score,
			COUNT(CASE WHEN s.type IN ('writing', 'speaking') AND a.is_graded = false THEN 1 END) as pending_grades
		FROM test_sessions ts
		JOIN tests t ON ts.test_id = t.id
		JOIN sections s ON s.test_id = t.id
		JOIN questions q ON q.section_id = s.id
		LEFT JOIN answers a ON a.session_id = ts.id AND a.question_id = q.id
		WHERE ts.id = $1
	`
	var listening, reading, writing, speaking, maxScore float64
	var pendingGrades int

	err := r.db.QueryRow(query, sessionID).Scan(&listening, &reading, &writing, &speaking, &maxScore, &pendingGrades)
	if err != nil {
		return err
	}

	totalScore := listening + reading + writing + speaking
	percentage := scoring.CalculatePercentage(totalScore, maxScore)
	cefrLevel := scoring.CalculateCEFRLevel(percentage)
	isFinal := (pendingGrades == 0)

	upsertResultQuery := `
		INSERT INTO test_results (session_id, listening_score, reading_score, writing_score, speaking_score, total_score, max_score, percentage, cefr_level, is_final)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
		ON CONFLICT (session_id)
		DO UPDATE SET
			listening_score = EXCLUDED.listening_score,
			reading_score = EXCLUDED.reading_score,
			writing_score = EXCLUDED.writing_score,
			speaking_score = EXCLUDED.speaking_score,
			total_score = EXCLUDED.total_score,
			max_score = EXCLUDED.max_score,
			percentage = EXCLUDED.percentage,
			cefr_level = EXCLUDED.cefr_level,
			is_final = EXCLUDED.is_final
	`
	_, err = r.db.Exec(upsertResultQuery, sessionID, listening, reading, writing, speaking, totalScore, maxScore, percentage, cefrLevel, isFinal)
	if err != nil {
		return err
	}

	if isFinal {
		_, _ = r.db.Exec(`UPDATE test_sessions SET status = 'graded' WHERE id = $1`, sessionID)
	}

	return nil
}

// Examiner operations
func (r *Repository) GetPendingSubmissions() ([]models.TestSession, error) {
	query := `
		SELECT DISTINCT ts.id, ts.user_id, ts.test_id, t.title, u.full_name, u.email, ts.status, ts.started_at, ts.expires_at, ts.submitted_at, ts.current_section_index
		FROM test_sessions ts
		JOIN tests t ON ts.test_id = t.id
		JOIN users u ON ts.user_id = u.id
		JOIN answers a ON a.session_id = ts.id
		JOIN questions q ON a.question_id = q.id
		JOIN sections s ON q.section_id = s.id
		WHERE ts.status = 'submitted' AND s.type IN ('writing', 'speaking') AND a.is_graded = false
		ORDER BY ts.submitted_at DESC
	`
	rows, err := r.db.Query(query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	sessions := make([]models.TestSession, 0)
	for rows.Next() {
		var s models.TestSession
		if err := rows.Scan(
			&s.ID, &s.UserID, &s.TestID, &s.TestTitle, &s.StudentName, &s.StudentEmail,
			&s.Status, &s.StartedAt, &s.ExpiresAt, &s.SubmittedAt, &s.CurrentSectionIndex,
		); err == nil {
			sessions = append(sessions, s)
		}
	}
	return sessions, nil
}

func (r *Repository) GradeAnswer(answerID int, score float64, feedback string) error {
	query := `
		UPDATE answers
		SET score = $1, examiner_feedback = $2, is_graded = true
		WHERE id = $3
		RETURNING session_id
	`
	var sessionID int
	err := r.db.QueryRow(query, score, feedback, answerID).Scan(&sessionID)
	if err != nil {
		return err
	}

	return r.RecalculateSessionResults(sessionID)
}

func (r *Repository) GetStudentResults(userID int) ([]models.TestSession, error) {
	query := `
		SELECT ts.id, ts.user_id, ts.test_id, t.title, ts.status, ts.started_at, ts.expires_at, ts.submitted_at, ts.current_section_index
		FROM test_sessions ts
		JOIN tests t ON ts.test_id = t.id
		WHERE ts.user_id = $1
		ORDER BY ts.id DESC
	`
	rows, err := r.db.Query(query, userID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	sessions := make([]models.TestSession, 0)
	for rows.Next() {
		var s models.TestSession
		if err := rows.Scan(&s.ID, &s.UserID, &s.TestID, &s.TestTitle, &s.Status, &s.StartedAt, &s.ExpiresAt, &s.SubmittedAt, &s.CurrentSectionIndex); err != nil {
			return nil, err
		}

		// Attach result if exists
		var res models.TestResult
		resQuery := `
			SELECT id, session_id, listening_score, reading_score, writing_score, speaking_score, total_score, max_score, percentage, cefr_level, is_final, COALESCE(feedback_summary, ''), created_at
			FROM test_results WHERE session_id = $1
		`
		if err := r.db.QueryRow(resQuery, s.ID).Scan(
			&res.ID, &res.SessionID, &res.ListeningScore, &res.ReadingScore, &res.WritingScore,
			&res.SpeakingScore, &res.TotalScore, &res.MaxScore, &res.Percentage, &res.CEFRLevel,
			&res.IsFinal, &res.FeedbackSummary, &res.CreatedAt,
		); err == nil {
			s.Result = &res
		}

		sessions = append(sessions, s)
	}
	return sessions, nil
}

// Admin operations
func (r *Repository) CreateTest(title, description, level string, durationMinutes int) (*models.Test, error) {
	query := `
		INSERT INTO tests (title, description, level, duration_minutes, is_active)
		VALUES ($1, $2, $3, $4, true)
		RETURNING id, title, description, level, duration_minutes, is_active, created_at
	`
	var t models.Test
	err := r.db.QueryRow(query, title, description, level, durationMinutes).Scan(
		&t.ID, &t.Title, &t.Description, &t.Level, &t.DurationMinutes, &t.IsActive, &t.CreatedAt,
	)
	if err != nil {
		return nil, err
	}
	return &t, nil
}

func (r *Repository) CreateSection(testID int, secType, title, instructions string, audioURL, passageText *string, orderIndex int) (*models.Section, error) {
	query := `
		INSERT INTO sections (test_id, type, title, instructions, audio_url, passage_text, order_index)
		VALUES ($1, $2, $3, $4, $5, $6, $7)
		RETURNING id, test_id, type, title, instructions, audio_url, passage_text, order_index
	`
	var s models.Section
	err := r.db.QueryRow(query, testID, secType, title, instructions, audioURL, passageText, orderIndex).Scan(
		&s.ID, &s.TestID, &s.Type, &s.Title, &s.Instructions, &s.AudioURL, &s.PassageText, &s.OrderIndex,
	)
	if err != nil {
		return nil, err
	}
	return &s, nil
}

func (r *Repository) CreateQuestion(sectionID int, qType, text string, options []string, correctAnswer string, points, orderIndex int) (*models.Question, error) {
	optJSON, _ := json.Marshal(options)
	query := `
		INSERT INTO questions (section_id, question_type, question_text, options, correct_answer, points, order_index)
		VALUES ($1, $2, $3, $4, $5, $6, $7)
		RETURNING id, section_id, question_type, question_text, points, order_index
	`
	var q models.Question
	err := r.db.QueryRow(query, sectionID, qType, text, optJSON, correctAnswer, points, orderIndex).Scan(
		&q.ID, &q.SectionID, &q.QuestionType, &q.QuestionText, &q.Points, &q.OrderIndex,
	)
	if err != nil {
		return nil, err
	}
	q.Options = options
	q.CorrectAnswer = correctAnswer
	return &q, nil
}

func (r *Repository) DeleteTest(testID int) error {
	_, err := r.db.Exec(`DELETE FROM tests WHERE id = $1`, testID)
	return err
}
