-- Migration: cambridge_ielts_13_speaking_all.sql
-- Cambridge IELTS 13 Academic Speaking Tests 1 to 4
-- Total 4 speaking tests, 12 speaking prompts with official Part 1, 2, 3 tasks

-- Test 135: Cambridge IELTS 13 Academic Speaking Test 1
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(135, 'Cambridge IELTS 13 Academic Speaking Test 1', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 13 Test 1 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(1351, 135, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(13501, 1351, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. Where do you usually watch TV programmes/shows? [Why/why not?]\n2. What\'s your favorite TV programme/show? [Why?]\n3. Are there any programmes/shows you don\'t like watching? [Why/why not?]\n4. Do you think you will watch more TV or fewer TV programmes/shows in the future? [Why/why not?]', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(13502, 1351, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe someone you know who has started a business.\nYou should say:\n• Who this person is\n• What work this person does\n• Why this person decided to start a business\nAnd explain whether you would like to do the same kind of work as this person.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(13503, 1351, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What kinds of jobs do young people not want to do in your country?\n2. Who is best at advising young people about choosing a job: teachers or parents?\n3. Is money always the most important thing when choosing a job?\n4. Do you agree that many people nowadays are under pressure to work longer hours and take less holiday?\n5. What is the impact on society of people having a poor working-life balance?\n6. Could you recommend some effective strategies for governments and employers to ensure people have a good work-life balance?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 136: Cambridge IELTS 13 Academic Speaking Test 2
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(136, 'Cambridge IELTS 13 Academic Speaking Test 2', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 13 Test 2 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(1361, 136, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(13601, 1361, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. Are you happy to be the age you are now? [Why/why not?]\n2. When you were a child, did you think a lot about your future? [Why/why not?]\n3. Do you think you have changed as you have got older? [Why/why not?]\n4. What will be different about your life in the future? [Why?]', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(13602, 1361, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a time when you started using a new technological device (e.g. a new computer or phone).\nYou should say:\n• What device you started using\n• Why you started using this device\n• How easy or difficult it was to use\nAnd explain how helpful this device was to you.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(13603, 1361, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What is the best age for children to start computer lessons?\n2. Do you think that schools should use more technology to help children learn?\n3. Do you agree or disagree that computers will replace teachers one day?\n4. How much has technology improved how we communicate with each other?\n5. Do you agree that there are still many more major technological innovations to be made?\n6. Could you suggest some reasons why some people are deciding to reduce their use of technology?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 137: Cambridge IELTS 13 Academic Speaking Test 3
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(137, 'Cambridge IELTS 13 Academic Speaking Test 3', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 13 Test 3 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(1371, 137, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(13701, 1371, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. When you go shopping, do you prefer to pay for things in cash or by card? [Why?]\n2. Do you ever save money to buy special things? [Why/why not?]\n3. Would you ever take a job which had low pay? [Why/why not?]\n4. Would winning a lot of money make a big difference to your life? [Why/why not?]', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(13702, 1371, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe an interesting discussion you had as part of your work or studies.\nYou should say:\n• What the subject of the discussion was\n• Who you discussed the subject with\n• What opinions were expressed\nAnd explain why you found the discussion interesting.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(13703, 1371, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. Why is it good to discuss problems with other people?\n2. Do you think that it\'s better to talk to friends and not family about problems?\n3. Is it always a good idea to tell lots of people about a problem?\n4. Which communication skills are most important when taking part in meetings with colleagues?\n5. What are the possible effects of poor written communication skills at work?\n6. What do you think will be the future impact of technology on communication in the workplace?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 138: Cambridge IELTS 13 Academic Speaking Test 4
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(138, 'Cambridge IELTS 13 Academic Speaking Test 4', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 13 Test 4 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(1381, 138, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(13801, 1381, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. Are there many animals or birds where you live? [Why/why not?]\n2. How often do you watch programmes or read articles about wild animals? [Why?]\n3. Have you ever been to a zoo or a wildlife park? [Why/why not?]\n4. Would you like to have a job working with animals? [Why/why not?]', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(13802, 1381, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a website you use that helps you a lot in your work or studies.\nYou should say:\n• What the website is\n• How often you use the website\n• What information the website gives you\nAnd explain how your work or studies would change if this website didn\'t exist.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(13803, 1381, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. Why do some people find the internet addictive?\n2. What would the world be like without the internet?\n3. Do you think that the way people use the internet may change in the future?\n4. What are the ways that social media can be used for positive purposes?\n5. Why do some individuals post highly negative comments about other people on social media?\n6. Do you think that companies\' main form of advertising will be via social media in the future?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Sync Sequences
SELECT setval(pg_get_serial_sequence('tests', 'id'), COALESCE((SELECT MAX(id) FROM tests), 1));
SELECT setval(pg_get_serial_sequence('sections', 'id'), COALESCE((SELECT MAX(id) FROM sections), 1));
SELECT setval(pg_get_serial_sequence('questions', 'id'), COALESCE((SELECT MAX(id) FROM questions), 1));
