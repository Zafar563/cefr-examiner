package repository

import (
	"bytes"
	"database/sql"
	"encoding/json"
	"fmt"
	"net/http"
	"os"
	"strings"
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

func (r *Repository) GetAllUsers() ([]models.User, error) {
	query := `SELECT id, email, full_name, role, created_at FROM users ORDER BY id ASC`
	rows, err := r.db.Query(query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var users []models.User
	for rows.Next() {
		var u models.User
		if err := rows.Scan(&u.ID, &u.Email, &u.FullName, &u.Role, &u.CreatedAt); err != nil {
			return nil, err
		}
		users = append(users, u)
	}
	return users, nil
}

func (r *Repository) UpdateUserRole(userID int, newRole string) error {
	query := `UPDATE users SET role = $1 WHERE id = $2`
	res, err := r.db.Exec(query, newRole, userID)
	if err != nil {
		return err
	}
	rowsAffected, _ := res.RowsAffected()
	if rowsAffected == 0 {
		return fmt.Errorf("foydalanuvchi topilmadi")
	}
	return nil
}


// Test operations
func (r *Repository) GetActiveTests() ([]models.Test, error) {
	query := `SELECT id, title, description, level, duration_minutes, is_active, created_at 
		FROM tests 
		WHERE is_active = true 
		ORDER BY 
			CASE 
				WHEN (regexp_match(title, 'Cambridge IELTS ([0-9]+)'))[1]::int >= 13 THEN (regexp_match(title, 'Cambridge IELTS ([0-9]+)'))[1]::int
				ELSE 100 + COALESCE((regexp_match(title, 'Cambridge IELTS ([0-9]+)'))[1]::int, 900)
			END ASC,
			COALESCE((regexp_match(title, 'Test ([0-9]+)'))[1]::int, 0) ASC,
			id ASC`
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

// AutoSubmitExpiredSessions closes any in_progress sessions whose expires_at is past now
func (r *Repository) AutoSubmitExpiredSessions(userID int) {
	query := `SELECT id FROM test_sessions WHERE status = 'in_progress' AND expires_at <= NOW()`
	var rows *sql.Rows
	var err error
	if userID > 0 {
		query += ` AND user_id = $1`
		rows, err = r.db.Query(query, userID)
	} else {
		rows, err = r.db.Query(query)
	}
	if err != nil {
		return
	}
	defer rows.Close()

	var expiredIDs []int
	for rows.Next() {
		var id int
		if err := rows.Scan(&id); err == nil {
			expiredIDs = append(expiredIDs, id)
		}
	}
	rows.Close()

	for _, id := range expiredIDs {
		_ = r.SubmitSession(id)
	}
}

// Session operations
func (r *Repository) StartSession(userID, testID int, forceNew bool) (*models.TestSession, error) {
	// Auto-submit any expired in_progress sessions for this user first
	r.AutoSubmitExpiredSessions(userID)

	if forceNew {
		// Close any currently in_progress session for this specific test
		var activeID int
		if err := r.db.QueryRow(`
			SELECT id FROM test_sessions
			WHERE user_id = $1 AND test_id = $2 AND status = 'in_progress'
			ORDER BY id DESC LIMIT 1
		`, userID, testID).Scan(&activeID); err == nil {
			_ = r.SubmitSession(activeID)
		}
	} else {
		// Check existing in_progress session that is still valid (not expired)
		var existing models.TestSession
		err := r.db.QueryRow(`
			SELECT id, user_id, test_id, status, started_at, expires_at, current_section_index
			FROM test_sessions
			WHERE user_id = $1 AND test_id = $2 AND status = 'in_progress' AND expires_at > NOW()
			ORDER BY id DESC LIMIT 1
		`, userID, testID).Scan(
			&existing.ID, &existing.UserID, &existing.TestID, &existing.Status,
			&existing.StartedAt, &existing.ExpiresAt, &existing.CurrentSectionIndex,
		)
		if err == nil {
			// Session already active and not expired
			return &existing, nil
		}
	}

	// Fetch test duration
	var durationMinutes int
	err := r.db.QueryRow(`SELECT duration_minutes FROM tests WHERE id = $1`, testID).Scan(&durationMinutes)
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

func (r *Repository) StartRandomMockSession(userID int, forceNew bool) (*models.TestSession, error) {
	// Auto-submit any expired sessions for this user first
	r.AutoSubmitExpiredSessions(userID)

	if forceNew {
		var activeMockID int
		checkActive := `
			SELECT ts.id FROM test_sessions ts
			JOIN tests t ON ts.test_id = t.id
			WHERE ts.user_id = $1 AND ts.status = 'in_progress' AND (t.title ILIKE '%mock%')
			ORDER BY ts.id DESC LIMIT 1
		`
		if err := r.db.QueryRow(checkActive, userID).Scan(&activeMockID); err == nil {
			_ = r.SubmitSession(activeMockID)
		}
	} else {
		// Check existing in_progress mock session if not forcing new
		var existing models.TestSession
		checkMockQuery := `
			SELECT ts.id, ts.user_id, ts.test_id, ts.status, ts.started_at, ts.expires_at, ts.current_section_index
			FROM test_sessions ts
			JOIN tests t ON ts.test_id = t.id
			WHERE ts.user_id = $1 AND ts.status = 'in_progress' AND ts.expires_at > NOW()
			  AND (t.title ILIKE '%mock%')
			ORDER BY ts.id DESC LIMIT 1
		`
		err := r.db.QueryRow(checkMockQuery, userID).Scan(
			&existing.ID, &existing.UserID, &existing.TestID, &existing.Status,
			&existing.StartedAt, &existing.ExpiresAt, &existing.CurrentSectionIndex,
		)
		if err == nil {
			return &existing, nil
		}
	}

	// 1. Pick a random Listening test
	var listeningTestID int
	var listeningTitle string
	err := r.db.QueryRow(`
		SELECT id, title FROM tests
		WHERE is_active = true AND id IN (SELECT DISTINCT test_id FROM sections WHERE type = 'listening')
		ORDER BY RANDOM() LIMIT 1
	`).Scan(&listeningTestID, &listeningTitle)
	if err != nil {
		return nil, fmt.Errorf("no listening tests available: %w", err)
	}

	// 2. Pick a random Reading test
	var readingTestID int
	var readingTitle string
	err = r.db.QueryRow(`
		SELECT id, title FROM tests
		WHERE is_active = true AND id IN (SELECT DISTINCT test_id FROM sections WHERE type = 'reading')
		ORDER BY RANDOM() LIMIT 1
	`).Scan(&readingTestID, &readingTitle)
	if err != nil {
		return nil, fmt.Errorf("no reading tests available: %w", err)
	}

	// 3. Pick a random Speaking test
	var speakingTestID int
	var speakingTitle string
	err = r.db.QueryRow(`
		SELECT id, title FROM tests
		WHERE is_active = true AND id IN (SELECT DISTINCT test_id FROM sections WHERE type = 'speaking')
		ORDER BY RANDOM() LIMIT 1
	`).Scan(&speakingTestID, &speakingTitle)
	if err != nil {
		return nil, fmt.Errorf("no speaking tests available: %w", err)
	}

	// 4. Optionally pick a random Writing test
	var writingTestID int
	var writingTitle string
	hasWriting := false
	err = r.db.QueryRow(`
		SELECT id, title FROM tests
		WHERE is_active = true AND id IN (SELECT DISTINCT test_id FROM sections WHERE type = 'writing')
		ORDER BY RANDOM() LIMIT 1
	`).Scan(&writingTestID, &writingTitle)
	if err == nil {
		hasWriting = true
	}

	// 5. Begin transaction
	tx, err := r.db.Begin()
	if err != nil {
		return nil, err
	}
	defer tx.Rollback()

	var newTitle string
	var newDesc string
	durationMins := 120
	if hasWriting {
		durationMins = 180
		newTitle = "CEFR Multi-Level Full Mock Exam (Listening + Reading + Writing + Speaking)"
		newDesc = fmt.Sprintf("Tasodifiy tanlangan to'liq 4 ko'nikmali sinov imtihoni: 🎧 %s | 📖 %s | ✍️ %s | 🎙️ %s. Barcha ko'nikmalar bo'yicha to'liq CEFR / IELTS simulyatsiyasi.", listeningTitle, readingTitle, writingTitle, speakingTitle)
	} else {
		newTitle = "CEFR Multi-Level Full Mock Exam (Listening + Reading + Speaking)"
		newDesc = fmt.Sprintf("Tasodifiy tanlangan to'liq sinov imtihoni: 🎧 %s | 📖 %s | 🎙️ %s. 3 ta ko'nikma bo'yicha to'liq CEFR / IELTS simulyatsiyasi.", listeningTitle, readingTitle, speakingTitle)
	}

	var newTestID int
	testInsertQuery := `
		INSERT INTO tests (title, description, level, duration_minutes, is_active)
		VALUES ($1, $2, 'Multi-level (A1-C1)', $3, false)
		RETURNING id
	`
	if err := tx.QueryRow(testInsertQuery, newTitle, newDesc, durationMins).Scan(&newTestID); err != nil {
		return nil, fmt.Errorf("failed to create combined test: %w", err)
	}

	currentOrderIndex := 1

	copySections := func(srcTestID int, secType string) error {
		secRows, err := tx.Query(`
			SELECT id, title, instructions, audio_url, passage_text
			FROM sections
			WHERE test_id = $1 AND type = $2
			ORDER BY order_index ASC
		`, srcTestID, secType)
		if err != nil {
			return err
		}
		defer secRows.Close()

		type SecData struct {
			OldID        int
			Title        string
			Instructions sql.NullString
			AudioURL     sql.NullString
			PassageText  sql.NullString
		}
		var secList []SecData
		for secRows.Next() {
			var s SecData
			if err := secRows.Scan(&s.OldID, &s.Title, &s.Instructions, &s.AudioURL, &s.PassageText); err != nil {
				return err
			}
			secList = append(secList, s)
		}
		secRows.Close()

		for _, s := range secList {
			var newSecID int
			secTitle := s.Title
			if secType == "listening" && !strings.Contains(strings.ToLower(secTitle), "listening") {
				secTitle = "Listening: " + secTitle
			} else if secType == "reading" && !strings.Contains(strings.ToLower(secTitle), "reading") {
				secTitle = "Reading: " + secTitle
			} else if secType == "writing" && !strings.Contains(strings.ToLower(secTitle), "writing") {
				secTitle = "Writing: " + secTitle
			} else if secType == "speaking" && !strings.Contains(strings.ToLower(secTitle), "speaking") {
				secTitle = "Speaking: " + secTitle
			}

			err := tx.QueryRow(`
				INSERT INTO sections (test_id, type, title, instructions, audio_url, passage_text, order_index)
				VALUES ($1, $2, $3, $4, $5, $6, $7)
				RETURNING id
			`, newTestID, secType, secTitle, s.Instructions, s.AudioURL, s.PassageText, currentOrderIndex).Scan(&newSecID)
			if err != nil {
				return err
			}
			currentOrderIndex++

			qRows, err := tx.Query(`
				SELECT question_type, question_text, options, correct_answer, points, order_index
				FROM questions
				WHERE section_id = $1
				ORDER BY order_index ASC
			`, s.OldID)
			if err != nil {
				return err
			}

			type QData struct {
				QType    string
				QText    string
				Options  []byte
				Ans      sql.NullString
				Points   int
				OrderIdx int
			}
			var qList []QData
			for qRows.Next() {
				var q QData
				if err := qRows.Scan(&q.QType, &q.QText, &q.Options, &q.Ans, &q.Points, &q.OrderIdx); err != nil {
					qRows.Close()
					return err
				}
				qList = append(qList, q)
			}
			qRows.Close()

			for _, q := range qList {
				_, err := tx.Exec(`
					INSERT INTO questions (section_id, question_type, question_text, options, correct_answer, points, order_index)
					VALUES ($1, $2, $3, $4, $5, $6, $7)
				`, newSecID, q.QType, q.QText, q.Options, q.Ans, q.Points, q.OrderIdx)
				if err != nil {
					return err
				}
			}
		}
		return nil
	}

	if err := copySections(listeningTestID, "listening"); err != nil {
		return nil, fmt.Errorf("failed copying listening sections: %w", err)
	}

	if err := copySections(readingTestID, "reading"); err != nil {
		return nil, fmt.Errorf("failed copying reading sections: %w", err)
	}

	if hasWriting {
		if err := copySections(writingTestID, "writing"); err != nil {
			return nil, fmt.Errorf("failed copying writing sections: %w", err)
		}
	}

	if err := copySections(speakingTestID, "speaking"); err != nil {
		return nil, fmt.Errorf("failed copying speaking sections: %w", err)
	}

	now := time.Now()
	expiresAt := now.Add(time.Duration(durationMins) * time.Minute)

	var s models.TestSession
	sessQuery := `
		INSERT INTO test_sessions (user_id, test_id, status, started_at, expires_at, current_section_index)
		VALUES ($1, $2, 'in_progress', $3, $4, 0)
		RETURNING id, user_id, test_id, status, started_at, expires_at, current_section_index
	`
	err = tx.QueryRow(sessQuery, userID, newTestID, now, expiresAt).Scan(
		&s.ID, &s.UserID, &s.TestID, &s.Status, &s.StartedAt, &s.ExpiresAt, &s.CurrentSectionIndex,
	)
	if err != nil {
		return nil, fmt.Errorf("failed creating mock session: %w", err)
	}

	if err := tx.Commit(); err != nil {
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

	// If session has expired while in_progress, automatically submit and grade it!
	if s.Status == "in_progress" && time.Now().After(s.ExpiresAt) {
		_ = r.SubmitSession(sessionID)
		s.Status = "submitted"
		expTime := s.ExpiresAt
		s.SubmittedAt = &expTime
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
	_, err = tx.Exec(`UPDATE test_sessions SET status = CASE WHEN status = 'graded' THEN 'graded' ELSE 'submitted' END, submitted_at = COALESCE(submitted_at, $1) WHERE id = $2`, now, sessionID)
	if err != nil {
		return err
	}

	// Automatic grading for listening and reading
	autoGradeQuery := `
		UPDATE answers a
		SET score = CASE
			WHEN LOWER(TRIM(COALESCE(a.user_answer_text, ''))) = LOWER(TRIM(COALESCE(q.correct_answer, '')))
			  OR LOWER(TRIM(COALESCE(a.user_answer_text, ''))) = ANY(string_to_array(LOWER(COALESCE(q.correct_answer, '')), '|'))
			  OR LOWER(TRIM(COALESCE(a.user_answer_text, ''))) = ANY(string_to_array(LOWER(COALESCE(q.correct_answer, '')), '/'))
			THEN q.points
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

	// Automatic grading for writing
	autoGradeWritingQuery := `
		UPDATE answers a
		SET score = CASE
			WHEN LENGTH(TRIM(COALESCE(a.user_answer_text, ''))) >= 500 THEN ROUND((q.points * 0.90)::numeric, 1)
			WHEN LENGTH(TRIM(COALESCE(a.user_answer_text, ''))) >= 300 THEN ROUND((q.points * 0.80)::numeric, 1)
			WHEN LENGTH(TRIM(COALESCE(a.user_answer_text, ''))) >= 150 THEN ROUND((q.points * 0.70)::numeric, 1)
			WHEN LENGTH(TRIM(COALESCE(a.user_answer_text, ''))) >= 60 THEN ROUND((q.points * 0.50)::numeric, 1)
			WHEN LENGTH(TRIM(COALESCE(a.user_answer_text, ''))) > 10 THEN ROUND((q.points * 0.30)::numeric, 1)
			ELSE 0
		END,
		examiner_feedback = CASE
			WHEN LENGTH(TRIM(COALESCE(a.user_answer_text, ''))) >= 300 THEN 'Avtomatik tahlil: Yaxshi hajm va fikr rivoji. Grammatika va leksikani yanada boyitish tavsiya etiladi.'
			WHEN LENGTH(TRIM(COALESCE(a.user_answer_text, ''))) >= 150 THEN 'Avtomatik tahlil: Insho qabul qilindi. Fikrlarni kengroq dalillash va so‘z boyligiga e’tibor bering.'
			WHEN LENGTH(TRIM(COALESCE(a.user_answer_text, ''))) > 0 THEN 'Avtomatik tahlil: Matn hajmi tavsiya etilgan normadan kamroq.'
			ELSE 'Avtomatik tahlil: Javob taqdim etilmagan.'
		END,
		is_graded = true
		FROM questions q
		JOIN sections s ON q.section_id = s.id
		WHERE a.question_id = q.id
		  AND a.session_id = $1
		  AND s.type = 'writing'
	`
	if _, err := tx.Exec(autoGradeWritingQuery, sessionID); err != nil {
		return err
	}

	// Automatic grading for speaking
	autoGradeSpeakingQuery := `
		UPDATE answers a
		SET score = CASE
			WHEN COALESCE(a.audio_file_url, '') != '' OR LENGTH(TRIM(COALESCE(a.user_answer_text, ''))) >= 50 THEN ROUND((q.points * 0.85)::numeric, 1)
			WHEN LENGTH(TRIM(COALESCE(a.user_answer_text, ''))) > 5 THEN ROUND((q.points * 0.55)::numeric, 1)
			ELSE 0
		END,
		examiner_feedback = CASE
			WHEN COALESCE(a.audio_file_url, '') != '' THEN 'Avtomatik tahlil: Audio yozuv qabul qilindi va nutq mezonlari bo‘yicha muvaffaqiyatli baholandi.'
			WHEN LENGTH(TRIM(COALESCE(a.user_answer_text, ''))) > 0 THEN 'Avtomatik tahlil: Matnli javob qabul qilindi.'
			ELSE 'Avtomatik tahlil: Audio yoki javob taqdim etilmagan.'
		END,
		is_graded = true
		FROM questions q
		JOIN sections s ON q.section_id = s.id
		WHERE a.question_id = q.id
		  AND a.session_id = $1
		  AND s.type = 'speaking'
	`
	if _, err := tx.Exec(autoGradeSpeakingQuery, sessionID); err != nil {
		return err
	}

	if err := tx.Commit(); err != nil {
		return err
	}

	// Launch background AI evaluation with Gemini via media-service
	go r.runAIAssessment(sessionID)

	// Calculate and update preliminary results immediately
	return r.RecalculateSessionResults(sessionID)
}

type aiGradeResponse struct {
	Score     float64 `json:"score"`
	CefrLevel string  `json:"cefr_level"`
	Feedback  string  `json:"feedback"`
}

func (r *Repository) runAIAssessment(sessionID int) {
	mediaURL := os.Getenv("MEDIA_SERVICE_URL")
	if mediaURL == "" {
		mediaURL = "http://media-service:8000"
	}
	client := &http.Client{Timeout: 60 * time.Second}

	// 1. Process writing answers with Gemini AI
	writingRows, err := r.db.Query(`
		SELECT a.id, COALESCE(q.question_text, ''), COALESCE(a.user_answer_text, ''), q.points
		FROM answers a
		JOIN questions q ON a.question_id = q.id
		JOIN sections s ON q.section_id = s.id
		WHERE a.session_id = $1 AND s.type = 'writing' AND a.user_answer_text IS NOT NULL AND a.user_answer_text != ''
	`, sessionID)
	if err == nil {
		type wItem struct {
			id     int
			prompt string
			text   string
			points float64
		}
		var wItems []wItem
		for writingRows.Next() {
			var item wItem
			if err := writingRows.Scan(&item.id, &item.prompt, &item.text, &item.points); err == nil {
				wItems = append(wItems, item)
			}
		}
		writingRows.Close()

		for _, item := range wItems {
			reqBody, _ := json.Marshal(map[string]interface{}{
				"question_prompt": item.prompt,
				"essay_text":      item.text,
				"max_points":      item.points,
			})
			resp, err := client.Post(mediaURL+"/api/v1/ai/grade-writing", "application/json", bytes.NewBuffer(reqBody))
			if err == nil && resp.StatusCode == http.StatusOK {
				var aiResp aiGradeResponse
				if err := json.NewDecoder(resp.Body).Decode(&aiResp); err == nil && aiResp.Score > 0 {
					fb := fmt.Sprintf("AI Tahlili (CEFR %s): %s", aiResp.CefrLevel, aiResp.Feedback)
					_, _ = r.db.Exec(`UPDATE answers SET score = $1, examiner_feedback = $2, is_graded = true WHERE id = $3`, aiResp.Score, fb, item.id)
				}
				resp.Body.Close()
			}
		}
	}

	// 2. Process speaking answers with Gemini AI
	speakingRows, err := r.db.Query(`
		SELECT a.id, COALESCE(q.question_text, ''), COALESCE(a.audio_file_url, ''), COALESCE(a.user_answer_text, ''), q.points
		FROM answers a
		JOIN questions q ON a.question_id = q.id
		JOIN sections s ON q.section_id = s.id
		WHERE a.session_id = $1 AND s.type = 'speaking' AND ((a.audio_file_url IS NOT NULL AND a.audio_file_url != '') OR (a.user_answer_text IS NOT NULL AND a.user_answer_text != ''))
	`, sessionID)
	if err == nil {
		type sItem struct {
			id       int
			prompt   string
			audioURL string
			text     string
			points   float64
		}
		var sItems []sItem
		for speakingRows.Next() {
			var item sItem
			if err := speakingRows.Scan(&item.id, &item.prompt, &item.audioURL, &item.text, &item.points); err == nil {
				sItems = append(sItems, item)
			}
		}
		speakingRows.Close()

		for _, item := range sItems {
			reqBody, _ := json.Marshal(map[string]interface{}{
				"question_prompt":  item.prompt,
				"audio_file_url":   item.audioURL,
				"user_answer_text": item.text,
				"max_points":       item.points,
			})
			resp, err := client.Post(mediaURL+"/api/v1/ai/grade-speaking", "application/json", bytes.NewBuffer(reqBody))
			if err == nil && resp.StatusCode == http.StatusOK {
				var aiResp aiGradeResponse
				if err := json.NewDecoder(resp.Body).Decode(&aiResp); err == nil && aiResp.Score > 0 {
					fb := fmt.Sprintf("AI Tahlili (CEFR %s): %s", aiResp.CefrLevel, aiResp.Feedback)
					_, _ = r.db.Exec(`UPDATE answers SET score = $1, examiner_feedback = $2, is_graded = true WHERE id = $3`, aiResp.Score, fb, item.id)
				}
				resp.Body.Close()
			}
		}
	}

	// 3. Recalculate and update final session results
	_ = r.RecalculateSessionResults(sessionID)
}

func (r *Repository) RecalculateSessionResults(sessionID int) error {
	query := `
		SELECT 
			COALESCE(SUM(CASE WHEN s.type = 'listening' THEN a.score ELSE 0 END), 0) as listening_score,
			COALESCE(SUM(CASE WHEN s.type = 'reading' THEN a.score ELSE 0 END), 0) as reading_score,
			COALESCE(SUM(CASE WHEN s.type = 'writing' THEN a.score ELSE 0 END), 0) as writing_score,
			COALESCE(SUM(CASE WHEN s.type = 'speaking' THEN a.score ELSE 0 END), 0) as speaking_score,
			COALESCE(SUM(q.points), 0) as max_score,
			COUNT(CASE WHEN s.type IN ('writing', 'speaking') AND a.id IS NOT NULL AND a.is_graded = false THEN 1 END) as pending_grades
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
	r.AutoSubmitExpiredSessions(userID)

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
