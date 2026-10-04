-- Cambridge IELTS 15 Academic Listening Test 3
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1503, 'Cambridge IELTS 15 Academic Listening Test 3', 'Rasmiy Cambridge IELTS 15 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(15031, 1503, 'listening', 'Listening Part 1: Employment Agency: Possible Jobs', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-10                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Employment Agency: Possible Jobs</strong></strong></p>
<p><strong>First Job</strong></p>
<p>Administrative assistant in a company that produces <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span> (North London)</p>
<p>Responsibilities</p>
<ul>
<li>data entry</li>
<li>go to <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span> and take notes</li>
<li>general admin</li>
<li>management of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p>Requirements</p>
<ul>
<li>good computer skills including spreadsheets</li>
<li>good interpersonal skills</li>
<li>attention to <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p>Experience</p>
<ul>
<li>need a minimum of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span> of experience of teleconferencing</li>
</ul>
<p><strong>Second Job</strong></p>
<p>Warehouse assistant in South London</p>
<p>Responsibilities</p>
<ul>
<li>stock management</li>
<li>managing <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p>Requirements</p>
<ul>
<li>ability to work with numbers</li>
<li>good computer skills</li>
<li>very organised and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>good communication skills</li>
<li>used to working in a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>able to cope with items that are <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p>Need experience of</p>
<ul>
<li>driving in London</li>
<li>warehouse work</li>
<li><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span> service</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/26103-cambridge-ielts-15-academic-listening-3-audio-1.mp3', 'SALLY: Good morning. Thanks for coming in to see us here at the agency, Joe. I’m one of the agency representatives, and my name’s Sally Baker.
JOE: Hi Sally. I think we spoke on the phone, didn’t we?
SALLY: That’s right, we did. So thank you for sending in your CV. We’ve had quite a careful look at it and I think we have two jobs that might be suitable for you.
JOE: OK.
SALLY: The first one is in a company based in North London. They’re looking for an administrative assistant.
JOE: OK. What sort of company is it?
SALLY: They’re called Home Solutions and they design and make furniture.
JOE: Oh, I don’t know much about that, but it sounds interesting.
SALLY: Yes, well as I said, they want someone in their office, and looking at your past experience it does look as if you fit quite a few of the requirements. So on your CV it appears you’ve done some data entry?
JOE: Yes.
SALLY: So that’s one skill they want. Then they expect the person they appoint to attend meetings and take notes there …
JOE: OK. I’ve done that before, yes.
SALLY: And you’d need to be able to cope with general admin.
JOE: Filling, and keeping records and so on? That should be OK. And in my last job I also had to manage the diary.
SALLY: Excellent. That’s something they want here too. I’d suggest you add it to your CV – I don’t think you mentioned that, did you?
JOE: No.
SALLY: So as far as the requirements go, they want good computer skills, of course, and they particularly mention spreadsheets.
JOE: That should be fine.
SALLY: And interpersonal skills – which would be something they’d check with your references.
JOE: I think that should be OK, yes.
SALLY: Then they mention that they want someone who is careful and takes care with details – just looking at your CV, I’d say you’re probably alright there.
JOE: I think so, yes. Do they want any special experience?
SALLY: I think they wanted some experience of teleconferencing.
JOE: I’ve got three years’ experience of that.
SALLY: let’s see, yes, good. In fact they’re only asking for at least one year, so that’s great. So is that something that might interest you?
JOE: It is, yes. The only thing is, you said they were in North London so it would be quite a long commute for me.
SALLY: OK.
————————
SALLY: So the second position might suit you better as far as the location goes; that’s for a warehouse assistant and that’s in South London.
JOE: Yes, that would be a lot closer.
SALLY: And you’ve worked in a warehouse before, haven’t you?
JOE: Yes.
SALLY: So as far as the responsibilities for this position go, they want someone who can manage the stock, obviously, and also deliveries.
JOE: That should be OK. You’ve got to keep track of stuff, but I’ve always been quite good with numbers.
SALLY: Good, that’s their first requirement. And they want someone who’s computer literate, which we know you are.
JOE: Sure.
SALLY: Then they mention organisational skills. They want someone who’s well organised.
JOE: Yes, I think I am.
SALLY: And tidy?
JOE: Yes, they go together really, don’t they?
SALLY: Sure. Then the usual stuff; they want someone who can communicate well both orally and in writing.
JOE: OK. And for the last warehouse job I had, one of the things I enjoyed most was being part of a team. I found that was really essential for the job.
SALLY: Excellent. Yes, they do mention that they want someone who’s used to that, yes. Now when you were working in a warehouse last time, what sorts of items were you dealing with?
JOE: It was mostly bathroom and kitchen equipment, sinks and stoves and fridges.
SALLY: So you’re OK moving heavy things?
JOE: Sure. I’m quite strong, and I’ve had the training.
SALLY: Good. Now as far as experience goes, they mention they want someone with a licence, and that you have experience of driving in London – so you can cope with the traffic and so on.
JOE: Yes, no problem.
SALLY: And you’ve got experience of warehouse work … and the final thing they mention is customer service. I think looking at your CV you’ve OK there.
JOE: Right. So what about pay? Can you tell me a bit more about that, please …', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(150301, 15031, 'text_input', 'Employment Agency: Possible Jobs   
  First Job  
 Administrative assistant in a company that produces  <strong', '[]'::jsonb, 'furniture', 1, 1),
