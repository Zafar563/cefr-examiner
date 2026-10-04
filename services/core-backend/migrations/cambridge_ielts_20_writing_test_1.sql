-- Migration: cambridge_ielts_20_writing_test_1.sql
-- Cambridge IELTS 20 Academic Writing Test 1

INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (2041, 'Cambridge IELTS 20 Academic Writing Test 1', 'Haqiqiy IELTS/CEFR Academic Writing formati: Task 1 (The first table below shows changes in the total population of New York City fro - min 150 so‘z) va Task 2 (You should spend about 40 minutes on this task. Write at least 250 words. - min 250 so‘z).', 'Multi-level (A1-C1)', 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (20411, 2041, 'writing', 'Writing Assessment (Task 1 & Task 2)', 'Ushbu imtihon 2 ta topshiriqdan iborat. Topshiriq 1 uchun tavsiya etilgan vaqt: 20 daqiqa (kamida 150 so‘z). Topshiriq 2 uchun tavsiya etilgan vaqt: 40 daqiqa (kamida 250 so‘z). Insho matningizni pastdagi javob maydoniga kiriting.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(204101, 20411, 'essay', 'WRITING TASK 1

You should spend about 20 minutes on this task.

The first table below shows changes in the total population of New York City from 1800 to 2000. The second and third tables show changes in the population of the five districts of the city (Manhattan, Brooklyn, Bronx, Queens, Staten Island) over the same period.

Summarise the information by selecting and reporting the main features, and make comparisons where relevant.

Write at least 150 words.', '["/images/writing/cambridge_20_writing_t1.png", "https://engnovate.com/wp-content/uploads/2025/07/Cambridge-IELTS-20-Academic-Writing-Test-1-1.png"]'::jsonb, '', 15, 1),
(204102, 20411, 'essay', 'WRITING TASK 2

You should spend about 40 minutes on this task.

Write about the following topic:

Access to clean water is a basic human right. Therefore, every home should have a water supply that is provided free of charge.
Do you agree or disagree?

Give reasons for your answer and include any relevant examples from your own knowledge or experience.

Write at least 250 words.', '[]'::jsonb, '', 25, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, points = EXCLUDED.points;
