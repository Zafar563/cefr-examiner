-- Migration: cambridge_ielts_16_speaking_all.sql
-- Cambridge IELTS 16 Academic Speaking Tests 1 to 4
-- Total 4 speaking tests, 12 speaking prompts with official Part 1, 2, 3 tasks

-- Test 165: Cambridge IELTS 16 Academic Speaking Test 1
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(165, 'Cambridge IELTS 16 Academic Speaking Test 1', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 16 Test 1 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(1651, 165, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(16501, 1651, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. Who do you spend most time studying/working with? [Why?]\n2. What kinds of things do you study/work on with other people? [Why?]\n3. Are there times when you study/work better by yourself? [Why/why not?]\n4. Is it important to like the people you study/work with? [Why/why not?]', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(16502, 1651, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a tourist attraction you enjoyed visiting.\nYou should say:\n• What this tourist attraction is\n• When and why you visited it\n• What you did there\nAnd explain why you enjoyed visiting this tourist attraction.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(16503, 1651, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What are the most popular tourist attractions in your country?\n2. How do the types of tourist attractions that younger people like to visit compare with those that older people like to visit?\n3. Do you agree that some tourist attractions (e.g national museums/galleries) should be free to visit?\n4. Why is tourism important to a country?\n5. What are the benefits to individuals of visiting another country as tourists?\n6. How necessary is it for tourists to learn the language of the country they\'re visiting?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 166: Cambridge IELTS 16 Academic Speaking Test 2
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(166, 'Cambridge IELTS 16 Academic Speaking Test 2', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 16 Test 2 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(1661, 166, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(16601, 1661, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. Do you have a favorite flower or plant? [Why/why not?]\n2. What kinds of flowers and plants grow near where you live? [Why/why not?]\n3. Is it important to you to have flowers and plants in your home? [Why/why not?]\n4. Have you ever bought flowers for someone else? [Why/why not?]', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(16602, 1661, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a review you read about a product or service.\nYou should say:\n• Where you read the review\n• What the product or service was\n• What information the review gave about the product or service\nAnd explain what you did as a result of reading this reveiw.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(16603, 1661, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What kinds of things do people write online reviews about in your country?\n2. Why do some people write online reviews?\n3. Do you think that online reviews are good for both shoppers and companies?\n4. What do you think it might be like to work in a customer service job?\n5. Do you agree that customers are more likely to complain nowadays?\n6. How important is it for companies to take all customer complaints seriously?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 167: Cambridge IELTS 16 Academic Speaking Test 3
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(167, 'Cambridge IELTS 16 Academic Speaking Test 3', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 16 Test 3 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(1671, 167, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(16701, 1671, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. Is summer your favorite time of year? [Why/why not?]\n2. What do you do in summer when the weather\'s very hot? [Why?]\n3. Do you go on holiday every summer? [Why/why not?]\n4. Did you enjoy the summer holidays when you were at school? [Why/why not?]', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(16702, 1671, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a luxury item you would like to own in the future.\nYou should say:\n• What item you would like to own\n• What this item looks like\n• Why you would like to own this item\nAnd explain whether you think you will ever own this item.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(16703, 1671, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. Which expensive items would many young people (in your country) like to buy?\n2. How do the expensive items that younger people want to buy differ from those that older people want to buy?\n3. Do you think that people are more likely to buy expensive items for their friends or for themselves?\n4. How difficult is it to become very rich in today\'s world?\n5. Do you agree that money does not necessarily bring happiness?\n6. In what ways might rich people use their money to help society?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 168: Cambridge IELTS 16 Academic Speaking Test 4
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(168, 'Cambridge IELTS 16 Academic Speaking Test 4', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 16 Test 4 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(1681, 168, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(16801, 1681, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. What kinds of fast food have you tried? [Why/why not?]\n2. Do you ever use a microwave to cook food quickly? [Why/why not?]\n3. How popular are fast food restaurants where you live? [Why/why not?]\n4. When would you go to a fast-food restaurant? [Why/why not?]', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(16802, 1681, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe some technology (e.g an app, phone, software program) that you decided to stop using.\nYou should say:\n• When and where you got this technology\n• Why you started using this technology\n• Why you decided to stop using it\nAnd explain how you feel about the decision you made.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(16803, 1681, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What kinds of computer games do people play in your country?\n2. Why do people enjoy playing computer games?\n3. Do you think that all computer games should have a minimum age for players?\n4. In what ways can technology in the classroom be helpful?\n5. Do you agree that students are often better at using technology than their teachers?\n6. Do you believe that computers will ever replace human teachers?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Sync Sequences
SELECT setval(pg_get_serial_sequence('tests', 'id'), COALESCE((SELECT MAX(id) FROM tests), 1));
SELECT setval(pg_get_serial_sequence('sections', 'id'), COALESCE((SELECT MAX(id) FROM sections), 1));
SELECT setval(pg_get_serial_sequence('questions', 'id'), COALESCE((SELECT MAX(id) FROM questions), 1));
