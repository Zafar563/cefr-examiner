-- Migration: 004_speaking_tests.sql
-- Cambridge IELTS 21 & 20 Academic Speaking Tests (4 tests)

-- Test 31: Cambridge IELTS 21 Academic Speaking Test 1
INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (31, 'Cambridge IELTS 21 Academic Speaking Test 1', 'Haqiqiy IELTS/CEFR Speaking formati: Part 1 (Tanishtiruv va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Chuqurlashtirilgan tahliliy suhbat).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (3101, 31, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(31001, 3101, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. What is your hometown like? What do you like most about living there?\n2. Do you prefer spending your free time indoors or outdoors? Why?\n3. How often do you use public transport, and what improvements would you like to see in your local transport system?', '[]'::jsonb, '', 10, 1),
(31002, 3101, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a memorable journey or trip you took that did not go according to plan.\nYou should say:\n• Where you were going and who you were with\n• What unexpected event or problem happened\n• How you handled the situation\nAnd explain what you learned from this experience.', '[]'::jsonb, '', 15, 2),
(31003, 3101, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. How has modern technology changed the way people travel today compared to the past?\n2. What are the environmental consequences of increased global tourism, and how can they be minimized?\n3. Do you think international travel helps promote cultural understanding between different nations? Why or why not?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;


-- Test 32: Cambridge IELTS 21 Academic Speaking Test 2
INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (32, 'Cambridge IELTS 21 Academic Speaking Test 2', 'Haqiqiy IELTS/CEFR Speaking formati: Ish/o‘qish mavzulari, maqsadlarga erishish va jamiyatdagi muvaffaqiyat omillari bo‘yicha suhbat.', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (3201, 32, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(32001, 3201, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. Do you currently work or are you a student? What is your favorite aspect of your work or studies?\n2. How important is healthy eating to you, and do you enjoy cooking at home?\n3. What kind of music do you like to listen to when you want to relax and unwind?', '[]'::jsonb, '', 10, 1),
(32002, 3201, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe an ambitious goal or project you worked hard to achieve.\nYou should say:\n• What the goal was and when you started working on it\n• What difficulties or obstacles you had to overcome\n• Who helped or encouraged you along the way\nAnd explain how you felt when you finally accomplished it.', '[]'::jsonb, '', 15, 2),
(32003, 3201, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. Why do some people set very ambitious goals while others prefer simple, achievable routines?\n2. How does the pressure to succeed in modern society impact mental health and work-life balance?\n3. In your opinion, is individual determination or external support more important for achieving long-term success?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;


-- Test 33: Cambridge IELTS 20 Academic Speaking Test 1
INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (33, 'Cambridge IELTS 20 Academic Speaking Test 1', 'Haqiqiy IELTS/CEFR Speaking formati: Zamonaviy texnologiyalar, sun’iy intellekt va raqamli qurilmalarning hayotimizga ta’siri bo‘yicha suhbat.', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (3301, 33, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(33001, 3301, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. What kind of weather do you enjoy the most, and how does weather affect your daily mood?\n2. How much time do you spend using digital screens (smartphones, computers) each day?\n3. Do you prefer reading physical books or reading articles and news online? Why?', '[]'::jsonb, '', 10, 1),
(33002, 3301, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe an important piece of technology (electronic device or software) that you use daily.\nYou should say:\n• What it is and how long you have had it\n• What you primarily use it for\n• How easy or difficult it was to learn how to use it\nAnd explain how your daily routine would change if you could no longer use it.', '[]'::jsonb, '', 15, 2),
(33003, 3301, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. How has Artificial Intelligence started to affect education and everyday jobs in recent years?\n2. Do you think people have become overly dependent on digital devices for basic tasks?\n3. What measures can parents and educators take to help teenagers maintain healthy digital habits?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;


-- Test 34: Cambridge IELTS 20 Academic Speaking Test 2
INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES (34, 'Cambridge IELTS 20 Academic Speaking Test 2', 'Haqiqiy IELTS/CEFR Speaking formati: Ustozlar va yetakchilar, ijtimoiy ta’lim va qadriyatlar mavzusi bo‘yicha suhbat.', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES (3401, 34, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
(34001, 3401, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. What hobbies or sports did you enjoy most when you were a child?\n2. How do people in your country typically celebrate national holidays or family gatherings?\n3. Do you enjoy shopping in local traditional markets or modern supermarkets? Why?', '[]'::jsonb, '', 10, 1),
(34002, 3401, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a person (a teacher, mentor, or family member) who had a significant positive influence on your life.\nYou should say:\n• Who this person is and how you know them\n• What special qualities or skills they possess\n• What valuable advice or lessons they gave you\nAnd explain why this person continues to inspire you today.', '[]'::jsonb, '', 15, 2),
(34003, 3401, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What qualities make someone an inspiring leader or role model in a community?\n2. How has the role of teachers changed in the era of internet access and online self-study?\n3. Do you think younger generations are more influenced by celebrities and social media influencers or by real-life mentors?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Synchronize sequences
SELECT setval(pg_get_serial_sequence('tests', 'id'), COALESCE((SELECT MAX(id) FROM tests), 1));
SELECT setval(pg_get_serial_sequence('sections', 'id'), COALESCE((SELECT MAX(id) FROM sections), 1));
SELECT setval(pg_get_serial_sequence('questions', 'id'), COALESCE((SELECT MAX(id) FROM questions), 1));