(150302, 15031, 'text_input', 'estion-number-1" class="ielts-listening-question-number">1     (North London) 
 Responsibilities 
 
 data entry 
 go to  <strong', '[]'::jsonb, 'meetings', 1, 2),
(150303, 15031, 'text_input', 'elts-listening-question-number-2" class="ielts-listening-question-number">2     and take notes 
 general admin 
 management of  <strong', '[]'::jsonb, 'diary', 1, 3),
(150304, 15031, 'text_input', 'ong>    
 
 Requirements 
 
 good computer skills including spreadsheets 
 good interpersonal skills 
 attention to  <strong', '[]'::jsonb, 'detail / details', 1, 4),
(150305, 15031, 'text_input', 'id="ielts-listening-question-number-4" class="ielts-listening-question-number">4     
 
 Experience 
 
 need a minimum of  <strong', '[]'::jsonb, '1 year / one year', 1, 5),
(150306, 15031, 'text_input', 'er_12962_5" id="ielts_listening_answer_12962_5" aria-label="Question 5" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  of experience of teleconferencing 
 
  Second Job  
 Warehouse assistant in South London 
 Responsibilities 
 
 stock management 
 managing  <strong', '[]'::jsonb, 'deliveries', 1, 6),
(150307, 15031, 'text_input', 'number">6     
 
 Requirements 
 
 ability to work with numbers 
 good computer skills 
 very organised and  <strong', '[]'::jsonb, 'tidy', 1, 7),
(150308, 15031, 'text_input', '-listening-question-number-7" class="ielts-listening-question-number">7     
 good communication skills 
 used to working in a  <strong', '[]'::jsonb, 'team', 1, 8),
(150309, 15031, 'text_input', 'item"> 8     
 able to cope with items that are  <strong', '[]'::jsonb, 'heavy', 1, 9),
(150310, 15031, 'text_input', 'ass="ielts-listening-question-number">9     
 
 Need experience of 
 
 driving in London 
 warehouse work 
  <strong', '[]'::jsonb, 'customer', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(15032, 1503, 'listening', 'Listening Part 2: Street Play Scheme', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-16                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Street Play Scheme</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="11"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong><span class="ielts-q-title"><span>When did the Street Play Scheme first take place?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="A"><span class="ielts-radio-text"><strong>A</strong> two years ago</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="B"><span class="ielts-radio-text"><strong>B</strong> three years ago</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="C"><span class="ielts-radio-text"><strong>C</strong> six years ago</span></label></div></div><div class="ielts-standalone-q" data-qnum="12"><div class="ielts-q-header"><strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>How often is Beechwood Road closed to traffic now?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="A"><span class="ielts-radio-text"><strong>A</strong> once a week</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="B"><span class="ielts-radio-text"><strong>B</strong> on Saturdays and Sundays</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="C"><span class="ielts-radio-text"><strong>C</strong> once a month</span></label></div></div><div class="ielts-standalone-q" data-qnum="13"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong><span class="ielts-q-title"><span>Who is responsible for closing the road?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="A"><span class="ielts-radio-text"><strong>A</strong> a council official</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="B"><span class="ielts-radio-text"><strong>B</strong> the police</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="C"><span class="ielts-radio-text"><strong>C</strong> local wardens</span></label></div></div><div class="ielts-standalone-q" data-qnum="14"><div class="ielts-q-header"><strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>Residents who want to use their cars</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="A"><span class="ielts-radio-text"><strong>A</strong> have to park in another street.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="B"><span class="ielts-radio-text"><strong>B</strong> must drive very slowly</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="C"><span class="ielts-radio-text"><strong>C</strong> need permission from a warden.</span></label></div></div><div class="ielts-standalone-q" data-qnum="15"><div class="ielts-q-header"><strong class="ielts-q-badge">15</strong><span class="ielts-q-title"><span>Alice says that Street Play Schemes are most needed in</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="A"><span class="ielts-radio-text"><strong>A</strong> wealthy areas</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="B"><span class="ielts-radio-text"><strong>B</strong> quiet suburban areas.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="C"><span class="ielts-radio-text"><strong>C</strong> areas with heavy traffic.</span></label></div></div><div class="ielts-standalone-q" data-qnum="16"><div class="ielts-q-header"><strong class="ielts-q-badge">16</strong><span class="ielts-q-title"><span>What has been the reaction of residents who are not parents?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="A"><span class="ielts-radio-text"><strong>A</strong> Many of them were unhappy at first.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="B"><span class="ielts-radio-text"><strong>B</strong> They like seeing children play in the street.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="C"><span class="ielts-radio-text"><strong>C</strong> They are surprised by the lack of noise.</span></label></div></div></div>
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
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="17,18"><div class="ielts-q-header"><strong class="ielts-q-badge">17</strong> <strong class="ielts-q-badge">18</strong><span class="ielts-q-title"><span>Which  benefits for children does Alice think are the most important?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> increased physical activity</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> increased sense of independence</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> opportunity to learn new games</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> opportunity to be part of a community</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> opportunity to make new friends</span></label></div></div></div>
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
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="19,20"><div class="ielts-q-header"><strong class="ielts-q-badge">19</strong> <strong class="ielts-q-badge">20</strong><span class="ielts-q-title"><span>Which  results of the King Street experiment surprised Alice?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> more shoppers</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> improved safety</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> less air pollution</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> more relaxed atmosphere</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> less noise pollution</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/26104-cambridge-ielts-15-academic-listening-3-audio-2.mp3', 'PRESENTER:
My guest on the show today is Alice Riches who started the Street Play Scheme where she lives in Beechwood Road. For those of you that don’t already know – Street Play involves local residents closing off their street for a few hours so that children have a chance to play in the street safely. She started it in her own street, Beechwood Road, and the idea caught on, and there are now Street Play Schemes all over the city. So when did you actually start the scheme, Alice?
ALICE:
Well, I first had the idea when my oldest child was still a toddler, so that’s about six years ago now – but it took at least two years of campaigning before we were actually able to make it happen. So the scheme’s been up and running for three years now. We’d love to be able to close our road for longer – for the whole weekend, from Saturday morning until Sunday evening, for example. At the moment it’s just once a week. But when we started it was only once a month. But we’re working on it.
PRESENTER:
So what actually happens when Beechwood Road is closed?
ALICE:
We have volunteer wardens, mostly parents but some elderly residents too, who block off our road at either end. The council have provided special signs but there’s always a volunteer there to explain what’s happening to any motorists. Generally, they’re fine about it – we’ve only had to get the police involved once or twice.
Now I should explain that the road isn’t completely closed to cars. But only residents’ cars are allowed. If people really need to get in or out of Beechwood Road, it’s not a problem – as long as they drive at under 20 kilometres per hour. But most people just decide not to use their cars during this time, or they park in another street. The wardens are only there to stop through traffic.
PRESENTER:
So can anyone apply to get involved in Street Play?
ALICE:
Absolutely – we want to include all kids in the city – especially those who live on busy roads. It’s here that demand is greatest. Obviously, there isn’t such demand in wealthier areas where the children have access to parks or large gardens – or in the suburbs where there are usually more places for children to play outside.
I’d recommend that anyone listening who likes the idea should just give it a go. We’ve been surprised by the positive reaction of residents all over the city. And that’s not just parents. There are always a few who complain but they’re a tiny minority. On the whole everyone is very supportive and say they’re very happy to see children out on the street – even if it does get quite noisy.
——————
ALICE:
There have been so many benefits of Street Play for the kids. Parents really like the fact that the kids are getting fresh air instead of sitting staring at a computer screen, even if they’re not doing anything particularly energetic. And of course it’s great that kids can play with their friends outside without being supervised by their parents – but for me the biggest advantage is that kids develop confidence in themselves to be outside without their parents. The other really fantastic thing is that children get to know the adults in the street – it’s like having a big extended family.
PRESENTER:
It certainly does have a lot of benefits. I want to move on now and ask you about a related project in King Street.
ALICE:
Right. Well this was an experiment I was involved in where local residents decided to try and reduce the traffic along King Street, which is the busiest main road in our area, by persuading people not to use their cars for one day. We thought about making people pay more for parking – but we decided that would be really unpopular – so instead we just stopped people from parking on King Street but left the other car parks open.
It was surprising how much of a difference all this made. As we’d predicted, air quality was significantly better but what I hadn’t expected was how much quieter it would be – even with the buses still running. Of course everyone said they felt safer but we were actually amazed that sales in the shops went up considerably that day – we thought there’d be fewer people out shopping – not more.
PRESENTER:
That’s really interesting so the fact that …', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(150311, 15032, 'single_choice', 'When did the Street Play Scheme first take place?', '["A", "B", "C"]'::jsonb, 'B', 1, 11),
(150312, 15032, 'single_choice', 'How often is Beechwood Road closed to traffic now?', '["A", "B", "C"]'::jsonb, 'A', 1, 12),
(150313, 15032, 'single_choice', 'Who is responsible for closing the road?', '["A", "B", "C"]'::jsonb, 'C', 1, 13),
(150314, 15032, 'single_choice', 'Residents who want to use their cars', '["A", "B", "C"]'::jsonb, 'B', 1, 14),
(150315, 15032, 'single_choice', 'Alice says that Street Play Schemes are most needed in', '["A", "B", "C"]'::jsonb, 'C', 1, 15),
(150316, 15032, 'single_choice', 'What has been the reaction of residents who are not parents?', '["A", "B", "C"]'::jsonb, 'B', 1, 16),
(150317, 15032, 'multiple_choice', 'Question 17', '["A", "B", "C", "D", "E"]'::jsonb, 'B / D', 1, 17),
(150318, 15032, 'multiple_choice', 'Which&nbsp; TWO &nbsp;benefits for children does Alice think are the most important?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / D', 1, 18),
(150319, 15032, 'multiple_choice', 'Question 19', '["A", "B"]'::jsonb, 'A / E', 1, 19),
(150320, 15032, 'multiple_choice', 'Which&nbsp; TWO &nbsp;results of the King Street experiment surprised Alice?', '["A", "B"]'::jsonb, 'A / E', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(15033, 1503, 'listening', 'Listening Part 3', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-26                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write <strong>ONE WORD ONLY</strong> for each answer.</p>
<p>What Hazel should analyse about items in newspapers:</p>
<ul>
<li>what <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">21</strong><input type="text" data-qnum="21" name="question_21" class="ielts-inline-input" placeholder="[21] javob..." autocomplete="off" spellcheck="false"></span></span> the item is on</li>
<li>the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">22</strong><input type="text" data-qnum="22" name="question_22" class="ielts-inline-input" placeholder="[22] javob..." autocomplete="off" spellcheck="false"></span></span> of the item, including the headline</li>
<li>any <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">23</strong><input type="text" data-qnum="23" name="question_23" class="ielts-inline-input" placeholder="[23] javob..." autocomplete="off" spellcheck="false"></span></span> accompanying the item</li>
<li>the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">24</strong><input type="text" data-qnum="24" name="question_24" class="ielts-inline-input" placeholder="[24] javob..." autocomplete="off" spellcheck="false"></span></span> of the item, e.g. what’s made prominent</li>
<li>the writer’s main <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">25</strong><input type="text" data-qnum="25" name="question_25" class="ielts-inline-input" placeholder="[25] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">26</strong><input type="text" data-qnum="26" name="question_26" class="ielts-inline-input" placeholder="[26] javob..." autocomplete="off" spellcheck="false"></span></span> the writer may make about the reader</li>
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
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 27-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What does Hazel decide to do about each of the following types of articles?</p>
<p><em>Write the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>, next to Questions</em></p>
<p><strong>Types of articles</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>national news item</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. She will definitely look for a suitable article.">A. She will definitely look for a suitable article.</option><option value="B. She may look for a suitable article.">B. She may look for a suitable article.</option><option value="C. She definitely won’t look for an article.">C. She definitely won’t look for an article.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>editorial</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">28</strong><select data-qnum="28" name="question_28" class="ielts-inline-select"><option value="">[ 28 ] Tanlang...</option><option value="A. She will definitely look for a suitable article.">A. She will definitely look for a suitable article.</option><option value="B. She may look for a suitable article.">B. She may look for a suitable article.</option><option value="C. She definitely won’t look for an article.">C. She definitely won’t look for an article.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>human interest</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">29</strong><select data-qnum="29" name="question_29" class="ielts-inline-select"><option value="">[ 29 ] Tanlang...</option><option value="A. She will definitely look for a suitable article.">A. She will definitely look for a suitable article.</option><option value="B. She may look for a suitable article.">B. She may look for a suitable article.</option><option value="C. She definitely won’t look for an article.">C. She definitely won’t look for an article.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>arts</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">30</strong><select data-qnum="30" name="question_30" class="ielts-inline-select"><option value="">[ 30 ] Tanlang...</option><option value="A. She will definitely look for a suitable article.">A. She will definitely look for a suitable article.</option><option value="B. She may look for a suitable article.">B. She may look for a suitable article.</option><option value="C. She definitely won’t look for an article.">C. She definitely won’t look for an article.</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12973" data-allow-duplicates="true">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. She will definitely look for a suitable article.">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">She will definitely look for a suitable article.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. She may look for a suitable article.">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">She may look for a suitable article.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. She definitely won’t look for an article.">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">She definitely won’t look for an article.</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/26105-cambridge-ielts-15-academic-listening-3-audio-3.mp3', 'HAZEL: Tom, could I ask you for some advice, please?
TOM: Yes of course, if you think I can help. What’s it about?
HAZEL: It’s my first media studies assignment, and I’m not sure how to go about it. You must have done it last year.
TOM: Is that the one comparing the coverage of a particular story in a range of newspapers?
HAZEL: That’s right.
TOM: Oh yes, I really enjoyed writing it.
HAZEL: So what sort of things do I need to compare?
TOM: Well, there are several things. For example, there’s the question of which page of the newspaper the item appears on.
HAZEL: You mean, because there’s a big difference between having it on the front page and the bottom of page ten, for instance?
TOM: Exactly. And that shows how important the editor thinks the story is. Then there’s the size – how many column inches the story is given, how many columns it spreads over.
HAZEL: And I suppose that includes the headline.
TOM: It certainly does. It’s all part of attracting the reader’s attention.
HAZEL: What about graphics – whether there’s anything visual in addition to the text?
TOM: Yes, you need to consider those, too, because they can have a big effect on the reader’s understanding of the story – sometimes a bigger effect than the text itself. Then you’ll need to look at how the item is put together: what structure is it given? Bear in mind that not many people read beyond the first paragraph, so what has the journalist put at the beginning? And if, say, three are conflicting opinions about something, does one appear near the end, where people probably won’t read it?
HAZEL: And newspapers sometimes give wrong or misleading information, don’t they?
Either deliberately or by accident. Should I be looking at that, too?
TOM: Yes, if you can. Compare what’s in different versions, and as far as possible, try and work out what’s true and what isn’t. And that relates to a very important point: what’s the writer’s purpose, or at least the most important one, if they have several. It may seem to be to inform the public, but often it’s that they want to create fear, or controversy, or to make somebody look ridiculous.
HAZEL: Gosh, I see what you mean. And I suppose the writer may make assumptions about the reader.
TOM: That’s right – about their knowledge of the subject, their attitudes, and their level of education, which means writing so that the readers understand without feeling patronised. All of that will make a difference to how story is presented.
———————
HAZEL: Does it matter what type of story I write about?
TOM: No – national or international politics, the arts … Anything, as long as it’s covered in two or three newspaper. Though of course it’ll be easier and more fun if it’s something you’re interested in and know something about.
HAZEL: And on that basis a national news item would be worth analysing – I’m quite keen on politics, so I’ll try and find a suitable topic. What did you choose for your analysis, Tom?
TOM: I was interested in how newspapers express their opinions explicitly, so I wanted to compare editorials in different papers, but when I started looking. I couldn’t find two on the same topic that I felt like analysing.
HAZEL: In that case, I won’t even bother to look.
TOM: So in the end I chose a human interest story – a terribly emotional story about a young girl who was very ill, and lots of other people – mostly strangers – raised money so she could go abroad for treatment. Actually, I was surprised – some papers just wrote about how wonderful everyone was, but others considered the broader picture, like why treatment wasn’t available here.
HAZEL: Hmm, I usually find stories like that raise quite strong feelings in me! I’ll avoid that. Perhaps I’ll choose an arts topic, like different reviews of a film, or something about funding for the arts – I’ll think about that.
TOM: Yes, that might be interesting.
HAZEL: OK, well thanks a lot for your help, Tom. It’s been really useful.
TOM: You’re welcome. Good luck with the assignment, Hazel.', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(150321, 15033, 'text_input', 'What Hazel should analyse about items in newspapers: 
 
 what  <strong', '[]'::jsonb, 'page', 1, 21),
(150322, 15033, 'text_input', 'g-question-item"> 21     the item is on 
 the  <strong', '[]'::jsonb, 'size', 1, 22),
(150323, 15033, 'text_input', 'ong id="ielts-listening-question-number-22" class="ielts-listening-question-number">22     of the item, including the headline 
 any  <strong', '[]'::jsonb, 'graphic / graphics', 1, 23),
(150324, 15033, 'text_input', 'ion-item"> 23     accompanying the item 
 the  <strong', '[]'::jsonb, 'structure', 1, 24),
(150325, 15033, 'text_input', 'what’s made prominent 
 the writer’s main  <strong', '[]'::jsonb, 'purpose', 1, 25),
(150326, 15033, 'text_input', '"ielts-listening-question-item"> 25     
 the  <strong', '[]'::jsonb, 'assumption / assumptions', 1, 26),
(150327, 15033, 'single_choice', 'Question 27', '["A", "B", "C"]'::jsonb, 'A', 1, 27),
(150328, 15033, 'single_choice', 'Question 28', '["A", "B", "C"]'::jsonb, 'C', 1, 28),
(150329, 15033, 'single_choice', 'Question 29', '["A", "B", "C"]'::jsonb, 'C', 1, 29),
(150330, 15033, 'single_choice', 'Question 30', '["A", "B", "C"]'::jsonb, 'B', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(15034, 1503, 'listening', 'Listening Part 4: Early history of keeping clean', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write <strong>ONE WORD ONLY</strong> for each answer.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Early history of keeping clean</strong></strong></p>
<p><strong>Prehistoric times:</strong></p>
<ul>
<li>water was used to wash off <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Ancient Babylon</strong></p>
<ul>
<li>soap-like material found in <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> cylinders</li>
</ul>
<p><strong>Ancient Greece:</strong></p>
<ul>
<li>people cleaned themselves with sand and other substances</li>
<li>used a strigil – scraper made of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>washed clothes in streams</li>
</ul>
<p><strong>Ancient Germany and Gaul:</strong></p>
<ul>
<li>used soap to colour their <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Ancient Rome:</strong></p>
<ul>
<li>animal fat, ashes and clay mixed through action of rain, used for washing clothes</li>
<li>from about 312 BC, water carried to Roman <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span> by aqueducts</li>
</ul>
<p><strong>Europe in Middle Ages:</strong></p>
<ul>
<li>decline in bathing contributed to occurrence of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span> began to be added to soap</li>
</ul>
<p><strong>Europe from 17th century:</strong></p>
<ul>
<li>1600s: cleanliness and bathing started becoming usual</li>
<li>1791: Leblanc invented a way of making soda ash from <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>early 1800s: Chevreul turned soapmaking into a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>from 1800s, there was no longer a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span> on soap.</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/26106-cambridge-ielts-15-academic-listening-3-audio-4.mp3', 'Nowadays, we use different products for personal cleanliness, laundry, dishwashing and household cleaning, but this is very much a 20th-century development.
The origins of cleanliness date back to prehistoric times. Since water is essential for life, the earliest people lived near water and knew something about its cleansing properties – at least that it rinsed mud off their hands.
During the excavation of ancient Babylon, evidence was found that soapmaking was known as early as 2800 BC. Archaeologists discovered cylinders made of clay, with inscriptions on them saying that fats were boiled with askes. This is a method of making soap, though there’s no reference to the purpose of this material.
The early Greeks bathed for aesthetic reasons and apparently didn’t use soap. Instead, they cleaned their bodies with blocks of sand, pumice and ashes, then anointed themselves with oil, and scraped off the oil and dirt with a metal instrument known as a strigil. They also used oil mixed with ashes. Clothes were washed without soap in streams.
The ancient Germans and Gauls are also credited with discovering how to make a substance called ‘soap’, made of melted animal fat and ashes. They used this mixture to tint their hair red.
Soap got its name, according to an ancient Roman legend, from Mount Sapo, where animals were sacrificed, leaving deposits of animal fat. Rain washed these deposits, along with wood ashes, down into the clay soil along the River Tiber. Women found that this mixture greatly reduced the effort required to wash their clothes.
As Roman civilisation advance, so did bathing. The first of the famous Roman baths, supplied with water from their aqueducts, was built around 312 BC. The baths were luxurious, and bathing became very popular. And by the second century AD, the Greek physician Galen recommended soap for both medicinal and cleaning purposes.
————————
After the fall of Rome in 467 AD and the resulting decline in bathing habits, much of Europe felt the impact of filth on public health. This lack of personal cleanliness and related unsanitary living conditions were major factors in the outbreaks of disease in the Middle Ages, and especially the Black Death of the 14th century.
Nevertheless, soapmaking became an established craft in Europe, and associations of soapmakers guarded their trade secrets closely. Vegetable and animal oils were used with ashes of plants, along with perfume, apparently for the first time. Gradually more varieties of soap became available for shaving and shampooing, as well as bathing and laundering.
A major step toward large-scale commercial soapmaking occurred in 1791, when a French chemist, Nicholas Leblanc, patented a process for turning salt into soda ash, or sodium carbonate. Soda ash is the alkali obtained from ashes that combines with fat to form soap. The Leblanc process yielded quantities of good-quality, inexpensive soda ash.
Modern soapmaking was born some 20 years later, in the early 19th century, with the discovery by Michel Eugène Chevreul, another French chemist, of the chemical nature and relationship of fats, glycerine and fatty acids. His studies established the basis for both fat and soap chemistry, and soapmaking became a science. Further developments during the 19th century made it easier and cheaper to manufacture soap.
Until the 19th century, soap was regarded as a luxury item, and was heavily taxed in several countries. As it became more readily available, it became an everyday necessity, a development that was reinforced when the high tax was removed. Soap was then something ordinary people could afford, and cleanliness standards improved.
With this widespread use came the development of milder soaps for bathing and soaps for use in the washing machines that were available to consumers by the turn of the 20th century.', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(150331, 15034, 'text_input', 'Early history of keeping clean   
  Prehistoric times:  
 
 water was used to wash off  <strong', '[]'::jsonb, 'mud', 1, 31),
(150332, 15034, 'text_input', '-31" class="ielts-listening-question-number">31     
 
  Ancient Babylon  
 
 soap-like material found in  <strong', '[]'::jsonb, 'clay', 1, 32),
(150333, 15034, 'text_input', '"ielts_listening_answer_12975_2" id="ielts_listening_answer_12975_2" aria-label="Question 32" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  cylinders 
 
  Ancient Greece:  
 
 people cleaned themselves with sand and other substances 
 used a strigil – scraper made of  <strong', '[]'::jsonb, 'metal', 1, 33),
(150334, 15034, 'text_input', '">33     
 washed clothes in streams 
 
  Ancient Germany and Gaul:  
 
 used soap to colour their  <strong', '[]'::jsonb, 'hair', 1, 34),
(150335, 15034, 'text_input', 'r_12975_4" id="ielts_listening_answer_12975_4" aria-label="Question 34" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  
 
  Ancient Rome:  
 
 animal fat, ashes and clay mixed through action of rain, used for washing clothes 
 from about 312 BC, water carried to Roman  <strong', '[]'::jsonb, 'bath / baths', 1, 35),
(150336, 15034, 'text_input', 'ber">35     by aqueducts 
 
  Europe in Middle Ages:  
 
 decline in bathing contributed to occurrence of  <strong', '[]'::jsonb, 'disease / diseases', 1, 36),
(150337, 15034, 'text_input', 'ass="ielts-listening-question-item"> 36     
  <strong', '[]'::jsonb, 'perfume', 1, 37),
(150338, 15034, 'text_input', 'listening_answer_12975_7" aria-label="Question 37" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  began to be added to soap 
 
  Europe from 17th century:  
 
 1600s: cleanliness and bathing started becoming usual 
 1791: Leblanc invented a way of making soda ash from  <strong', '[]'::jsonb, 'salt', 1, 38),
(150339, 15034, 'text_input', '"ielts-listening-question-number-38" class="ielts-listening-question-number">38     
 early 1800s: Chevreul turned soapmaking into a  <strong', '[]'::jsonb, 'science', 1, 39),
(150340, 15034, 'text_input', '"> 39     
 from 1800s, there was no longer a  <strong', '[]'::jsonb, 'tax', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
