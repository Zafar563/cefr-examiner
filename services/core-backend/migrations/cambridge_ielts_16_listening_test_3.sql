-- Cambridge IELTS 16 Academic Listening Test 3
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1603, 'Cambridge IELTS 16 Academic Listening Test 3', 'Rasmiy Cambridge IELTS 16 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(16031, 1603, 'listening', 'Listening Part 1: JUNIOR CYCLE CAMP', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-10                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Complete the notes below.</p>
<p>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</p>
<table>
<tbody>
<tr>
<td width="623">
<p class="ielts-listening-transcript-subhead"><strong><strong>JUNIOR CYCLE CAMP</strong></strong></p>
</td>
</tr>
<tr>
<td width="623">The course focuses on skills and safety</td>
</tr>
<tr>
<td width="623">
<ul>
<li>Charlie would be placed in Level 5.</li>
<li>First of all, children at this level are taken to practise in a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
</ul>
<p><strong>Instructors</strong></p>
<ul>
<li>Instructors wear <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span> shirts.</li>
<li>A <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span> is required and training is given.</li>
</ul>
<p><strong>Classes</strong></p>
<ul>
<li>The size of the classes is limited.</li>
<li>There are quiet times during the morning for a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span> or a game.</li>
<li>Classes are held even if there is <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
</ul>
<p><strong>What</strong> <strong>to</strong> <strong>bring</strong></p>
<ul>
<li>a change of clothing</li>
<li>a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>shoes (not sandals)</li>
<li>Charlie’s <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Day</strong> <strong>1</strong></p>
<ul>
<li>Charlie should arrive at 9.20 am on the first day.</li>
<li>Before the class, his <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span> will be checked.</li>
<li>He should then go to the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span> to meet his class instructor.</li>
</ul>
<p><strong>Cost</strong></p>
<ul>
<li>The course costs $<span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span> per week.</li>
</ul>
</td>
</tr>
</tbody>
</table>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13240-cambridge-ielts-16-academic-listening-3-audio-1.mp3', 'JAKE: Hello, Junior Cycle camp, Jake speaking.
WOMAN: Hi. I’m calling for some information about the cycle camp – I’m thinking of sending my son.
JAKE: Great. Well, it’s held every weekday morning over the summer vacation and we focus on basic cycling skills and safety. We have eight levels for children from three years upwards. How old’s your son?
WOMAN: Charlie? He’s seven. He can ride a bike, but he needs a little more training before he’s safe to go on the road.
JAKE: He’d probably be best in Level 5. They start off practising on the site here, and we aim to get them riding on the road, but first they’re taken to ride in the park, away from the traffic.
WOMAN: Right. And can you tell me a bit about the instructors?
JAKE: Well, all our staff wear different coloured shirts. So, we have three supervisors, and they have red shirts. They support the instructors, and they also stand in for me if I’m not around. Then the instructors themselves are in blue shirts, and one of these is responsible for each class.
WOMAN: OK.
JAKE: In order to be accepted, all our instructors have to submit a reference from someone who’s seen them work with children – like if they’ve worked as a babysitter, for example. Then they have to complete our training course, including how to do lesson plans, and generally care for the well-being of the kids in their class. They do a great job, I have to say.
WOMAN: Right. And tell me a bit about the classes. What size will Charlie’s class be?
JAKE: We have a limit of eight children in each class, so their instructor really gets to know them well. They’re out riding most of the time but they have quiet times too, where their instructor might tell them a story that’s got something to do with cycling, or get them to play a game together. It’s a lot of fun.
WOMAN: It must be. Now, what happens if there’s rain? Do the classes still run?
JAKE: Oh yes. We don’t let that put us off – we just put on our waterproofs and keep cycling.
————————
WOMAN: And is there anything special Charlie should bring along with him?
JAKE: Well, maybe some spare clothes, especially if the weather’s not so good. And a snack for break time.
WOMAN: How about a drink?
JAKE: No, we’ll provide that. And make sure he has shoes, not sandals.
WOMAN: Sure. And just at present Charlie has to take medication every few hours, so I’ll make sure he has that.
JAKE: Absolutely. Just give us details of when he has to take it and we’ll make sure he does.
WOMAN: Thanks.
JAKE: Now, there are a few things you should know about Day 1 of the camp. The classes normally start at 9.30 every morning, but on Day 1 you should aim to get Charlie here by 9.20. The finishing time will be 12.30 as usual. We need the additional time because there are a few extra things to do. The most important is that we have a very careful check to make sure that every child’s helmet fits properly. If it doesn’t fit, we’ll try to adjust it, or we’ll find him another one – but he must wear it all the time he’s on the bike.
WOMAN: Of course.
JAKE: Then after that, all the instructors will be waiting to meet their classes, and they’ll meet up in the tent – you can’t miss it. And each instructor will take their class away and get started.
WOMAN: OK. Well that all sounds good. Now can you tell me how much the camp costs a week?
JAKE: One hundred ninety-nine dollars. We’ve managed to keep the price more or less the same as last year – it was one hundred ninety then. But the places are filling up quite quickly.
WOMAN: Right. OK, well I’d like to book for …', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(160301, 16031, 'text_input', 'First of all, children at this level are taken to practise in a  <strong', '[]'::jsonb, 'park', 1, 1),
(160302, 16031, 'text_input', 'Instructors  
 
 Instructors wear  <strong', '[]'::jsonb, 'blue', 1, 2),
(160303, 16031, 'text_input', 'A  <strong', '[]'::jsonb, 'reference', 1, 3),
(160304, 16031, 'text_input', 'There are quiet times during the morning for a  <strong', '[]'::jsonb, 'story / storey', 1, 4),
(160305, 16031, 'text_input', 'Classes are held even if there is  <strong', '[]'::jsonb, 'rain', 1, 5),
(160306, 16031, 'text_input', 'What   to   bring  
 
 a change of clothing 
 a  <strong', '[]'::jsonb, 'snack', 1, 6),
(160307, 16031, 'text_input', '6     
 shoes (not sandals) 
 Charlie’s  <strong', '[]'::jsonb, 'medication', 1, 7),
(160308, 16031, 'text_input', 'Before the class, his  <strong', '[]'::jsonb, 'helmet', 1, 8),
(160309, 16031, 'text_input', 'He should then go to the  <strong', '[]'::jsonb, 'tent', 1, 9),
(160310, 16031, 'text_input', 'Cost  
 
 The course costs $ <strong', '[]'::jsonb, '199', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(16032, 1603, 'listening', 'Listening Part 2', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-12                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="11,12"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong> <strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>According to Megan, what are the  main advantages of working in the agriculture and horticulture sectors?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> the active lifestyle</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> the above-average salaries</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> the flexible working opportunities</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> the opportunities for overseas travel</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> the chance to be in a natural environment</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 13-14                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="13,14"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong> <strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>Which  of the following are likely to be disadvantages for people working outdoors?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> the increasing risk of accidents</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> being in a very quiet location</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> difficult weather conditions at times</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> the cost of housing</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> the level of physical fitness required</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 15-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What information does Megan give about each of the following job opportunities?</p>
<p><em>Choose <strong>SIX</strong> answers from the box and write the correct letter, <strong>A-H</strong>, next to Questions.</em></p>
<p><strong>Information</strong></p>
<p><strong>Job opportunities</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>Fresh food commercial manager</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">15</strong><select data-qnum="15" name="question_15" class="ielts-inline-select"><option value="">[ 15 ] Tanlang...</option><option value="A. not a permanent job">A. not a permanent job</option><option value="B. involves leading a team">B. involves leading a team</option><option value="C. experience not essential">C. experience not essential</option><option value="D. intensive work but also fun">D. intensive work but also fun</option><option value="E. chance to earn more through overtime">E. chance to earn more through overtime</option><option value="F. chance for rapid promotion">F. chance for rapid promotion</option><option value="G. accommodation available">G. accommodation available</option><option value="H. local travel involved">H. local travel involved</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Agronomist</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">16</strong><select data-qnum="16" name="question_16" class="ielts-inline-select"><option value="">[ 16 ] Tanlang...</option><option value="A. not a permanent job">A. not a permanent job</option><option value="B. involves leading a team">B. involves leading a team</option><option value="C. experience not essential">C. experience not essential</option><option value="D. intensive work but also fun">D. intensive work but also fun</option><option value="E. chance to earn more through overtime">E. chance to earn more through overtime</option><option value="F. chance for rapid promotion">F. chance for rapid promotion</option><option value="G. accommodation available">G. accommodation available</option><option value="H. local travel involved">H. local travel involved</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Fresh produce buyer</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">17</strong><select data-qnum="17" name="question_17" class="ielts-inline-select"><option value="">[ 17 ] Tanlang...</option><option value="A. not a permanent job">A. not a permanent job</option><option value="B. involves leading a team">B. involves leading a team</option><option value="C. experience not essential">C. experience not essential</option><option value="D. intensive work but also fun">D. intensive work but also fun</option><option value="E. chance to earn more through overtime">E. chance to earn more through overtime</option><option value="F. chance for rapid promotion">F. chance for rapid promotion</option><option value="G. accommodation available">G. accommodation available</option><option value="H. local travel involved">H. local travel involved</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Garden centre sales manager</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">18</strong><select data-qnum="18" name="question_18" class="ielts-inline-select"><option value="">[ 18 ] Tanlang...</option><option value="A. not a permanent job">A. not a permanent job</option><option value="B. involves leading a team">B. involves leading a team</option><option value="C. experience not essential">C. experience not essential</option><option value="D. intensive work but also fun">D. intensive work but also fun</option><option value="E. chance to earn more through overtime">E. chance to earn more through overtime</option><option value="F. chance for rapid promotion">F. chance for rapid promotion</option><option value="G. accommodation available">G. accommodation available</option><option value="H. local travel involved">H. local travel involved</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Tree technician</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">19</strong><select data-qnum="19" name="question_19" class="ielts-inline-select"><option value="">[ 19 ] Tanlang...</option><option value="A. not a permanent job">A. not a permanent job</option><option value="B. involves leading a team">B. involves leading a team</option><option value="C. experience not essential">C. experience not essential</option><option value="D. intensive work but also fun">D. intensive work but also fun</option><option value="E. chance to earn more through overtime">E. chance to earn more through overtime</option><option value="F. chance for rapid promotion">F. chance for rapid promotion</option><option value="G. accommodation available">G. accommodation available</option><option value="H. local travel involved">H. local travel involved</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Farm worker</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">20</strong><select data-qnum="20" name="question_20" class="ielts-inline-select"><option value="">[ 20 ] Tanlang...</option><option value="A. not a permanent job">A. not a permanent job</option><option value="B. involves leading a team">B. involves leading a team</option><option value="C. experience not essential">C. experience not essential</option><option value="D. intensive work but also fun">D. intensive work but also fun</option><option value="E. chance to earn more through overtime">E. chance to earn more through overtime</option><option value="F. chance for rapid promotion">F. chance for rapid promotion</option><option value="G. accommodation available">G. accommodation available</option><option value="H. local travel involved">H. local travel involved</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="13226">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. not a permanent job">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">not a permanent job</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. involves leading a team">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">involves leading a team</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. experience not essential">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">experience not essential</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. intensive work but also fun">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">intensive work but also fun</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. chance to earn more through overtime">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">chance to earn more through overtime</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. chance for rapid promotion">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">chance for rapid promotion</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. accommodation available">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">accommodation available</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="H" data-text="H. local travel involved">
                                                                                        <span class="dnd-label">H.</span>
                                                                                        <span class="dnd-text">local travel involved</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13239-cambridge-ielts-16-academic-listening-3-audio-2.mp3', 'Hello everyone. My name’s Megan Baker and I’m a recruitment consultant at AVT Recruitment specialists.
Now, our company specialises in positions that involve working in the agriculture and horticulture sectors, so that’s fresh food production, garden and park maintenance and so on. And these sectors do provide some very special career opportunities. For a start, they often offer opportunities for those who don’t want to be stuck with a 40-hour week, but need to juggle work with other responsibilities such as child care – and this is very important for many of our recruits. Some people like working in a rural setting, surrounded by plants and trees instead of buildings, although we can’t guarantee that. But there are certainly health benefits, especially in jobs where you’re not sitting all day looking at a screen – a big plus for many people. Salaries can sometimes be good too, although there’s a lot of variety here. And you may have the opportunity in some types of jobs for travel overseas, although that obviously depends on the job, and not everyone is keen to do it.
Of course, working outdoors does have its challenges. It’s fine in summer, but can be extremely unpleasant when it’s cold and windy. You may need to be pretty fit for some jobs, though with modern technology that’s not as important as it once was. And standards of health and safety are much higher now than they used to be, so there are fewer work-related accidents. But if you like a lively city environment surrounded by lots of people, these jobs are probably not for you – they’re often in pretty remote areas. And some people worry about finding a suitable place to live, but in our experience, this usually turns out fine.
————————
Now let me tell you about some of the exciting jobs that we have on our books right now.
One is for a fresh food commercial manager. Our client here is a very large fresh food producer supplying a range of top supermarkets. They operate in a very fast-paced environment with low profit margins – the staff there work hard, but they play hard as well, so if you’ve a sociable personality this may be for you.
We have an exciting post as an agronomist advising farmers on issues such as crop nutrition, protection against pests, and the latest legislation on farming and agricultural practices. There are good opportunities for the right person to quickly make their way up the career ladder, but a deep knowledge of the agricultural sector is expected of applicants.
A leading supermarket is looking for a fresh produce buyer who is available for a 12-month maternity cover contract. You need to have experience in administration, planning and buying in the fresh produce industry, and in return will receive a very competitive salary.
We have also received a request for a sales manager for a chain of garden centres. You will be visiting centres in the region to ensure their high levels of customer service are maintained. This post is only suitable for someone who is prepared to live in the region.
There is also a vacancy for a tree technician to carry out tree cutting, forestry and conservation work. Candidates must have a clean driving licence and have training in safety procedures. A year’s experience would be preferred but the company might be prepared to consider someone who has just completed an appropriate training course.
Finally, we have a position for a farm worker. This will involve a wide range of farm duties including crop sowing and harvesting, machine maintenance and animal care. Perks of the job include the possibility of renting a small cottage on the estate, and the chance to earn a competitive salary. A driving licence and tractor driving experience are essential.', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(160311, 16032, 'multiple_choice', 'Question 11', '["A", "B", "C", "D", "E"]'::jsonb, 'A / C', 1, 11),
(160312, 16032, 'multiple_choice', 'According to Megan, what are the&nbsp; TWO &nbsp;main advantages of working in the agriculture and horticulture sectors?', '["A", "B", "C", "D", "E"]'::jsonb, 'A / C', 1, 12),
(160313, 16032, 'multiple_choice', 'Question 13', '["A", "B", "C", "D", "E"]'::jsonb, 'B / C', 1, 13),
(160314, 16032, 'multiple_choice', 'Which&nbsp; TWO &nbsp;of the following are likely to be disadvantages for people working outdoors?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / C', 1, 14),
(160315, 16032, 'single_choice', 'Question 15', '["A", "B", "C"]'::jsonb, 'D', 1, 15),
(160316, 16032, 'single_choice', 'Question 16', '["A", "B", "C"]'::jsonb, 'F', 1, 16),
(160317, 16032, 'single_choice', 'Question 17', '["A", "B", "C"]'::jsonb, 'A', 1, 17),
(160318, 16032, 'single_choice', 'Question 18', '["A", "B", "C"]'::jsonb, 'H', 1, 18),
(160319, 16032, 'single_choice', 'Question 19', '["A", "B", "C"]'::jsonb, 'C', 1, 19),
(160320, 16032, 'single_choice', 'Question 20', '["A", "B", "C"]'::jsonb, 'G', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(16033, 1603, 'listening', 'Listening Part 3', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-22                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="21,22"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong> <strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>Which  points does Adam make about his experiment on artificial sweeteners?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> The results were what he had predicted.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> The experiment was simple to set up</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> A large sample of people was tested.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> The subjects were unaware of what they were drinking.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> The test was repeated several times for each person.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 23-24                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="23,24"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong> <strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>Which  problems did Rosie have when measuring the fat content of nuts?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> She used the wrong sort of nuts.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> She used an unsuitable chemical.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> She did not grind the nuts finely enough.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> The information on the nut package was incorrect.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> The weighing scales may have been unsuitable.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 25-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="25"><div class="ielts-q-header"><strong class="ielts-q-badge">25</strong><span class="ielts-q-title"><span>Adam suggests that restaurants could reduce obesity if their menus</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="A"><span class="ielts-radio-text"><strong>A</strong> offered fewer options.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="B"><span class="ielts-radio-text"><strong>B</strong> had more low-calorie foods.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="C"><span class="ielts-radio-text"><strong>C</strong> were organised in a particular way.</span></label></div></div><div class="ielts-standalone-q" data-qnum="26"><div class="ielts-q-header"><strong class="ielts-q-badge">26</strong><span class="ielts-q-title"><span>The students agree that food manufacturers deliberately</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="26" name="question_26" value="A"><span class="ielts-radio-text"><strong>A</strong> make calorie counts hard to understand.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="26" name="question_26" value="B"><span class="ielts-radio-text"><strong>B</strong> fail to provide accurate calorie counts.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="26" name="question_26" value="C"><span class="ielts-radio-text"><strong>C</strong> use ineffective methods to reduce calories.</span></label></div></div><div class="ielts-standalone-q" data-qnum="27"><div class="ielts-q-header"><strong class="ielts-q-badge">27</strong><span class="ielts-q-title"><span>What does Rosie say about levels of exercise in England?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="27" name="question_27" value="A"><span class="ielts-radio-text"><strong>A</strong> The amount recommended is much too low.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="27" name="question_27" value="B"><span class="ielts-radio-text"><strong>B</strong> Most people overestimate how much they do.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="27" name="question_27" value="C"><span class="ielts-radio-text"><strong>C</strong> Women now exercise more than they used to.</span></label></div></div><div class="ielts-standalone-q" data-qnum="28"><div class="ielts-q-header"><strong class="ielts-q-badge">28</strong><span class="ielts-q-title"><span>Adam refers to the location and width of stairs in a train station to illustrate</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="28" name="question_28" value="A"><span class="ielts-radio-text"><strong>A</strong> practical changes that can influence people’s behaviour.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="28" name="question_28" value="B"><span class="ielts-radio-text"><strong>B</strong> methods of helping people who have mobility problems.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="28" name="question_28" value="C"><span class="ielts-radio-text"><strong>C</strong> ways of preventing accidents by controlling crowd movement.</span></label></div></div><div class="ielts-standalone-q" data-qnum="29"><div class="ielts-q-header"><strong class="ielts-q-badge">29</strong><span class="ielts-q-title"><span>What do the students agree about including reference to exercise in their presentation?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="29" name="question_29" value="A"><span class="ielts-radio-text"><strong>A</strong> They should probably leave it out.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="29" name="question_29" value="B"><span class="ielts-radio-text"><strong>B</strong> They need to do more research on it.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="29" name="question_29" value="C"><span class="ielts-radio-text"><strong>C</strong> They should discuss this with their tutor.</span></label></div></div><div class="ielts-standalone-q" data-qnum="30"><div class="ielts-q-header"><strong class="ielts-q-badge">30</strong><span class="ielts-q-title"><span>What are the students going to do next for their presentation?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="30" name="question_30" value="A"><span class="ielts-radio-text"><strong>A</strong> prepare some slides for it</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="30" name="question_30" value="B"><span class="ielts-radio-text"><strong>B</strong> find out how long they have for it</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="30" name="question_30" value="C"><span class="ielts-radio-text"><strong>C</strong> decide on its content and organisation</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13238-cambridge-ielts-16-academic-listening-3-audio-3.mp3', 'ADAM: OK Rosie, shall we try to get some ideas together for our presentation on diet and obesity?
ROSIE: Sure.
ADAM: I can talk about the experiment I did to see if people can tell the difference between real sugar and artificial sweeteners.
ROSIE: Where you have people drinks with either sugar or artificial sweeteners and they had to say which they thought it was?
ADAM: Yeah. It took me ages to decide exactly how I’d organise it, especially how I could make sure that people didn’t know which drink I was giving them. It was hard to keep track of it all, especially as I had so many people doing it – I had to make sure I kept a proper record of what each person had had.
ROSIE: So could most people tell the difference?
ADAM: Yeah – I hadn’t thought they would be able to, but most people could.
ROSIE: Then there’s that experiment I did measuring the fat content of nuts, to see if the nutritional information given on the packet was accurate.
ADAM: The one where you ground up the nuts and mixed them with a chemical to absorb the fat?
ROSIE: Yes. My results were a bit problematic – the fat content for that type of nut seemed much lower than it said on the package. But I reckon the package information was right. I think I should probably have ground up the nuts more than I did. It’s possible that the scales for weighing the fat weren’t accurate enough, too. I’d really like to try the experiment again some time.
———————
ADAM: So what can we say about helping people to lose weight? There’s a lot we could say about what restaurants could do to reduce obesity. I read that the items at the start of a menu and the items at the end of a menu are much more likely to be chosen than the items in the middle. So, if you put the low-calorie items at the beginning and end of the menu, people will probably go for the food with fewer calories, without even realising what they’re doing.
ROSIE: I think food manufacturers could do more to encourage healthy eating.
ADAM: How?
ROSIE: Well, when manufacturers put calorie counts of a food on the label, they’re sometimes really confusing and I suspect they do it on purpose. Because food that’s high in calories tastes better, and so they’ll sell more.
ADAM: Yeah, so if you look at the amount of calories in a pizza, they’ll give you the calories per quarter pizza and you think, oh that’s not too bad. But who’s going to eat a quarter pizza?
ROSIE: Exactly.
ADAM: I suppose another approach to this problem is to get people to exercise more.
ROSIE: Right. In England, the current guidelines are for at least 30 minutes of brisk walking, five days a week. Now when you ask them, about 40% of men and 30% of women say they do this, but when you objectively measure the amount of walking they do with motion sensors, you find that only 6% of men and 4% of women do the recommended amount of exercise.
ADAM: Mm, so you can see why obesity is growing.
ROSIE: So how can people be encouraged to take more exercise?
ADAM: Well, for example, think of the location of stairs station. if people reach the stairs before they reach the escalator when they’re leaving the station, they’re more likely to take the stairs. And if you increase the width of the stairs, you’ll get more people using them at the same time. It’s an unconscious process and influenced by minor modifications in their environment.
ROSIE: Right. And it might not be a big change, but if it happens every day, it all adds up.
ADAM: Yes. But actually, I’m not sure if we should be talking about exercise in our presentation.
ROSIE: Well, we’ve done quite a bit of reading about it.
ADAM: I know, but it’s going to mean we have a very wide focus, and our tutor did say that we need to focus on causes and solutions in terms of nutrition.
ROSIE: I suppose so. And we’ve got plenty of information about that. OK, well that will be simpler.
ADAM: So what shall we do now? We’ve still got half an hour before our next lecture.
ROSIE: Let’s think about what we’re going to include and what will go where. Then we can decide what slides we need.
ADAM: OK, fine.', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(160321, 16033, 'multiple_choice', 'Question 21', '["A", "B", "C", "D", "E"]'::jsonb, 'C / D', 1, 21),
(160322, 16033, 'multiple_choice', 'Which&nbsp; TWO &nbsp;points does Adam make about his experiment on artificial sweeteners?', '["A", "B", "C", "D", "E"]'::jsonb, 'C / D', 1, 22),
(160323, 16033, 'multiple_choice', 'Question 23', '["A", "B", "C", "D", "E"]'::jsonb, 'C / E', 1, 23),
(160324, 16033, 'multiple_choice', 'Which&nbsp; TWO &nbsp;problems did Rosie have when measuring the fat content of nuts?', '["A", "B", "C", "D", "E"]'::jsonb, 'C / E', 1, 24),
(160325, 16033, 'single_choice', 'Adam suggests that restaurants could reduce obesity if their menus', '["A", "B", "C"]'::jsonb, 'C', 1, 25),
(160326, 16033, 'single_choice', '&nbsp;', '["A", "B", "C"]'::jsonb, 'A', 1, 26),
(160327, 16033, 'single_choice', 'What does Rosie say about levels of exercise in England?', '["A", "B", "C"]'::jsonb, 'B', 1, 27),
(160328, 16033, 'single_choice', 'Adam refers to the location and width of stairs in a train station to illustrate', '["A", "B", "C"]'::jsonb, 'A', 1, 28),
(160329, 16033, 'single_choice', 'What do the students agree about including reference to exercise in their presentation?', '["A", "B", "C"]'::jsonb, 'A', 1, 29),
(160330, 16033, 'single_choice', 'What are the students going to do next for their presentation?', '["A", "B"]'::jsonb, 'C', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(16034, 1603, 'listening', 'Listening Part 4: Hand knitting', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write ONE WORD ONLY for each answer.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Hand knitting</strong></strong></p>
<p><strong>Interest in knitting</strong></p>
<ul>
<li>Knitting has a long history around the world.</li>
<li>We imagine someone like a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span> knitting.</li>
<li>A <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> ago, knitting was expected to disappear.</li>
<li>The number of knitting classes is now increasing.</li>
<li>People are buying more <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span> for knitting nowadays.</li>
</ul>
<p><strong>Benefits of knitting</strong></p>
<ul>
<li>gives support in times of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> difficulty</li>
<li>requires only <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span> skills and little money to start</li>
<li>reduces stress in a busy life</li>
</ul>
<p><strong>Early knitting</strong></p>
<ul>
<li>The origins are not known.</li>
<li>Findings show early knitted items to be <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> in shape.</li>
<li>The first needles were made of natural materials such as wood and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>Early yarns felt <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> to touch.</li>
<li>Wool became the most popular yarn for spinning.</li>
<li>Geographical areas had their own <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span> of knitting.</li>
<li>Everyday tasks like looking after <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span> were done while knitting.</li>
</ul>
</div>                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                    </div>
                                        </div>                                                                    </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13237-cambridge-ielts-16-academic-listening-3-audio-4.mp3', 'Good morning everyone. So today we’re going to look at an important creative activity and that’s hand knitting. Ancient knitted garments have been found in many different countries, showing that knitting is a global activity with a long history.
When someone says the word ‘knitting’ we might well picture an elderly person – a grandmother perhaps – sitting by the fire knitting garments for themselves or other members of the family. It’s a homely image, but one that may lead you to feel that knitting is an activity of the past – and, indeed, during the previous decade, it was one of the skills that was predicted to vanish from everyday life. For although humans have sewn and knitted their own clothing for a very long time, many of these craft-based skills went into decline when industrial machines took over – mainly because they were no longer passed down from one generation to another. However, that’s all changing and interest in knitting classes in many countries is actually rising, as more and more people are seeking formal instruction in the skill. With that trend, we’re also seeing an increase in the sales figures for knitting equipment.
So why do people want to be taught to knit at a time when a machine can readily do the job for them? The answer is that knitting, as a handicraft, has numerous benefits for those doing it. Let’s consider what some of these might be. While many people knitted garments in the past because they couldn’t afford to buy clothes, it’s still true today that knitting can be helpful if you’re experiencing economic hardship. If you have several children who all need warm winter clothes, knitting may save you a lot of money. And the results of knitting your own clothes can be very rewarding, even though the skills you need to get going are really quite basic and the financial outlay is minimal.
But the more significant benefits in today’s world are to do with well-being. In a world where it’s estimated that we spend up to nine hours a day online, doing something with our hands that is craft-based makes us feel good. It releases us from the stress of a technological, fast-paced life.
———————
Now, let’s look back a bit to early knitting activities. In fact, no one really knows when knitting first began, but archaeological remains have disclosed plenty of information for us to think about.
One of the interesting things about knitting is that the earliest pieces of clothing that have been found suggest that most of the items produced were round rather than flat. Discoveries from the 3rd and 4th centuries in Egypt show that things like socks and gloves, that were needed to keep hands and feet warm, were knitted in one piece using four or five needles. That’s very different from most knitting patterns today, which only require two. What’s more, the very first needles people used were hand carved out of wood and other natural materials, like bone, whereas today’s needles are largely made of steel or plastic and make that characteristic clicking sound when someone’s using them. Ancient people knitted using yarns made from linen, hemp, cotton and wool, and these were often very rough on the skin. The spinning wheel, which allowed people to make finer yarns and produce much greater quantities of them, led to the dominance of wool in the knitting industry – often favoured for its warmth.
Another interesting fact about knitting is that because it was practised in so many parts of the world for so many purposes, regional differences in style developed. This visual identity has allowed researchers to match bits of knitted clothing that have been unearthed over time to the region from which the wearer came or the job that he or she did.
As I’ve mentioned, knitting offered people from poor communities a way of making extra money while doing other tasks. For many centuries, it seems, men, women and children took every opportunity to knit, for example, while watching over sheep, walking to market or riding in boats. So, let’s move on to take a …', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(160331, 16034, 'text_input', 'We imagine someone like a  <strong', '[]'::jsonb, 'grandmother', 1, 31),
(160332, 16034, 'text_input', 'A  <strong', '[]'::jsonb, 'decade', 1, 32),
(160333, 16034, 'text_input', 'People are buying more  <strong', '[]'::jsonb, 'equipment', 1, 33),
(160334, 16034, 'text_input', 'Benefits of knitting  
 
 gives support in times of  <strong', '[]'::jsonb, 'economic', 1, 34),
(160335, 16034, 'text_input', 'tion-item"> 34     difficulty 
 requires only  <strong', '[]'::jsonb, 'basic', 1, 35),
(160336, 16034, 'text_input', 'Findings show early knitted items to be  <strong', '[]'::jsonb, 'round', 1, 36),
(160337, 16034, 'text_input', 'The first needles were made of natural materials such as wood and  <strong', '[]'::jsonb, 'bone', 1, 37),
(160338, 16034, 'text_input', 'Early yarns felt  <strong', '[]'::jsonb, 'rough', 1, 38),
(160339, 16034, 'text_input', 'Geographical areas had their own  <strong', '[]'::jsonb, 'style', 1, 39),
(160340, 16034, 'text_input', 'Everyday tasks like looking after  <strong', '[]'::jsonb, 'sheep', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
