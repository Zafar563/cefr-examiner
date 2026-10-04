-- Cambridge IELTS 13 Academic Listening Test 3
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1303, 'Cambridge IELTS 13 Academic Listening Test 3', 'Rasmiy Cambridge IELTS 13 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(13031, 1303, 'listening', 'Listening Part 1: Moving to Banford City', '<div class="ielts-reading-container">
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
<p class="ielts-listening-transcript-subhead"><strong><strong>Moving to Banford City</strong></strong></p>
</td>
</tr>
<tr>
<td width="623"><em>Example</em></p>
<p>Linda recommends living in suburb of: …..<em>Dalton</em>…..</td>
</tr>
<tr>
<td width="623"><strong>Accommodation</strong></p>
<ul>
<li>Average rent: £<span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span> a month</li>
</ul>
<p><strong>Transport</strong></p>
<ul>
<li>Linda travels to work by <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>Limited <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span> in city centre</li>
<li>Trains to London every <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span> Minutes</li>
<li>Poor train service at <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Advantages of living in Banford</strong></p>
<ul>
<li>New <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span> opened recently</li>
<li><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span> has excellent reputation</li>
<li>Good <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span> on Bridge Street</li>
</ul>
<p><strong>Meet</strong> <strong>Linda</strong></p>
<ul>
<li>Meet Linda on <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span> after 5.30 pm</li>
<li>In the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span> opposite the station</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12450-cambridge-ielts-13-academic-listening-3-audio-1.mp3', 'LINDA: Hello, Linda speaking.
MATT: Oh hi, Linda. This is Matt Brooks. Alex White gave me your number. He said you’d be able to give me some advice about moving to Banford.
LINDA: Yes, Alex did mention you. How can I help?
MATT: Well, first of all – which area to live in?
LINDA: Well, I live in Dalton, which is a really nice suburb – not too expensive, and there’s a nice park.
MATT: Sounds good. Do you know how much it would be to rent a two bedroom flat there?
LINDA: Yeah, you should be able to get something reasonable for 850 pounds per month. That’s what people typically pay. You certainly wouldn’t want to pay more than 900 pounds. That doesn’t include bills or anything.
MATT: No. That sound alright. I’ll definitely have a look there. Are the transport links easy from where you live?
LINDA: Well, I’m very lucky. I work in the city centre so I don’t have to use public transport. I go by bike.
MATT: Oh, I wish I could do that. Is it safe to cycle around the city?
LINDA: Yes, it’s fine. And it keeps me fit. Anyway, driving to work in the city centre would be a nightmare because there’s hardly any parking. And the traffic during the rush hour can be bad.
MATT: I’d be working from home but I’d have to go to London one or two days a week.
LINDA: Oh, that’s perfect. Getting to London is no problem. There’s a fast train every 30 minutes which only takes 45 minutes.
MATT: That’s good.
LINDA: Yeah, the train service isn’t bad during the week. And they run quite late at night. It’s weekends that are a problem. They’re always doing engineering work and you have to take a bus to Hadham and pick up the train there, which is really slow. But other than that, Banford’s a great place to live. I’ve never been happier.
————————
LINDA: There are some nice restaurants in the city centre and a brand new cinema which has only been open a couple of months. There’s a good arts centre too.
MATT: Sounds like Banford’s got it all.
LINDA: Yes! We’re really lucky. There are lots of really good aspects to living here. The schools are good and the hospital here is one of the best in the country. Everyone I know who’s been there’s had a positive experience. Oh, I can give you the name of my dentist too in Bridge Street, if you’re interested. I’ve been going to him for years and I’ve never had any problems.
MATT: Oh, OK. Thanks!
LINDA: I’ll find his number and send it to you.
MATT: Thanks, that would be really helpful.
LINDA: Are you planning to visit Banford soon?
MATT: Yes. My wife and I are both coming next week. We want to make some appointments with estate agents.
LINDA: I could meet you if you like and show you around.
MATT: Are you sure? We’d really appreciate that.
LINDA: Either a Tuesday or Thursday is good for me, after 5.30.
MATT: Thursday’s preferable – Tuesday I need to get home before 6 pm.
LINDA: Okay great. Let me know which train your catching and I’ll meet you in the cafe outside. You can’t miss it. It’s opposite the station and next to the museum.
MATT: Brilliant. I’ll text you next week then. Thanks so much for all the advice.
LINDA: No problem. I’ll see you next week.', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(130301, 13031, 'text_input', 'Accommodation  
 
 Average rent: £ <strong', '[]'::jsonb, '850', 1, 1),
