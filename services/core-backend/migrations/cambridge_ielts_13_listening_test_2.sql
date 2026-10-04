-- Cambridge IELTS 13 Academic Listening Test 2
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1302, 'Cambridge IELTS 13 Academic Listening Test 2', 'Rasmiy Cambridge IELTS 13 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(13021, 1302, 'listening', 'Listening Part 1: South City Cycling Club', '<div class="ielts-reading-container">
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
<p class="ielts-listening-transcript-subhead"><strong><strong>South City Cycling Club</strong></strong></p>
</td>
</tr>
<tr>
<td width="623"><em>Example</em></p>
<p>Name of club secretary: Jim …..<em>Hunter</em>…..</td>
</tr>
<tr>
<td width="623"><strong>Membership</strong></p>
<ul>
<li>Full membership costs $260; this covers cycling and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span> all over Australia</li>
<li>Recreational membership costs $108</li>
<li>Cost of membership includes the club fee and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>The club kit is made by a company called <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Training rides</strong></p>
<ul>
<li>Chance to improve cycling skills and fitness</li>
<li>Level B: speed about <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span> kph</li>
<li>Weekly sessions</li>
</ul>
<p>–  Tuesdays at 5.30 am, meet at the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>–  Thursdays at 5.30 am, meet at the entrance to the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p><strong>Further information</strong></p>
<ul>
<li>Rides are about an hour and a half</li>
<li>Members often have <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span> together afterwards</li>
<li>There is not always a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span> with the group on these rides</li>
<li>Check and print the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span> on the website beforehand</li>
<li>Bikes must have <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span></li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12413-cambridge-ielts-13-academic-listening-2-audio-1.mp3', 'JIM: Hello, South City Cycling Club.
WOMAN: Oh, hi. Er … I want to find out about joining the club.
JIM: Right. I can help you there. I’m the club secretary and my name’s Jim Hunter.
WOMAN: Oh, hi Jim.
JIM: So, are you interested in membership for yourself?
WOMAN: That’s right.
JIM: OK. Well there are basically two types of adult membership. If you’re pretty serious about cycling, there’s the Full membership. That costs 260 dollars and that covers you not just for ordinary cycling but also for races both here in the city and also in other parts of Australia.
WOMAN: Right. Well, I’m not really up to that standard. I was more interested in just joining a group to do some cycling in my free time.
JIM: Sure. That’s why most people join. So, in that case you’d be better with the Recreational membership. That’s 108 dollars if you’re over 19, and 95 dollars if you’re under.
WOMAN: I’m 25.
JIM: OK. It’s paid quarterly, and you can upgrade it later to the Full membership if you want to, of course. Now both types of membership include the club fee of 20 dollars. They also provide insurance in case you have an accident, though we hope you won’t need that, of course.
WOMAN: No. OK, well, I’ll go with the Recreational membership, I think. And that allows me to join in the club activities, and so on?
JIM: That’s right. And once you’re a member of the club, you’re also permitted to wear our kit when you’re out cycling. It’s green and white.
WOMAN: Yes, I’ve seen cyclists wearing it. So, can I buy that at the club?
JIM: No, it’s made to order by a company in Brisbane. You can find them online: they’re called Jerriz. That’s J-E-R-R-I-Z. You can use your membership number to put in an order on their website.
WOMAN: OK. Now, can you tell me a bit about the rides I can do?
JIM: Sure. So we have training rides pretty well every morning, and they’re a really good way of improving your cycling skills as well as your general level of fitness, but they’re different levels. Level A is pretty fast – you’re looking at about 30 or 35 kilometres an hour. If you can do about 25 kilometres an hour, you’d probably be level B, and then level C are the novices, who stay at about 15 kilometres per hour.
WOMAN: Right. Well I reckon I’d be level B. So, when are the sessions for that level?
JIM: There are a couple each week. They’re both early morning sessions. There’s one on Tuesdays, and for that one you meet at 5.30 am, and the meeting point’s the stadium – do you know where that is?
WOMAN: Yes, it’s quite near my home, in fact. OK, and how about the other one?
JIM: That’s on Thursdays. It starts at the same time, but they meet at the main gate to the park.
WOMAN: Is that the one just past the shopping mall?
JIM: That’s it.
————————
WOMAN: So how long are the rides?
JIM: They’re about an hour and a half. So, if you have a job it’s easy to fit in before you go to work. And the members often go somewhere for coffee afterwards, so it’s quite a social event.
WOMAN: OK. That sounds good. I’ve only just moved to the city so I don’t actually know many people yet.
JIM: Well, it’s a great way to meet people.
WOMAN: And does each ride have a leader?
JIM: Sometimes, but not always. But you don’t really need one; the group members on the ride support one another, anyway.
WOMAN: How would we know where to go?
JIM: If you check the club website, you’ll see that the route for each ride is clearly marked. So you can just print that out and take it along with you. It’s similar from one week to another, but it’s not always exactly the same.
WOMAN: And what do I need to bring?
JIM: Well, bring a bottle of water, and your phone. You shouldn’t use if while you’re cycling, buy have it with you.
WOMAN: Right.
JIM: And in winter, it’s well before sunrise when we set out, so you need to make sure your bike’s got lights.
WOMAN: That’s OK. Well, thanks Jim. I’d definitely like to join. So what’s the best way of going about it?
JIM: You can …', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(130201, 13021, 'text_input', 'Membership  
 
 Full membership costs $260; this covers cycling and  <strong', '[]'::jsonb, 'races', 1, 1),
