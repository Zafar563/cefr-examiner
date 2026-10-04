-- Cambridge IELTS 13 Academic Listening Test 4
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1304, 'Cambridge IELTS 13 Academic Listening Test 4', 'Rasmiy Cambridge IELTS 13 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(13041, 1304, 'listening', 'Listening Part 1: Alex’s Training', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-10                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Complete the notes below.</p>
<p><em>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</em></p>
<table>
<tbody>
<tr>
<td width="623">
<p class="ielts-listening-transcript-subhead"><strong><strong>Alex’s Training</strong></strong></p>
</td>
</tr>
<tr>
<td width="623"><em>Example</em></p>
<p>Alex complete his training in …..<em>2014</em>……</td>
</tr>
<tr>
<td width="623"><strong>About the applicant:</strong></p>
<ul>
<li>At first, Alex did his training in the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span> department.</li>
<li>Alex didn’t have a qualification from school in <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>Alex thinks he should have done the diploma in <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span> skills.</li>
<li>Age of other trainees: the youngest was <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
</ul>
<p><strong>Benefits of doing training at JPNW:</strong></p>
<ul>
<li>Lots of opportunities because of the size of the organisation.</li>
<li>Trainees receive the same amount of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span> as permanent staff.</li>
<li>The training experience increases people’s confidence a lot.</li>
<li>Trainees go to <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span> one day per month.</li>
<li>The company is in a convenient <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
</ul>
<p><strong>Advice for interview:</strong></p>
<ul>
<li>Don’t wear <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>Don’t be <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>Make sure you <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12491-cambridge-ielts-13-academic-listening-4-audio-1.mp3', 'MARTHA: Hi Alex. It’s Martha Clines here. James White gave me your number. I hope you don’t mind me calling you.
ALEX: Of course not. How are you, Martha?
MARTHA: Good thanks. I’m ringing because I need a bit of advice.
ALEX: Oh yeah. What about?
MARTHA: The training you did at JPNW a few years ago. I’m applying for the same thing.
ALEX: Oh right. Yes, I did mine in 2014. Best thing I ever did. I’m still working there.
MARTHA: Really? What are you doing?
ALEX: Well, now I work in the customer services department but I did my initial training in Finance. I stayed there for the first two years and then moved to where I am now.
MARTHA: That’s the same department I’m applying for. Did you enjoy it?
ALEX: I was pretty nervous to begin with. I didn’t do well in my exams at school and I was really worried because I failed Maths. But it didn’t actually matter because I did lots of courses on the job.
MARTHA: Did you get a diploma at the end of your trainee period? I’m hoping to do the one in business skills.
ALEX: Yes. That sounds good. I took the one on IT skills but I wish I’d done that one instead.
MARTHA: OK, that’s good to know. What about the other trainees? How did you get on with them?
ALEX: There were about 20 of us who started at the same time and we were all around the same age – I was 18 and there was only one person younger than me, how was 17. The rest were between 18 and 20. I made some good friends.
MARTHA: I’ve heard lots of good things about the training at JPNW. It seems like there are a lot of opportunities there.
ALEX: Yeah, definitely. Because of its size you can work in loads of different areas within the organisation.
MARTHA: What about pay? I know you get a lower minimum wage than regular employees.
ALEX: That’s right – which isn’t great. Buy you get the same number of days’ holiday as everyone else. And the pay goes up massively if they offer you a job at the end of the training period.
MARTHA: Yeah, but I’m not doing it for the money – it’s the experience I think will be really useful. Everyone says by the end of the year you gain so much confidence.
ALEX: You’re right. That’s the most useful part about it. There’s a lot of variety too. You’re given lots of different things to do. I enjoyed it all – I didn’t even mind the studying.
MARTHA: Do you have to spend any time in college?
ALEX: Yes, one day each month. So you get lots of support from both your tutor and your manager.
MARTHA: That’s good. And the company is easy to get to, isn’t it?
ALEX: Yes, it’s very close to the train station so the location’s a real advantage.
———————
ALEX: Have you got a date for your interview yet?
MARTHA: Yes, it’s on the 23rd of this month.
ALEX: So long as you’re well prepared there’s nothing to worry about. Everyone’s very friendly.
MARTHA: I am not sure what I should wear. What do you think?
ALEX: Nothing too casual – like jeans, for example. If you’ve got a nice jacket, wear that with a skirt or trousers.
MARTHA: OK. Thanks. Any other tips?
ALEX: Erm, well I know it’s really obvious but arrive in plenty of time. They hate people who are late. So make sure you know exactly where you have to get to. And one other useful piece of advice my manager told me before I had the interview for this job – is to smile. Even if you feel terrified. It makes people respond better to you.
MARTHA: I’ll have to practise doing that in the mirror!
ALEX: Yeah – well, good luck. Let me know if you need any more information.
MARTHA: Thanks very much.', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(130401, 13041, 'text_input', '2014 …… 
 
 
  About the applicant:  
 
 At first, Alex did his training in the  <strong', '[]'::jsonb, 'Finance', 1, 1),
