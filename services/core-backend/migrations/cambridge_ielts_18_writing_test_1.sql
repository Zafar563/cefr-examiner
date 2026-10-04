-- Migration: cambridge_ielts_18_writing_test_1.sql
-- Cambridge IELTS 18 Academic Writing Test 1

INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (1841, 'Cambridge IELTS 18 Academic Writing Test 1', 'Haqiqiy IELTS/CEFR Academic Writing formati: Task 1 (The graph below gives information about the percentage of the population in four - min 150 so‘z) va Task 2 (The most important aim of science should be to improve people''s lives. To what e - min 250 so‘z).', 'Multi-level (A1-C1)', 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (18411, 1841, 'writing', 'Writing Assessment (Task 1 & Task 2)', 'Ushbu imtihon 2 ta topshiriqdan iborat. Topshiriq 1 uchun tavsiya etilgan vaqt: 20 daqiqa (kamida 150 so‘z). Topshiriq 2 uchun tavsiya etilgan vaqt: 40 daqiqa (kamida 250 so‘z). Insho matningizni pastdagi javob maydoniga kiriting.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(184101, 18411, 'essay', 'WRITING TASK 1

You should spend about 20 minutes on this task.

The graph below gives information about the percentage of the population in four Asian countries living in cities from 1970 to 2020, with predictions for 2030 and 2040.

Summarise the information by selecting and reporting the main features, and make comparisons where relevant.

Write at least 150 words.', '["/images/writing/cambridge_18_writing_t1.png", "https://engnovate.com/wp-content/uploads/2023/08/cambridge-ielts-18-academic-writing-test-1-1.png"]'::jsonb, '', 15, 1),
(184102, 18411, 'essay', 'WRITING TASK 2

You should spend about 40 minutes on this task.

Write about the following topic:

The most important aim of science should be to improve people''s lives. To what extent do you agree or disagree with this statement?

Give reasons for your answer and include any relevant examples from your own knowledge or experience.

Write at least 250 words.', '[]'::jsonb, '', 25, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, points = EXCLUDED.points;
