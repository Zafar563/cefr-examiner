-- Migration: cambridge_ielts_14_writing_test_4.sql
-- Cambridge IELTS 14 Academic Writing Test 4

INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (1444, 'Cambridge IELTS 14 Academic Writing Test 4', 'Haqiqiy IELTS/CEFR Academic Writing formati: Task 1 (The plans below show a public park when it first opened in 1920 and the same par - min 150 so‘z) va Task 2 (Nowadays many people choose to be self-employed, rather than to work for a compa - min 250 so‘z).', 'Multi-level (A1-C1)', 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (14441, 1444, 'writing', 'Writing Assessment (Task 1 & Task 2)', 'Ushbu imtihon 2 ta topshiriqdan iborat. Topshiriq 1 uchun tavsiya etilgan vaqt: 20 daqiqa (kamida 150 so‘z). Topshiriq 2 uchun tavsiya etilgan vaqt: 40 daqiqa (kamida 250 so‘z). Insho matningizni pastdagi javob maydoniga kiriting.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(144401, 14441, 'essay', 'WRITING TASK 1

You should spend about 20 minutes on this task.

The plans below show a public park when it first opened in 1920 and the same park today.

Summarise the information by selecting and reporting the main features, and make comparisons where relevant.

Write at least 150 words.', '["/images/writing/cambridge_14_writing_t4.png", "https://engnovate.com/wp-content/uploads/2023/08/cambridge-ielts-14-academic-writing-test-4-1.png"]'::jsonb, '', 15, 1),
(144402, 14441, 'essay', 'WRITING TASK 2

You should spend about 40 minutes on this task.

Write about the following topic:

Nowadays many people choose to be self-employed, rather than to work for a company or organisation.
Why might this be the case?
What could be the disadvantages of being self-employed?

Give reasons for your answer and include any relevant examples from your own knowledge or experience.

Write at least 250 words.', '[]'::jsonb, '', 25, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, points = EXCLUDED.points;
