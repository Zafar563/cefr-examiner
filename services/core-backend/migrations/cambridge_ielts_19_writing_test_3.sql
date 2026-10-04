-- Migration: cambridge_ielts_19_writing_test_3.sql
-- Cambridge IELTS 19 Academic Writing Test 3

INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (1943, 'Cambridge IELTS 19 Academic Writing Test 3', 'Haqiqiy IELTS/CEFR Academic Writing formati: Task 1 (The diagram below shows how a biofuel called ethanol is produced. - min 150 so‘z) va Task 2 (It is important for everyone, including young people, to save money for their fu - min 250 so‘z).', 'Multi-level (A1-C1)', 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (19431, 1943, 'writing', 'Writing Assessment (Task 1 & Task 2)', 'Ushbu imtihon 2 ta topshiriqdan iborat. Topshiriq 1 uchun tavsiya etilgan vaqt: 20 daqiqa (kamida 150 so‘z). Topshiriq 2 uchun tavsiya etilgan vaqt: 40 daqiqa (kamida 250 so‘z). Insho matningizni pastdagi javob maydoniga kiriting.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(194301, 19431, 'essay', 'WRITING TASK 1

You should spend about 20 minutes on this task.

The diagram below shows how a biofuel called ethanol is produced.

Summarise the information by selecting and reporting the main features, and make comparisons where relevant.

Write at least 150 words.', '["/images/writing/cambridge_19_writing_t3.png", "https://engnovate.com/wp-content/uploads/2024/10/cambridge-ielts-19-academic-writing-test-3\u20131.png"]'::jsonb, '', 15, 1),
(194302, 19431, 'essay', 'WRITING TASK 2

You should spend about 40 minutes on this task.

Write about the following topic:

It is important for everyone, including young people, to save money for their future.
To what extent do you agree or disagree with this statement?

Give reasons for your answer and include any relevant examples from your own knowledge or experience.

Write at least 250 words.', '[]'::jsonb, '', 25, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, points = EXCLUDED.points;