(130402, 13041, 'text_input', 'Alex didn’t have a qualification from school in  <strong', '[]'::jsonb, 'Maths / math / Math / maths / Mathematics', 1, 2),
(130403, 13041, 'text_input', 'Alex thinks he should have done the diploma in  <strong', '[]'::jsonb, 'business', 1, 3),
(130404, 13041, 'text_input', 'Age of other trainees: the youngest was  <strong', '[]'::jsonb, '17 / seventeen', 1, 4),
(130405, 13041, 'text_input', 'Trainees receive the same amount of  <strong', '[]'::jsonb, 'holiday / holidays / vacation / vacations', 1, 5),
(130406, 13041, 'text_input', 'Trainees go to  <strong', '[]'::jsonb, 'college', 1, 6),
(130407, 13041, 'text_input', 'The company is in a convenient  <strong', '[]'::jsonb, 'location', 1, 7),
(130408, 13041, 'text_input', 'Advice for interview:  
 
 Don’t wear  <strong', '[]'::jsonb, 'jeans', 1, 8),
(130409, 13041, 'text_input', 'Don’t be  <strong', '[]'::jsonb, 'late', 1, 9),
(130410, 13041, 'text_input', 'Make sure you  <strong', '[]'::jsonb, 'smile', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(13042, 1304, 'listening', 'Listening Part 2: The Snow Centre', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-16                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>The Snow Centre</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="11"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong><span class="ielts-q-title"><span>Annie recommends that when cross-country skiing, the visitors should</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="A"><span class="ielts-radio-text"><strong>A</strong> get away from the regular trails.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="B"><span class="ielts-radio-text"><strong>B</strong> stop to enjoy views of the scenery.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="C"><span class="ielts-radio-text"><strong>C</strong> go at a slow speed at the beginning.</span></label></div></div><div class="ielts-standalone-q" data-qnum="12"><div class="ielts-q-header"><strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>What does Annie tell the group about this afternoon’s dog-sled trip?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="A"><span class="ielts-radio-text"><strong>A</strong> Those who want to can take part in a race.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="B"><span class="ielts-radio-text"><strong>B</strong> Anyone has the chance to drive a team of dogs.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="C"><span class="ielts-radio-text"><strong>C</strong> One group member will be chosen to lead the trail.</span></label></div></div><div class="ielts-standalone-q" data-qnum="13"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong><span class="ielts-q-title"><span>What does Annie say about the team relay event?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="A"><span class="ielts-radio-text"><strong>A</strong> All participants receive a medal.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="B"><span class="ielts-radio-text"><strong>B</strong> The course is 4 km long.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="C"><span class="ielts-radio-text"><strong>C</strong> Each team is led by a teacher.</span></label></div></div><div class="ielts-standalone-q" data-qnum="14"><div class="ielts-q-header"><strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>On the snow-shoe trip, the visitors will</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="A"><span class="ielts-radio-text"><strong>A</strong> visit an old gold mine.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="B"><span class="ielts-radio-text"><strong>B</strong> learn about unusual flowers.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="C"><span class="ielts-radio-text"><strong>C</strong> climb to the top of a mountain.</span></label></div></div><div class="ielts-standalone-q" data-qnum="15"><div class="ielts-q-header"><strong class="ielts-q-badge">15</strong><span class="ielts-q-title"><span>The cost of accommodation in the mountain hut includes</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="A"><span class="ielts-radio-text"><strong>A</strong> a supply of drinking water.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="B"><span class="ielts-radio-text"><strong>B</strong> transport of visitors’ luggage.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="C"><span class="ielts-radio-text"><strong>C</strong> cooked meals.</span></label></div></div><div class="ielts-standalone-q" data-qnum="16"><div class="ielts-q-header"><strong class="ielts-q-badge">16</strong><span class="ielts-q-title"><span>If there is a storm while the visitors are in the hut, they should</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="A"><span class="ielts-radio-text"><strong>A</strong> contact the bus driver.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="B"><span class="ielts-radio-text"><strong>B</strong> wait until the weather improves.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="C"><span class="ielts-radio-text"><strong>C</strong> use the emergency locator beacon.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 17-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What information does Annie give about skiing on each of the following mountain trails?</p>
<p><em>Choose <strong>FOUR</strong> answers from the box and write the correct letter, <strong>A-F</strong>, next to Questions</em></p>
<p><strong>Information</strong></p>
<p><strong>Mountain trails</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>Highland Trail</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">17</strong><select data-qnum="17" name="question_17" class="ielts-inline-select"><option value="">[ 17 ] Tanlang...</option><option value="A. It has a good place to stop and rest.">A. It has a good place to stop and rest.</option><option value="B. It is suitable for all abilities.">B. It is suitable for all abilities.</option><option value="C. It involves crossing a river.">C. It involves crossing a river.</option><option value="D. It demands a lot of skill.">D. It demands a lot of skill.</option><option value="E. It may be closed in bad weather.">E. It may be closed in bad weather.</option><option value="F. It has some very narrow sections.">F. It has some very narrow sections.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <div class="ielts-listening-question-item"> • <span>Pine Trail</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">18</strong><select data-qnum="18" name="question_18" class="ielts-inline-select"><option value="">[ 18 ] Tanlang...</option><option value="A. It has a good place to stop and rest.">A. It has a good place to stop and rest.</option><option value="B. It is suitable for all abilities.">B. It is suitable for all abilities.</option><option value="C. It involves crossing a river.">C. It involves crossing a river.</option><option value="D. It demands a lot of skill.">D. It demands a lot of skill.</option><option value="E. It may be closed in bad weather.">E. It may be closed in bad weather.</option><option value="F. It has some very narrow sections.">F. It has some very narrow sections.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <div class="ielts-listening-question-item"> • <span>Stony Trail</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">19</strong><select data-qnum="19" name="question_19" class="ielts-inline-select"><option value="">[ 19 ] Tanlang...</option><option value="A. It has a good place to stop and rest.">A. It has a good place to stop and rest.</option><option value="B. It is suitable for all abilities.">B. It is suitable for all abilities.</option><option value="C. It involves crossing a river.">C. It involves crossing a river.</option><option value="D. It demands a lot of skill.">D. It demands a lot of skill.</option><option value="E. It may be closed in bad weather.">E. It may be closed in bad weather.</option><option value="F. It has some very narrow sections.">F. It has some very narrow sections.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <div class="ielts-listening-question-item"> • <span>Loser’s Trail</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">20</strong><select data-qnum="20" name="question_20" class="ielts-inline-select"><option value="">[ 20 ] Tanlang...</option><option value="A. It has a good place to stop and rest.">A. It has a good place to stop and rest.</option><option value="B. It is suitable for all abilities.">B. It is suitable for all abilities.</option><option value="C. It involves crossing a river.">C. It involves crossing a river.</option><option value="D. It demands a lot of skill.">D. It demands a lot of skill.</option><option value="E. It may be closed in bad weather.">E. It may be closed in bad weather.</option><option value="F. It has some very narrow sections.">F. It has some very narrow sections.</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12477">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. It has a good place to stop and rest.">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">It has a good place to stop and rest.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. It is suitable for all abilities.">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">It is suitable for all abilities.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. It involves crossing a river.">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">It involves crossing a river.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. It demands a lot of skill.">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">It demands a lot of skill.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. It may be closed in bad weather.">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">It may be closed in bad weather.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. It has some very narrow sections.">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">It has some very narrow sections.</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12490-cambridge-ielts-13-academic-listening-4-audio-2.mp3', 'Hi everyone, welcome to the Snow Centre. My name’s Annie. I hope you enjoyed the bus trip from the airport – we’ve certainly got plenty of snow today! Well, you’ve come to New Zealand’s premier snow and ski centre, and we’ve a whole load of activities for you during your week here.
Most visitors come here for the cross-country skiing, where you’re on fairly flat ground for most of the time, rather than going down steep mountainsides. There are marked trails, but you can also leave these and go off on your own and that’s an experience not to be missed. You can go at your own speed – it’s great aerobic exercise if you really push yourself, or if you prefer you can just glide gently along and enjoy the beautiful scenery.
This afternoon, you’ll be going on a dog-sled trip. You may have seen our dogs on TV recently racing in the winter sled festival. If you want, you can have your own team for the afternoon and learn how to drive them, following behind our leader on the trail. Or if you’d prefer, you can just sit back in the sled and enjoy the ride as a passenger.
At the weekend, we have the team relay event, and you’re all welcome to join in. We have a local school coming along, and a lot of the teachers are taking part too. Participation rather than winning is the main focus, and there’s a medal for everyone who takes part. Participants are in teams of two to four, and each team must complete four laps of the course.
For your final expedition, you’ll head off to Mount Frenner wearing a pair of special snow shoes which allow you to walk on top of the snow. This is an area where miners once searched for gold, though there are very few traces of their work left now. When the snow melts in summer, the mountain slopes are carpeted in flowers and plants. It’s a long ascent, though not too steep, and walkers generally take a couple of days to get to the summit and return.
You’ll spend the night in our hut half-way up the mountain. That’s included in your package for the stay. It’s got cooking facilities, firewood and water for drinking. For washing, we recommend you use melted snow, though, to conserve supplies. We can take your luggage up on our snowmobile for you for just ten dollars a person. The hut has cooking facilities so you can make a hot meal in the evening and morning, but you need to take your own food.
The weather on Mount Frenner can be very stormy. In that case, stay in the hut – generally the storms don’t last long. Don’t stress about getting back here to the centre in time to catch the airport bus – they’ll probably not be running anyway. We do have an emergency locator beacon in the hut but only use that if it’s real emergency, like if someone’s ill or injured.
—————
Now, let me tell you something about the different ski trails you can follow during your stay here.
Highland Trail’s directly accessible from where we are now. This trail’s been designed to give first-timers an experience they’ll enjoy regardless of their age or skill, but it’s also ideal for experts to practise their technique.
Then there’s Pine Trail … if you’re nervous about skiing, leave this one to the experts! You follow a steep valley looking right down on the river below – scary! But if you’ve fully mastered the techniques needed for hills, it’s great fun.
Stony Trail’s a good choice once you’ve got a general idea of the basics. There are one or two tricky sections, but nothing too challenging. There’s a shelter half-way where you can sit and take a break and enjoy the afternoon sunshine.
And finally, Loser’s Trail. This starts off following a gentle river valley but the last part is quite exposed so the snow conditions can be challenging – if it’s snowing or windy, check with us before you set out to make sure the trail’s open that day.
Right, so now if you’d like to follow me, we’ll get started …', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(130411, 13042, 'single_choice', 'Annie recommends that when cross-country skiing, the visitors should', '["A", "B", "C"]'::jsonb, 'A', 1, 11),
(130412, 13042, 'single_choice', 'What does Annie tell the group about this afternoon&rsquo;s dog-sled trip?', '["A", "B", "C"]'::jsonb, 'B', 1, 12),
(130413, 13042, 'single_choice', 'What does Annie say about the team relay event?', '["A", "B", "C"]'::jsonb, 'A', 1, 13),
(130414, 13042, 'single_choice', 'On the snow-shoe trip, the visitors will', '["A", "B", "C"]'::jsonb, 'C', 1, 14),
(130415, 13042, 'single_choice', 'The cost of accommodation in the mountain hut includes', '["A", "B", "C"]'::jsonb, 'A', 1, 15),
(130416, 13042, 'single_choice', 'If there is a storm while the visitors are in the hut, they should', '["A", "B", "C"]'::jsonb, 'B', 1, 16),
(130417, 13042, 'single_choice', 'Question 17', '["A", "B", "C"]'::jsonb, 'B', 1, 17),
(130418, 13042, 'single_choice', 'Question 18', '["A", "B", "C"]'::jsonb, 'D', 1, 18),
(130419, 13042, 'single_choice', 'Question 19', '["A", "B", "C"]'::jsonb, 'A', 1, 19),
(130420, 13042, 'single_choice', 'Question 20', '["A", "B", "C"]'::jsonb, 'E', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(13043, 1304, 'listening', 'Listening Part 3: Labels giving nutritional information on food packaging', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-26                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Labels giving nutritional information on food packaging</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="21"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong><span class="ielts-q-title"><span>What was Jack’s attitude to nutritional food labels before this project?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="A"><span class="ielts-radio-text"><strong>A</strong> He didn’t read everything on them.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="B"><span class="ielts-radio-text"><strong>B</strong> He didn’t think they were important.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="C"><span class="ielts-radio-text"><strong>C</strong> He thought they were too complicated.</span></label></div></div><div class="ielts-standalone-q" data-qnum="22"><div class="ielts-q-header"><strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>Alice says that before doing this project,</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="A"><span class="ielts-radio-text"><strong>A</strong> she was unaware of what certain foods contained.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="B"><span class="ielts-radio-text"><strong>B</strong> she was too lazy to read food labels.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="C"><span class="ielts-radio-text"><strong>C</strong> she was only interested in the number of calories.</span></label></div></div><div class="ielts-standalone-q" data-qnum="23"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong><span class="ielts-q-title"><span>When discussing supermarket brands of pizza, Jack agrees with Alice that</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="A"><span class="ielts-radio-text"><strong>A</strong> the list of ingredients is shocking.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="B"><span class="ielts-radio-text"><strong>B</strong> he will hesitate before buying pizza again.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="C"><span class="ielts-radio-text"><strong>C</strong> the nutritional label is misleading.</span></label></div></div><div class="ielts-standalone-q" data-qnum="24"><div class="ielts-q-header"><strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>Jack prefers the daily value system to other labelling systems because it is</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="A"><span class="ielts-radio-text"><strong>A</strong> more accessible.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="B"><span class="ielts-radio-text"><strong>B</strong> more logical.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="C"><span class="ielts-radio-text"><strong>C</strong> more comprehensive.</span></label></div></div><div class="ielts-standalone-q" data-qnum="25"><div class="ielts-q-header"><strong class="ielts-q-badge">25</strong><span class="ielts-q-title"><span>What surprised both students about one flavour of crisps?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="A"><span class="ielts-radio-text"><strong>A</strong> The percentage of artificial additives given was incorrect.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="B"><span class="ielts-radio-text"><strong>B</strong> The products did not contain any meat.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="C"><span class="ielts-radio-text"><strong>C</strong> The labels did not list all the ingredients.</span></label></div></div><div class="ielts-standalone-q" data-qnum="26"><div class="ielts-q-header"><strong class="ielts-q-badge">26</strong><span class="ielts-q-title"><span>What do the students think about research into the impact of nutritional food labelling?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="26" name="question_26" value="A"><span class="ielts-radio-text"><strong>A</strong> It did not produce clear results.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="26" name="question_26" value="B"><span class="ielts-radio-text"><strong>B</strong> It focused on the wrong people.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="26" name="question_26" value="C"><span class="ielts-radio-text"><strong>C</strong> It made unrealistic recommendations.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 27-28                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="27,28"><div class="ielts-q-header"><strong class="ielts-q-badge">27</strong> <strong class="ielts-q-badge">28</strong><span class="ielts-q-title"><span>Which  things surprised the students about the traffic-light system for nutritional labels?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="27,28" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> its widespread use</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="27,28" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> the fact that it is voluntary for supermarkets</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="27,28" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> how little research was done before its introduction</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="27,28" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> its unpopularity with food manufacturers</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="27,28" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> the way that certain colours are used</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 29-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="29,30"><div class="ielts-q-header"><strong class="ielts-q-badge">29</strong> <strong class="ielts-q-badge">30</strong><span class="ielts-q-title"><span>Which  things are true about the participants in the study on the traffic-light system?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> They had low literacy levels.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> They were regular consumers of packaged food.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> They were selected randomly.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> They were from all socio-economic groups.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> They were interviewed face-to-face.</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12489-cambridge-ielts-13-academic-listening-4-audio-3.mp3', 'JACK: I’ve still got loads to do for our report on nutritional food labels.
ALICE: Me too. What did you learn from doing the project about your own shopping habits?
JACK: Well, I’ve always had to check labels for traces of peanuts in everything I eat because of my allergy. But beyond that I’ve never really been concerned enough to check how healthy a product is.
ALICE: This project has actually taught me to read the labels much more carefully. I tended to believe claims on packaging like ‘low in fat’. But I now realise that the ‘healthy’ yoghurt I’ve bought for years is full of sugar and that it’s actually quite high in calories.
JACK: Ready meals are the worst … comparing the labels on supermarket pizzas was a real eye-opener. Did you have any idea how many calories they contain? I was amazed.
ALICE: Yes, because unless you read the label really carefully, you wouldn’t know that the nutritional values given are for half a pizza.
JACK: When most people eat the whole pizza. Not exactly transparent is it?
ALICE: Not at all. But I expect it won’t stop you from buying pizza?
JACK: Probably not, no! I thought comparing the different labelling systems used by food manufactures was interesting. I think the kind of labelling system used makes a big difference.
ALICE: Which one did you prefer?
JACK: I liked the traditional daily value system best – the one which tells you what proportion of your required daily intake of each ingredient the product contains. I’m not sure it’s the easiest for people to use but at least you get the full story. I like to know all the ingredients in a product – not just how much fat, salt and sugar they contain.
ALICE: But it’s good supermarkets have been making an effort to provide reliable information for customers.
JACK: Yes. There just needs to be more consistency between labelling systems used by different supermarkets, in terms of portion sizes, etc.
ALICE: Mmm. The labels on the different brands of chicken flavour crisps were quite revealing too, weren’t they?
JACK: Yeah. I don’t understand how they can get away with calling them chicken flavour when they only contain artificial additives.
ALICE: I know. I’d at least have expected them to contain a small percentage of real chicken.
JACK: Absolutely.
ALICE: I think having nutritional food labeling has been a good idea, don’t you? I think it will change people’s behaviour and stop mothers, in particular, buying the wrong things.
JACK: But didn’t that study kind of prove the opposite? People didn’t necessarily stop buying unhealthy products.
ALICE: They only said that might be the case. Those findings weren’t that conclusive and it was quite a small-scale study. I think more research has to be done.
JACK: Yes, I think you’re probably right.
——————
JACK: What do you think of the traffic-light system?
ALICE: I think supermarkets like the idea of having a colour-coded system – red, orange or green – for levels of fat, sugar and salt in a product.
JACK: Buy it’s not been adopted universally. And not on all products. Why do you suppose that is?
ALICE: Pressure from the food manufacturers. Hardly surprising that some of them are opposed to flagging up how unhealthy their products are.
JACK: I’d have thought it would have been compulsory. It seems ridiculous it isn’t.
ALICE: I know. And what I couldn’t get over is the fact that it was brought in without enough consultation – a lot of experts had deep reservations about it.
JACK: That is a bit weird. I suppose there’s an argument for doing the research now when consumers are familiar with this system.
ALICE: Yeah, maybe.
JACK: The participants in the survey were quite positive about the traffic-light system.
ALICE: Mmm. But I don’t think they targeted the right people. They should have focused on people with low literacy levels because these labels are designed to be accessible to them.
JACK: Yeah. But it’s good to get feedback from all socio-economic groups. And there wasn’t much variation in their responses.
ALICE: No. But if they hadn’t interviewed participants face-to-face, they could have used a much bigger sample size. I wonder why they chose that method?
JACK: Dunno. How were they selected? Did they volunteer or were they approached?
ALICE: I think they volunteered. The thing that wasn’t stated was how often they bought packaged food – all we know is how frequently they used the supermarket.', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(130421, 13043, 'single_choice', 'What was Jack&rsquo;s attitude to nutritional food labels before this project?', '["A", "B", "C"]'::jsonb, 'A', 1, 21),
(130422, 13043, 'single_choice', 'Alice says that before doing this project,', '["A", "B", "C"]'::jsonb, 'A', 1, 22),
(130423, 13043, 'single_choice', 'When discussing supermarket brands of pizza, Jack agrees with Alice that', '["A", "B", "C"]'::jsonb, 'C', 1, 23),
(130424, 13043, 'single_choice', 'Jack prefers the daily value system to other labelling systems because it is', '["A", "B", "C"]'::jsonb, 'C', 1, 24),
(130425, 13043, 'single_choice', 'What surprised both students about one flavour of crisps?', '["A", "B", "C"]'::jsonb, 'B', 1, 25),
(130426, 13043, 'single_choice', 'What do the students think about research into the impact of nutritional food labelling?', '["A", "B", "C"]'::jsonb, 'A', 1, 26),
(130427, 13043, 'multiple_choice', 'Question 27', '["A", "B", "C", "D", "E"]'::jsonb, 'B / C', 1, 27),
(130428, 13043, 'multiple_choice', 'Which&nbsp; TWO &nbsp;things surprised the students about the traffic-light system for nutritional labels?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / C', 1, 28),
(130429, 13043, 'multiple_choice', 'Question 29', '["A", "B"]'::jsonb, 'D / E', 1, 29),
(130430, 13043, 'multiple_choice', 'Which&nbsp; TWO &nbsp;things are true about the participants in the study on the traffic-light system?', '["A", "B"]'::jsonb, 'D / E', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(13044, 1304, 'listening', 'Listening Part 4: The history of coffee', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p><em>Write <strong>ONE WORD ONLY</strong> for each answer.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>The history of coffee</strong></strong></p>
<p><strong>Coffee in the Arab world</strong></p>
<ul>
<li>These was small-scale trade in wild coffee from Ethiopia.</li>
<li>1522: Coffee was approved in the Ottoman court as a type of medicine.</li>
<li>1623: In Constantinople, the ruler ordered the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span> of every coffee house.</li>
</ul>
<p><strong>Coffee arrives in Europe (17th century)</strong></p>
<ul>
<li>Coffee shops were compared to <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>They played an important part in social and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span> changes.</li>
</ul>
<p><strong>Coffee and European colonization</strong></p>
<ul>
<li>European powers established coffee plantations in their colonies.</li>
<li>Types of coffee were often named according to the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> they came from.</li>
<li>In Brazil and the Caribbean, most cultivation depended on <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>In Java, coffee was used as a form of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>Coffee became almost as important as <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>The move towards the consumption of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> in Britain did not also take place in the USA.</li>
</ul>
<p><strong>Coffee in the 19th century</strong></p>
<ul>
<li>Prices dropped because of improvements in <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>Industrial workers found coffee helped them to work at <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12488-cambridge-ielts-13-academic-listening-4-audio-4.mp3', 'In my presentation, I’m going to talk about coffee, and its importance both in economic and social terms. We think it was first drunk in the Arab world, but there’s hardly any documentary evidence of it before the 1500s, although of course that doesn’t mean that people didn’t know about it before then.
However, there is evidence that coffee was originally gathered from bushes growing wild in Ethiopia, in the northeast of Africa. In the early sixteenth century, it was being bought by traders, and gradually its use as a drink spread throughout the Middle East. It’s also known that in 1522, in the Turkish city of Constantinople, which was the centre of the Ottoman Empire, the court physician approved its use as a medicine.
By the mid-1500s, coffee bushes were being cultivated in the Yemen and for the next hundred years this region produced most of the coffee drunk in Africa and the Arab world. What’s particularly interesting about coffee is its effect on social life. It was rarely drunk at home, but instead people went to coffee houses to drink it. These people, usually men, would meet to drink coffee and chat about issues of the day. But at the time, this chance to share ideas and opinions was seen as something that was potentially dangerous, and in 1623 the ruler of Constantinople demanded the destruction of all the coffee houses in the city, although after his death many new ones opened, and coffee consumption continued. In the seventeenth century, coffee drinking spread to Europe, and here too coffee shops became places where ordinary people, nearly always men, could meet to exchange ideas. Because of this, some people said that these places performed a similar function to universities. The opportunity they provided for people to meet together outside their own homes and to discuss the topics of the day had an enormous impact on social life, and many social movements and political developments had their origins in coffee house discussions.
——————
In the late 1600s, the Yemeni monopoly on coffee production broke down and coffee production started to spread around the world, helped by European colonization. Europeans set up coffee plantations in Indonesia and the Caribbean and production of coffee in the colonies skyrocketed. Different types of coffee were produced in different areas, and it’s interesting that the names given to these different types, like Mocha or Java coffee, were often taken from the port they were shipped to Europe from. But if you look at the labour system in the different colonies, there were some significant differences.
In Brazil and the various Caribbean colonies, coffee was grown in huge plantations and the workers there were almost all slaves. But this wasn’t the same in all colonies; for example in Java, which had been colonized by the Dutch, the peasants grew coffee and passed a proportion of this on to the Dutch, so it was used as a means of taxation. But whatever system was used, under the European powers of the eighteenth century, coffee production was very closely linked to colonisation. Coffee was grown in ever-increasing quantities to satisfy the growing demand from Europe, and it became nearly as important as sugar production, which was grown under very similar conditions. However, coffee prices were not yet low enough for people to drink it regularly at home, so most coffee consumption still took place in public coffee houses and it still remained something of a luxury item. In Britain, however, a new drink was introduced from China, and started to become popular, gradually taking over from coffee, although at first it was so expensive that only the upper classes could afford it. This was tea, and by the late 1700s it was being widely drunk. However, when the USA gained independence from Britain in 1766, they identified this drink with Britain, and coffee remained the preferred drink in the USA, as it still is today.
So, by the early nineteenth century, coffee was already being widely produced and consumed. But during this century, production boomed and coffee prices started to fall. This was partly because new types of transportation had been developed which were cheaper and more efficient. So now, working people could afford to buy coffee – it wasn’t just a drink for the middle classes. And this was at a time when large parts of Europe were starting to work in industries. And sometimes this meant their work didn’t stop when it got dark; they might have to continue throughout the night. So, the use of coffee as a stimulant became important – it wasn’t just a drink people drank in the morning, for breakfast.
There were also changes in cultivation …', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(130431, 13044, 'text_input', '1623: In Constantinople, the ruler ordered the  <strong', '[]'::jsonb, 'destruction', 1, 31),
(130432, 13044, 'text_input', 'Coffee arrives in Europe (17th century)  
 
 Coffee shops were compared to  <strong', '[]'::jsonb, 'universities / university', 1, 32),
(130433, 13044, 'text_input', 'They played an important part in social and  <strong', '[]'::jsonb, 'political', 1, 33),
(130434, 13044, 'text_input', 'Types of coffee were often named according to the  <strong', '[]'::jsonb, 'port / ports', 1, 34),
(130435, 13044, 'text_input', 'In Brazil and the Caribbean, most cultivation depended on  <strong', '[]'::jsonb, 'slaves / slavery', 1, 35),
(130436, 13044, 'text_input', 'In Java, coffee was used as a form of  <strong', '[]'::jsonb, 'taxation', 1, 36),
(130437, 13044, 'text_input', 'Coffee became almost as important as  <strong', '[]'::jsonb, 'sugar', 1, 37),
(130438, 13044, 'text_input', 'The move towards the consumption of  <strong', '[]'::jsonb, 'tea', 1, 38),
(130439, 13044, 'text_input', 'Coffee in the 19th century  
 
 Prices dropped because of improvements in  <strong', '[]'::jsonb, 'transportation', 1, 39),
(130440, 13044, 'text_input', 'Industrial workers found coffee helped them to work at  <strong', '[]'::jsonb, 'night / nite', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
