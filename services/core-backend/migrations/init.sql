-- CEFR Practice & Assessment Database Schema

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL CHECK (role IN ('student', 'examiner', 'admin')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tests (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    level VARCHAR(50) DEFAULT 'Multi-level (A1-C1)',
    duration_minutes INT DEFAULT 120,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sections (
    id SERIAL PRIMARY KEY,
    test_id INT REFERENCES tests(id) ON DELETE CASCADE,
    type VARCHAR(50) NOT NULL CHECK (type IN ('listening', 'reading', 'writing', 'speaking')),
    title VARCHAR(255) NOT NULL,
    instructions TEXT,
    audio_url TEXT,
    passage_text TEXT,
    order_index INT DEFAULT 1
);

CREATE TABLE IF NOT EXISTS questions (
    id SERIAL PRIMARY KEY,
    section_id INT REFERENCES sections(id) ON DELETE CASCADE,
    question_type VARCHAR(50) NOT NULL CHECK (question_type IN ('single_choice', 'multiple_choice', 'text_input', 'essay', 'speaking_prompt')),
    question_text TEXT NOT NULL,
    options JSONB DEFAULT '[]'::jsonb,
    correct_answer TEXT,
    points INT DEFAULT 1,
    order_index INT DEFAULT 1
);

CREATE TABLE IF NOT EXISTS test_sessions (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    test_id INT REFERENCES tests(id) ON DELETE CASCADE,
    status VARCHAR(50) DEFAULT 'in_progress' CHECK (status IN ('in_progress', 'submitted', 'graded')),
    started_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    submitted_at TIMESTAMP WITH TIME ZONE,
    current_section_index INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS answers (
    id SERIAL PRIMARY KEY,
    session_id INT REFERENCES test_sessions(id) ON DELETE CASCADE,
    question_id INT REFERENCES questions(id) ON DELETE CASCADE,
    user_answer_text TEXT,
    audio_file_url TEXT,
    score FLOAT DEFAULT 0,
    examiner_feedback TEXT,
    is_graded BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_session_question UNIQUE (session_id, question_id)
);

CREATE TABLE IF NOT EXISTS test_results (
    id SERIAL PRIMARY KEY,
    session_id INT UNIQUE REFERENCES test_sessions(id) ON DELETE CASCADE,
    listening_score FLOAT DEFAULT 0,
    reading_score FLOAT DEFAULT 0,
    writing_score FLOAT DEFAULT 0,
    speaking_score FLOAT DEFAULT 0,
    total_score FLOAT DEFAULT 0,
    max_score FLOAT DEFAULT 120,
    percentage FLOAT DEFAULT 0,
    cefr_level VARCHAR(10) DEFAULT 'A1',
    is_final BOOLEAN DEFAULT FALSE,
    feedback_summary TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Indexing for performance
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_sections_test_id ON sections(test_id);
CREATE INDEX IF NOT EXISTS idx_questions_section_id ON questions(section_id);
CREATE INDEX IF NOT EXISTS idx_sessions_user_id ON test_sessions(user_id);
CREATE INDEX IF NOT EXISTS idx_answers_session_id ON answers(session_id);

-- SEED DATA
-- Default passwords: password123 (bcrypt hash: $2a$10$7R6v74u8U1KxL95yD0wJneX942K2f5K5uN9o0vIeJ7m1wP4vO6Xm2)
-- Using a standard bcrypt hash for 'password123': $2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy
INSERT INTO users (email, password_hash, full_name, role) VALUES
('admin@cefr.uz', '$2a$10$bER7FK3.9KsIeNPNE6evCOBHP5oLSkHtNscMhMHRLcT1PgjeiwORK', 'Tizim Administratori', 'admin'),
('examiner@cefr.uz', '$2a$10$bER7FK3.9KsIeNPNE6evCOBHP5oLSkHtNscMhMHRLcT1PgjeiwORK', 'Ali Qodirov (Senior Examiner)', 'examiner'),
('student@cefr.uz', '$2a$10$bER7FK3.9KsIeNPNE6evCOBHP5oLSkHtNscMhMHRLcT1PgjeiwORK', 'Jasur Rustamov (Student)', 'student')
ON CONFLICT (email) DO NOTHING;



-- Synchronize sequences for auto-incrementing SERIAL columns
SELECT setval(pg_get_serial_sequence('tests', 'id'), COALESCE((SELECT MAX(id) FROM tests), 1));
SELECT setval(pg_get_serial_sequence('sections', 'id'), COALESCE((SELECT MAX(id) FROM sections), 1));
SELECT setval(pg_get_serial_sequence('questions', 'id'), COALESCE((SELECT MAX(id) FROM questions), 1));
SELECT setval(pg_get_serial_sequence('users', 'id'), COALESCE((SELECT MAX(id) FROM users), 1));
