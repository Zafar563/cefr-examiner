-- Migration: 005_cambridge_21_writing.sql
-- Cambridge IELTS 21 Academic Writing Tests 1 to 4 (Authentic Tasks 1 & 2)

-- ==========================================
-- Test 41: Cambridge IELTS 21 Academic Writing Test 1
-- ==========================================
INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (41, 'Cambridge IELTS 21 Academic Writing Test 1', 'Haqiqiy IELTS/CEFR Academic Writing formati: Task 1 (AQSH iqtisodiyoti bo‘yicha ish o‘rinlari grafigi - min 150 so‘z) va Task 2 (Shaharlarda ko‘p qavatli uylar qurilishi inshosi - min 250 so‘z).', 'Multi-level (A1-C1)', 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (4101, 41, 'writing', 'Writing Assessment (Task 1 & Task 2)', 'Ushbu imtihon 2 ta topshiriqdan iborat. Topshiriq 1 uchun tavsiya etilgan vaqt: 20 daqiqa (kamida 150 so‘z). Topshiriq 2 uchun tavsiya etilgan vaqt: 40 daqiqa (kamida 250 so‘z). Insho matningizni pastdagi javob maydoniga kiriting.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(41001, 4101, 'essay', E'WRITING TASK 1\n\nYou should spend about 20 minutes on this task.\n\nThe graph below gives information about the number of jobs in four sectors of the economy in the US between 1960 and 2020.\n\nSummarise the information by selecting and reporting the main features, and make comparisons where relevant.\n\nWrite at least 150 words.', '["/images/writing/cambridge_21_writing_t1.jpg", "https://engnovate.com/wp-content/uploads/2026/06/cambridge-ielts-21-academic-writing-test-1-1-diagram-6a3cf471c4f88.jpg"]'::jsonb, '', 15, 1),
(41002, 4101, 'essay', E'WRITING TASK 2\n\nYou should spend about 40 minutes on this task.\n\nWrite about the following topic:\n\nThe best way to provide enough homes in large cities is to build tall apartment blocks.\n\nTo what extent do you agree or disagree with this statement?\n\nGive reasons for your answer and include any relevant examples from your own knowledge or experience.\n\nWrite at least 250 words.', '[]'::jsonb, '', 25, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, points = EXCLUDED.points;


-- ==========================================
-- Test 42: Cambridge IELTS 21 Academic Writing Test 2
-- ==========================================
INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (42, 'Cambridge IELTS 21 Academic Writing Test 2', 'Haqiqiy IELTS/CEFR Academic Writing formati: Task 1 (Kollej kafesining ta’mirdan oldingi va keyingi xaritasi - min 150 so‘z) va Task 2 (Raqamli davrda teatr va kinoteatrlarning o‘rni - min 250 so‘z).', 'Multi-level (A1-C1)', 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (4201, 42, 'writing', 'Writing Assessment (Task 1 & Task 2)', 'Ushbu imtihon 2 ta topshiriqdan iborat. Topshiriq 1 uchun tavsiya etilgan vaqt: 20 daqiqa (kamida 150 so‘z). Topshiriq 2 uchun tavsiya etilgan vaqt: 40 daqiqa (kamida 250 so‘z). Insho matningizni pastdagi javob maydoniga kiriting.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(42001, 4201, 'essay', E'WRITING TASK 1\n\nYou should spend about 20 minutes on this task.\n\nThe plans below show a college café before it was redesigned and how it looks now.\n\nSummarise the information by selecting and reporting the main features, and make comparisons where relevant.\n\nWrite at least 150 words.', '["/images/writing/cambridge_21_writing_t2.jpg", "https://engnovate.com/wp-content/uploads/2026/06/cambridge-ielts-21-academic-writing-test-2-1-diagram-6a3cf69ce3c3c.jpg"]'::jsonb, '', 15, 1),
(42002, 4201, 'essay', E'WRITING TASK 2\n\nYou should spend about 40 minutes on this task.\n\nWrite about the following topic:\n\nSome people say that in the digital age, theatres and cinemas are no longer important as people can watch all the entertainment they want online. Others argue that theatres and cinemas are still important both economically and culturally.\n\nDiscuss both these views and give your own opinion.\n\nGive reasons for your answer and include any relevant examples from your own knowledge or experience.\n\nWrite at least 250 words.', '[]'::jsonb, '', 25, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, points = EXCLUDED.points;


-- ==========================================
-- Test 43: Cambridge IELTS 21 Academic Writing Test 3
-- ==========================================
INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (43, 'Cambridge IELTS 21 Academic Writing Test 3', 'Haqiqiy IELTS/CEFR Academic Writing formati: Task 1 (Yomg‘ir soyasi cho‘lining hosil bo‘lish jarayoni diagrammasi - min 150 so‘z) va Task 2 (Universitet ta’limida chet elda o‘qish yoki amaliyot o‘tash - min 250 so‘z).', 'Multi-level (A1-C1)', 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (4301, 43, 'writing', 'Writing Assessment (Task 1 & Task 2)', 'Ushbu imtihon 2 ta topshiriqdan iborat. Topshiriq 1 uchun tavsiya etilgan vaqt: 20 daqiqa (kamida 150 so‘z). Topshiriq 2 uchun tavsiya etilgan vaqt: 40 daqiqa (kamida 250 so‘z). Insho matningizni pastdagi javob maydoniga kiriting.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(43001, 4301, 'essay', E'WRITING TASK 1\n\nYou should spend about 20 minutes on this task.\n\nThe diagram below shows how one type of desert, known as a rain-shadow desert, is formed.\n\nSummarise the information by selecting and reporting the main features, and make comparisons where relevant.\n\nWrite at least 150 words.', '["/images/writing/cambridge_21_writing_t3.jpg", "https://engnovate.com/wp-content/uploads/2026/06/cambridge-ielts-21-academic-writing-test-3-1-diagram-6a3cf9263843a.jpg"]'::jsonb, '', 15, 1),
(43002, 4301, 'essay', E'WRITING TASK 2\n\nYou should spend about 40 minutes on this task.\n\nWrite about the following topic:\n\nAll university undergraduate courses should include a period of time spent studying abroad or doing a work placement.\n\nDo you think the advantages of this would outweigh the disadvantages?\n\nGive reasons for your answer and include any relevant examples from your own knowledge or experience.\n\nWrite at least 250 words.', '[]'::jsonb, '', 25, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, points = EXCLUDED.points;


-- ==========================================
-- Test 44: Cambridge IELTS 21 Academic Writing Test 4
-- ==========================================
INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (44, 'Cambridge IELTS 21 Academic Writing Test 4', 'Haqiqiy IELTS/CEFR Academic Writing formati: Task 1 (Universitet kutubxonasidan foydalanuvchilar so‘rovi jadvali va diagrammasi - min 150 so‘z) va Task 2 (Boshlang‘ich ta’limda rasmiy o‘qish va o‘yin balansi - min 250 so‘z).', 'Multi-level (A1-C1)', 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (4401, 44, 'writing', 'Writing Assessment (Task 1 & Task 2)', 'Ushbu imtihon 2 ta topshiriqdan iborat. Topshiriq 1 uchun tavsiya etilgan vaqt: 20 daqiqa (kamida 150 so‘z). Topshiriq 2 uchun tavsiya etilgan vaqt: 40 daqiqa (kamida 250 so‘z). Insho matningizni pastdagi javob maydoniga kiriting.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(44001, 4401, 'essay', E'WRITING TASK 1\n\nYou should spend about 20 minutes on this task.\n\nThe chart and table below show the results of a survey of library users at a university.\n\nSummarise the information by selecting and reporting the main features, and make comparisons where relevant.\n\nWrite at least 150 words.', '["/images/writing/cambridge_21_writing_t4.jpg", "https://engnovate.com/wp-content/uploads/2026/06/cambridge-ielts-21-academic-writing-test-4-1-diagram-6a3cfa2909fd5.jpg"]'::jsonb, '', 15, 1),
(44002, 4401, 'essay', E'WRITING TASK 2\n\nYou should spend about 40 minutes on this task.\n\nWrite about the following topic:\n\nSome people argue that primary schools focus too much on formal learning.\n\nTo what extent do you agree with this opinion?\n\nHow important do you think it is for children to play as well as learn in the primary school classroom?\n\nGive reasons for your answer and include any relevant examples from your own knowledge or experience.\n\nWrite at least 250 words.', '[]'::jsonb, '', 25, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, points = EXCLUDED.points;

-- Synchronize sequences
SELECT setval(pg_get_serial_sequence('tests', 'id'), COALESCE((SELECT MAX(id) FROM tests), 1));
SELECT setval(pg_get_serial_sequence('sections', 'id'), COALESCE((SELECT MAX(id) FROM sections), 1));
SELECT setval(pg_get_serial_sequence('questions', 'id'), COALESCE((SELECT MAX(id) FROM questions), 1));
