-- Cambridge IELTS 15 Academic Listening Test 1
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1501, 'Cambridge IELTS 15 Academic Listening Test 1', 'Rasmiy Cambridge IELTS 15 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(15011, 1501, 'listening', 'Listening Part 1: Bankside Recruitment Agency', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-10                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write ONE WORD AND/OR A NUMBER for each answer.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Bankside Recruitment Agency</strong></strong></p>
<ul>
<li>Address of agency: 497 Eastside, Docklands</li>
<li>Name of agent: Becky <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>Phone number: 07866 510333</li>
<li>Best to call her in the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Typical jobs</strong></p>
<ul>
<li>Clerical and admin roles, mainly in the finance industry</li>
<li>Must have good <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span> skills</li>
<li>Jobs are usually for at least one <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>Pay is usually £<span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span> per hour</li>
</ul>
<p><strong>Registration process</strong></p>
<ul>
<li>Wear a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span> to the interview</li>
<li>Must bring your <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span> to the interview</li>
<li>They will ask questions about each applicant’s <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Advantages of using an agency</strong></p>
<ul>
<li>The <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span> you receive at interview will benefit you</li>
<li>Will get access to vacancies which are not advertised</li>
<li>Less <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span> is involved in applying for jobs</li>
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
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/26096-cambridge-ielts-15-academic-listening-1-audio-1.mp3', 'AMBER: Hello William. This is Amber – you said to phone if I wanted to get more information about the job agency you mentioned. Is now a good time?
WILLIAM: Oh, hi Amber. Yes. Fine. So the agency I was talking about is called Bankside – they’re based in Docklands – I can tell you the address now – 497 Eastside.
AMBER: OK, thanks. So is there anyone in particular I should speak to there?
WILLIAM: The agent I always deal with is called Becky Jamieson.
AMBER: Let me write that down – Becky …
WILLIAM: Jamieson J-A-M-I-E-S-O-N.
AMBER: Do you have her direct line?
WILLIAM: Yes, it’s in my contacts somewhere – right, here we are: 078 double 6, 510 triple 3. I wouldn’t call her until the afternoon if I were you – she’s always really busy in the morning trying to fill last-minute vacancies. She’s really helpful and friendly so I’m sure it would be worth getting in touch with her for an informal chat.
AMBER: It’s mainly clerical and admin jobs they deal with, isn’t it?
WILLIAM: That’s right. I know you’re hoping to find a full-time job in the media eventually – but Becky mostly recruits temporary staff for the finance sector – which will look good on your CV – and generally pays better too.
AMBER: Yeah – I’m just a bit worried because I don’t have much office experience.
WILLIAM: I wouldn’t worry. They’ll probably start you as a receptionist, or something like that. So what’s important for that kind of job isn’t so much having business skills or knowing lots of different computer systems – it’s communication that really matters – so you’d be fine there. And you’ll pick up office skills really quickly on the job. It’s not that complicated.
AMBER: OK good. So how long do people generally need temporary staff for? It would be great if I could get something lasting at least a month.
WILLIAM: That shouldn’t be too difficult. But you’re more likely to be offered something for a week at first, which might get extended. It’s unusual to be sent somewhere for just a day or two.
AMBER: Right, I’ve heard the pay isn’t too bad – better than working in a shop or a restaurant.
WILLIAM: Oh yes – definitely. The hourly rate is about £10, 11 if you’re lucky.
AMBER: That’s pretty good. I was only expecting to get eight or nine pounds an hour.
————————————————
WILLIAM: Do you want me to tell you anything about the registration process?
AMBER: Yes, please. I know you have to have an interview.
WILLIAM: The interview usually takes about an hour and you should arrange that about a week in advance.
AMBER: I suppose I should dress smartly if it’s for office work – I can probably borrow a suit from Mum.
WILLIAM: Good idea. It’s better to look too smart than too casual.
AMBER: Will I need to bring copies of my exam certificates or anything like that?
WILLIAM: No – they don’t need to see those, I don’t think.
AMBER: What about my passport?
WILLIAM: Oh yes – they will ask to see that.
AMBER: OK.
WILLIAM: I wouldn’t get stressed about the interview though. It’s just a chance for them to build a relationship with you – so they can try and match you to a job which you’ll like. So there are questions about personality that they always ask candidates – fairly basic ones. And they probably won’t ask anything too difficult like what your plans are for the future.
AMBER: Hope not.
WILLIAM: Anyway, there are lots of benefits to using an agency – for example, the interview will be useful because they’ll give you feedback on your performance so you can improve next time.
AMBER: And they’ll have access to jobs which aren’t advertised.
WILLIAM: Exactly – most temporary jobs aren’t advertised.
AMBER: And I expect finding a temporary job this way takes a lot less time – it’s much easier than ringing up individual companies.
WILLIAM: Yes indeed. Well I think …', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(150101, 15011, 'text_input', 'Bankside Recruitment Agency   
 
 Address of agency: 497 Eastside, Docklands 
 Name of agent: Becky  <strong', '[]'::jsonb, 'Jamieson', 1, 1),
