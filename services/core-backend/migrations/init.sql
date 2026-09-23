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
('admin@cefr.uz', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Tizim Administratori', 'admin'),
('examiner@cefr.uz', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Ali Qodirov (Senior Examiner)', 'examiner'),
('student@cefr.uz', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Jasur Rustamov (Student)', 'student')
ON CONFLICT (email) DO NOTHING;

-- Seed Sample Complete CEFR Mock Test
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1, 'CEFR Official Standard Mock Exam #1', 'To''liq 4 ta ko''nikmani (Listening, Reading, Writing, Speaking) qamrab oluvchi rasmiy ko''rinishdagi CEFR sinov imtihoni.', 'Multi-level (A1-C1)', 120, true)
ON CONFLICT (id) DO NOTHING;

-- Sections
INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(1, 1, 'listening', 'Listening Comprehension', 'Quyidagi audioni tinglang (maksimal 2 marta). Har bir savolga to''g''ri javobni tanlang.', '/media/sample_listening.mp3', NULL, 1),
(2, 1, 'reading', 'Reading Comprehension', 'Chap tarafdagi matnni diqqat bilan o''qing va o''ng tarafdagi savollarga javob bering.', NULL, 
E'The Impact of Artificial Intelligence on Modern Language Learning\n\nArtificial Intelligence (AI) has significantly transformed the educational landscape over the last decade. In language learning, intelligent tutoring systems are now capable of providing instant, personalized feedback on pronunciation, grammar, and vocabulary usage. Unlike traditional classrooms where teacher-student interaction is constrained by time, AI-driven platforms offer continuous, round-the-clock immersion.\n\nRecent studies conducted across international universities indicate that learners utilizing adaptive speech recognition tools demonstrated a 28% faster acquisition of target phonemes compared to conventional self-study groups. Furthermore, automated lexical suggestors analyze student essays in real time, detecting subtle nuances in collocations and register that were historically only caught by native examiners.\n\nHowever, sociolinguists caution against complete reliance on synthetic algorithms. Language is inherently social, deeply rooted in cultural context, empathy, and interpersonal pragmatics. While AI excels at diagnostic drills and syntactic correction, authentic conversational fluency still demands genuine human interaction and unpredictable social exchange.', 
2),
(3, 1, 'writing', 'Writing Assessment', 'Berilgan 2 ta topshiriq bo''yicha insho yozing. So''zlar soni mezonlariga rioya qiling (Task 1: minimum 150 so''z; Task 2: minimum 250 so''z).', NULL, NULL, 3),
(4, 1, 'speaking', 'Speaking Assessment', 'Berilgan mavzular bo''yicha ovozli javob bering. Tayyorgarlik ko''ring va mikrofon tugmasini bosib javobingizni yozib yuboring.', NULL, NULL, 4)
ON CONFLICT (id) DO NOTHING;

-- Questions for Section 1 (Listening)
INSERT INTO questions (section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(1, 'single_choice', 'What is the main topic of the conversation in the audio clip?', '["A university campus tour", "Booking accommodation and flight tickets", "Preparing for an academic research conference", "Job interview preparation"]'::jsonb, 'Booking accommodation and flight tickets', 5, 1),
(1, 'single_choice', 'Which date did the passenger decide to depart?', '["Monday, 12th October", "Wednesday, 14th October", "Friday, 16th October", "Sunday, 18th October"]'::jsonb, 'Wednesday, 14th October', 5, 2),
(1, 'single_choice', 'What extra service was included in the premium package?', '["Free city transport pass", "Complimentary airport shuttle and breakfast", "Guided museum tour", "Baggage insurance only"]'::jsonb, 'Complimentary airport shuttle and breakfast', 5, 3);

-- Questions for Section 2 (Reading)
INSERT INTO questions (section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(2, 'single_choice', 'According to paragraph 2, what advantage did students using adaptive speech recognition achieve?', '["They scored 50% higher on reading tests", "They achieved a 28% faster acquisition of phonemes", "They completely replaced human teachers", "They learned vocabulary without reading books"]'::jsonb, 'They achieved a 28% faster acquisition of phonemes', 5, 1),
(2, 'single_choice', 'Why do sociolinguists advise against solely relying on AI for language learning?', '["Because AI systems are too expensive for ordinary schools", "Because language requires cultural context, empathy, and human social pragmatics", "Because computer screens cause eye fatigue", "Because AI models make frequent grammar mistakes"]'::jsonb, 'Because language requires cultural context, empathy, and human social pragmatics', 5, 2),
(2, 'single_choice', 'The word "synthetic" in paragraph 3 is closest in meaning to:', '["Artificial / non-human", "Natural and organic", "Traditional and ancient", "Flawed and incorrect"]'::jsonb, 'Artificial / non-human', 5, 3);

-- Questions for Section 3 (Writing)
INSERT INTO questions (section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(3, 'essay', 'Task 1: You have recently moved to a new city for work or study. Write a letter to a friend describing your new neighborhood, how you are settling in, and invite them to visit. (Write at least 150 words).', '[]'::jsonb, '', 15, 1),
(3, 'essay', 'Task 2: Some people believe that online education will eventually replace physical universities. To what extent do you agree or disagree? Give reasons and examples from your experience. (Write at least 250 words).', '[]'::jsonb, '', 15, 2);

-- Questions for Section 4 (Speaking)
INSERT INTO questions (section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(4, 'speaking_prompt', 'Part 1 (Personal Introduction): Describe your hometown or city. What do you like most about living there, and what changes would you like to see in the future? (Speak for 1-2 minutes).', '[]'::jsonb, '', 15, 1),
(4, 'speaking_prompt', 'Part 2 (In-depth discussion): Talk about a challenging goal you achieved in your life. Explain what the goal was, what obstacles you overcame, and what lessons you learned. (Speak for 2 minutes).', '[]'::jsonb, '', 15, 2);
