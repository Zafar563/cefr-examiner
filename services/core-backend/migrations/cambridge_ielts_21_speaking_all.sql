-- Migration: cambridge_ielts_21_speaking_all.sql
-- Cambridge IELTS 21 Academic Speaking Tests 1 to 4
-- Total 4 speaking tests, 12 speaking prompts with official Part 1, 2, 3 tasks

-- Test 31: Cambridge IELTS 21 Academic Speaking Test 1
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(31, 'Cambridge IELTS 21 Academic Speaking Test 1', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 21 Test 1 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(3101, 31, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(31001, 3101, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. Where do you go to get a haircut?\n2. Have you changed your hairstyle recently?\n3. Would you ever change the colour of your hair?\n4. Do you enjoy going to the hairdresser/barber?', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(31002, 3101, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a time when you used information for tourists, for example from a guidebook or online.\nYou should say:\n• Where you got this information\n• What place this information was about\n• What information you got\nAnd explain whether this information was very helpful for you.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(31003, 3101, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What are the most popular kinds of holidays for people from your country to go on?\n2. Do you think most people prefer to have a holiday abroad rather than in their own country?\n3. Why do some people want to do absolutely nothing when they go away on holiday?\n4. What are the kinds of tourist attraction that visitors to your country like to see?\n5. Do you think tourist attractions such as museums should be free for local people to visit?\n6. What can make a tourist attraction disappointing for visitors?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 32: Cambridge IELTS 21 Academic Speaking Test 2
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(32, 'Cambridge IELTS 21 Academic Speaking Test 2', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 21 Test 2 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(3201, 32, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(32001, 3201, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. How well do you know the capital city of your country?\n2. Do you think cities are exciting places to live?\n3. Why do some people dislike living in a city?\n4. If you could visit any city in the world, where would you go?', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(32002, 3201, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a time when you read or heard something that you thought was not true.\nYou should say:\n• Where you read/heard this\n• What you read/heard\n• Why you thought it was not true\nAnd explain how you felt about reading/hearing this thing that you thought was not true.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(32003, 3201, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. Do you think children are more honest than adults?\n2. Why do adults tell children it\'s important to be honest?\n3. Do you think there are sometimes good reasons for adults not to tell children the truth?\n4. Are there any claims in advertisements that are sometimes not true?\n5. Why do people still buy things even when they know advertisements aren\'t completely accurate?\n6. Do you think advertisements that are dishonest should be banned?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 35: Cambridge IELTS 21 Academic Speaking Test 3
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(35, 'Cambridge IELTS 21 Academic Speaking Test 3', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 21 Test 3 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(3501, 35, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(35001, 3501, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. When you go shopping, do you usually pay for things by cash or by card?\n2. Are you generally careful about how much money you spend?\n3. Have you ever spent money on something you didn\'t need?\n4. How important is it to you to save money for the future?', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(35002, 3501, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe an interesting garden or park you have seen.\nYou should say:\n• Where this garden or park is\n• How big it is\n• What you saw in this garden/park\nAnd explain why you think this garden/park is interesting.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(35003, 3501, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What are the advantages of having a home with a garden?\n2. How could people living in apartment blocks grow plants and vegetables?\n3. How interested are people in your country in TV shows and magazines about gardens?\n4. Do you think that gardening is a hobby mainly for older people?\n5. What are the benefits for people of gardening as a hobby?\n6. Will gardening be a more popular hobby in the future?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Test 36: Cambridge IELTS 21 Academic Speaking Test 4
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(36, 'Cambridge IELTS 21 Academic Speaking Test 4', 'Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS 21 Test 4 bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara).', 'Multi-level (A1-C1)', 15, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(3601, 36, 'speaking', 'Speaking Assessment (Parts 1-3)', 'Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(36001, 3601, 'speaking_prompt', E'Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n1. When do you usually eat bread?\n2. How important is bread in your culture?\n3. Have you tried any kinds of bread from other countries?\n4. Would you be interested in learning how to make bread?', '[]'::jsonb, '', 10, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(36002, 3601, 'speaking_prompt', E'Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\nDescribe a person you know who is very competitive.\nYou should say:\n• Who this person is\n• What this person is competitive about\n• How successful this person is\nAnd explain why you think this person is so competitive.', '[]'::jsonb, '', 15, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(36003, 3601, 'speaking_prompt', E'Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n1. What kinds of competitions do people like to enter in your country?\n2. What do you think is the best kind of prize to win in a competition?\n3. Why do people like watching quiz shows and other competitions on TV?\n4. How important is it to be very competitive at sport?\n5. Do you think sportspeople perform better when they play against competitors who are stronger than they are?\n6. Why do some people think that taking part in sport is more important than winning?', '[]'::jsonb, '', 15, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;

-- Sync Sequences
SELECT setval(pg_get_serial_sequence('tests', 'id'), COALESCE((SELECT MAX(id) FROM tests), 1));
SELECT setval(pg_get_serial_sequence('sections', 'id'), COALESCE((SELECT MAX(id) FROM sections), 1));
SELECT setval(pg_get_serial_sequence('questions', 'id'), COALESCE((SELECT MAX(id) FROM questions), 1));
