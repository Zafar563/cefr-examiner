-- Migration: cambridge_ielts_20_writing_test_3.sql
-- Cambridge IELTS 20 Academic Writing Test 3

INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (2043, 'Cambridge IELTS 20 Academic Writing Test 3', 'Haqiqiy IELTS/CEFR Academic Writing formati: Task 1 (You should spend about 20 minutes on this task. - min 150 so‘z) va Task 2 (You should spend about 40 minutes on this task. Write about the following topic: - min 250 so‘z).', 'Multi-level (A1-C1)', 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (20431, 2043, 'writing', 'Writing Assessment (Task 1 & Task 2)', 'Ushbu imtihon 2 ta topshiriqdan iborat. Topshiriq 1 uchun tavsiya etilgan vaqt: 20 daqiqa (kamida 150 so‘z). Topshiriq 2 uchun tavsiya etilgan vaqt: 40 daqiqa (kamida 250 so‘z). Insho matningizni pastdagi javob maydoniga kiriting.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(204301, 20431, 'essay', 'WRITING TASK 1

You should spend about 20 minutes on this task.

The charts below give information about a public library in a town called Little Chalfont.

Summarise the information by selecting and reporting the main features, and make comparisons where relevant.

Write at least 150 words.', '["/images/writing/cambridge_20_writing_t3.png", "https://engnovate.com/wp-content/uploads/2025/07/Cambridge-IELTS-20-Academic-Writing-Test-3-1.png"]'::jsonb, '', 15, 1),
(204302, 20431, 'essay', 'WRITING TASK 2

You should spend about 40 minutes on this task.

Write about the following topic:

Some people have decided to reduce the number of times they fly every year or to stop flying altogether. Do you think the environmental benefits of this development outweigh the disadvantages for individuals and businesses?

Give reasons for your answer and include any relevant examples from your own knowledge or experience.

Write at least 250 words.', '[]'::jsonb, '', 25, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, points = EXCLUDED.points;
