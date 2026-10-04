-- Cambridge IELTS 19 Academic Listening Test 4
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1904, 'Cambridge IELTS 19 Academic Listening Test 4', 'Rasmiy Cambridge IELTS 19 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(19041, 1904, 'listening', 'Listening Part 1', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-6                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Complete the notes below</p>
<p>Write <b>ONE WORD AND/OR A NUMBER</b> for each answer.</p>
<p style="text-align: center"><strong>First day at work</strong></p>
<table>
<tbody>
<tr>
<td>Name of supervisor</td>
<td><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span></td>
</tr>
<tr>
<td>Where to leave coat and bag:</td>
<td>use <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span> in staffroom</td>
</tr>
<tr>
<td>See Tiffany in HR:</td>
<td>to give <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span> number to collect <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span></td>
</tr>
<tr>
<td>Location of HR office:</td>
<td>on <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span> floor</td>
</tr>
<tr>
<td>Supervisor''s mobile number:</td>
<td><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span></td>
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
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 7-10                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><i>Complete the table below.</i></p>
<p><i>Write <strong>ONE WORD ONLY</strong> for each answer.</i></p>
<table>
<tbody>
<tr>
<td colspan="4">
<p style="text-align: center"><b>Responsibilities</b></p>
</td>
</tr>
<tr>
<td></td>
<td style="text-align: center"><b>Task 1</b></td>
<td style="text-align: center"><b>Task 2</b></td>
<td style="text-align: center"><b>Notes</b></td>
</tr>
<tr>
<td>Bakery section</td>
<td>Check sell by dates</td>
<td>Change price labels</td>
<td>Use <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span> labels</td>
</tr>
<tr>
<td>Sushi takeaway counter</td>
<td>Re-stock with <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span> boxes if needed</td>
<td>Wipe preparation area and clean the sink</td>
<td>Do not clean any knives</td>
</tr>
<tr>
<td>Meat and fish counters</td>
<td>Clean the serving area, including the weighing scales</td>
<td>Collect <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span> for the fish from the cold-room</td>
<td>Must wear special <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span></td>
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
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/163752-cambridge-ielts-19-academic-listening-4-audio-1.mp3', 'KAEDEN: Hello Charlotte. I’m Kaeden, one of the supervisors. Welcome to the team.
CHARLOTTE: Hi Aiden.
KAEDEN: It’s Kaeden
CHARLOTTE: I’m so sorry.
KAEDEN: Don’t worry. People often get my name wrong; they never know how to spell it. It’s K-A-E-D-E-N, in case you ever need to write it.
CHARLOTTE: I’ll try and remember.
KAEDEN: So, there are a few practical things you need to sort out this morning. Then I’ll show you what you’re going to do today.
CHARLOTTE: The email I received said to go to the front desk, to show my letter of appointment and pick up my badge.
KAEDEN: You’ll need that for the staffroom and other areas of the supermarket where shoppers aren’t allowed.
So, after you’ve finished at the front desk, I’ll take you to the staffroom. Put your coat and rucksack in one of the lockers there. Take whichever one is free.
CHARLOTTE: WillI have a key?
KAEDEN: Yes. Try not to lose it. At the end of the day, leave it in the door for the next person to use.
CHARLOTTE: Will do.
KAEDEN: You also need to go to the HR department to see Tiffany. She’s really helpful.
CHARLOTTE: I was told to bring my passport with me. HR need to take a note of the number in it.
KAEDEN: That’s right. Or you can show your ID card.
CHARLOTTE: I don’t have one of those.
KAEDEN: OK. Tiffany will give you a uniform. They have lots in different sizes, so you just tell her what you need.I won’t come with you to HR -I’ve got to go and sort something else out. Problem with a bread sheer.
CHARLOTTE: Is the HR office near the staffroom?
KAEDEN: The staffroom’s on the first floor, and HR are a couple of floors above that, on the third floor. There’s a staircase outside the staffroom.
CHARLOTTE: OK.
KAEDEN: When you’ve finished with HR, come and find me in the bakery section of the shop.
CHARLOTTE: I’m looking forward to getting started.
KAEDEN: I’ll just give you my phone number, in case you can’t find me. Have you got your phone there?
CHARLOTTE: Yes … OK,ready.
KAEDEN: It’s oh-four-one-two double-six-five nine-oh-three.
CHARLOTTE: OK, done.
-------
KAEDEN: So, Charlotte, your tasks today are in the bakery section, on the sushi counter, and on the meat and fish counters. The first job is to check sell-by dates on the bread and cakes. If any of the dates are today’s, put a new price label on the packaging.
CHARLOTTE: What if any of the labels are yesterday’s dates, or older? Do I throw those items away?
KAEDEN: Yes, but that shouldn’t happen – we check the stock every day. When something needs a new price label, put a yellow one on the package, next to the original price.
CHARLOTTE: OK.
KAEDEN: After that, you’ll go to the sushi takeaway counter.
CHARLOTTE: Will I be preparing boxes of food?
KAEDEN: For today, you’ll just be helping the staff.
CHARLOTTE: Yes, of course.
KAEDEN: You’ll see lots of flat cardboard boxes at one end of the counter. Beneath those is where we keep the plastic boxes -we run out of those really quickly, so you should bring more from the storeroom.
CHARLOTTE: IS that my only task on the sushi counter?
KAEDEN: No. You also need to clean the area where they prepare the dishes. There are cloths and bottles of spray by the sink. Oh, and please make sure you clean that too.
CHARLOTTE: Sure. That’s important, isn’t it?
KAEDEN: Absolutely. But you mustn’t wash up knives. You have to do some training before you’re allowed to touch sharp objects.
CHARLOTTE: What should I do if there are any?
KAEDEN: Ask someone to put them in the dishwasher.
CHARLOTTE: OK, thanks. I don’t want to get anything wrong.
KAEDEN: Don’t worry. You’ll be fine. And I’ll be around to help.
CHARLOTTE: Right.
KAEDEN: Finally, the meat and fish counters. You need to clean the area where staff serve customers, including wiping the weighing scales.
CHARLOTTE: OK. Anything else?
KAEDEN: The fish is laid on ice, but when that starts to melt, you’ll need to get more from the cold-room.
CHARLOTTE: I know the staff on the food counters wear a hat. Will that be the same for me?
KAEDEN: You won’t be serving customers directly, so no. But make sure you put on thermal gloves when you take anything out of the cold-room. The temperature’s low enough in there to get frostbite from touching things.
CHARLOTTE: Understood.', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(190401, 19041, 'text_input', 'First day at work  
 
 
 
 Name of supervisor 
  <strong', '[]'::jsonb, 'KAEDEN', 1, 1),
