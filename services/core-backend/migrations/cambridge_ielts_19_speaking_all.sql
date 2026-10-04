-- Migration: cambridge_ielts_19_speaking_all.sql
-- Cambridge IELTS 19 Academic Speaking Tests 1 to 4
-- Total 4 speaking tests, 12 speaking prompts with official Part 1, 2, 3 tasks

-- Test 195: Cambridge IELTS 19 Academic Speaking Test 1
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(195, 'Cambridge IELTS 19 Academic Speaking Test 1', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 19 Test 1 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(1951, 195, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(19501, 1951, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. Can you find food from many different countries where you live? [Why/Why not?]\n2. How often do you eat typical food from other countries? [Why/Why not?]\n3. Have you ever tried making food from another country? [Why/Why not?]\n4. What food from your country would you recommend to people from other countries? [Why?]', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(19502, 1951, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a law that was introduced in your country and that you thought was a very good idea.\nYou should say:\n• What the law was\n• Who introduced it\n• When and why it was introduced\nAnd explain why you thought this law was such a good idea.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(19503, 1951, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What kinds of rules are common in a school?\n2. How important is it to have rules in a school?\n3. What do you recommend should happen if children break school rules?\n4. Can you suggest why many students decide to study law at university?\n5. What are the key personal qualities needed to be a successful lawyer?\n6. Do you agree that working in the legal profession is very stressful?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 196: Cambridge IELTS 19 Academic Speaking Test 2
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(196, 'Cambridge IELTS 19 Academic Speaking Test 2', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 19 Test 2 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(1961, 196, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(19601, 1961, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. Have you travelled a lot by plane? [To where?/Why not?]\n2. Why do you think some people enjoy travelling by plane?\n3. Would you like to live near an airport? [Why/Why not?]\n4. In the future, do you think that you will travel by plane more often? [Why/Why not?]', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(19602, 1961, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a person from your country who has won a prize, award or medal.\nYou should say:\n• Who this person is\n• Which prize, award or medal they received\n• What they did to win this\nAnd explain whether you think it was right that this person received this prize, award or medal.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(19603, 1961, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What types of school prizes do children in your country receive?\n2. What do you think are the advantages of rewarding schoolchildren for good work?\n3. Do you agree that it’s more important for children to receive rewards from their parents than from teachers?\n4. Do you think that some sportspeople (e.g., top footballers) are paid too much money?\n5. Should everyone on a team get the same prize money when they win?\n6. Do you agree with the view that, in sport, taking part is more important than winning?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 197: Cambridge IELTS 19 Academic Speaking Test 3
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(197, 'Cambridge IELTS 19 Academic Speaking Test 3', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 19 Test 3 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(1971, 197, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(19701, 1971, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. Do you prefer spending holidays with friends or with family? [Why?]\n2. What kind of holiday accommodation do you like to stay in? [Why?]\n3. What plans do you have for your next holiday?\n4. Is your city or region a good place for other people to visit on holiday? [Why/Why not?]', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(19702, 1971, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a car journey you made that took longer than expected.\nYou should say:\n• Where you were going\n• Who you were with\n• How you felt during the journey\nAnd explain why this car journey took longer than expected.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(19703, 1971, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. How interested are young people in your country in learning to drive?\n2. What are the differences between driving in the countryside and driving in the city?\n3. Do you consider most drivers where you live to be good drivers?\n4. How popular are electric cars in your country?\n5. In what ways could more people be persuaded to buy electric cars?\n6. Do you think all cars will be electric one day?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 198: Cambridge IELTS 19 Academic Speaking Test 4
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(198, 'Cambridge IELTS 19 Academic Speaking Test 4', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 19 Test 4 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(1981, 198, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(19801, 1981, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. Do you have a favourite cafe? [Why/Why not?]\n2. Do you often go to cafes by yourself? [Why/Why not?]\n3. What do you think helps to make a cafe very popular? [Why?]\n4. Why do some people prefer cafes that are part of large chains, rather than small, local cafes?', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(19802, 1981, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a place you visited that has beautiful views.\nYou should say:\n• Where this place is\n• When and why you visited it\n• What views you can see from this place\nAnd explain why you think these views are so beautiful.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(19803, 1981, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. Do you agree that most beauty products are a waste of money?\n2. How does the beauty industry advertise its products so successfully?\n3. What do you think of the view that beauty products should not be advertised to children?\n4. Why do many people equate youth with beauty?\n5. Do you think that being beautiful could affect a person’s success in life?\n6. Why might society\'s ideas about beauty change over time?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Sync Sequences
SELECT setval(pg_get_serial_sequence('tests', 'id'), COALESCE((SELECT MAX(id) FROM tests), 1));
SELECT setval(pg_get_serial_sequence('sections', 'id'), COALESCE((SELECT MAX(id) FROM sections), 1));
SELECT setval(pg_get_serial_sequence('questions', 'id'), COALESCE((SELECT MAX(id) FROM questions), 1));