(130302, 13031, 'text_input', 'mber-1" class="ielts-listening-question-number">1     a month 
 
  Transport  
 
 Linda travels to work by  <strong', '[]'::jsonb, 'bike / bicycle', 1, 2),
(130303, 13031, 'text_input', 'ielts-listening-question-item"> 2     
 Limited  <strong', '[]'::jsonb, 'parking', 1, 3),
(130304, 13031, 'text_input', '> 3     in city centre 
 Trains to London every  <strong', '[]'::jsonb, '30 / thirty', 1, 4),
(130305, 13031, 'text_input', 'on-item"> 4     Minutes 
 Poor train service at  <strong', '[]'::jsonb, 'weekend / weekends', 1, 5),
(130306, 13031, 'text_input', 'tion-number-5" class="ielts-listening-question-number">5     
 
  Advantages of living in Banford  
 
 New  <strong', '[]'::jsonb, 'cinema', 1, 6),
(130307, 13031, 'text_input', 'stening-question-item"> 6     opened recently 
  <strong', '[]'::jsonb, 'hospital', 1, 7),
(130308, 13031, 'text_input', 'on-item"> 7     has excellent reputation 
 Good  <strong', '[]'::jsonb, 'dentist', 1, 8),
(130309, 13031, 'text_input', 'elts-listening-question-number">8     on Bridge Street 
 
  Meet   Linda  
 
 Meet Linda on  <strong', '[]'::jsonb, 'Thursday', 1, 9),
(130310, 13031, 'text_input', '30 pm 
 In the  <strong', '[]'::jsonb, 'café / cafe', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(13032, 1303, 'listening', 'Listening Part 2', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-16                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What advantage does the speaker mention for each of the following physical activities?</p>
<p><em>Choose <strong>SIX</strong> answers from the box and write the correct letter, <strong>A-G</strong>, next to Questions</em></p>
<p><strong>Advantages</strong></p>
<p><strong>Physical activities</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>using a gym</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">11</strong><select data-qnum="11" name="question_11" class="ielts-inline-select"><option value="">[ 11 ] Tanlang...</option><option value="A. not dependent on season">A. not dependent on season</option><option value="B. enjoyable">B. enjoyable</option><option value="C. low risk of injury">C. low risk of injury</option><option value="D. fitness level unimportant">D. fitness level unimportant</option><option value="E. sociable">E. sociable</option><option value="F. fast results">F. fast results</option><option value="G. motivating">G. motivating</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>running</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">12</strong><select data-qnum="12" name="question_12" class="ielts-inline-select"><option value="">[ 12 ] Tanlang...</option><option value="A. not dependent on season">A. not dependent on season</option><option value="B. enjoyable">B. enjoyable</option><option value="C. low risk of injury">C. low risk of injury</option><option value="D. fitness level unimportant">D. fitness level unimportant</option><option value="E. sociable">E. sociable</option><option value="F. fast results">F. fast results</option><option value="G. motivating">G. motivating</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>swimming</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">13</strong><select data-qnum="13" name="question_13" class="ielts-inline-select"><option value="">[ 13 ] Tanlang...</option><option value="A. not dependent on season">A. not dependent on season</option><option value="B. enjoyable">B. enjoyable</option><option value="C. low risk of injury">C. low risk of injury</option><option value="D. fitness level unimportant">D. fitness level unimportant</option><option value="E. sociable">E. sociable</option><option value="F. fast results">F. fast results</option><option value="G. motivating">G. motivating</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>cycling</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">14</strong><select data-qnum="14" name="question_14" class="ielts-inline-select"><option value="">[ 14 ] Tanlang...</option><option value="A. not dependent on season">A. not dependent on season</option><option value="B. enjoyable">B. enjoyable</option><option value="C. low risk of injury">C. low risk of injury</option><option value="D. fitness level unimportant">D. fitness level unimportant</option><option value="E. sociable">E. sociable</option><option value="F. fast results">F. fast results</option><option value="G. motivating">G. motivating</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>doing yoga</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">15</strong><select data-qnum="15" name="question_15" class="ielts-inline-select"><option value="">[ 15 ] Tanlang...</option><option value="A. not dependent on season">A. not dependent on season</option><option value="B. enjoyable">B. enjoyable</option><option value="C. low risk of injury">C. low risk of injury</option><option value="D. fitness level unimportant">D. fitness level unimportant</option><option value="E. sociable">E. sociable</option><option value="F. fast results">F. fast results</option><option value="G. motivating">G. motivating</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>training with a personal trainer</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">16</strong><select data-qnum="16" name="question_16" class="ielts-inline-select"><option value="">[ 16 ] Tanlang...</option><option value="A. not dependent on season">A. not dependent on season</option><option value="B. enjoyable">B. enjoyable</option><option value="C. low risk of injury">C. low risk of injury</option><option value="D. fitness level unimportant">D. fitness level unimportant</option><option value="E. sociable">E. sociable</option><option value="F. fast results">F. fast results</option><option value="G. motivating">G. motivating</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12432">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. not dependent on season">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">not dependent on season</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. enjoyable">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">enjoyable</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. low risk of injury">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">low risk of injury</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. fitness level unimportant">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">fitness level unimportant</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. sociable">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">sociable</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. fast results">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">fast results</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. motivating">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">motivating</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 17-18                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="17,18"><div class="ielts-q-header"><strong class="ielts-q-badge">17</strong> <strong class="ielts-q-badge">18</strong><span class="ielts-q-title"><span>For which  reasons does the speaker say people give up going to the gym?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> lack of time</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> loss of confidence</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> too much effort required</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> high costs</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> feeling less successful than others</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 19-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="19,20"><div class="ielts-q-header"><strong class="ielts-q-badge">19</strong> <strong class="ielts-q-badge">20</strong><span class="ielts-q-title"><span>Which  pieces of advice does the speaker give for setting goals?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> write goals down</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> have achievable aims</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> set a time limit</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> give yourself rewards</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> challenge yourself</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12449-cambridge-ielts-13-academic-listening-3-audio-2.mp3', 'So if you are one of those people who hasn’t found the perfect physical activity yet, here are some things to think about which might help you make the right decision for you. The first question to ask yourself is whether you would enjoy training in a gym. Many people are put off by the idea of having to fit a visit to the gym into their busy day. You often have to go very early or late as some gyms can get very crowded but with regular training you’ll see a big difference in a relatively short space of time.
Running has become incredibly popular in recent years. That’s probably got a lot to do with the fact that it’s a very accessible form of exercise that anyone can run even if you could only run a few meters to begin with. But make sure you get the right shoes. It’s worth investing in a high quality pair and they don’t come cheap. Another great thing about running is that you can do it at any time of day or night. The only thing that may stop you is snow and ice.
Swimming is another really good way to build fitness. What attracts many people is that you can swim in an indoor pool at any time of year. On the other hand, it can be quite boring or solitary. It’s hard to chat to people while you’re swimming lengths.
Cycling has become almost as popular as running in recent years. That’s probably because as well as improving their fitness many people say being out in the fresh air in a park or in the countryside can be fun, provided the conditions are right of course. Only fanatics go out in the wind and rain.
Yoga is a good choice for those of you looking for exercise, which focuses on developing both a healthy mind and body. It’s a good way of building strength and with the right instructor there’s less chance of hurting yourself than with other more active sports. But don’t expect to find it easy. It can be surprisingly challenging, especially for people who aren’t very flexible. Getting a personal trainer is a good way to start your fitness program. Obviously there can be significant costs involved. But if you’ve got someone there to encourage you and help you achieve your goals, you’re less likely to give up. Make sure you get someone with a recognised qualification though. Or you could do yourself permanent damage.
—————
Whatever you do, don’t join a gym and you’re sure you’ll make good use of it. So many people waste lots of money by signing up for membership and then hardly ever go. What happens to their good intentions? I don’t think people suddenly stop caring about improving their fitness or decide they have more important things to do. I think people lose interest when they don’t think they’re making enough progress. That’s when they give up hope and stop believing they’ll ever achieve their goals. Also, what people sometimes don’t realize when they start is that it takes a lot of determination and hard work to keep training week after week, and lots of people don’t have that kind of commitment. One thing you can do to help yourself is to set manageable goals, be realistic and don’t push yourself too far. Some people advise writing goes down but I think it’s better to have a flexible approach. Give yourself a really nice treat every time you reach one of your goals and don’t get too upset if you experience setbacks. It’s a journey. There are bound to be difficulties along the way.', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(130311, 13032, 'single_choice', 'Question 11', '["A", "B", "C"]'::jsonb, 'F', 1, 11),
(130312, 13032, 'single_choice', 'Question 12', '["A", "B", "C"]'::jsonb, 'D', 1, 12),
(130313, 13032, 'single_choice', 'Question 13', '["A", "B", "C"]'::jsonb, 'A', 1, 13),
(130314, 13032, 'single_choice', 'Question 14', '["A", "B", "C"]'::jsonb, 'B', 1, 14),
(130315, 13032, 'single_choice', 'Question 15', '["A", "B", "C"]'::jsonb, 'C', 1, 15),
(130316, 13032, 'single_choice', 'Question 16', '["A", "B", "C", "D", "E", "F", "G"]'::jsonb, 'G', 1, 16),
(130317, 13032, 'multiple_choice', 'Question 17', '["A", "B", "C", "D", "E"]'::jsonb, 'B / C', 1, 17),
(130318, 13032, 'multiple_choice', 'For which&nbsp; TWO &nbsp;reasons does the speaker say people give up going to the gym?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / C', 1, 18),
(130319, 13032, 'multiple_choice', 'Question 19', '["A", "B"]'::jsonb, 'B / D', 1, 19),
(130320, 13032, 'multiple_choice', 'Which&nbsp; TWO &nbsp;pieces of advice does the speaker give for setting goals?', '["A", "B"]'::jsonb, 'B / D', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(13033, 1303, 'listening', 'Listening Part 3: Project on using natural dyes to colour fabrics', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-24                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Project on using natural dyes to colour fabrics</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="21"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong><span class="ielts-q-title"><span>What first inspired Jim to choose this project?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="A"><span class="ielts-radio-text"><strong>A</strong> textiles displayed in an exhibition</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="B"><span class="ielts-radio-text"><strong>B</strong> a book about a botanic garden</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="C"><span class="ielts-radio-text"><strong>C</strong> carpets he saw on holiday</span></label></div></div><div class="ielts-standalone-q" data-qnum="22"><div class="ielts-q-header"><strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>Jim eventually decided to do a practical investigation which involved</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="A"><span class="ielts-radio-text"><strong>A</strong> using a range of dyes with different fibres.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="B"><span class="ielts-radio-text"><strong>B</strong> applying different dyes to one type of fibre.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="C"><span class="ielts-radio-text"><strong>C</strong> testing one dye and a range of fibres.</span></label></div></div><div class="ielts-standalone-q" data-qnum="23"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong><span class="ielts-q-title"><span>When doing his experiments, Jim was surprised by</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="A"><span class="ielts-radio-text"><strong>A</strong> how much natural material was needed to make the dye.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="B"><span class="ielts-radio-text"><strong>B</strong> the fact that dyes were widely available on the internet.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="C"><span class="ielts-radio-text"><strong>C</strong> the time that he had to leave the fabric in the dye.</span></label></div></div><div class="ielts-standalone-q" data-qnum="24"><div class="ielts-q-header"><strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>What problem did Jim have with using tartrazine as a fabric dye?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="A"><span class="ielts-radio-text"><strong>A</strong> It caused a slight allergic reaction.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="B"><span class="ielts-radio-text"><strong>B</strong> It was not a permanent dye on cotton.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="C"><span class="ielts-radio-text"><strong>C</strong> It was ineffective when used on nylon.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 25-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What problem is identified with each of the following natural dyes?</p>
<p><em>Choose <strong>SIX</strong> answers from the box and write the correct letter, <strong>A-H</strong>, next to Questions</em></p>
<p><strong>Problems</strong></p>
<p><strong>Natural</strong> <strong>dyes</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>turmeric</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">25</strong><select data-qnum="25" name="question_25" class="ielts-inline-select"><option value="">[ 25 ] Tanlang...</option><option value="A. It is expensive.">A. It is expensive.</option><option value="B. The colour is too strong.">B. The colour is too strong.</option><option value="C. The colour is not long-lasting.">C. The colour is not long-lasting.</option><option value="D. It is very poisonous.">D. It is very poisonous.</option><option value="E. It can damage the fabric.">E. It can damage the fabric.</option><option value="F. The colour may be unexpected.">F. The colour may be unexpected.</option><option value="G. It is unsuitable for some fabrics.">G. It is unsuitable for some fabrics.</option><option value="H. It is not generally available">H. It is not generally available</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>beetroot</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">26</strong><select data-qnum="26" name="question_26" class="ielts-inline-select"><option value="">[ 26 ] Tanlang...</option><option value="A. It is expensive.">A. It is expensive.</option><option value="B. The colour is too strong.">B. The colour is too strong.</option><option value="C. The colour is not long-lasting.">C. The colour is not long-lasting.</option><option value="D. It is very poisonous.">D. It is very poisonous.</option><option value="E. It can damage the fabric.">E. It can damage the fabric.</option><option value="F. The colour may be unexpected.">F. The colour may be unexpected.</option><option value="G. It is unsuitable for some fabrics.">G. It is unsuitable for some fabrics.</option><option value="H. It is not generally available">H. It is not generally available</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Tyrian purple</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. It is expensive.">A. It is expensive.</option><option value="B. The colour is too strong.">B. The colour is too strong.</option><option value="C. The colour is not long-lasting.">C. The colour is not long-lasting.</option><option value="D. It is very poisonous.">D. It is very poisonous.</option><option value="E. It can damage the fabric.">E. It can damage the fabric.</option><option value="F. The colour may be unexpected.">F. The colour may be unexpected.</option><option value="G. It is unsuitable for some fabrics.">G. It is unsuitable for some fabrics.</option><option value="H. It is not generally available">H. It is not generally available</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>logwood</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">28</strong><select data-qnum="28" name="question_28" class="ielts-inline-select"><option value="">[ 28 ] Tanlang...</option><option value="A. It is expensive.">A. It is expensive.</option><option value="B. The colour is too strong.">B. The colour is too strong.</option><option value="C. The colour is not long-lasting.">C. The colour is not long-lasting.</option><option value="D. It is very poisonous.">D. It is very poisonous.</option><option value="E. It can damage the fabric.">E. It can damage the fabric.</option><option value="F. The colour may be unexpected.">F. The colour may be unexpected.</option><option value="G. It is unsuitable for some fabrics.">G. It is unsuitable for some fabrics.</option><option value="H. It is not generally available">H. It is not generally available</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>cochineal</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">29</strong><select data-qnum="29" name="question_29" class="ielts-inline-select"><option value="">[ 29 ] Tanlang...</option><option value="A. It is expensive.">A. It is expensive.</option><option value="B. The colour is too strong.">B. The colour is too strong.</option><option value="C. The colour is not long-lasting.">C. The colour is not long-lasting.</option><option value="D. It is very poisonous.">D. It is very poisonous.</option><option value="E. It can damage the fabric.">E. It can damage the fabric.</option><option value="F. The colour may be unexpected.">F. The colour may be unexpected.</option><option value="G. It is unsuitable for some fabrics.">G. It is unsuitable for some fabrics.</option><option value="H. It is not generally available">H. It is not generally available</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>metal oxide</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">30</strong><select data-qnum="30" name="question_30" class="ielts-inline-select"><option value="">[ 30 ] Tanlang...</option><option value="A. It is expensive.">A. It is expensive.</option><option value="B. The colour is too strong.">B. The colour is too strong.</option><option value="C. The colour is not long-lasting.">C. The colour is not long-lasting.</option><option value="D. It is very poisonous.">D. It is very poisonous.</option><option value="E. It can damage the fabric.">E. It can damage the fabric.</option><option value="F. The colour may be unexpected.">F. The colour may be unexpected.</option><option value="G. It is unsuitable for some fabrics.">G. It is unsuitable for some fabrics.</option><option value="H. It is not generally available">H. It is not generally available</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12442">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. It is expensive.">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">It is expensive.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. The colour is too strong.">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">The colour is too strong.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. The colour is not long-lasting.">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">The colour is not long-lasting.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. It is very poisonous.">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">It is very poisonous.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. It can damage the fabric.">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">It can damage the fabric.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. The colour may be unexpected.">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">The colour may be unexpected.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. It is unsuitable for some fabrics.">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">It is unsuitable for some fabrics.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="H" data-text="H. It is not generally available">
                                                                                        <span class="dnd-label">H.</span>
                                                                                        <span class="dnd-text">It is not generally available</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12448-cambridge-ielts-13-academic-listening-3-audio-3.mp3', 'TUTOR: OK, Jim. You wanted to see me about your textile design project.
JIM: That’s right. I’ve been looking at how a range of natural dyes can be used to colour fabrics like cotton and wool.
TUTOR: Why did you choose that topic?
JIM: Well, I got a lot of useful ideas from the museum, you know, at that exhibition of textiles. But I’ve always been interested in anything to do with colour. Years ago, I went to a carpet shop with my parents when we were on holiday in Turkey, and I remember all the amazing colours.
TUTOR: They might not all have been natural dyes.
JIM: Maybe not, but for the project I decided to follow it up. And I found a great book about a botanic garden in California that specialises in plants used for dyes.
TUTOR: OK. So, in your project, you had to include a practical investigation.
JIM: Yeah. At first I couldn’t decide on my variables. I was going to just look at one type of fibre for example, like cotton …
TUTOR: … and see how different types of dyes affected it?
JIM: Yes. Then I decided to include others as well, so I looked at cotton and wool and nylon.
TUTOR: With just one type of dye?
JIM: Various types, including some that weren’t natural, for comparison.
TUTOR: OK.
JIM: So, I did the experiments last week. I used some ready-made natural dyes. I found a website which supplied them, they came in just a few days, but I also made some of my own.
TUTOR: That must have taken quite a bit of time.
JIM: Yes, I’d thought it’d just be a matter of a teaspoon or so of dye, and actually that wasn’t the case at all. Like I was using one vegetable, beetroot, for a red dye, and I had to chop up a whole pile of it. So it all took longer than I’d expected.
TUTOR: One possibility is to use food colourings.
JIM: I did use one. That was a yellow dye, an artificial one.
TUTOR: Tartrazine?
JIM: Yeah. I used it on cotton first. It came out a great colour, but when I rinsed the material, the colour just washed away. I’d been going to try it out on nylon, but I abandoned that idea.
TUTOR: Were you worried about health issues?
JIM: I’d thought if it’s a legal food colouring, it must be safe.
TUTOR: Well, it can occasionally cause allergic reactions, I believe.
———————
TUTOR: So what natural dyes did you look at?
JIM: Well, one was turmeric. The colour’s great, it’s a really strong yellow. It’s generally used in dishes like curry.
TUTOR: It’s meant to be quite good for your health when eaten, but you might find it’s not permanent when it’s used as a dye – a few washes, and it’s gone.
JIM: Right. I used beetroot as a dye for wool. When I chop up beetroot to eat I always end up with bright red hands, but the wool ended up just a sort of watery cream shade. Disappointing.
TUTOR: There’s a natural dye called Tyrian purple. Have you heard of that?
JIM: Yes. It comes from a shellfish, and it was worn in ancient times but only by important people as it was so rare. I didn’t use it.
TUTOR: It fell out of use centuries ago, though one researcher managed to get hold of some recently. But that shade of purple can be produced by chemical dyes nowadays. Did you use any black dyes?
JIM: Logwood. That was quite complicated. I had to prepare the fabric so the dye would take.
TUTOR: I hope you were careful to wear gloves.
JIM: Yes. I know the danger with that dye.
TUTOR: Good. It can be extremely dangerous if it’s ingested. Now, presumably you had a look at an insect-based dye? Like cochineal, for example?
JIM: Yes. I didn’t actually make that, I didn’t have time to start crushing up insects to get the red colour and anyway they’re not available here, but I managed to get the dye quite easily from a website. But it cost a fortune. I can see why it’s generally just used in cooking, and in small quantities.
TUTOR: Yes, it’s very effective, but that’s precisely why it’s not used as a dye.
JIM: I also read about using metal oxide. Apparently you can allow iron to rust while it’s in contact with the fabric, and that colours it.
TUTOR: Yes, that works well for dying cotton. But you have to be careful as the metal can actually affect the fabric and so you can’t expect to get a lot of wear out of fabrics treated in this way. And the colours are quite subtle, not everyone likes them. Anyway, it looks as if you’ve done a lot of work …', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(130321, 13033, 'single_choice', 'What first inspired Jim to choose this project?', '["A", "B", "C"]'::jsonb, 'C', 1, 21),
(130322, 13033, 'single_choice', 'Jim eventually decided to do a practical investigation which involved', '["A", "B", "C"]'::jsonb, 'A', 1, 22),
(130323, 13033, 'single_choice', 'When doing his experiments, Jim was surprised by', '["A", "B", "C"]'::jsonb, 'A', 1, 23),
(130324, 13033, 'single_choice', 'What problem did Jim have with using tartrazine as a fabric dye?', '["A", "B", "C"]'::jsonb, 'B', 1, 24),
(130325, 13033, 'single_choice', 'Question 25', '["A", "B", "C"]'::jsonb, 'C', 1, 25),
(130326, 13033, 'single_choice', 'Question 26', '["A", "B", "C"]'::jsonb, 'F', 1, 26),
(130327, 13033, 'single_choice', 'Question 27', '["A", "B", "C"]'::jsonb, 'H', 1, 27),
(130328, 13033, 'single_choice', 'Question 28', '["A", "B", "C"]'::jsonb, 'D', 1, 28),
(130329, 13033, 'single_choice', 'Question 29', '["A", "B", "C"]'::jsonb, 'A', 1, 29),
(130330, 13033, 'single_choice', 'Question 30', '["A", "B", "C"]'::jsonb, 'E', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(13034, 1303, 'listening', 'Listening Part 4: The sleepy lizard (tiliqua rugosa)', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write <strong>ONE WORD ONLY</strong> for each answer.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>The sleepy lizard (<em>tiliqua rugosa</em>)</strong></strong></p>
<p><strong>Description</strong></p>
<ul>
<li>They are common in Western and South Australia</li>
<li>They are brown, but recognisable by their blue <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>They are relatively large</li>
<li>Their diet consists mainly of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>Their main predators are large birds and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Navigation study</strong></p>
<ul>
<li>One study found that lizards can use the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> to help them navigate</li>
</ul>
<p><strong>Observations in the wild</strong></p>
<ul>
<li>Observations show that these lizards keep the same <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span> for several years</li>
</ul>
<p><strong>What people want</strong></p>
<ul>
<li>Possible reasons:</li>
</ul>
<p>–  to improve the survival of their young</p>
<p>(but little <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> has been noted between parents and children)</p>
<p>–  to provide <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span> for female lizards</p>
<p><strong>Tracking study</strong></p>
<p>–  A study was carried out using GPS systems attached to the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> of the lizards</p>
<p>–  This provided information on the lizards’ location and even the number of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span> taken</p>
<p>–  It appeared that the lizards were trying to avoid one another</p>
<p>–  This may be in order to reduce chances of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span></p>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12447-cambridge-ielts-13-academic-listening-3-audio-4.mp3', 'Last week, we started looking at reptiles, including crocodiles and snakes. Today, I’d like us to have a look at another reptile – the lizard – and in particular, at some studies that have been done on a particular type of lizard whose Latin name is tiliqua rugosa . This is commonly known as the sleepy lizard, because it’s quite slow in its movements and spends quite a lot of its time dozing under rocks or lying in the sun.
I’ll start with a general description. Sleepy lizards live in Western and South Australia, where they’re quite common. Unlike European lizards, which are mostly small, green and fast-moving, sleepy lizards are brown, but what’s particularly distinctive about them is the colour of their tongue, which is dark blue, in contrast with the lining of their mouth which is bright pink. And they’re much bigger than most European lizards. They have quite a varied diet, including insects and even small animals, but they mostly eat plants of varying kinds.
Even though they’re quite large and powerful, with strong jaws that can crush beetles and snail shells, they still have quite a few predators. Large birds like cassowaries were one of the main ones in the past, but nowadays they’re more likely to be caught and killed by snakes. Actually, another threat to their survival isn’t a predator at all, but is man-made – quite a large number of sleepy lizards are killed by cars when they’re trying to cross highways.
One study carried out by Michael Freake at Flinders University investigated the methods of navigation of these lizards. Though they move slowly, they can travel quite long distances. And he found that even if they were taken some distance away from their home territory, they could usually find their way back home as long as they could see the sky – they didn’t need any other landmarks on the ground.
———————
Observations of these lizards in the wild have also revealed that their mating habits are quite unusual. Unlike most animals, it seems that they’re relatively monogamous, returning to the same partner year after year. And the male and female also stay together for a long time, both before and after the birth of their young.
It’s quite interesting to think about the possible reasons for this. It could be that it’s to do with protecting their young – you’d expect them to have a much better chance of survival if they have both parents around. But in fact observers have noted that once the babies have hatched out of their eggs, they have hardly any contact with their parents. So, there’s not really any evidence to support that idea.
Another suggestion’s based on the observation that male lizards in monogamous relationships tend to be bigger and stronger than other males. So maybe the male lizards stay around so they can give the female lizards protection from other males. But again, we’re not really sure.
Finally, I’d like to mention another study that involved collecting data by tracking the lizards. I was actually involved in this myself. So we caught some lizards in the wild and we developed a tiny GPS system that would allow us to track them, and we fixed this onto their tails. Then we set the lizards free again, and we were able to track them for twelve days and gather data, not just about their location, but even about how many steps they took during this period.
One surprising thing we discovered from this is that there were far fewer meetings between lizards than we expected – it seems that they were actually trying to avoid one another. So why would that be? Well, again we have no clear evidence, but one hypothesis is that male lizards can cause quite serious injuries to one another, so maybe this avoidance is a way of preventing this – of self-preservation, if you like. But we need to collect a lot more data before we can be sure of any of this.', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(130331, 13034, 'text_input', 'The sleepy lizard ( tiliqua rugosa )   
  Description  
 
 They are common in Western and South Australia 
 They are brown, but recognisable by their blue  <strong', '[]'::jsonb, 'tongue / tongues', 1, 31),
(130332, 13034, 'text_input', 'uestion-number-31" class="ielts-listening-question-number">31     
 They are relatively large 
 Their diet consists mainly of  <strong', '[]'::jsonb, 'plants', 1, 32),
(130333, 13034, 'text_input', 'ng id="ielts-listening-question-number-32" class="ielts-listening-question-number">32     
 Their main predators are large birds and  <strong', '[]'::jsonb, 'snakes', 1, 33),
(130334, 13034, 'text_input', 'lts-listening-question-number">33     
 
  Navigation study  
 
 One study found that lizards can use the  <strong', '[]'::jsonb, 'sky', 1, 34),
(130335, 13034, 'text_input', 'g>    to help them navigate 
 
  Observations in the wild  
 
 Observations show that these lizards keep the same  <strong', '[]'::jsonb, 'partner / partners', 1, 35),
(130336, 13034, 'text_input', 'lts_listening_answer_12444_5" id="ielts_listening_answer_12444_5" aria-label="Question 35" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  for several years 
 
  What people want  
 
 Possible reasons: 
 
 –  to improve the survival of their young 
 (but little  <strong', '[]'::jsonb, 'contact', 1, 36),
(130337, 13034, 'text_input', 'tening-question-number-36" class="ielts-listening-question-number">36     has been noted between parents and children) 
 –  to provide  <strong', '[]'::jsonb, 'protection', 1, 37),
(130338, 13034, 'text_input', 'umber">37     for female lizards 
  Tracking study  
 –  A study was carried out using GPS systems attached to the  <strong', '[]'::jsonb, 'tail / tails', 1, 38),
(130339, 13034, 'text_input', '"ielts-listening-question-number">38     of the lizards 
 –  This provided information on the lizards’ location and even the number of  <strong', '[]'::jsonb, 'steps', 1, 39),
(130340, 13034, 'text_input', 'r">39     taken 
 –  It appeared that the lizards were trying to avoid one another 
 –  This may be in order to reduce chances of  <strong', '[]'::jsonb, 'injury / injuries', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