(130202, 13021, 'text_input', '-question-number">1     all over Australia 
 Recreational membership costs $108 
 Cost of membership includes the club fee and  <strong', '[]'::jsonb, 'insurance', 1, 2),
(130203, 13021, 'text_input', 'trong id="ielts-listening-question-number-2" class="ielts-listening-question-number">2     
 The club kit is made by a company called  <strong', '[]'::jsonb, 'Jerriz', 1, 3),
(130204, 13021, 'text_input', '>3     
 
  Training rides  
 
 Chance to improve cycling skills and fitness 
 Level B: speed about  <strong', '[]'::jsonb, '25 / twenty-five', 1, 4),
(130205, 13021, 'text_input', '30 am, meet at the  <strong', '[]'::jsonb, 'stadium', 1, 5),
(130206, 13021, 'text_input', '30 am, meet at the entrance to the  <strong', '[]'::jsonb, 'park', 1, 6),
(130207, 13021, 'text_input', 'estion-number">6     
  Further information  
 
 Rides are about an hour and a half 
 Members often have  <strong', '[]'::jsonb, 'coffee', 1, 7),
(130208, 13021, 'text_input', 'rong id="ielts-listening-question-number-7" class="ielts-listening-question-number">7     together afterwards 
 There is not always a  <strong', '[]'::jsonb, 'leader', 1, 8),
(130209, 13021, 'text_input', '"ielts-listening-question-number-8" class="ielts-listening-question-number">8     with the group on these rides 
 Check and print the  <strong', '[]'::jsonb, 'route', 1, 9),
(130210, 13021, 'text_input', 'rong id="ielts-listening-question-number-9" class="ielts-listening-question-number">9     on the website beforehand 
 Bikes must have  <strong', '[]'::jsonb, 'lights', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(13022, 1302, 'listening', 'Listening Part 2: Information on company volunteering projects', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-16                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Information on company volunteering projects</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="11"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong><span class="ielts-q-title"><span>How much time for volunteering does the company allow per employee?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="A"><span class="ielts-radio-text"><strong>A</strong> two hours per week</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="B"><span class="ielts-radio-text"><strong>B</strong> one day per month</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="C"><span class="ielts-radio-text"><strong>C</strong> 8 hours per year</span></label></div></div><div class="ielts-standalone-q" data-qnum="12"><div class="ielts-q-header"><strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>In feedback almost all employees said that volunteering improved their</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="A"><span class="ielts-radio-text"><strong>A</strong> chances of promotion.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="B"><span class="ielts-radio-text"><strong>B</strong> job satisfaction.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="C"><span class="ielts-radio-text"><strong>C</strong> relationships with colleagues.</span></label></div></div><div class="ielts-standalone-q" data-qnum="13"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong><span class="ielts-q-title"><span>Last year some staff helped unemployed people with their</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="A"><span class="ielts-radio-text"><strong>A</strong> literacy skills.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="B"><span class="ielts-radio-text"><strong>B</strong> job applications.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="C"><span class="ielts-radio-text"><strong>C</strong> communication skills.</span></label></div></div><div class="ielts-standalone-q" data-qnum="14"><div class="ielts-q-header"><strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>This year the company will start a new volunteering project with a local</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="A"><span class="ielts-radio-text"><strong>A</strong> school.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="B"><span class="ielts-radio-text"><strong>B</strong> park.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="C"><span class="ielts-radio-text"><strong>C</strong> charity.</span></label></div></div><div class="ielts-standalone-q" data-qnum="15"><div class="ielts-q-header"><strong class="ielts-q-badge">15</strong><span class="ielts-q-title"><span>Where will the Digital Inclusion Day be held?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="A"><span class="ielts-radio-text"><strong>A</strong> at the company’s training facility</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="B"><span class="ielts-radio-text"><strong>B</strong> at a college</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="C"><span class="ielts-radio-text"><strong>C</strong> in a community centre</span></label></div></div><div class="ielts-standalone-q" data-qnum="16"><div class="ielts-q-header"><strong class="ielts-q-badge">16</strong><span class="ielts-q-title"><span>What should staff do if they want to take part in the Digital Inclusion Day?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="A"><span class="ielts-radio-text"><strong>A</strong> fill in a form</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="B"><span class="ielts-radio-text"><strong>B</strong> attend a training workshop</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="C"><span class="ielts-radio-text"><strong>C</strong> get permission from their manager</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 17-18                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="17,18"><div class="ielts-q-header"><strong class="ielts-q-badge">17</strong> <strong class="ielts-q-badge">18</strong><span class="ielts-q-title"><span>What  things are mentioned about the participants on the last Digital Inclusion Day?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> They were all over 70.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> They never used their computer.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> Their phones were mostly old-fashioned.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> They only used their phones for making calls.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> They initially showed little interest.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 19-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="19,20"><div class="ielts-q-header"><strong class="ielts-q-badge">19</strong> <strong class="ielts-q-badge">20</strong><span class="ielts-q-title"><span>What  activities on the last Digital Inclusion Day did participants describe as useful?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> learning to use tables</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> communicating with family</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> shopping online</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> playing online games</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> sending emails</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12412-cambridge-ielts-13-academic-listening-2-audio-2.mp3', 'Thanks for coming everyone. OK, so this meeting is for new staff and staff who haven’t been involved with our volunteering projects yet. So basically, the idea is that we allow staff to give up some of their work time to help on various charity projects to benefit the local community. We’ve been doing this for the last five years and it’s been very successful.
Participating doesn’t necessarily involve a huge time commitment. The company will pay for eight hours of your time. That can be used over one or two days all at once, or spread over several months throughout the year. There are some staff who enjoy volunteering so much they also give up their own free time for a couple of hours every week. It’s completely up to you. Obviously, many people will have family commitments and aren’t as available as other members of staff.
Feedback from staff has been overwhelmingly positive. Because they felt they were doing something really useful, nearly everyone agreed that volunteering made them feel more motivated at work. They also liked building relationships with the people in the local community and felt valued by them. One or two people also said it was a good thing to have on their CVs.
One particularly successful project last year was the Get Working Project. This was aimed at helping unemployed people in the area get back to work. Our staff were able to help them improve their telephone skills, such as writing down messages and speaking with confidence to potential customers, which they had found quite difficult. This is something many employers look for in job applicants – and something we all do without even thinking about, every day at work.
We’ve got an exciting new project starting this year. Up until now, we’re mainly focused on projects to do with education and training. And we’ll continue with out reading project in schools and our work with local charities. But we’re also agreed to help out on a conservation project in Redfern Park. So if any of you fancy being outside and getting your hands dirty, this is the project for you.
I also want to mention the annual Digital Inclusion Day, which is coming up next month. The aim of this is to help older people keep up with technology. And this year, instead of hosting the event in our own training facility, we’re using the ICT suite at Hill College, as it can hold far more people.
We’ve invited over 60 people from the Silver Age Community Centre to take part, so we’ll need a lot of volunteers to help with this event.
If you’re interested in taking part, please go to the volunteering section of our website and complete the relevant form. We won’t be providing any training for this but you’ll be paired with an experienced volunteer if you’ve never done it before. By the way, don’t forget to tell your manager about any volunteering activities you decide to do.
——————
The participants on the Digital Inclusion Day really benefited. The majority were in their seventies, though some where younger and a few were even in their nineties! Quite a few owned both a computer and a mobile phone, but these tended to be outdated model. They generally knew how to do simple things, like send texts, but weren’t aware of recent developments in mobile phone technology. A few were keen to learn but most were quite dismissive at first – they couldn’t see the point of updating their skills. But that soon changed.
The feedback was very positive. The really encouraging thing was that participants all said they felt much more confident about using social media to keep in touch with their grandchildren, who prefer this form of communication to phoning or sending emails. A lot of them also said playing online games would help them make new friends and keep their brains active. They weren’t that impressed with being able to order their groceries online, as they liked going out to the shops, but some said it would come in handy if they were ill or the weather was really bad. One thing they asked about was using tablets for things like reading newspapers – some people had been given tablets as presents but had never used them, so that’s something we’ll make sure we include this time …', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(130211, 13022, 'single_choice', 'How much time for volunteering does the company allow per employee?', '["A", "B", "C"]'::jsonb, 'C', 1, 11),
(130212, 13022, 'single_choice', 'In feedback almost all employees said that volunteering improved their', '["A", "B", "C"]'::jsonb, 'B', 1, 12),
(130213, 13022, 'single_choice', 'Last year some staff helped unemployed people with their', '["A", "B", "C"]'::jsonb, 'C', 1, 13),
(130214, 13022, 'single_choice', 'This year the company will start a new volunteering project with a local', '["A", "B", "C"]'::jsonb, 'B', 1, 14),
(130215, 13022, 'single_choice', 'Where will the Digital Inclusion Day be held?', '["A", "B", "C"]'::jsonb, 'B', 1, 15),
(130216, 13022, 'single_choice', 'What should staff do if they want to take part in the Digital Inclusion Day?', '["A", "B", "C"]'::jsonb, 'A', 1, 16),
(130217, 13022, 'multiple_choice', 'Question 17', '["A", "B", "C", "D", "E"]'::jsonb, 'C / E', 1, 17),
(130218, 13022, 'multiple_choice', 'What&nbsp; TWO &nbsp;things are mentioned about the participants on the last Digital Inclusion Day?', '["A", "B", "C", "D", "E"]'::jsonb, 'C / E', 1, 18),
(130219, 13022, 'multiple_choice', 'Question 19', '["A", "B"]'::jsonb, 'B / D', 1, 19),
(130220, 13022, 'multiple_choice', 'What&nbsp; TWO &nbsp;activities on the last Digital Inclusion Day did participants describe as useful?', '["A", "B"]'::jsonb, 'B / D', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(13023, 1302, 'listening', 'Listening Part 3: Planning a presentation on nanotechnology', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-25                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Planning a presentation on nanotechnology</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="21"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong><span class="ielts-q-title"><span>Russ says that his difficulty in planning the presentation is due to</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="A"><span class="ielts-radio-text"><strong>A</strong> his lack of knowledge about the topic.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="B"><span class="ielts-radio-text"><strong>B</strong> his uncertainly about what he should try to achieve.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="C"><span class="ielts-radio-text"><strong>C</strong> the short time that he has for preparation.</span></label></div></div><div class="ielts-standalone-q" data-qnum="22"><div class="ielts-q-header"><strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>Russ and his tutor agree that his approach in the presentation will be</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="A"><span class="ielts-radio-text"><strong>A</strong> to concentrate on how nanotechnology is used in one field.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="B"><span class="ielts-radio-text"><strong>B</strong> to follow the chronological development of nanotechnology.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="C"><span class="ielts-radio-text"><strong>C</strong> to show the range of applications of nanotechnology.</span></label></div></div><div class="ielts-standalone-q" data-qnum="23"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong><span class="ielts-q-title"><span>In connection with slides, the tutor advises Russ to</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="A"><span class="ielts-radio-text"><strong>A</strong> talk about things that he can find slides to illustrate.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="B"><span class="ielts-radio-text"><strong>B</strong> look for slides to illustrate the points he makes.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="C"><span class="ielts-radio-text"><strong>C</strong> consider omitting slides altogether.</span></label></div></div><div class="ielts-standalone-q" data-qnum="24"><div class="ielts-q-header"><strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>They both agree that the best way for Russ to start his presentation is</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="A"><span class="ielts-radio-text"><strong>A</strong> to encourage the audience to talk.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="B"><span class="ielts-radio-text"><strong>B</strong> to explain what Russ intends to do.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="C"><span class="ielts-radio-text"><strong>C</strong> to provide an example.</span></label></div></div><div class="ielts-standalone-q" data-qnum="25"><div class="ielts-q-header"><strong class="ielts-q-badge">25</strong><span class="ielts-q-title"><span>What does the tutor advise Russ to do next while preparing his presentation?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="A"><span class="ielts-radio-text"><strong>A</strong> summarise the main point he wants to make</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="B"><span class="ielts-radio-text"><strong>B</strong> read the notes he has already made</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="C"><span class="ielts-radio-text"><strong>C</strong> list the topics he wants to cover</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 26-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What comments do the speakers make about each of the following aspects of Russ’s previous presentation?</p>
<p><em>Choose <strong>FIVE</strong> answers from the box and write the correct letter, <strong>A-G</strong>, next to Questions.</em></p>
<p><strong>Comments</strong></p>
<p><strong>Aspects of Russ’s previous presentation</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>structure</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">26</strong><select data-qnum="26" name="question_26" class="ielts-inline-select"><option value="">[ 26 ] Tanlang...</option><option value="A. lacked a conclusion">A. lacked a conclusion</option><option value="B. useful in the future">B. useful in the future</option><option value="C. not enough">C. not enough</option><option value="D. sometimes distracting">D. sometimes distracting</option><option value="E. showed originality">E. showed originality</option><option value="F. covered a wide range">F. covered a wide range</option><option value="G. not too technical">G. not too technical</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>eye contact</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. lacked a conclusion">A. lacked a conclusion</option><option value="B. useful in the future">B. useful in the future</option><option value="C. not enough">C. not enough</option><option value="D. sometimes distracting">D. sometimes distracting</option><option value="E. showed originality">E. showed originality</option><option value="F. covered a wide range">F. covered a wide range</option><option value="G. not too technical">G. not too technical</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>body language</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">28</strong><select data-qnum="28" name="question_28" class="ielts-inline-select"><option value="">[ 28 ] Tanlang...</option><option value="A. lacked a conclusion">A. lacked a conclusion</option><option value="B. useful in the future">B. useful in the future</option><option value="C. not enough">C. not enough</option><option value="D. sometimes distracting">D. sometimes distracting</option><option value="E. showed originality">E. showed originality</option><option value="F. covered a wide range">F. covered a wide range</option><option value="G. not too technical">G. not too technical</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>choice of words</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">29</strong><select data-qnum="29" name="question_29" class="ielts-inline-select"><option value="">[ 29 ] Tanlang...</option><option value="A. lacked a conclusion">A. lacked a conclusion</option><option value="B. useful in the future">B. useful in the future</option><option value="C. not enough">C. not enough</option><option value="D. sometimes distracting">D. sometimes distracting</option><option value="E. showed originality">E. showed originality</option><option value="F. covered a wide range">F. covered a wide range</option><option value="G. not too technical">G. not too technical</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>handouts</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">30</strong><select data-qnum="30" name="question_30" class="ielts-inline-select"><option value="">[ 30 ] Tanlang...</option><option value="A. lacked a conclusion">A. lacked a conclusion</option><option value="B. useful in the future">B. useful in the future</option><option value="C. not enough">C. not enough</option><option value="D. sometimes distracting">D. sometimes distracting</option><option value="E. showed originality">E. showed originality</option><option value="F. covered a wide range">F. covered a wide range</option><option value="G. not too technical">G. not too technical</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12405">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. lacked a conclusion">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">lacked a conclusion</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. useful in the future">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">useful in the future</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. not enough">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">not enough</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. sometimes distracting">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">sometimes distracting</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. showed originality">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">showed originality</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. covered a wide range">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">covered a wide range</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. not too technical">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">not too technical</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12411-cambridge-ielts-13-academic-listening-2-audio-3.mp3', 'TUTOR: Ah … come in, Russ.
RUSS: Thank you.
TUTOR: Now you wanted to consult me about your class presentation on nanotechnology – you’re due to give it in next week, aren’t you?
RUSS: That’s right. And I’m really struggling. I chose the topic because I didn’t know much about it and wanted to learn more, but now I’ve read so much about it, in a way there’s too much to say – I could talk for much longer than the twenty minutes I’ve been allocated. Should I assume the other students don’t know much, and give them a kind of general introduction, or should I try and make them share my fascination with a particular aspect?
TUTOR: You could do either, but you’ll need to have it clear in your own mind.
RUSS: Then I think I’ll give an overview.
TUTOR: OK. Now, one way of approaching this is to work through developments in chronological order.
RUSS: Uh-huh.
TUTOR: On the other hand, you could talk about the numerous ways that nanotechnology is being applied.
RUSS: You mean things like thin films on camera displays to make them water-repellent, and additives to make motorcycle helmets stronger and lighter.
TUTOR: Exactly. Or another way would be to focus on its impact in one particular area, say medicine, or space exploration.
RUSS: That would make it easier to focus. Perhaps I should do that.
TUTOR: I think that would be a good idea.
RUSS: Right. How important is it to include slides in the presentation?
TUTOR: They aren’t essential, by any means. And there’s a danger of tailoring what you say to fit whatever slides you can find. While it can be good to includes slides, you could end up spending too long looking for suitable ones. You might find it better to leave them out.
RUSS: I see. Another thing I was wondering about was how to start. I know presentations often begin with ‘First I’m going to talk about this, and then I’ll talk about that’, but I thought about asking the audience what they know about nanotechnology.
TUTOR: That would be fine if you had an hour or two for the presentation, but you might find that you can’t do anything with the answers you get, and it simply eats into the short time that’s available.
RUSS: So, maybe I should mention a particular way that nanotechnology is used, to focus people’s attention.
TUTOR: That sounds sensible.
RUSS: What do you think I should do next? I really have to plan the presentation today and tomorrow.
TUTOR: Well, initially I think you should ignore all the notes you’ve made, take a small piece of paper, and write a single short sentence that ties together the whole presentation: it can be something as simple as ‘Nanotechnology is already improving our lives’. Then start planning the content around that. You can always modify that sentence later, if you need to.
RUSS: OK.
————————————
TUTOR: OK, now let’s think about actually giving the presentation. You’ve only given one before, if I remember correctly, about an experiment you’d been involved in.
RUSS: That’s right. It was pretty rubbish!
TUTOR: Let’s say it was better in some respects than in others. With regard to the structure. I felt that you ended rather abruptly, without rounding it off. Be careful not to do that in next week’s presentation.
RUSS: OK.
TUTOR: And you made very little eye contact with the audience, because you were looking down at your notes most of the time. You need to be looking at the audience and only occasionally glancing at your notes.
RUSS: Mmm.
TUTOR: Your body language was a little odd. Every time you showed a slide, you turned your back on the audience so you could look at it – you should have been looking at your laptop. And you kept scratching your head, so I found myself wondering when you were next going to do that, instead of listening to what you were saying!
RUSS: Oh dear. What did you think of the language? I knew that not everyone was familiar with the subject, so I tried to make it as simple as I could.
TUTOR: Yes, that came across. You used a few words that are specific to the field, but you always explained what they meant, so the audience wouldn’t have had any difficulty understanding.
RUSS: Uh-huh.
TUTOR: I must say the handouts you prepared were well thought out. They were a good summary of your presentation, which people would be able to refer to later on. So well done on that.
RUSS: Thank you.
TUTOR: Well, I hope that helps you with next week’s presentation.
RUSS: Yes, it will. Thanks a lot.
TUTOR: I’ll look forward to seeing a big improvement, then.', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(130221, 13023, 'single_choice', 'Russ says that his difficulty in planning the presentation is due to', '["A", "B", "C"]'::jsonb, 'B', 1, 21),
(130222, 13023, 'single_choice', 'Russ and his tutor agree that his approach in the presentation will be', '["A", "B", "C"]'::jsonb, 'A', 1, 22),
(130223, 13023, 'single_choice', 'In connection with slides, the tutor advises Russ to', '["A", "B", "C"]'::jsonb, 'C', 1, 23),
(130224, 13023, 'single_choice', 'They both agree that the best way for Russ to start his presentation is', '["A", "B", "C"]'::jsonb, 'C', 1, 24),
(130225, 13023, 'single_choice', 'What does the tutor advise Russ to do next while preparing his presentation?', '["A", "B", "C"]'::jsonb, 'A', 1, 25),
(130226, 13023, 'single_choice', 'Question 26', '["A", "B", "C"]'::jsonb, 'A', 1, 26),
(130227, 13023, 'single_choice', 'Question 27', '["A", "B", "C"]'::jsonb, 'C', 1, 27),
(130228, 13023, 'single_choice', 'Question 28', '["A", "B", "C"]'::jsonb, 'D', 1, 28),
(130229, 13023, 'single_choice', 'Question 29', '["A", "B", "C"]'::jsonb, 'G', 1, 29),
(130230, 13023, 'single_choice', 'Question 30', '["A", "B", "C"]'::jsonb, 'B', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(13024, 1302, 'listening', 'Listening Part 4', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write <strong>ONE WORD ONLY</strong> for each answer.</p>
<p><strong>Episodic memory</strong></p>
<ul>
<li>the ability to recall details, e.g. the time and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span> of past events</li>
<li>different to semantic memory – the ability to remember general information about the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span>, which does not involve recalling <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span> information</li>
</ul>
<p><strong>Forming episodic memories involves three steps:</strong></p>
<p><strong>Encoding</strong></p>
<ul>
<li>involves receiving and processing information</li>
<li>the more <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> Given to an event, the more successfully it can be encoded</li>
<li>to remember a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span>, it is useful to have a strategy for encoding such information</li>
</ul>
<p><strong>Consolidation</strong></p>
<ul>
<li>how memories are strengthened and stored</li>
<li>most effective when memories can be added to a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> Of related information</li>
<li>the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span> Of retrieval affects the strength of memories</li>
</ul>
<p><strong>Retrieval</strong></p>
<ul>
<li>memory retrieval often depends on using a prompt, e.g. the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> Of an object near to the place where you left your car</li>
</ul>
<p><strong>Episodic memory impairments</strong></p>
<ul>
<li>these affect people with a wide range of medical conditions</li>
<li>games which stimulate the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span> have been found to help people with schizophrenia</li>
<li>children with autism may have difficulty forming episodic memories – possibly because their concept of the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span> may be absent</li>
<li>memory training may help autistic children develop social skills</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12410-cambridge-ielts-13-academic-listening-2-audio-4.mp3', 'Today, we’ll be continuing the series of lectures on memory by focusing on what is called episodic memory and what can happen if this is not working properly.
Episodic memory refers to the memory of an event or ‘episode’. Episodic memories allow us to mentally travel back in time to an event from the past. Episodic memories include various details about these events, for example, when an event happened and other information such as the location. To help understand this concept, try to remember the last time you ate dinner at a restaurant. The ability to remember where you ate, who you were with and the items you ordered are all features of an episodic memory.
Episodic memory is distinct from another type of memory called semantic memory. This is the type of factual memory that we have in common with everyone else – that is your general knowledge of the world. To build upon a previous example, remembering where you parked your car is an example of episodic memory, but your understanding of what a car is and how an engine works are examples of sematic memory. Unlike episodic memory, semantic memory isn’t dependent on recalling personal experiences.
Episodic memory can be thought of as a process with several different steps of memory processing: encoding, consolidation and retrieval.
The initial step is called encoding. This involves the process of receiving and registering information, which is necessary for creating memories of information or events that you experience. The degree to which you can successfully encode information depends on the level of attention you give to an event while it’s actually happening. Being distracted can make effective encoding very difficult. Encoding of episodic memories is also influenced by how you process the event. For example, if you were introduced to someone called Charlie, you might make the connection that your uncle has the same name. Future recollection of Charlie’s name is much easier if you have a strategy to help you encode it.
Memory consolidation, the next step in forming an episodic memory, is the process by which memories of encoded information are strengthened, stabilised and stored to facilitate later retrieval. Consolidation is most effective when the information being stored can be linked to an existing network of information. Consolidation makes it possible for you to store memories for later retrieval indefinitely. Forming strong memories depends on the frequency with which you try to retrieve them. Memories can fade or become harder to retrieve if they aren’t used very often.
The last step in forming episodic memories is called retrieval, which is the conscious recollection of encoded information. Retrieving information from episodic memory depends upon semantic, olfactory, auditory and visual factors. These help episodic memory retrieval by acting as a prompt. For example, when recalling where you parked your car you may use the colour of a sign close to where you parked. You actually have to mentally travel back to the moment you parked.
——————
There are a wide range of neurological diseases and conditions that can affect episodic memory. These range from Alzheimer’s to schizophrenia to autism. An impairment of episodic memory can have a profound effect on individuals’ lives. For example, the symptoms of schizophrenia can be reasonably well controlled by medication; however, patients’ episodic memory may still be impaired and so they are often unable to return to university or work. Recent studies have shown that computer- assisted games designed to keep the brain active can help improve their episodic memory.
Episodic memories can help people connect with others, for instance by sharing intimate details about their past; something individuals with autism often have problems with. This may be caused by an absence of a sense of self. This is essential for the storage of episodic memory, and has been found to be impaired in children with autism. Research has shown that treatments that improve memory may also have a positive impact on children’s social development.
One study looked at a …', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(130231, 13024, 'text_input', 'the time and  <strong', '[]'::jsonb, 'location', 1, 31),
(130232, 13024, 'text_input', 'tening-question-number">31     of past events 
 different to semantic memory – the ability to remember general information about the  <strong', '[]'::jsonb, 'world', 1, 32),
(130233, 13024, 'text_input', 'tion-item"> 32    , which does not involve recalling  <strong', '[]'::jsonb, 'personal', 1, 33),
(130234, 13024, 'text_input', 'id="ielts_listening_answer_12407_3" aria-label="Question 33" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  information 
 
  Forming episodic memories involves three steps:  
  Encoding  
 
 involves receiving and processing information 
 the more  <strong', '[]'::jsonb, 'attention', 1, 34),
(130235, 13024, 'text_input', 'number-34" class="ielts-listening-question-number">34     Given to an event, the more successfully it can be encoded 
 to remember a  <strong', '[]'::jsonb, 'name', 1, 35),
(130236, 13024, 'text_input', 'ing_answer_12407_5" aria-label="Question 35" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off"> , it is useful to have a strategy for encoding such information 
 
  Consolidation  
 
 how memories are strengthened and stored 
 most effective when memories can be added to a  <strong', '[]'::jsonb, 'network', 1, 36),
(130237, 13024, 'text_input', 'on-item"> 36     Of related information 
 the  <strong', '[]'::jsonb, 'frequency', 1, 37),
(130238, 13024, 'text_input', 'the  <strong', '[]'::jsonb, 'colour / color', 1, 38),
(130239, 13024, 'text_input', 'answer_12407_8" aria-label="Question 38" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  Of an object near to the place where you left your car 
 
  Episodic memory impairments  
 
 these affect people with a wide range of medical conditions 
 games which stimulate the  <strong', '[]'::jsonb, 'brain', 1, 39),
(130240, 13024, 'text_input', 'me="ielts_listening_answer_12407_9" id="ielts_listening_answer_12407_9" aria-label="Question 39" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  have been found to help people with schizophrenia 
 children with autism may have difficulty forming episodic memories – possibly because their concept of the  <strong', '[]'::jsonb, 'self', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