(190402, 19041, 'text_input', 's-listening-question-number-1" class="ielts-listening-question-number">1     
 
 
 Where to leave coat and bag: 
 use  <strong', '[]'::jsonb, 'locker / lockers', 1, 2),
(190403, 19041, 'text_input', 'ning-question-number-2" class="ielts-listening-question-number">2     in staffroom 
 
 
 See Tiffany in HR: 
 to give  <strong', '[]'::jsonb, 'passport', 1, 3),
(190404, 19041, 'text_input', 'ts-listening-question-item"> 3     number to collect  <strong', '[]'::jsonb, 'uniform', 1, 4),
(190405, 19041, 'text_input', 'd="ielts-listening-question-number-4" class="ielts-listening-question-number">4     
 
 
 Location of HR office: 
 on  <strong', '[]'::jsonb, 'third / 3rd', 1, 5),
(190406, 19041, 'text_input', '-listening-question-number-5" class="ielts-listening-question-number">5     floor 
 
 
 Supervisor''s mobile number: 
  <strong', '[]'::jsonb, '0412665903', 1, 6),
(190407, 19041, 'text_input', 'colspan="4">
  Responsibilities  
 
 
 
  
  Task 1  
  Task 2  
  Notes  
 
 
 Bakery section 
 Check sell by dates 
 Change price labels 
 Use  <strong', '[]'::jsonb, 'yellow', 1, 7),
(190408, 19041, 'text_input', '-question-number-7" class="ielts-listening-question-number">7     labels 
 
 
 Sushi takeaway counter 
 Re-stock with  <strong', '[]'::jsonb, 'plastic', 1, 8),
(190409, 19041, 'text_input', 'answer_155774_2" aria-label="Question 8" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  boxes if needed 
 Wipe preparation area and clean the sink 
 Do not clean any knives 
 
 
 Meat and fish counters 
 Clean the serving area, including the weighing scales 
 Collect  <strong', '[]'::jsonb, 'ice', 1, 9),
(190410, 19041, 'text_input', 'elts-listening-question-number-9" class="ielts-listening-question-number">9     for the fish from the cold-room 
 Must wear special  <strong', '[]'::jsonb, 'gloves', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(19042, 1904, 'listening', 'Listening Part 2', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-12                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><i>Choose <b>TWO</b> letters, <b>A-E</b>.</i></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="11,12"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong> <strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>Which  problems with some training programmes for new runners does Liz mention?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> There is a risk of serious injury.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> They are unsuitable for certain age groups.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> They are unsuitable for people with health issues.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> It is difficult to stay motivated.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> There is a lack of individual support.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 13-14                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="wp-block-group quizlib-question-title">
<div class="wp-block-group__inner-container">
<p><i>Choose <b>TWO</b> letters, <b>A-E</b>.</i><label></label></p>
</div>
</div>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="13,14"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong> <strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>Which TWO tips does Liz recommend for new runners?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> doing two runs a week</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> running in the evening</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> going on runs with a friend</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> listening to music during runs</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> running very slowly</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 15-18                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What reason prevented each of the following members of the Compton Park Runners Club from joining until recently?</p>
<p><i>Write the correct letter, <b>A</b>, <b>B</b>, or <b>C</b>.</i></p>
<p><b>Reasons</b></p>
<p><b>Club members</b></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>Ceri</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">15</strong><select data-qnum="15" name="question_15" class="ielts-inline-select"><option value="">[ 15 ] Tanlang...</option><option value="A. a lack of confidence">A. a lack of confidence</option><option value="B. a dislike of running">B. a dislike of running</option><option value="C. a lack of time">C. a lack of time</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>James</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">16</strong><select data-qnum="16" name="question_16" class="ielts-inline-select"><option value="">[ 16 ] Tanlang...</option><option value="A. a lack of confidence">A. a lack of confidence</option><option value="B. a dislike of running">B. a dislike of running</option><option value="C. a lack of time">C. a lack of time</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Leo</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">17</strong><select data-qnum="17" name="question_17" class="ielts-inline-select"><option value="">[ 17 ] Tanlang...</option><option value="A. a lack of confidence">A. a lack of confidence</option><option value="B. a dislike of running">B. a dislike of running</option><option value="C. a lack of time">C. a lack of time</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Mark</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">18</strong><select data-qnum="18" name="question_18" class="ielts-inline-select"><option value="">[ 18 ] Tanlang...</option><option value="A. a lack of confidence">A. a lack of confidence</option><option value="B. a dislike of running">B. a dislike of running</option><option value="C. a lack of time">C. a lack of time</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="155789" data-allow-duplicates="true">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. a lack of confidence">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">a lack of confidence</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. a dislike of running">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">a dislike of running</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. a lack of time">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">a lack of time</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 19-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><i>Choose the correct letter, <b>A</b>, <b>B</b> or <b>C</b>.</i></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="19"><div class="ielts-q-header"><strong class="ielts-q-badge">19</strong><span class="ielts-q-title"><span>What does Liz say about running her first marathon?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="19" name="question_19" value="A"><span class="ielts-radio-text"><strong>A</strong> It had always been her ambition.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="19" name="question_19" value="B"><span class="ielts-radio-text"><strong>B</strong> Her husband persuaded her to do it.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="19" name="question_19" value="C"><span class="ielts-radio-text"><strong>C</strong> She nearly gave up before the end.</span></label></div></div><div class="ielts-standalone-q" data-qnum="20"><div class="ielts-q-header"><strong class="ielts-q-badge">20</strong><span class="ielts-q-title"><span>Liz says new runners should sign up for a race</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="20" name="question_20" value="A"><span class="ielts-radio-text"><strong>A</strong> every six months.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="20" name="question_20" value="B"><span class="ielts-radio-text"><strong>B</strong> within a few weeks of taking up running.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="20" name="question_20" value="C"><span class="ielts-radio-text"><strong>C</strong> after completing several practice runs.</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/163863-cambridge-ielts-19-academic-listening-4-audio-2-.mp3', 'My name’s Liz Fuller and I’m a running coach with Compton Park Runners Club.
Welcome to my podcast. If you’re thinking about taking up running – I’m here to help.
There are many training programmes available online which aim to help people build up to running 5 kilometres. Some of them are great and thousands of people of all ages are taking part in 5-kilometre races across the country as a result. People like them because they’re easy to follow and don’t push them too hard. However, they don’t work for everyone-especially if you suffer from something like a heart condition or asthma, because they’re aimed at people with average fitness and running ability. Another thing is that everyone is different- and if you have any specific questions related to your needs, there’s no one to provide any answers.
I have a couple of simple tips I always give to new runners. I expect you’ve been told to run very slowly until your fitness increases – well, I find that can prevent progress. You should run at a speed that feels comfortable, but time yourself and try to run a bit faster each time. Listening to music can be very helpful- it takes your mind off things and helps your body get into a rhythm. I’d say that is better than running with a friend – especially as most people are competitive and that’s not what you want when you’re just starting. I don’t think the time of day is especially important- some people are better in the evening, while others are morning people- but you need to be consistent, so aim to train regularly- twice a week is enough to begin with.
New members often say to me that they’ve been put off running either because they lack confidence, or they don’t have time, or they think they dislike running. Ceri, for example, joined the club two years ago at the age of 40. She’d always enjoyed running at school but wasn’t sure if she’d be able to do it. She was worried about being left behind and being the slowest runner. But she says she was made to feel so welcome she soon forgot all about that.
James had always hated the idea of running but a friend encouraged him to come along for a taster session and he hasn’t looked back. He never misses a training session despite having a really demanding job.
Leo was worried about having to commit himself to training sessions every week and wasn’t sure he’d be able to fit training into his busy schedule. But after experiencing a lot of stress at work he came along to us and gave it a go. Now he says he feels much more relaxed and he looks forward to his weekly run.
Mark is quite typical of our new members. He’s never considered himself to be a sporty person and it was only when he retired that he decided to take up the challenge of trying to run 5 kilometres. It took him months to find the courage to contact us but felt reassured immediately as there were other people his age who were only just taking up running for the first time.
My own journey hasn’t been easy. I did my first marathon when I was 37, after having had two kids. My husband had been running marathons for years, but I never dreamed I ’d be doing one with him. I managed to complete it in four hours, but I felt like giving up halfway through -it was only the support of the spectators that kept me going.
I do think signing up for a race of whatever length is motivating – whether it’s 5K or 25K – because it’s good to have something to work towards and it gives you a sense of achievement. I did my first 10K after only six months, which was certainly very challenging and not something I ’d necessarily recommend. But after you’ve been training for a few weeks, it’s worth putting your name down for a 5K- some people find they only need a few practice runs before taking part in a race, but I’d give yourself a couple of months at least.
Well, I hope that’s given . . .', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(190411, 19042, 'multiple_choice', 'Question 11', '["A", "B", "C", "D", "E"]'::jsonb, 'C / E', 1, 11),
(190412, 19042, 'multiple_choice', 'Which  TWO &nbsp;problems with some training programmes for new runners does Liz mention?', '["A", "B", "C", "D", "E"]'::jsonb, 'C / E', 1, 12),
(190413, 19042, 'multiple_choice', 'Question 13', '["A", "B", "C", "D", "E"]'::jsonb, 'A / D', 1, 13),
(190414, 19042, 'multiple_choice', 'Which TWO tips does Liz recommend for new runners?', '["A", "B", "C", "D", "E"]'::jsonb, 'A / D', 1, 14),
(190415, 19042, 'single_choice', 'Question 15', '["A", "B", "C"]'::jsonb, 'A', 1, 15),
(190416, 19042, 'single_choice', 'Question 16', '["A", "B", "C"]'::jsonb, 'B', 1, 16),
(190417, 19042, 'single_choice', 'Question 17', '["A", "B", "C"]'::jsonb, 'C', 1, 17),
(190418, 19042, 'single_choice', 'Question 18', '["A", "B", "C"]'::jsonb, 'A', 1, 18),
(190419, 19042, 'single_choice', 'What does Liz say about running her first marathon?', '["A", "B", "C"]'::jsonb, 'C', 1, 19),
(190420, 19042, 'single_choice', 'Liz says new runners should sign up for a race', '["A", "B"]'::jsonb, 'B', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(19043, 1904, 'listening', 'Listening Part 3', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-25                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose the correct letter, A, B or C.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="21"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong><span class="ielts-q-title"><span>Kieran thinks the packing advice given by Jane’s grandfather is</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="A"><span class="ielts-radio-text"><strong>A</strong> common sense.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="B"><span class="ielts-radio-text"><strong>B</strong> hard to follow.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="C"><span class="ielts-radio-text"><strong>C</strong> over-protective.</span></label></div></div><div class="ielts-standalone-q" data-qnum="22"><div class="ielts-q-header"><strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>How does Jane feel about the books her grandfather has given her?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="A"><span class="ielts-radio-text"><strong>A</strong> They are not worth keeping.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="B"><span class="ielts-radio-text"><strong>B</strong> They should go to a collector.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="C"><span class="ielts-radio-text"><strong>C</strong> They have sentimental value for her.</span></label></div></div><div class="ielts-standalone-q" data-qnum="23"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong><span class="ielts-q-title"><span>Jane and Kieran agree that hardback books should be</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="A"><span class="ielts-radio-text"><strong>A</strong> put out on display.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="B"><span class="ielts-radio-text"><strong>B</strong> given as gifts to visitors.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="C"><span class="ielts-radio-text"><strong>C</strong> more attractively designed.</span></label></div></div><div class="ielts-standalone-q" data-qnum="24"><div class="ielts-q-header"><strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>While talking about taking a book from a shelf, Jane</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="A"><span class="ielts-radio-text"><strong>A</strong> describes the mistakes other people make doing it.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="B"><span class="ielts-radio-text"><strong>B</strong> reflects on a significant childhood experience.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="C"><span class="ielts-radio-text"><strong>C</strong> explains why some books are easier to remove than others.</span></label></div></div><div class="ielts-standalone-q" data-qnum="25"><div class="ielts-q-header"><strong class="ielts-q-badge">25</strong><span class="ielts-q-title"><span>What do Jane and Kieran suggest about new books?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="A"><span class="ielts-radio-text"><strong>A</strong> Their parents liked buying them as presents.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="B"><span class="ielts-radio-text"><strong>B</strong> They would like to buy more of them.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="C"><span class="ielts-radio-text"><strong>C</strong> Not everyone can afford them.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 26-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Where does Jane’s grandfather keep each of the following types of books in his shop?</p>
<p><i>Choose FIVE answers from the box and write the correct letter, A-G.</i></p>
<p><strong>Location of books</strong></p>
<p><strong>Types of books</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>rare books</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">26</strong><select data-qnum="26" name="question_26" class="ielts-inline-select"><option value="">[ 26 ] Tanlang...</option><option value="A. near the entrance">A. near the entrance</option><option value="B. in the attic">B. in the attic</option><option value="C. at the back of the shop">C. at the back of the shop</option><option value="D. on a high shelf">D. on a high shelf</option><option value="E. near the stairs">E. near the stairs</option><option value="F. in a specially designed space">F. in a specially designed space</option><option value="G. within the cafe">G. within the cafe</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>children’s books</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. near the entrance">A. near the entrance</option><option value="B. in the attic">B. in the attic</option><option value="C. at the back of the shop">C. at the back of the shop</option><option value="D. on a high shelf">D. on a high shelf</option><option value="E. near the stairs">E. near the stairs</option><option value="F. in a specially designed space">F. in a specially designed space</option><option value="G. within the cafe">G. within the cafe</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>unwanted books</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">28</strong><select data-qnum="28" name="question_28" class="ielts-inline-select"><option value="">[ 28 ] Tanlang...</option><option value="A. near the entrance">A. near the entrance</option><option value="B. in the attic">B. in the attic</option><option value="C. at the back of the shop">C. at the back of the shop</option><option value="D. on a high shelf">D. on a high shelf</option><option value="E. near the stairs">E. near the stairs</option><option value="F. in a specially designed space">F. in a specially designed space</option><option value="G. within the cafe">G. within the cafe</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>requested books</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">29</strong><select data-qnum="29" name="question_29" class="ielts-inline-select"><option value="">[ 29 ] Tanlang...</option><option value="A. near the entrance">A. near the entrance</option><option value="B. in the attic">B. in the attic</option><option value="C. at the back of the shop">C. at the back of the shop</option><option value="D. on a high shelf">D. on a high shelf</option><option value="E. near the stairs">E. near the stairs</option><option value="F. in a specially designed space">F. in a specially designed space</option><option value="G. within the cafe">G. within the cafe</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>coursebooks</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">30</strong><select data-qnum="30" name="question_30" class="ielts-inline-select"><option value="">[ 30 ] Tanlang...</option><option value="A. near the entrance">A. near the entrance</option><option value="B. in the attic">B. in the attic</option><option value="C. at the back of the shop">C. at the back of the shop</option><option value="D. on a high shelf">D. on a high shelf</option><option value="E. near the stairs">E. near the stairs</option><option value="F. in a specially designed space">F. in a specially designed space</option><option value="G. within the cafe">G. within the cafe</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="155805">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. near the entrance">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">near the entrance</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. in the attic">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">in the attic</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. at the back of the shop">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">at the back of the shop</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. on a high shelf">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">on a high shelf</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. near the stairs">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">near the stairs</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. in a specially designed space">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">in a specially designed space</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. within the cafe">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">within the cafe</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/163754-cambridge-ielts-19-academic-listening-4-audio-3.mp3', 'KIERAN: So Jane – you’ll be off to Denmark soon to do your work placement.
JANE: Yes, I’m really looking forward to it and I’ve just started packing up all my books to put in storage.
KIERAN: Well, I hope they don’t get spoilt.
JANE: It’s OK – my grandfather works in a bookshop and he told me how to pack them.
KIERAN: Oh, that’s helpful.
JANE: He says you have to support the spine otherwise the paper can come away from the cover.
KIERAN: Yeah – that’s obvious.
JANE: He also told me to pack them flat in the box not on their side – again because they can bend and if you leave them like that for, say, a year, it’s quite hard to get them back to their normal shape.
KIERAN: Well, it’s pretty clear that ruins them, but a lot of people just can’t be bothered to protect their books.
JANE: He always says it’s such a shame that publishers don’t use better-quality paper.
KIERAN: It’s the acid in the paper that causes the problem, isn’t it?
JANE: Yeah – that’s why old books go yellow. You know some of the books my grandfather’s given me are like that already.
KIERAN: Oh . . .
JANE: I should dump them really if they’re going to deteriorate further, but I’d feel bad. They’ll always remind me of him. He’s quite a collector, you know.
KIERAN: Well, if they’re important to you . . .
JANE: Yeah – I’d regret just throwing them away.
KIERAN: You know, maybe it’s because I was taught to treasure books . . . but I hate seeing students force open the pages – of paperbacks. They press so hard they end up breaking the spine.
JANE: I know, but unfortunately, paperbacks aren’t designed to last a long time and people know that. Hardbacks aren’t quite as weak.
KIERAN: Yeah, they’re different, I suppose. But I still don’t think people value hardbacks like they used to.
JANE: Well, they aren’t decorative, are they, like other objects. Plus, nowadays, people don’t keep them out on shelves as much as they used to.
KIERAN: That’s such a pity. When I visit someone – if they have, say, a colorful book on a table, it’s the first thing I’m drawn to.
JANE: I agree-and book covers can be a work of art in themselves. Some are really eye-catching.
KIERAN: I’ve always been taught to handle books carefully. If you watch someone take a book off a shelf, well, they usually do it wrong.
JANE: Ah, my grandfather says, you should put your hand right over the top of the book . . . or if you can’t do that, pull the other books on the shelf aside so that you can hold the whole cover.
KIERAN: When did you learn all this?
JANE: He watched me pull a heavy book off the shelf when I was small, and it fell on the floor and broke apart.
KIERAN: Oh dear!
KIERAN: I can still remember it!
JANE: You know what I really like?
KIERAN: What?
JANE: The smell of new books.
KIERAN: Me too.
JANE: My parents used to laugh at me when I was a kid because I loved putting books up to my nose. Almost as much as reading them!
KIERAN: New books aren’t cheap, though, are they?
JANE: I guess we’re lucky we can buy them.
KIERAN: My grandfather stocks second-hand books as well as new ones and they don’t smell quite as good.
……………………………………………………………………………………………………………..
KIERAN: I’d love to have a bookshop like your grandfather. What’s it like?
JANE: Well, it’s quite big – it’s got two floors and an attic, and he stocks all kinds of books really.
KIERAN: I guess he treasures things like first editions and other rare books.
JANE: Yeah – you might think he’d keep those in the attic or somewhere.
KIERAN: . . . so they’d be hidden?
JANE: Yeah. But he likes people to know that he has them. So, he puts them out in the shop but makes sure you need a ladder to get them.
KIERAN: Right. That would prevent any thefts!
JANE: Uhuh.
KIERAN: Does he stock books for children?
JANE: He does. He particularly likes to encourage kids to read; he always says that he used to sit under the stairs as a child with a pile of books and read them all.
KIERAN: Is that where he keeps them, then?
JANE: Not exactly- he’s got a dedicated area on the ground floor with cushions so that parents can enter with their toddlers, go there and spend some time reading to them.
KIERAN: Oh cool.
JANE: And then there’s a place for pushchairs by the front door. And a café if anyone needs refreshments.
KIERAN: That’s good to know.
JANE: As I said, it’s a big shop and there’s a storage area out the back as well.
KIERAN: Oh, what does he keep there? Books he wants to throw away?
JANE: He hardly ever throws anything away -he just leaves unwanted books by the front door for customers to take.
KIERAN: Well, that’s very nice.
JANE: Yeah-and books people or institutions have requested, they all go at the far end.
KIERAN: Oh.
JANE: He thinks it’s best to keep these out of the main shopping area as they’re boxed and new.
KIERAN: Did you get your coursebooks from him?
JANE: Naturally. He stocks books for a lot of the colleges. He used to keep these books on the first floor, but now there’s a new university in my hometown, he’s moved them downstairs to attract the students. They’re actually part of the coffee shop, on low shelves all around it.
KIERAN: Pretty central then. You’ll have to take me there some time!', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(190421, 19043, 'single_choice', 'Kieran thinks the packing advice given by Jane&rsquo;s grandfather is', '["A", "B", "C"]'::jsonb, 'A', 1, 21),
(190422, 19043, 'single_choice', 'How does Jane feel about the books her grandfather has given her?', '["A", "B", "C"]'::jsonb, 'C', 1, 22),
(190423, 19043, 'single_choice', 'Jane and Kieran agree that hardback books should be', '["A", "B", "C"]'::jsonb, 'A', 1, 23),
(190424, 19043, 'single_choice', 'While talking about taking a book from a shelf, Jane', '["A", "B", "C"]'::jsonb, 'B', 1, 24),
(190425, 19043, 'single_choice', 'What do Jane and Kieran suggest about new books?', '["A", "B", "C"]'::jsonb, 'C', 1, 25),
(190426, 19043, 'single_choice', 'Question 26', '["A", "B", "C"]'::jsonb, 'D', 1, 26),
(190427, 19043, 'single_choice', 'Question 27', '["A", "B", "C"]'::jsonb, 'F', 1, 27),
(190428, 19043, 'single_choice', 'Question 28', '["A", "B", "C"]'::jsonb, 'A', 1, 28),
(190429, 19043, 'single_choice', 'Question 29', '["A", "B", "C"]'::jsonb, 'C', 1, 29),
(190430, 19043, 'single_choice', 'Question 30', '["A", "B", "C"]'::jsonb, 'G', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(19044, 1904, 'listening', 'Listening Part 4', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p><em>Complete the notes below.</em></p>
<p><em>Write <strong>ONE WORD ONLY</strong> for each answer.</em></p>
<p style="text-align: center"><strong>Tree planting</strong></p>
<p><strong>Reforestation projects should:</strong></p>
<p>- include a range of tree species</p>
<p>- not include invasive species because of possible <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span> with native species</p>
<p>- aim to capture carbon, protect the environment and provide sustainable sources of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> for local people</p>
<p>- use tree seeds with a high genetic diversity to increase resistance to <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span> and climate change</p>
<p>- plant trees on previously forested land which is in a bad condition, not select land which is being used for <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p><strong>Large-scale reforestation projects</strong></p>
<p>- Base planning decisions on information from accurate <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>- Drones are useful for identifying areas in Brazil which are endangered by keeping <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> and illegal logging.</p>
<p><strong>Lampang Province, Northern Thailand</strong></p>
<p>- A forest was restored in an area damaged by mining.</p>
<p>- A variety of native fig trees were planted, which are important for</p>
<p>+ supporting many wildlife species</p>
<p>+ increasing the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span> of recovery by attracting animals and birds, e.g., <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> were soon attracted to the area.</p>
<p><strong>Involving local communities</strong></p>
<p>- Destruction of mangrove forests in Madagascar made it difficult for people to make a living from <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>- The mangrove reforestation project:</p>
<p>+ provided employment for local people</p>
<p>+ restored a healthy ecosystem</p>
<p>+ protects against the higher risk of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span></p>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/163753-cambridge-ielts-19-academic-listening-4-audio-4.mp3', 'Tree planting now dominates political and popular agendas and is often presented as an easy answer to the climate crisis, as well as a way for business corporations to offset their carbon emissions. But unfortunately, tree planting isn’t as straightforward as some people think. When the wrong trees are planted in the wrong place, it can do considerably more damage than good, failing to help either people or the environment.
Reforestation projects are currently being undertaken on a huge scale in many countries and it’s crucial that the right trees are selected. A mix of species should always be planted, typical of the local natural forest ecosystem and including rare and endangered species in order to create a rich ecosystem. It’s important to avoid non-native species that could become invasive. Invasive species are a significant contributor to the current global biodiversity crisis and are often in competition with native species and may threaten their long-term survival.
Restoring biodiversity that will maximise carbon capture is key when reforesting an area, but ideally any reforestation project should have several goals. These could include selecting trees that can contribute to wildlife conservation, improve the availability of food for the local community and maintain the stability of soil systems. Meeting as many of these goals as possible, whilst doing no harm to local communities, native ecosystems and vulnerable species, is the sign of a highly successful tree-planting scheme. To ensure the survival and resilience of a planted forest, it’s vital to use tree seeds with appropriate levels of genetic diversity: the amount of genetic variation found within a species essential for their survival. Using seeds with low genetic diversity generally lowers the resilience of restored forests, which can make them vulnerable to disease and unable to adapt to climate change.
Choosing the right location for reforestation projects is as important as choosing the right trees. Ultimately, the best area for planting trees would be in formerly forested areas that are in poor condition. It’s better to avoid non-forested landscapes such as natural grasslands, savannas or wetlands as these ecosystems already contribute greatly to capturing carbon. It would also be advantageous to choose an area where trees could provide other benefits, such as recreational spaces. Reforesting areas which are currently exploited for agriculture should be avoided as this often leads to other areas being deforested.
Large-scale reforestation projects require careful planning. Making the right decisions about where to plant trees depends on having the right information. Having detailed and up-to-date maps identifying high-prioritv areas for intervention is essential. Drone technology is a useful tool in helping to prioritise and monitor areas of degraded forest for restoration. In Brazil, it’s being used to identify and quantify how parts of the Amazon are being devastated by human activities such as rearing cattle and illegal logging.
A good example of where the right trees were picked to achieve a restored forest is in Lampang Province in Northern Thailand. A previously forested site which had been degraded through mining was reforested by a cement company together with Chiang Mai University. After spreading 60 cm of topsoil, they planted 14 different native tree species which included several species of fig. Figs are a keystone species because of the critical role they play in maintaining wildlife populations. They are central to tropical reforestation projects as they accelerate the speed of the recovery process by attracting animals and birds which act as natural seed dispersers. This helps to promote diversity through the healthy regrowth of a wide range of plant species. Unlike the majority of fruit trees, figs bear fruit all year round, providing a reliable food source for many species. At this site, for example, after only three rainy seasons, monkeys started visiting to eat the fig fruits, naturally dispersing seeds through defecation.
Reforestation projects should always aim to make sure that local communities are consulted and involved in the decision-making process. The restoration of mangrove forests in Madagascar is an example of a project which has succeeded in creating real benefits for the community. Destruction of the mangrove forests had a terrible impact on plant and animal life, and also badly affected the fishing industry, which was a major source of employment for local people living in coastal areas. The reforestation project involved hiring local people to plant and care for the new mangrove trees. Millions of mangrove trees have now been planted which has resulted in the return of a healthy aquatic ecosystem. The mangroves also act as a defence against the increased threat of flooding caused by climate change. What’s more, the local economy is more stable and thousands more Madagascans are now able to send their children to school.
One other important point to consider . ..', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(190431, 19044, 'text_input', 'Tree planting  
  Reforestation projects should:  
 - include a range of tree species 
 - not include invasive species because of possible  <strong', '[]'::jsonb, 'competition', 1, 31),
(190432, 19044, 'text_input', 'ng-question-number">31     with native species 
 - aim to capture carbon, protect the environment and provide sustainable sources of  <strong', '[]'::jsonb, 'food', 1, 32),
(190433, 19044, 'text_input', '"ielts-listening-question-number">32     for local people 
 - use tree seeds with a high genetic diversity to increase resistance to  <strong', '[]'::jsonb, 'disease', 1, 33),
(190434, 19044, 'text_input', 'rong>    and climate change 
 - plant trees on previously forested land which is in a bad condition, not select land which is being used for  <strong', '[]'::jsonb, 'agriculture', 1, 34),
(190435, 19044, 'text_input', 'n-number">34     
  Large-scale reforestation projects  
 - Base planning decisions on information from accurate  <strong', '[]'::jsonb, 'maps', 1, 35),
(190436, 19044, 'text_input', 'class="ielts-listening-question-number">35     
 - Drones are useful for identifying areas in Brazil which are endangered by keeping  <strong', '[]'::jsonb, 'cattle', 1, 36),
(190437, 19044, 'text_input', '- A variety of native fig trees were planted, which are important for 
 + supporting many wildlife species 
 + increasing the  <strong', '[]'::jsonb, 'speed', 1, 37),
(190438, 19044, 'text_input', ',  <strong', '[]'::jsonb, 'monkeys', 1, 38),
(190439, 19044, 'text_input', 'Involving local communities  
 - Destruction of mangrove forests in Madagascar made it difficult for people to make a living from  <strong', '[]'::jsonb, 'fishing', 1, 39),
(190440, 19044, 'text_input', 'listening_answer_155809_9" id="ielts_listening_answer_155809_9" aria-label="Question 39" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  
 - The mangrove reforestation project: 
 + provided employment for local people 
 + restored a healthy ecosystem 
 + protects against the higher risk of  <strong', '[]'::jsonb, 'flooding', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
