-- Migration: cambridge_ielts_18_writing_test_2.sql
-- Cambridge IELTS 18 Academic Writing Test 2

INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (1842, 'Cambridge IELTS 18 Academic Writing Test 2', 'Haqiqiy IELTS/CEFR Academic Writing formati: Task 1 (The chart below shows the number of households in the US by their annual '' incom - min 150 so‘z) va Task 2 (Some university students want to learn about other subjects in addition to their - min 250 so‘z).', 'Multi-level (A1-C1)', 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (18421, 1842, 'writing', 'Writing Assessment (Task 1 & Task 2)', 'Ushbu imtihon 2 ta topshiriqdan iborat. Topshiriq 1 uchun tavsiya etilgan vaqt: 20 daqiqa (kamida 150 so‘z). Topshiriq 2 uchun tavsiya etilgan vaqt: 40 daqiqa (kamida 250 so‘z). Insho matningizni pastdagi javob maydoniga kiriting.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(184201, 18421, 'essay', 'WRITING TASK 1

You should spend about 20 minutes on this task.

The chart below shows the number of households in the US by their annual '' income in 2007, 2011 and 2015.

Summarise the information by selecting and reporting the main features, and make comparisons where relevant.

Write at least 150 words.', '["/images/writing/cambridge_18_writing_t2.webp", "https://engnovate.com/wp-content/uploads/2023/08/cambridge-ielts-18-academic-writing-test-2-1.webp"]'::jsonb, '', 15, 1),
(184202, 18421, 'essay', 'WRITING TASK 2

You should spend about 40 minutes on this task.

Write about the following topic:

Some university students want to learn about other subjects in addition to their main subjects. Others believe it is more important to give all their time and attention to studying for a qualification.
Discuss both these views and give your own opinion.

Give reasons for your answer and include any relevant examples from your own knowledge or experience.

Write at least 250 words.', '[]'::jsonb, '', 25, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, points = EXCLUDED.points;