(150102, 15011, 'text_input', 'tening-question-number-1" class="ielts-listening-question-number">1     
 Phone number: 07866 510333 
 Best to call her in the  <strong', '[]'::jsonb, 'afternoon', 1, 2),
(150103, 15011, 'text_input', 'strong>    
 
  Typical jobs  
 
 Clerical and admin roles, mainly in the finance industry 
 Must have good  <strong', '[]'::jsonb, 'communication', 1, 3),
(150104, 15011, 'text_input', 'trong id="ielts-listening-question-number-3" class="ielts-listening-question-number">3     skills 
 Jobs are usually for at least one  <strong', '[]'::jsonb, 'week', 1, 4),
(150105, 15011, 'text_input', 'stening-question-item"> 4     
 Pay is usually £ <strong', '[]'::jsonb, '10 / ten', 1, 5),
(150106, 15011, 'text_input', 'ion-number-5" class="ielts-listening-question-number">5     per hour 
 
  Registration process  
 
 Wear a  <strong', '[]'::jsonb, 'suit', 1, 6),
(150107, 15011, 'text_input', 'item"> 6     to the interview 
 Must bring your  <strong', '[]'::jsonb, 'passport', 1, 7),
(150108, 15011, 'text_input', 'ng-question-number-7" class="ielts-listening-question-number">7     to the interview 
 They will ask questions about each applicant’s  <strong', '[]'::jsonb, 'personality', 1, 8),
(150109, 15011, 'text_input', 'estion-number-8" class="ielts-listening-question-number">8     
 
  Advantages of using an agency  
 
 The  <strong', '[]'::jsonb, 'feedback', 1, 9),
(150110, 15011, 'text_input', 'uestion-number">9     you receive at interview will benefit you 
 Will get access to vacancies which are not advertised 
 Less  <strong', '[]'::jsonb, 'time', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(15012, 1501, 'listening', 'Listening Part 2: Matthews Island Holidays', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-14                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Matthews Island Holidays</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="11"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong><span class="ielts-q-title"><span>According to the speaker, the company</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="A"><span class="ielts-radio-text"><strong>A</strong> has been in business for longer than most of its competitors.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="B"><span class="ielts-radio-text"><strong>B</strong> arranges holidays to more destinations than its competitors.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="C"><span class="ielts-radio-text"><strong>C</strong> has more customers than its competitors.</span></label></div></div><div class="ielts-standalone-q" data-qnum="12"><div class="ielts-q-header"><strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>Where can customers meet the tour manager before travelling to the Isle of Man?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="A"><span class="ielts-radio-text"><strong>A</strong> Liverpool</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="B"><span class="ielts-radio-text"><strong>B</strong> Heysham</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="C"><span class="ielts-radio-text"><strong>C</strong> Luton</span></label></div></div><div class="ielts-standalone-q" data-qnum="13"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong><span class="ielts-q-title"><span>How many lunches are included in the price of the holiday?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="A"><span class="ielts-radio-text"><strong>A</strong> three</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="B"><span class="ielts-radio-text"><strong>B</strong> four</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="C"><span class="ielts-radio-text"><strong>C</strong> five</span></label></div></div><div class="ielts-standalone-q" data-qnum="14"><div class="ielts-q-header"><strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>Customers have to pay extra for</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="A"><span class="ielts-radio-text"><strong>A</strong> guaranteeing themselves a larger room.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="B"><span class="ielts-radio-text"><strong>B</strong> booking at short notice.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="C"><span class="ielts-radio-text"><strong>C</strong> transferring to another date.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 15-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Complete the table below.</p>
<p>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</p>
<table>
<tbody>
<tr>
<td colspan="3" width="510"><strong>Timetable for Isle of Man holiday</strong></td>
</tr>
<tr>
<td width="60"> </td>
<td width="204"><strong>Activity</strong></td>
<td width="246"><strong>Notes</strong></td>
</tr>
<tr>
<td width="60">Day 1</td>
<td width="204">Arrive</td>
<td width="246">Introduction by manager</p>
<p> </p>
<p>Hotel dining room has view of the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">15</strong><input type="text" data-qnum="15" name="question_15" class="ielts-inline-input" placeholder="[15] javob..." autocomplete="off" spellcheck="false"></span></span></td>
</tr>
<tr>
<td width="60">Day 2</td>
<td width="204">Tynwald Exhibition and Peel</td>
<td width="246">Tynwald may have been founded in <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">16</strong><input type="text" data-qnum="16" name="question_16" class="ielts-inline-input" placeholder="[16] javob..." autocomplete="off" spellcheck="false"></span></span> not 979.</td>
</tr>
<tr>
<td width="60">Day 3</td>
<td width="204">Trip to Snaefell</td>
<td width="246">Travel along promenade in a tram; train to Laxey; train to the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">17</strong><input type="text" data-qnum="17" name="question_17" class="ielts-inline-input" placeholder="[17] javob..." autocomplete="off" spellcheck="false"></span></span> of Snaefell</td>
</tr>
<tr>
<td width="60">Day 4</td>
<td width="204">
<p style="text-align: center">Free day</p>
</td>
<td width="246">Company provides a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">18</strong><input type="text" data-qnum="18" name="question_18" class="ielts-inline-input" placeholder="[18] javob..." autocomplete="off" spellcheck="false"></span></span> for local transport and heritage sites.</td>
</tr>
<tr>
<td width="60">Day 5</td>
<td width="204">Take the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">19</strong><input type="text" data-qnum="19" name="question_19" class="ielts-inline-input" placeholder="[19] javob..." autocomplete="off" spellcheck="false"></span></span> railway train from Douglas to Port Erin</td>
<td width="246">Free time, then coach to Castletown – former <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">20</strong><input type="text" data-qnum="20" name="question_20" class="ielts-inline-input" placeholder="[20] javob..." autocomplete="off" spellcheck="false"></span></span> has old castle.</td>
</tr>
<tr>
<td width="60">Day 6</td>
<td width="204">Leave</td>
<td width="246">Leave the island by ferry or plane</td>
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
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/26092-cambridge-ielts-15-academic-listening-1-audio-2.mp3', 'Good morning. My name’s Erica Matthews, and I’m the owner of Matthews Island Holidays, a company set up by my parents. Thank you for coming to this presentation, in which I hope to interest you in what we have to offer. We’re a small, family-run company, and we believe in the importance of the personal touch, so we don’t aim to compete with other companies on the number of customers. What we do is build on our many years’ experience – more than almost any other rail holiday company – to ensure we provide perfect holidays in a small number of destinations, which we’ve got to know extremely well.
I’ll start with our six-day Isle of Man holiday. This is a fascinating island in the Irish Sea, with Wales to the south, England to the east, Scotland to the north and Northern Ireland to the west. Our holiday starts in Heysham, where your tour manager will meet you, then you’ll travel by ferry to the Isle of Man. Some people prefer to fly from Luton instead, and another popular option is to go by train to Liverpool and take a ferry from there.
You have five nights in the hotel, and the price covers five breakfasts and dinners, and lunch on the three days when there are organised trips: day four is free, and most people have lunch in a café or restaurant in Douglas.
The price of the holiday includes the ferry to the Isle of Man, all travel on the island, the hotel, and the meals I’ve mentioned. Incidentally, we try to make booking our holidays as simple and fair as possible, so unlike with many companies, the price is the same whether you book six months in advance or at the last minute, and there’s no supplement for single rooms in hotels. If you make a booking then need to change the start date, for example because of illness, you’re welcome to change to an alternative date or a different tour, for a small administrative fee.
——————————
OK, so what does the holiday consist of? Well, on day one you’ll arrive in time for a short introduction by your tour manager, followed by dinner in the hotel. The dining room looks out at the river, close to where it flows into the harbour, and there’s usually plenty of activity going on.
On day two you’ll take the coach to the small town of Peel, on the way calling in at the Tynwald Exhibition. The Isle of Man isn’t part of the United Kingdom, and it has its own parliament, called Tynwald. It’s claimed that this is the world’s oldest parliament that’s still functioning, and that it dates back to 979. However, the earliest surviving reference to it is from 1422, so perhaps it isn’t quite as old as it claims!
Day three we have a trip to the mountain Snaefell. This begins with a leisurely ride along the promenade in Douglas in a horse-drawn tram. Then you board an electric train which takes you to the fishing village of Laxey. From there it’s an eight-kilometre ride in the Snaefell Mountain Railway to the top. Lunch will be in the café, giving you spectacular views of the island.
Day four is free for you to explore, using the pass which we’ll give you. So you won’t have to pay for travel on local transport, or for entrance to the island’s heritage sites. Or you might just want to take it easy in Douglas and perhaps do a little light shopping.
The last full day, day five, is for some people the highlight of the holiday, with a ride on the steam railway, from Douglas to Port Erin. After some time to explore, a coach will take you to the headland that overlooks the Calf of Man, a small island just off the coast. From there you continue to Castletown, which used to be the capital of the Isle of Man, and its mediaeval castle.
And on day six it’s back to the ferry – or the airport, if you flew to the island – and time to go home.
Now I’d like to tell you …', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(150111, 15012, 'single_choice', 'According to the speaker, the company', '["A", "B", "C"]'::jsonb, 'A', 1, 11),
(150112, 15012, 'single_choice', 'Where can customers meet the tour manager before travelling to the Isle of Man?', '["A", "B", "C"]'::jsonb, 'B', 1, 12),
(150113, 15012, 'single_choice', 'How many lunches are included in the price of the holiday?', '["A", "B", "C"]'::jsonb, 'A', 1, 13),
(150114, 15012, 'single_choice', 'Customers have to pay extra for', '["A", "B", "C"]'::jsonb, 'C', 1, 14),
(150115, 15012, 'text_input', '0"> Timetable for Isle of Man holiday  
 
 
 &nbsp; 
  Activity  
  Notes  
 
 
 Day 1 
 Arrive 
 Introduction by manager 
 &nbsp; 
 Hotel dining room has view of the  <strong', '[]'::jsonb, 'river', 1, 15),
(150116, 15012, 'text_input', 'ong>    
 
 
 Day 2 
 Tynwald Exhibition and Peel 
 Tynwald may have been founded in  <strong', '[]'::jsonb, '1422', 1, 16),
(150117, 15012, 'text_input', 'Day 3 
 Trip to Snaefell 
 Travel along promenade in a tram; train to Laxey; train to the  <strong', '[]'::jsonb, 'top', 1, 17),
(150118, 15012, 'text_input', 'e="text" name="ielts_listening_answer_12761_3" id="ielts_listening_answer_12761_3" aria-label="Question 17" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  of Snaefell 
 
 
 Day 4 
 
 Free day 
 
 Company provides a  <strong', '[]'::jsonb, 'pass', 1, 18),
(150119, 15012, 'text_input', 'Day 5 
 Take the  <strong', '[]'::jsonb, 'steam', 1, 19),
(150120, 15012, 'text_input', 'listening-question-number">19     railway train from Douglas to Port Erin 
 Free time, then coach to Castletown – former  <strong', '[]'::jsonb, 'capital', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(15013, 1501, 'listening', 'Listening Part 3', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-26                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What did findings of previous research claim about the personality traits a child is likely to have because of their position in the family?</p>
<p><em>Choose <strong>SIX</strong> answers from the box and write the correct letter, <strong>A-H</strong>, next to Questions</em></p>
<p><strong>Personality Traits</strong></p>
<p><strong>Position in family</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>the eldest child</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">21</strong><select data-qnum="21" name="question_21" class="ielts-inline-select"><option value="">[ 21 ] Tanlang...</option><option value="A. outgoing">A. outgoing</option><option value="B. selfish">B. selfish</option><option value="C. independent">C. independent</option><option value="D. attention-seeking">D. attention-seeking</option><option value="E. introverted">E. introverted</option><option value="F. co-operative">F. co-operative</option><option value="G. caring">G. caring</option><option value="H. competitive">H. competitive</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>a middle child</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">22</strong><select data-qnum="22" name="question_22" class="ielts-inline-select"><option value="">[ 22 ] Tanlang...</option><option value="A. outgoing">A. outgoing</option><option value="B. selfish">B. selfish</option><option value="C. independent">C. independent</option><option value="D. attention-seeking">D. attention-seeking</option><option value="E. introverted">E. introverted</option><option value="F. co-operative">F. co-operative</option><option value="G. caring">G. caring</option><option value="H. competitive">H. competitive</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>the youngest child</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">23</strong><select data-qnum="23" name="question_23" class="ielts-inline-select"><option value="">[ 23 ] Tanlang...</option><option value="A. outgoing">A. outgoing</option><option value="B. selfish">B. selfish</option><option value="C. independent">C. independent</option><option value="D. attention-seeking">D. attention-seeking</option><option value="E. introverted">E. introverted</option><option value="F. co-operative">F. co-operative</option><option value="G. caring">G. caring</option><option value="H. competitive">H. competitive</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>a twin</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">24</strong><select data-qnum="24" name="question_24" class="ielts-inline-select"><option value="">[ 24 ] Tanlang...</option><option value="A. outgoing">A. outgoing</option><option value="B. selfish">B. selfish</option><option value="C. independent">C. independent</option><option value="D. attention-seeking">D. attention-seeking</option><option value="E. introverted">E. introverted</option><option value="F. co-operative">F. co-operative</option><option value="G. caring">G. caring</option><option value="H. competitive">H. competitive</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>an only child</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">25</strong><select data-qnum="25" name="question_25" class="ielts-inline-select"><option value="">[ 25 ] Tanlang...</option><option value="A. outgoing">A. outgoing</option><option value="B. selfish">B. selfish</option><option value="C. independent">C. independent</option><option value="D. attention-seeking">D. attention-seeking</option><option value="E. introverted">E. introverted</option><option value="F. co-operative">F. co-operative</option><option value="G. caring">G. caring</option><option value="H. competitive">H. competitive</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>a child with much older siblings</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">26</strong><select data-qnum="26" name="question_26" class="ielts-inline-select"><option value="">[ 26 ] Tanlang...</option><option value="A. outgoing">A. outgoing</option><option value="B. selfish">B. selfish</option><option value="C. independent">C. independent</option><option value="D. attention-seeking">D. attention-seeking</option><option value="E. introverted">E. introverted</option><option value="F. co-operative">F. co-operative</option><option value="G. caring">G. caring</option><option value="H. competitive">H. competitive</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12763">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. outgoing">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">outgoing</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. selfish">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">selfish</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. independent">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">independent</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. attention-seeking">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">attention-seeking</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. introverted">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">introverted</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. co-operative">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">co-operative</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. caring">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">caring</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="H" data-text="H. competitive">
                                                                                        <span class="dnd-label">H.</span>
                                                                                        <span class="dnd-text">competitive</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 27-28                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="27"><div class="ielts-q-header"><strong class="ielts-q-badge">27</strong><span class="ielts-q-title"><span>What do the speakers say about the evidence relating to birth order and academic success?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="27" name="question_27" value="A"><span class="ielts-radio-text"><strong>A</strong> There is conflicting evidence about whether oldest children perform best in intelligence tests.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="27" name="question_27" value="B"><span class="ielts-radio-text"><strong>B</strong> There is little doubt that birth order has less influence on academic achievement than socio-economic status.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="27" name="question_27" value="C"><span class="ielts-radio-text"><strong>C</strong> Some studies have neglected to include important factors such as family size.</span></label></div></div><div class="ielts-standalone-q" data-qnum="28"><div class="ielts-q-header"><strong class="ielts-q-badge">28</strong><span class="ielts-q-title"><span>What does Ruth think is surprising about the difference in oldest children’s academic performance?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="28" name="question_28" value="A"><span class="ielts-radio-text"><strong>A</strong> It is mainly thanks to their roles as teachers for their younger siblings.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="28" name="question_28" value="B"><span class="ielts-radio-text"><strong>B</strong> The advantages they have only lead to a slightly higher level of achievement.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="28" name="question_28" value="C"><span class="ielts-radio-text"><strong>C</strong> The extra parental attention they receive at a young age makes little difference.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 29-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="29,30"><div class="ielts-q-header"><strong class="ielts-q-badge">29</strong> <strong class="ielts-q-badge">30</strong><span class="ielts-q-title"><span>Which  experiences of sibling rivalry do the speakers agree has been valuable for them?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> learning to share</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> learning to stand up for oneself</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> learning to be a good loser</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> learning to be tolerant</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> learning to say sorry</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/26097-cambridge-ielts-15-academic-listening-1-audio-3.mp3', 'RUTH: Ed, how are you getting on with the reading for our presentation next week?
ED: Well, OK, Ruth – but there’s so much of it.
RUTH: I know, I hadn’t realised birth order was such a popular area of research.
ED: But the stuff on birth order and personality is mostly unreliable. From what I’ve been reading a lot of claims about how your position in the family determines certain personality traits are just stereotypes, with no robust evidence to support them.
RUTH: OK, but that’s an interesting point – we could start by outlining what previous research has shown. There are studies going back over a hundred years.
ED: Yeah – so we could just run through some of the typical traits. Like the consensus seems to be that oldest children are generally less well-adjusted because they never get over the arrival of a younger sibling.
RUTH: Right, but on a positive note, some studies claimed that they were thought to be good a nurturing – certainly in the past when people had large families they would have been expected to look after the younger ones.
ED: There isn’t such a clear picture for middle children – but one trait that a lot of the studies mention is that they are easier to get on with than older or younger siblings.
RUTH: Generally eager to please and helpful – although that’s certainly not accurate as far as my family goes – my middle brother was a nightmare – always causing fights and envious of whatever I had.
ED: As I said – none of this seems to relate to my own experience. I’m the youngest in my family and I don’t recognise myself in any of the studies I’ve read about. I’m supposed to have been a sociable and confident child who made friends easily – but I was actually terribly shy.
RUTH: Really? That’s funny. There have been hundreds of studies on twins but mostly about nurture versus nature…
ED: There was one on personality, which said that a twin is likely to be quite shy in social situations because they always have their twin around to depend on for support.
RUTH: My cousins were like that when they were small – they were only interested in each other and found it hard to engage with other kids. They’re fine now though.
ED: Only children have had a really bad press – a lot of studies have branded them as loners who think the world revolves around them because they’ve never had to fight for their parents’ attention.
RUTH: That does seem a bit harsh. One category I hadn’t considered before was children with much older siblings – a couple of studies mentioned that these children grow up more quickly and are expected to do basic things for themselves – like getting dressed.
ED: I can see how that might be true – although I expect they’re sometimes the exact opposite – playing the baby role and clamouring for special treatment.
——————————
RUTH: What was the problem with most of these studies, do you think?
ED: I think it was because in a lot of cases data was collected from only one sibling per family, who rated him or herself and his or her siblings at the same time.
RUTH: Mmm. Some of the old research into the relationship between birth order and academic achievement has been proved to be accurate though. Performances in intelligence tests decline slightly from the eldest child to his or her younger siblings. This has been proved in lots of recent studies.
ED: Yes. Although what many of them didn’t take into consideration was family size. The more siblings there are, the likelier the family is to have a low socioeconomic status – which can also account for differences between siblings in academic performance.
RUTH: The oldest boy might be given more opportunities than his younger sisters, for example.
ED: Exactly.
RUTH: But the main reason for the marginally higher academic performance of oldest children is quite surprising, I think. It’s not only that they benefit intellectually from extra attention at a young age – which is what I would have expected. It’s that they benefit from being teachers for their younger siblings, by verbalising processes.
ED: Right, and this gives them status and confidence, which again contribute, in a small way, to better performance.
So would you say sibling rivalry has been a useful thing for you?
RUTH: I think so – my younger brother was incredibly annoying and we found a lot but I think this has made me a stronger person. I know how to defend myself. We had some terrible arguments and I would have died rather than apologise to him – but we had to put up with each other and most of the time we co-existed amicably enough.
ED: Yes, my situation was pretty similar. But I don’t think having two older brothers made me any less selfish – I was never prepared to let me brothers use any of my stuff …
RUTH: That’s perfectly normal, whereas …', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(150121, 15013, 'single_choice', 'Question 21', '["A", "B", "C"]'::jsonb, 'G', 1, 21),
(150122, 15013, 'single_choice', 'Question 22', '["A", "B", "C"]'::jsonb, 'F', 1, 22),
(150123, 15013, 'single_choice', 'Question 23', '["A", "B", "C"]'::jsonb, 'A', 1, 23),
(150124, 15013, 'single_choice', 'Question 24', '["A", "B", "C"]'::jsonb, 'E', 1, 24),
(150125, 15013, 'single_choice', 'Question 25', '["A", "B", "C"]'::jsonb, 'B', 1, 25),
(150126, 15013, 'single_choice', 'Question 26', '["A", "B", "C", "D", "E", "F", "G", "H"]'::jsonb, 'C', 1, 26),
(150127, 15013, 'single_choice', 'What do the speakers say about the evidence relating to birth order and academic success?', '["A", "B", "C"]'::jsonb, 'C', 1, 27),
(150128, 15013, 'single_choice', 'What does Ruth think is surprising about the difference in oldest children&rsquo;s academic performance?', '["A", "B", "C"]'::jsonb, 'A', 1, 28),
(150129, 15013, 'multiple_choice', 'Question 29', '["A", "B"]'::jsonb, 'B / D', 1, 29),
(150130, 15013, 'multiple_choice', 'Which&nbsp; TWO &nbsp;experiences of sibling rivalry do the speakers agree has been valuable for them?', '["A", "B"]'::jsonb, 'B / D', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(15014, 1501, 'listening', 'Listening Part 4: The Eucalyptus Tree in Australia', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write <strong>ONE WORD ONLY</strong> for each answer.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>The Eucalyptus Tree in Australia</strong></strong></p>
<p><strong>Importance</strong></p>
<ul>
<li>it provides <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span> and food for a wide range of species</li>
<li>its leaves provide <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> which is used to make a disinfectant</li>
</ul>
<p><strong>Reasons for present decline in number</strong></p>
<p><strong>A) Diseases</strong></p>
<p>(i)   ‘Mundulla Yellows’</p>
<ul>
<li>Cause   – lime used for making <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span> was absorbed</li>
</ul>
<p>– trees were unable to take in necessary iron through their roots</p>
<p>(ii)   ‘Bell-miner Associated Die-back’</p>
<ul>
<li>Cause   – <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> feed on eucalyptus leaves</li>
</ul>
<p>– they secrete a substance containing sugar</p>
<p>– bell-miner birds are attracted by this and keep away other species</p>
<p><strong>B) Bushfires</strong></p>
<p>William Jackson’s theory:</p>
<ul>
<li>high-frequency bushfires have impact on vegetation, resulting in the growth of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>mid-frequency bushfires result in the growth of eucalyptus forests, because they:</li>
</ul>
<p>– make more <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> available to the trees</p>
<p>– maintain the quality of the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<ul>
<li>low-frequency bushfires result in the growth of ‘<span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> rainforest’, which is:</li>
</ul>
<p>– a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span> Ecosystem</p>
<p>– an ideal environment for the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span> of the bell-miner</p>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/26098-cambridge-ielts-15-academic-listening-1-audio-4.mp3', 'Today I’m going to talk about the eucalyptus tree. This is a very common tree here in Australia, where it’s also sometimes called the gum tree. First I’m going to talk about why it’s important, then I’m going to describe some problems it faces at present.
Right, well the eucalyptus tree is an important tree for lots of reasons. For example, it gives shelter to creatures like birds and bats, and these and other species also depend on it for food, particularly the nectar from its flowers. So it supports biodiversity. It’s useful to us humans too, because we can kill germs with a disinfectant made from oil extracted from eucalyptus leaves.
The eucalyptus grows all over Australia and the trees can live for up to four hundred years. So it’s alarming that all across the country, numbers of eucalyptus are falling because the trees are dying off prematurely. So what are the reasons for this?
One possible reason is disease. As far back as the 1970s the trees started getting a disease called Mundulla Yellows. The trees’ leaves would gradually turn yellow, then the tree would die. It wasn’t until 2004 that they found the cause of the problem was lime, or calcium hydroxide to give it its proper chemical name, which was being used in the construction of roads. The lime was being washed away into the ground and affecting the roots of the eucalyptus trees nearby. What is was doing was preventing the trees from sucking up the iron they needed for healthy growth. When this was injected back into the affected trees, they immediately recovered.
But this problem only affected a relatively small number of trees. By 2000, huge numbers of eucalyptus were dying along Australia’s East Coast, of a disease known as Bell-miner Associated Die-back. The bell-miner is a bird, and the disease seems to be common where there are high populations of bell-miners. Again it’s the leaves of the trees that are affected. What happens is that insects settle on the leaves and eat their way round them, destroying them as they go, and at the same time they secrete a solution which has sugar in it. The bell-miner birds really like this solution, and in order to get as much as possible, they keep away other creatures that might try to get it. So these birds and insects flourish at the expense of other species, and eventually so much damage is done to the leaves that the tree dies.
————————
But experts say that trees can start looking sick before any sign of Bell-miner Associated Die-back. So it looks as if the problem might have another explanation. One possibility is that it’s to do with the huge bushfires that we have in Australia. A theory proposed over 40 years ago be ecologist William Jackson is that the frequency of bushfires in a particular region affects the type of vegetation that grows there. If there are very frequent bushfires in a region, this encourages grass to grow afterwards, while if the bushfires are rather less frequent, this results in the growth of eucalyptus forests.
So why is this? Why do fairly frequent bushfires actually support the growth of eucalyptus? Well, one reason is that the fire stops the growth of other species which would consume water needed by eucalyptus trees. And there’s another reason. If these other quick-growing species of bushes and plants are allowed to proliferate, they harm the eucalyptus in another way, by affecting the composition of the soil, and removing nutrients from it. So some bushfires are actually essential for the eucalyptus to survive as long as they are not too frequent. In fact there’s evidence that Australia’s indigenous people practised regular burning of bush land for thousands of years before the arrival of the Europeans.
But since Europeans arrived on the continent, the number of bushfires has been strictly controlled. Now scientists believe that this reduced frequency of bushfires to low levels had led to what’s known as ‘dry rainforest’, which seems an odd name as usually we associate tropical rainforest with wet conditions. And what’s special about this type of rainforest? Well, unlike tropical rainforest which is a rich ecosystem, this type of ecosystem is usually a simple one. It has very thick, dense vegetation, but not much variety of species. The vegetation provides lots of shade, so one species that does find it ideal is the bell-miner bird, which builds its nests in the undergrowth there. But again that’s not helpful for the eucalyptus tree.', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(150131, 15014, 'text_input', 'The Eucalyptus Tree in Australia   
  Importance  
 
 it provides  <strong', '[]'::jsonb, 'shelter', 1, 31),
(150132, 15014, 'text_input', 'stening-question-number-31" class="ielts-listening-question-number">31     and food for a wide range of species 
 its leaves provide  <strong', '[]'::jsonb, 'oil', 1, 32),
(150133, 15014, 'text_input', 'ing_answer_12771_2" aria-label="Question 32" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  which is used to make a disinfectant 
 
  Reasons for present decline in number  
  A) Diseases  
 (i)   ‘Mundulla Yellows’ 
 
 Cause   – lime used for making  <strong', '[]'::jsonb, 'roads', 1, 33),
(150134, 15014, 'text_input', 'name="ielts_listening_answer_12771_3" id="ielts_listening_answer_12771_3" aria-label="Question 33" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  was absorbed 
 
 – trees were unable to take in necessary iron through their roots 
 (ii)   ‘Bell-miner Associated Die-back’ 
 
 Cause   –  <strong', '[]'::jsonb, 'insects', 1, 34),
(150135, 15014, 'text_input', 'ocapitalize="off">  feed on eucalyptus leaves 
 
 – they secrete a substance containing sugar 
 – bell-miner birds are attracted by this and keep away other species 
  B) Bushfires  
 William Jackson’s theory: 
 
 high-frequency bushfires have impact on vegetation, resulting in the growth of  <strong', '[]'::jsonb, 'grass / grasses', 1, 35),
(150136, 15014, 'text_input', 'uestion-number">35     
 mid-frequency bushfires result in the growth of eucalyptus forests, because they: 
 
 – make more  <strong', '[]'::jsonb, 'water', 1, 36),
(150137, 15014, 'text_input', 'ts-listening-question-number-36" class="ielts-listening-question-number">36     available to the trees 
 – maintain the quality of the  <strong', '[]'::jsonb, 'soil', 1, 37),
(150138, 15014, 'text_input', '-listening-question-number-37" class="ielts-listening-question-number">37     
 
 low-frequency bushfires result in the growth of ‘ <strong', '[]'::jsonb, 'dry', 1, 38),
(150139, 15014, 'text_input', 'em"> 38     rainforest’, which is: 
 
 – a  <strong', '[]'::jsonb, 'simple', 1, 39),
(150140, 15014, 'text_input', 'rong id="ielts-listening-question-number-39" class="ielts-listening-question-number">39     Ecosystem 
 – an ideal environment for the  <strong', '[]'::jsonb, 'nest / nests', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
