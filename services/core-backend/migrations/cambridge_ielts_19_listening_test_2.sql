-- Cambridge IELTS 19 Academic Listening Test 2
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1902, 'Cambridge IELTS 19 Academic Listening Test 2', 'Rasmiy Cambridge IELTS 19 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(19021, 1902, 'listening', 'Listening Part 1', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-6                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the form below.</p>
<p>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</p>
<p dir="ltr" style="text-align: left"><strong>Guitar Group</strong></p>
<p dir="ltr">Coordinator: Gary <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p dir="ltr">Level: <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p dir="ltr">Place: the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p dir="ltr"><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span> Street</p>
<p dir="ltr">First floor, Room T347</p>
<p dir="ltr">Time: Thursday morning at <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p dir="ltr">Recommended website: ‘The perfect <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span>’</p>
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
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 7-10                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Complete the table below.</p>
<p>Write <strong>ONE WORD ONLY</strong> for each answer.</p>
<p><strong>A typical 45-minute guitar lesson</strong></p>
<table>
<colgroup>
<col />
<col />
<col /></colgroup>
<tbody>
<tr>
<td>
<p dir="ltr" style="text-align: center"><strong>Time</strong></p>
</td>
<td style="text-align: center">
<p dir="ltr"><strong>Activity</strong></p>
</td>
<td>
<p dir="ltr" style="text-align: center"><strong>Notes</strong></p>
</td>
</tr>
<tr>
<td>
<p dir="ltr">5 minutes</p>
</td>
<td>
<p dir="ltr">tuning guitars</p>
</td>
<td>
<p dir="ltr">using an app or by <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span></p>
</td>
</tr>
<tr>
<td>
<p dir="ltr">10 minutes</p>
</td>
<td>
<p dir="ltr">strumming chords using our thumbs</p>
</td>
<td>
<p dir="ltr">keeping time while the teacher is <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span></p>
</td>
</tr>
<tr>
<td>
<p dir="ltr">15 minutes</p>
</td>
<td>
<p dir="ltr">playing songs</p>
</td>
<td>
<p dir="ltr">often listening to a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span> of a song</p>
</td>
</tr>
<tr>
<td>
<p dir="ltr">10 minutes</p>
</td>
<td>
<p dir="ltr">playing single notes and simple tunes</p>
</td>
<td>
<p dir="ltr">playing together, then <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span></p>
</td>
</tr>
<tr>
<td>
<p dir="ltr">5 minutes</p>
</td>
<td>
<p dir="ltr">noting things to practise at home</p>
</td>
<td></td>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/158820-cambridge-ielts-19-academic-listening-2-audio-1.mp3', 'WOMAN: Hi Coleman, how are you?
COLEMAN: Good, thanks.
WOMAN: I wanted to have a chat with you because our friend Josh told me that you’ve joined a guitar group and it sounds interesting. I’d really like to learn myself.
COLEMAN: Why don’t you come along? I’m sure there’s room for another person.
WOMAN: Really? So – who runs the classes?
COLEMAN: He’s called a ‘coordinator’ – his name’s Gary Mathieson.
WOMAN: Let me note that down. Gary. . . . How do you spell his surname?
COLEMAN: It’s M-A-T-H-I-E-S-O-N.
WOMAN: Right, thanks.
COLEMAN: He’s retired, actually, but he’s a really nice guy and he used to play in a lot of bands.
WOMAN: Thanks. So how long have you been going?
COLEMAN: About a month now.
WOMAN: And could you play anything before you started?
COLEMAN: I knew a few chords, but that’s all.
WOMAN: I’m sure everyone will be better than me.
COLEMAN: That’s what I thought, too. When I first spoke to Gary on the phone, he said it was a class for beginners, but I was still worried that everyone would be better than me, but we were all equally hopeless!
WOMAN: Oh, that’s reassuring. So where do you meet?
COLEMAN: Well, when I joined the group, they were meeting in Gary’s home, but as the group got bigger, he decided to book a room at the college in town. I prefer going there.
WOMAN: I know that place. I used to go to tap dancing classes there when I was at secondary school. I haven’t been since, though and I can’t remember what road it’s in… is it Lock Street?
COLEMAN: It’s just beyond there at the bottom of New Street near the city roundabout.
WOMAN: Yes, of course.
COLEMAN: The guitar club is on the first floor in Room T347.
WOMAN: Right. And when do you meet? Is it at the weekend?
COLEMAN: We meet on Thursdays. It used to be 10.30 and that suited me well, but now we meet at 11. The class that’s in there before us asked if they could have the room for another 30 minutes.
WOMAN: Oh, I see. Well, I’d love to come, but I don’t have a guitar.
COLEMAN: Well, you can always buy a second-hand one. There’s a website called ‘The perfect instrument’ that sells all kinds of guitars, violins and so on. I’m sure you’ll find something there.
-----
WOMAN: So what’s a typical lesson like with Gary?
COLEMAN: Well, he always starts by getting us to tune our guitars. That takes about five minutes.
WOMAN: Uhuh.
COLEMAN: Some people have an app they use, but others do it by ear. Gary goes round and helps them. And while he’s doing that, he tells us what he’s going to do during the lesson.
WOMAN: Right.
COLEMAN: First, we usually spend about ten minutes doing some strumming.
WOMAN: So is that using . . . what are they called . . . plectrums?
COLEMAN: No – we just use our thumbs.
WOMAN: Much easier.
COLEMAN: Gary reminds us where to put our fingers for each chord and then we play them together. Sometimes we all just start laughing because we’re so bad at keeping time, so Gary starts clapping to help us.
WOMAN: Do you learn to play any songs?
COLEMAN: Yes – we do at least one song with words and chords. I mean that’s harder than you think.
WOMAN: Oh, I’m sure it is!
COLEMAN: That part of the lesson takes about 15 minutes. He often brings a recording of the song and plays it to us first. Then he hands out the song and if there’s a new chord in it, we practise that before we play it together – but really slowly.
WOMAN: Do you do any finger picking?
COLEMAN: That’s the last ten minutes of the lesson, when we pick out the individual notes from a tune he’s made up. It’s always quite simple.
WOMAN: That must be hard, though.
COLEMAN: It is, but people like it because they can really concentrate and if we’re all playing well, it sounds quite impressive. The only trouble is that he sometimes gets us to play one at a time – you know, alone.
WOMAN: That’s scary.
COLEMAN: It is, but I’ve got used to it now. At the end he spends about five minutes telling us what to practise for the following week.
WOMAN: Well, thanks Coleman. I’ll go and have a look at that website, I think.', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(190201, 19021, 'text_input', 'Guitar Group  
 Coordinator: Gary  <strong', '[]'::jsonb, 'MATHIESON', 1, 1),
