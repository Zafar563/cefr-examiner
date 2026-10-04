-- Migration: cambridge_ielts_20_speaking_all.sql
-- Cambridge IELTS 20 Academic Speaking Tests 1 to 4
-- Total 4 speaking tests, 12 speaking prompts with official Part 1, 2, 3 tasks

-- Test 33: Cambridge IELTS 20 Academic Speaking Test 1
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(33, 'Cambridge IELTS 20 Academic Speaking Test 1', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 20 Test 1 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(3301, 33, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(33001, 3301, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. How much walking do you do in your daily life?\n2. Did you walk more when you were at school than now?\n3. What places are there to go for a walk near where you live?\n4. Would you ever like to go on a walking holiday?', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(33002, 3301, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a play or a film you have seen that you would like to see again with friends.\nYou should say:\n• What play or film you\'d like to go to see again\n• Who you would go with\n• What other people have said about this play or film\nAnd explain why you would like to see this play or film again with friends.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(33003, 3301, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What are the most popular kinds of plays or shows at theatres in your country?\n2. How easy is it to get tickets to the theatre?\n3. Do you think theatres need to do more to attract younger audiences?\n4. What do you think attracts people to working as an actor?\n5. What are some of the qualities that a person needs to have if they want to become an actor?\n6. Can you think of any disadvantages of working as an actor?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 34: Cambridge IELTS 20 Academic Speaking Test 2
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(34, 'Cambridge IELTS 20 Academic Speaking Test 2', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 20 Test 2 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(3401, 34, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(34001, 3401, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. What\'s your favourite fruit?\n2. Are there any kinds of fruit that you don\'t like eating?\n3. Do you like eating cooked food that has fruit in it?\n4. Where\'s the best place to buy fruit where you live?', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(34002, 3401, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a time when you changed a plan you had made.\nYou should say:\n• What your original plan was\n• Why you changed it\n• What new plan you made and explain how you felt about changing your plan.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(34003, 3401, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What kinds of plans do friends make together?\n2. Do you think it\'s better to discuss future plans with friends or with family?\n3. When making plans for the future, is it important not to copy friends?\n4. When people are choosing what to study, how important is it that their course should lead directly to a career?\n5. Why is it a good idea to get some work experience before deciding on a future career?\n6. How easy do you think it is for people to change from one career to another?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 37: Cambridge IELTS 20 Academic Speaking Test 3
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(37, 'Cambridge IELTS 20 Academic Speaking Test 3', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 20 Test 3 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(3701, 37, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(37001, 3701, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. Did you enjoy going to museums when you were a child?\n2. Are there any interesting museums near where you live now?\n3. Do you think it is best to go to museums by yourself or with friends?\n4. When you visit another city or country, do you think it\'s important to go to a museum there?', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(37002, 3701, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a piece of work you did for your job or your studies that you felt very satisfied with.\nYou should say:\n• What this piece of work was\n• Why you did this piece of work\n• Who or what helped you to do this work and explain why you felt so satisfied with this piece of work.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(37003, 3701, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What are some aspects of people\'s lives that they can often be dissatisfied with?\n2. Would you say that having ambitions in life is always a positive thing?\n3. What do you believe the most important components are of a satisfying life?\n4. What makes a job more satisfying: a high salary or having good colleagues?\n5. Do you think people need to change jobs regularly if they want to stay satisfied at work?\n6. Is it possible to find job satisfaction in all types of work?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 38: Cambridge IELTS 20 Academic Speaking Test 4
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(38, 'Cambridge IELTS 20 Academic Speaking Test 4', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 20 Test 4 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(3801, 38, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(38001, 3801, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. What do you think your best personal qualities are? [Why?]\n2. Do you have the same personal qualities as your parents? [Why/Why not?]\n3. What personal qualities are important to you in a friend? [Why?]\n4. Do you think you have the personal qualities to be a good/successful leader? [Why/Why not?]', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(38002, 3801, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a time when you had a long discussion about a news story.\nYou should say:\n• What the news story was about\n• Who you discussed this news story with\n• What people\'s opinions were and explain why you had such a long discussion about this news story.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(38003, 3801, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. How do most people find out about the news in your country?\n2. Are people more interested in local news than national news?\n3. How important is it to know about international news?\n4. Why are discussion programmes involving members of the public popular on [TV and radio]?\n5. What kinds of people want to take part in discussion programmes?\n6. Do discussion programmes influence people in a good or bad way?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Sync Sequences
SELECT setval(pg_get_serial_sequence('tests', 'id'), COALESCE((SELECT MAX(id) FROM tests), 1));
SELECT setval(pg_get_serial_sequence('sections', 'id'), COALESCE((SELECT MAX(id) FROM sections), 1));
SELECT setval(pg_get_serial_sequence('questions', 'id'), COALESCE((SELECT MAX(id) FROM questions), 1));
