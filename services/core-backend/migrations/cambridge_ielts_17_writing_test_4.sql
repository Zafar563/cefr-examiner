-- Migration: cambridge_ielts_17_writing_test_4.sql
-- Cambridge IELTS 17 Academic Writing Test 4

INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (1744, 'Cambridge IELTS 17 Academic Writing Test 4', 'Haqiqiy IELTS/CEFR Academic Writing formati: Task 1 (The graph below shows the number of shops that closed and the number of new shop - min 150 so‘z) va Task 2 (Nowadays, a growing number of people with health problems are trying alternative - min 250 so‘z).', 'Multi-level (A1-C1)', 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (17441, 1744, 'writing', 'Writing Assessment (Task 1 & Task 2)', 'Ushbu imtihon 2 ta topshiriqdan iborat. Topshiriq 1 uchun tavsiya etilgan vaqt: 20 daqiqa (kamida 150 so‘z). Topshiriq 2 uchun tavsiya etilgan vaqt: 40 daqiqa (kamida 250 so‘z). Insho matningizni pastdagi javob maydoniga kiriting.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(174401, 17441, 'essay', 'WRITING TASK 1

You should spend about 20 minutes on this task.

The graph below shows the number of shops that closed and the number of new shops that opened in one country between 2011 and 2018.

Summarise the information by selecting and reporting the main features, and make comparisons where relevant.

Write at least 150 words.', '["/images/writing/cambridge_17_writing_t4.png", "https://engnovate.com/wp-content/uploads/2023/08/cambridge-ielts-17-academic-writing-test-4-1.png"]'::jsonb, '', 15, 1),
(174402, 17441, 'essay', 'WRITING TASK 2

You should spend about 40 minutes on this task.

Write about the following topic:

Nowadays, a growing number of people with health problems are trying alternative medicines and treatments instead of visiting their usual doctor.
Do you think this is a positive or a negative development?

Give reasons for your answer and include any relevant examples from your own knowledge or experience.

Write at least 250 words.', '[]'::jsonb, '', 25, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, points = EXCLUDED.points;