(190202, 19021, 'text_input', 'tening-question-item"> 1     
 Level:  <strong', '[]'::jsonb, 'beginners', 1, 2),
(190203, 19021, 'text_input', 'ng-question-item"> 2     
 Place: the  <strong', '[]'::jsonb, 'college', 1, 3),
(190204, 19021, 'text_input', 'lts-listening-question-item"> 3     
  <strong', '[]'::jsonb, 'New', 1, 4),
(190205, 19021, 'text_input', '4" class="ielts-listening-question-number">4     Street 
 First floor, Room T347 
 Time: Thursday morning at  <strong', '[]'::jsonb, '11 / eleven', 1, 5),
(190206, 19021, 'text_input', 'ng id="ielts-listening-question-number-5" class="ielts-listening-question-number">5     
 Recommended website: ‘The perfect  <strong', '[]'::jsonb, 'instrument', 1, 6),
(190207, 19021, 'text_input', 'style="text-align: center"> Time  
 
 
  Activity  
 
 
  Notes  
 
 
 
 
 5 minutes 
 
 
 tuning guitars 
 
 
 using an app or by  <strong', '[]'::jsonb, 'ear', 1, 7),
(190208, 19021, 'text_input', '_listening_answer_154562_1" id="ielts_listening_answer_154562_1" aria-label="Question 7" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  
 
 
 
 
 10 minutes 
 
 
 strumming chords using our thumbs 
 
 
 keeping time while the teacher is  <strong', '[]'::jsonb, 'Clapping', 1, 8),
(190209, 19021, 'text_input', 'g>    
 
 
 
 
 15 minutes 
 
 
 playing songs 
 
 
 often listening to a  <strong', '[]'::jsonb, 'recording', 1, 9),
(190210, 19021, 'text_input', 'stening_answer_154562_3" id="ielts_listening_answer_154562_3" aria-label="Question 9" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  of a song 
 
 
 
 
 10 minutes 
 
 
 playing single notes and simple tunes 
 
 
 playing together, then  <strong', '[]'::jsonb, 'alone', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(19022, 1902, 'listening', 'Listening Part 2', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-16                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, A, B or C.</p>
<p><strong>Working as a lifeboat volunteer</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="11"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong><span class="ielts-q-title"><span>What made David leave London and move to Northsea?<label for="q6c"></label></span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="A"><span class="ielts-radio-text"><strong>A</strong> He was eager to develop a hobby.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="B"><span class="ielts-radio-text"><strong>B</strong> He wanted to work shorter hours.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="C"><span class="ielts-radio-text"><strong>C</strong> He found his job in website design unsatisfying</span></label></div></div><div class="ielts-standalone-q" data-qnum="12"><div class="ielts-q-header"><strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>The Lifeboat Institution in Northsea was built with money provided by</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="A"><span class="ielts-radio-text"><strong>A</strong> a local organisation.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="B"><span class="ielts-radio-text"><strong>B</strong> a local resident.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="C"><span class="ielts-radio-text"><strong>C</strong> the local council.</span></label></div></div><div class="ielts-standalone-q" data-qnum="13"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong><span class="ielts-q-title"><span>In his health assessment, the doctor was concerned about the fact that David</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="A"><span class="ielts-radio-text"><strong>A</strong> might be colour blind.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="B"><span class="ielts-radio-text"><strong>B</strong> was rather short-sighted.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="C"><span class="ielts-radio-text"><strong>C</strong> had undergone eye surgery.</span></label></div></div><div class="ielts-standalone-q" data-qnum="14"><div class="ielts-q-header"><strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>After arriving at the lifeboat station, they aim to launch the boat within</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="A"><span class="ielts-radio-text"><strong>A</strong> five minutes.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="B"><span class="ielts-radio-text"><strong>B</strong> six to eight minutes.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="C"><span class="ielts-radio-text"><strong>C</strong> eight and a half minutes.</span></label></div></div><div class="ielts-standalone-q" data-qnum="15"><div class="ielts-q-header"><strong class="ielts-q-badge">15</strong><span class="ielts-q-title"><span>As a ‘helmsman’, David has the responsibility of deciding</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="A"><span class="ielts-radio-text"><strong>A</strong> who will be the members of his crew.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="B"><span class="ielts-radio-text"><strong>B</strong> what equipment it will be necessary to take.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="C"><span class="ielts-radio-text"><strong>C</strong> if the lifeboat should be launched.</span></label></div></div><div class="ielts-standalone-q" data-qnum="16"><div class="ielts-q-header"><strong class="ielts-q-badge">16</strong><span class="ielts-q-title"><span>As well as going out on the lifeboat, David</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="A"><span class="ielts-radio-text"><strong>A</strong> gives talks on safety at sea.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="B"><span class="ielts-radio-text"><strong>B</strong> helps with fundraising.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="C"><span class="ielts-radio-text"><strong>C</strong> recruits new volunteers.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 17-18                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A–E</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="17,18"><div class="ielts-q-header"><strong class="ielts-q-badge">17</strong> <strong class="ielts-q-badge">18</strong><span class="ielts-q-title"><span>Which TWO things does David say about the lifeboat volunteer training?<label for="q1d"></label></span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> The residential course developed his leadership skills.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> The training in use of ropes and knots was quite brief.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> The training exercises have built up his mental strength.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> The casualty care activities were particularly challenging for him.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> The wave tank activities provided practice in survival techniques.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 19-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A–E</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="19,20"><div class="ielts-q-header"><strong class="ielts-q-badge">19</strong> <strong class="ielts-q-badge">20</strong><span class="ielts-q-title"><span>Which TWO things does David find most motivating about the work he does?<label for="q2d"></label></span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> working as part of a team</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> experiences when working in winter</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> being thanked by those he has helped</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> the fact that it keeps him fit</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> the chance to develop new equipment</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/158821-cambridge-ielts-19-academic-listening-2-audio-2.mp3', 'I never really planned to be a lifeboat volunteer when I came to live in Northsea. I’d been working in London as a website designer, but although that was interesting, I didn’t like city life. I’d been really keen on boats as a teenager, and I thought if I went to live by the sea, I might be able to pursue that interest a bit more in my free time. Then I found that the Lifeboat Institution was looking for volunteers, so I decided to apply.
The Lifeboat Institution building here in Northsea’s hard to miss; it’s one of the largest in the country. It was built 15 years ago with funds provided by a generous member of the public, who’d lived here all her life. As the Lifeboat Institution is a charity that relies on that kind of donation, rather than funding provided by the government, that kind of help is much needed.
When I applied, I had to have a health assessment. The doctors were particularly interested in my vision. I used to be short-sighted, so I’d had to wear glasses, but I’d had laser eye surgery two years earlier so that was OK. They gave me tests for colour blindness and they thought I might have a problem there, but it turned out I was OK.
When the coastguard gets an alert, all the volunteers are contacted and rush to the lifeboat station. Our target’s to get there in five minutes, then we try to get the boat off the dock and out to sea in another six to eight minutes. Our team’s proud that we usually achieve that – the average time across the country’s eight and a half minutes.
I’ve recently qualified as what’s called a ’helmsman’, which means I have the ultimate responsibility for the lifeboat. I have to check that the equipment we use is in working order – the crew have special life jackets that can support up to four people in the water. And it’s ultimately my decision whether it’s safe to launch the boat. But it’s very rare not to launch it, even in the worst weather.
As well as going out on the lifeboat, my work involves other things too. A lot of people underestimate how windy conditions can change at sea, so I speak to youth groups and sailing clubs in the area about the sorts of problems that sailors and swimmers can have if the weather suddenly gets bad. We also have a lot of volunteers who organise activities to raise money for us, and we couldn’t manage without them.
The training we get is a continuous process, focusing on technical competence and safe handling techniques, and it’s given me the confidence to deal with extreme situations without panicking. We had to do a fire and sea survival test first, and that’s a big help with the casualty care activities we do. We’ve done a lot on how to deal with ropes and tie knots – that’s an essential skill. After a year, I did a one-week residential course, led by specialists. There’s a wave-tank where we could experience an overturned lifeboat scenario-so we could get experience at what to do if the boat turned over in a storm at night, for example.
Since I started, I’ve had to deal with a range of emergency situations.
But the work’s hugely motivating. It’s not just about saving lives-I’ve learned a lot about the technology involved. My background in IT’s been useful here, and I can use my expertise to help other volunteers. They’re a great group-we’re like a family really, which helps when you’re dragging yourself out of bed on a cold stormy night. But actually, it’s the colder months that can be the most rewarding time. That’s when the incidents tend to be more serious, and you realise that you can make a huge difference to the outcome.
So if any of you listeners are interested…', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(190211, 19022, 'single_choice', 'What made David leave London and move to Northsea?', '["A", "B", "C"]'::jsonb, 'A', 1, 11),
(190212, 19022, 'single_choice', 'The Lifeboat Institution in Northsea was built with money provided by', '["A", "B", "C"]'::jsonb, 'B', 1, 12),
(190213, 19022, 'single_choice', 'In his health assessment, the doctor was concerned about the fact that David', '["A", "B", "C"]'::jsonb, 'A', 1, 13),
(190214, 19022, 'single_choice', 'After arriving at the lifeboat station, they aim to launch the boat within', '["A", "B", "C"]'::jsonb, 'B', 1, 14),
(190215, 19022, 'single_choice', 'As a &lsquo;helmsman&rsquo;, David has the responsibility of deciding', '["A", "B", "C"]'::jsonb, 'C', 1, 15),
(190216, 19022, 'single_choice', 'As well as going out on the lifeboat, David', '["A", "B", "C"]'::jsonb, 'A', 1, 16),
(190217, 19022, 'multiple_choice', 'Question 17', '["A", "B", "C", "D", "E"]'::jsonb, 'C / E', 1, 17),
(190218, 19022, 'multiple_choice', 'Which TWO things does David say about the lifeboat volunteer training?', '["A", "B", "C", "D", "E"]'::jsonb, 'C / E', 1, 18),
(190219, 19022, 'multiple_choice', 'Question 19', '["A", "B"]'::jsonb, 'A / B', 1, 19),
(190220, 19022, 'multiple_choice', 'Which TWO things does David find most motivating about the work he does?', '["A", "B"]'::jsonb, 'A / B', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(19023, 1902, 'listening', 'Listening Part 3', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-24                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="21"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong><span class="ielts-q-title"><span>At first, Don thought the topic of recycling footwear might be too</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="A"><span class="ielts-radio-text"><strong>A</strong> limited in scope.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="B"><span class="ielts-radio-text"><strong>B</strong> hard to research.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="C"><span class="ielts-radio-text"><strong>C</strong> boring for listeners.</span></label></div></div><div class="ielts-standalone-q" data-qnum="22"><div class="ielts-q-header"><strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>When discussing trainers, Bella and Don disagree about</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="A"><span class="ielts-radio-text"><strong>A</strong> how popular they are among young people.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="B"><span class="ielts-radio-text"><strong>B</strong> how suitable they are for school.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="C"><span class="ielts-radio-text"><strong>C</strong> how quickly they wear out.</span></label></div></div><div class="ielts-standalone-q" data-qnum="23"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong><span class="ielts-q-title"><span>Bella says that she sometimes recycles shoes because</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="A"><span class="ielts-radio-text"><strong>A</strong> they no longer fit.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="B"><span class="ielts-radio-text"><strong>B</strong> she no longer likes them.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="C"><span class="ielts-radio-text"><strong>C</strong> they are no longer in fashion.</span></label></div></div><div class="ielts-standalone-q" data-qnum="24"><div class="ielts-q-header"><strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>What did the article say that confused Don?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="A"><span class="ielts-radio-text"><strong>A</strong> Public consumption of footwear has risen.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="B"><span class="ielts-radio-text"><strong>B</strong> Less footwear is recycled now than in the past.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="C"><span class="ielts-radio-text"><strong>C</strong> People dispose of more footwear than they used to.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 25-28                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What reasons did the recycling manager give for rejecting footwear, according tothe students?</p>
<p>Choose FOUR answers from the box and write the correct letter, A-F.</p>
<p><strong>Reason</strong></p>
<p><strong>Footwear</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>the high-heeled shoes</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">25</strong><select data-qnum="25" name="question_25" class="ielts-inline-select"><option value="">[ 25 ] Tanlang...</option><option value="A. one shoe was missing">A. one shoe was missing</option><option value="B. the colour of one shoe had faded">B. the colour of one shoe had faded</option><option value="C. one shoe had a hole in it">C. one shoe had a hole in it</option><option value="D. the shoes were brand new">D. the shoes were brand new</option><option value="E. he shoes were too dirty">E. he shoes were too dirty</option><option value="F. the stitching on the shoes was broken">F. the stitching on the shoes was broken</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <div class="ielts-listening-question-item"> • <span>the ankle boots</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">26</strong><select data-qnum="26" name="question_26" class="ielts-inline-select"><option value="">[ 26 ] Tanlang...</option><option value="A. one shoe was missing">A. one shoe was missing</option><option value="B. the colour of one shoe had faded">B. the colour of one shoe had faded</option><option value="C. one shoe had a hole in it">C. one shoe had a hole in it</option><option value="D. the shoes were brand new">D. the shoes were brand new</option><option value="E. he shoes were too dirty">E. he shoes were too dirty</option><option value="F. the stitching on the shoes was broken">F. the stitching on the shoes was broken</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <div class="ielts-listening-question-item"> • <span>the baby shoes</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. one shoe was missing">A. one shoe was missing</option><option value="B. the colour of one shoe had faded">B. the colour of one shoe had faded</option><option value="C. one shoe had a hole in it">C. one shoe had a hole in it</option><option value="D. the shoes were brand new">D. the shoes were brand new</option><option value="E. he shoes were too dirty">E. he shoes were too dirty</option><option value="F. the stitching on the shoes was broken">F. the stitching on the shoes was broken</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <div class="ielts-listening-question-item"> • <span>the trainers</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">28</strong><select data-qnum="28" name="question_28" class="ielts-inline-select"><option value="">[ 28 ] Tanlang...</option><option value="A. one shoe was missing">A. one shoe was missing</option><option value="B. the colour of one shoe had faded">B. the colour of one shoe had faded</option><option value="C. one shoe had a hole in it">C. one shoe had a hole in it</option><option value="D. the shoes were brand new">D. the shoes were brand new</option><option value="E. he shoes were too dirty">E. he shoes were too dirty</option><option value="F. the stitching on the shoes was broken">F. the stitching on the shoes was broken</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="154847">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. one shoe was missing">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">one shoe was missing</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. the colour of one shoe had faded">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">the colour of one shoe had faded</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. one shoe had a hole in it">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">one shoe had a hole in it</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. the shoes were brand new">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">the shoes were brand new</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. he shoes were too dirty">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">he shoes were too dirty</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. the stitching on the shoes was broken">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">the stitching on the shoes was broken</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 29-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, A, B or C.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="29"><div class="ielts-q-header"><strong class="ielts-q-badge">29</strong><span class="ielts-q-title"><span>Why did the project to make ‘new’ shoes out of old shoes fail?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="29" name="question_29" value="A"><span class="ielts-radio-text"><strong>A</strong> People believed the ''new'' pairs of shoes were unhygienic.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="29" name="question_29" value="B"><span class="ielts-radio-text"><strong>B</strong> There were not enough good parts to use in the old shoes.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="29" name="question_29" value="C"><span class="ielts-radio-text"><strong>C</strong> The shoes in the ‘new’ pairs were not completely alike.</span></label></div></div><div class="ielts-standalone-q" data-qnum="30"><div class="ielts-q-header"><strong class="ielts-q-badge">30</strong><span class="ielts-q-title"><span>Bella and Don agree that they can present their topic</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="30" name="question_30" value="A"><span class="ielts-radio-text"><strong>A</strong> from a new angle.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="30" name="question_30" value="B"><span class="ielts-radio-text"><strong>B</strong> with relevant images.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="30" name="question_30" value="C"><span class="ielts-radio-text"><strong>C</strong> in a straightforward way.</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/158822-cambridge-ielts-19-academic-listening-2-audio-3.mp3', 'BELLA: Hi Don – did you get the copy of the article on recycling footwear that I emailed you?
DON: Yeah – it’s here … I’ve had a look at it.
BELLA: So do you think it’s a good topic for our presentation?
DON: Well, before I started reading it, I thought recycling footwear, well, although it’s quite interesting, perhaps there isn’t enough to say about it, cos we put shoes in recycling bins, they go to charity shops and that’s about it.
BELLA: … but there’s much more to it than that.
DON: I realise that now and I’m keen to research the topic more.
BELLA: That’s great.
DON: One of the things I didn’t realise until I read the article was just how many pairs of trainers get recycled!
BELLA: Well, a lot of young people wear them all the time now. They’ve become more popular than ordinary shoes.
DON: I know. I guess they are very hard-wearing, but don’t they look a bit casual for school uniform? I don’t think they’re right for that.
BELLA: Actually, I think some of them look quite smart on pupils … better than a scruffy old pair of shoes.
DON: So do you keep shoes a long time?
BELLA: Yes. Though I do tend to wear my old pairs for doing dirty jobs like cleaning my bike.
BELLA: I must admit, I’ve recycled some perfectly good shoes, that haven’t gone out of fashion and still fit, just because they don’t look great on me any more. That’s awful isn’t it?
DON: I think it’s common because there’s so much choice. The article did say that recent sales of footwear have increased enormously.
BELLA: That didn’t surprise me.
DON: No. But then it said that the amount of recycled footwear has fallen: it’s 6 percent now compared to a previous level of 11 percent. That doesn’t seem to make sense.
BELLA: That’s because not everything goes through the recycling process. Some footwear just isn’t good enough to re-sell, for one reason or another, and gets rejected.
…………………………………………………………………………………………………
BELLA: So let’s find some examples in the article of footwear that was rejected for recycling.
DON: OK. I think there are some in the interview with the recycling manager. Yeah – here it is.
BELLA: Mmm. Let’s start with the ladies’ high-heeled shoes. What did he say about those?
DON: He said they were probably expensive – the material was suede and they were beige in colour – it looked like someone had only worn them once, but in a very wet field so the heels were too stained with mud and grass to re-sell them.
BELLA: OK … and the leather ankle boots. What was wrong with them?
DON: Apparently, the heels were worn – but that wasn’t the problem. One of the shoes was a much lighter shade than the other one – it had obviously been left in the sun. I suppose even second-hand shoes should look the same!
BELLA: Sure. Then there were the red baby shoes.
DON: Oh yes – we’re told to tie shoes together when we put them in a recycling bin, but people often don’t bother.
BELLA: You’d think it would have been easy to find the other, but it wasn’t. That was a shame because they were obviously new.
DON: The trainers were interesting. He said they looked like they’d been worn by a marathon runner.
BELLA: Yeah – weren’t they split?
DON: Not exactly. One of the soles was so worn under the foot that you could put your finger through it.
BELLA: Well, we could certainly use some of those examples in our presentation to explain why 90 percent of shoes that people take to recycling centres or bins get thrown into landfill.
DON: Mmm. What did you think about the project his team set up to avoid this by making new shoes out of the good parts of old shoes?
BELLA: It sounded like a good idea. They get so many shoes, they should be able to match parts. I wasn’t surprised that it failed, though. I mean who wants to buy second-hand shoes really? Think of all the germs you could catch!
DON: Well, people didn’t refuse them for that reason, did they? It was because the pairs of shoes weren’t identical.
BELLA: They still managed to ship them overseas, though.
DON: That’s another area we need to discuss.
BELLA: You know I used to consider this topic just from my own perspective, by thinking about my own recycling behaviour without looking at the bigger picture. So much happens once shoes leave the recycling area.
DON: It’s not as simple as you first think, and we can show that by taking a very different approach to it.
BELLA: Absolutely. So let’s discuss …', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(190221, 19023, 'single_choice', 'At first, Don thought the topic of recycling footwear might be too', '["A", "B", "C"]'::jsonb, 'A', 1, 21),
(190222, 19023, 'single_choice', 'When discussing trainers, Bella and Don disagree about', '["A", "B", "C"]'::jsonb, 'B', 1, 22),
(190223, 19023, 'single_choice', 'Bella says that she sometimes recycles shoes because', '["A", "B", "C"]'::jsonb, 'B', 1, 23),
(190224, 19023, 'single_choice', 'What did the article say that confused Don?', '["A", "B", "C"]'::jsonb, 'B', 1, 24),
(190225, 19023, 'single_choice', 'Question 25', '["A", "B", "C"]'::jsonb, 'E', 1, 25),
(190226, 19023, 'single_choice', 'Question 26', '["A", "B", "C"]'::jsonb, 'B', 1, 26),
(190227, 19023, 'single_choice', 'Question 27', '["A", "B", "C"]'::jsonb, 'A', 1, 27),
(190228, 19023, 'single_choice', 'Question 28', '["A", "B", "C", "D", "E", "F"]'::jsonb, 'C', 1, 28),
(190229, 19023, 'single_choice', 'Why did the project to make &lsquo;new&rsquo; shoes out of old shoes fail?', '["A", "B", "C"]'::jsonb, 'C', 1, 29),
(190230, 19023, 'single_choice', 'Bella and Don agree that they can present their topic', '["A", "B"]'::jsonb, 'A', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(19024, 1902, 'listening', 'Listening Part 4', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write ONE WORD ONLY for each answer.</p>
<p dir="ltr"><strong>Tardigrades</strong></p>
<p dir="ltr">- more than 1,000 species, 0.05–1.2 millimetres long</p>
<p dir="ltr">- also known as water ‘bears’ (due to how they <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span>) and ‘moss piglets’</p>
<p dir="ltr"><strong>Physical appearance</strong></p>
<p dir="ltr">- a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> round body and four pairs of legs</p>
<p dir="ltr">- claws or <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span> for gripping</p>
<p dir="ltr">- absence of respiratory organs</p>
<p dir="ltr">- body filled with a liquid that carries both <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> and blood</p>
<p dir="ltr">- mouth shaped like a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span> with teeth called stylets</p>
<p dir="ltr"><strong>Habitat</strong></p>
<p dir="ltr">- often found at the bottom of a lake or on plants</p>
<p dir="ltr">- very resilient and can exist in very low or high <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p dir="ltr"><strong>Cryptobiosis</strong></p>
<p dir="ltr">- In dry conditions, they roll into a ball called a ‘tun’.</p>
<p dir="ltr">- They stay alive with a much lower metabolism than usual.</p>
<p dir="ltr">- A type of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span> ensures their DNA is not damaged.</p>
<p dir="ltr">- Research is underway to find out how many days they can stay alive in <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p dir="ltr"><strong>Feeding</strong></p>
<p dir="ltr">- consume liquids, e.g., those found in moss or <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p dir="ltr">- may eat other tardigrades</p>
<p dir="ltr"><strong>Conservation status</strong></p>
<p dir="ltr">- They are not considered to be <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span>.</p>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/158823-cambridge-ielts-19-academic-listening-2-audio-4.mp3', 'For my project on invertebrates, I chose to study tardigrades. These are microscopic — or to be more precise — near-microscopic animals. There are well over a thousand known species of these tiny animals, which belong to the phylum Tardigrada. Most tardigrades range in length from 0.05 to 1 millimetre, though the largest species can grow to be 1.2 millimetres in length. They are also sometimes called ‘water bears’: ‘water’ because that’s where they thrive best, and ‘bear’ because of the way they move. ‘Moss piglet’ is another name for tardigrades because of the way they look when viewed from the front. They were first discovered in Germany in 1773 by Johann Goeze, who coined the name Tardigrada.
As I say, there are many different species of tardigrade — too many to describe here — but, generally speaking, the different species share similar physical traits. They have a body which is short, and also rounded- a bit like a barrel- and the body comprises four segments. Each segment has a pair of legs, at the end of which are between four and eight sharp claws. I should also say that some species don’t have any claws: what they have are discs, and these work by means of suction. They enable the tardigrade to cling to surfaces or to grip its prey. Within the body, there are no lungs, or any organs for breathing at all. Instead, oxygen and also blood are transported in a fluid that fills the cavity of the body.
As far as the tardigrade’s head is concerned, the best way I can describe this is that it looks rather strange — a bit squashed even — though many of the websites I looked at described its appearance as cute, which isn’t exactly very scientific. The tardigrade’s mouth is a kind of tube that can open outwards to reveal teeth-like structures known as ‘stylets’. These are sharp enough to pierce plant or animal cells.
So, where are tardigrades found? Well, they live in every part of the world, in a variety of habitats: most commonly, on the bed of a lake, or on many kinds of plants or in very wet environments. There’s been some interesting research which has found that tardigrades are capable of surviving radiation and very high pressure, and they’re also able to withstand temperatures as low as minus ~200 degrees centigrade, or highs of more than 148 degrees centigrade, which is incredibly hot.
It has been said that tardigrades could survive long after human beings have been wiped out, even in the event of an asteroid hitting the earth. If conditions become too extreme and tardigrades are at risk of drying out, they enter a state called cryptobiosis. They form a little ball, called a tun — that’s T-U-N — by retracting their head and legs, and their metabolism drops to less than one percent of normal levels. They can stay in this state for decades, and if re-introduced to water, when they will come back to life in a matter of a few hours. While in this state of cryptobiosis, tardigrades produce a protein that protects their DNA. In 2016, scientists revived two tardigrades that had been tuns for more than 30 years. There was a report that,in 1948, a 120-year-old tun was revived, but this experiment has never been repeated. There are currently several tests taking place in space, to determine how long tardigrades might be able to survive there. I believe the record so far is 10 day.
So, erm, moving on. In terms of their diet, tardigrades consume liquids in order to survive. Although they have teeth, they don’t use these for chewing. They suck the juices from moss, or extract fluid from seaweed, but some species prey on other tardigrades, from other species or within their own. I suppose this isn’t surprising, given that tardigrades are mainly comprised of liquid and are coated with a type of gel.
Finally, I’d like to mention the conservation status of tardigrades. It is estimated that they have been in existence for approximately half a billion years and, in that time, they have survived five mass extinctions. So, it will probably come as no surprise to you, that tardigrades have not been evaluated by the International Union for Conservation of Nature and are not on any endangered list. Some researchers have described them as thriving.
Does anyone have any questions they’d like to ask?', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(190231, 19024, 'text_input', '2 millimetres long 
 - also known as water ‘bears’ (due to how they  <strong', '[]'::jsonb, 'move', 1, 31),
(190232, 19024, 'text_input', 's="ielts-listening-question-number">31    ) and ‘moss piglets’ 
  Physical appearance  
 - a  <strong', '[]'::jsonb, 'short', 1, 32),
(190233, 19024, 'text_input', 'istening-question-number-32" class="ielts-listening-question-number">32     round body and four pairs of legs 
 - claws or  <strong', '[]'::jsonb, 'discs / disks', 1, 33),
(190234, 19024, 'text_input', 'mber">33     for gripping 
 - absence of respiratory organs 
 - body filled with a liquid that carries both  <strong', '[]'::jsonb, 'oxygen', 1, 34),
(190235, 19024, 'text_input', 'g id="ielts-listening-question-number-34" class="ielts-listening-question-number">34     and blood 
 - mouth shaped like a  <strong', '[]'::jsonb, 'tube', 1, 35),
(190236, 19024, 'text_input', '"ielts_listening_answer_154851_5" aria-label="Question 35" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  with teeth called stylets 
  Habitat  
 - often found at the bottom of a lake or on plants 
 - very resilient and can exist in very low or high  <strong', '[]'::jsonb, 'temperatures', 1, 36),
(190237, 19024, 'text_input', '- A type of  <strong', '[]'::jsonb, 'protein', 1, 37),
(190238, 19024, 'text_input', '- Research is underway to find out how many days they can stay alive in  <strong', '[]'::jsonb, 'space', 1, 38),
(190239, 19024, 'text_input', ', those found in moss or  <strong', '[]'::jsonb, 'seaweed', 1, 39),
(190240, 19024, 'text_input', 't type="text" name="ielts_listening_answer_154851_9" id="ielts_listening_answer_154851_9" aria-label="Question 39" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  
 - may eat other tardigrades 
  Conservation status  
 - They are not considered to be  <strong', '[]'::jsonb, 'endangered', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
