-- Cambridge IELTS 14 Academic Listening Test 1
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1401, 'Cambridge IELTS 14 Academic Listening Test 1', 'Rasmiy Cambridge IELTS 14 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(14011, 1401, 'listening', 'Listening Part 1', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-10                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the form below.</p>
<p>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</p>
<p><strong>CRIME REPORT FORM</strong></p>
<p><strong>Type of crime</strong>:             theft</p>
<p><strong>Personal information</strong></p>
<p><em>Example</em></p>
<p>Name                    Louise …<em>Taylor</em>…</p>
<p>Nationality           <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>Date of birth        14 December 1977</p>
<p>Occupation           interior designer</p>
<p>Reason for visit    business (to buy antique <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span>)</p>
<p>Length of stay       two months</p>
<p>Current address    <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span>Apartments (No 15)</p>
<p><strong>Details of theft</strong></p>
<p>Items stolen         – a wallet containing approximately £<span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>– a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>Date of theft        <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p><strong>Possible time and place of theft</strong></p>
<p>Location                    outside the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span> at about 4 pm</p>
<p>Details of suspect      – some boys asked for the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span> then ran off</p>
<p>– one had a T-shirt with a picture of a tiger</p>
<p>– he was about 12, slim build with <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span> hair</p>
<p><strong>Crime reference number allocated</strong></p>
<p><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span></p>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12558-cambridge-ielts-14-academic-listening-1-audio-1.mp3', 'OFFICER: Good morning. What can I do for you?
LOUISE: I want to report a theft. I had some things stolen out of my bag yesterday.
OFFICER: I’m sorry to hear that. Right, so I’ll need to take a few details. Can I start with your name?
LOUISE: Louise Taylor.
OFFICER: OK, thank you. And are you resident in the UK?
LOUISE: No, I’m actually Canadian. Though my mother was British.
OFFICER: And your date of birth?
LOUISE: December 14th, 1977.
OFFICER: So you’re just visiting this country?
LOUISE: That’s right. I come over most summers on business. I’m an interior designer and I come over to buy old furniture, antiques you know. There are some really lovely things around here, but you need to get out to the small towns. I’ve had a really good trip this year, until this happened.
OFFICER: OK. So you’ve been here quite a while?
LOUISE: Yes, I’m here for two months. I go back next week.
OFFICER: So may I ask where you’re staying now?
LOUISE: Well at present I’ve got a place at Park Apartments, that’s on King Street. I was staying at the Riverside Apartments on the same street, but the apartment there was only available for six weeks so I had to find another one.
OFFICER: OK. And the apartment number?
LOUISE: Fifteen.
LOUISE: Right.
…………………………………………..
OFFICER: Now, I need to take some details of the theft. So you said you had some things stolen out of your bag?
LOUISE: That’s right.
OFFICER: And were you actually carrying the bag when the theft took place?
LOUISE: Yes, I really can’t understand it. I had my backpack on. And I went into a supermarket to buy a few things and when I opened it up my wallet wasn’t there.
OFFICER: And what did your wallet have in it?
LOUISE: Well, fortunately I don’t keep my credit cards in that wallet – I keep them with my passport in an inside compartment in my backpack. But there was quite a bit of cash there … about £250 sterling, I should think. I withdrew £300 from my account yesterday, but I did a bit of shopping, so I must have already spent about £50 of that.
OFFICER: OK.
LOUISE: At first I thought, oh I must have left the wallet back in the apartment, but then I realised my phone had gone as well. It was only a week old, and that’s when I realised I’d been robbed. Anyway at least they didn’t take the keys to my rental car.
OFFICER: Yes. So you say the theft occurred yesterday?
LOUISE: Yes.
OFFICER: So that was September the tenth. And do you have any idea at all of where or when the things might possibly have been stolen?
LOUISE: Well at first I couldn’t believe it because the bag had been on my back ever since I left the apartment after lunch. It’s just a small backpack, but I generally use it when I’m travelling because it seems safer than a handbag. Anyway, I met up with a friend, and we spent a couple of hours in the museum. But I do remember that as we were leaving there, at about 4 o’clock, a group of young boys ran up to us, and they were really crowding round us, and they were asking us that time it was, then all of a sudden they ran off.
OFFICER: Can you remember anything about them?
LOUISE: The one who did most of the talking was wearing a T-shirt with a picture of something … let’s see … a tiger.
OFFICER: Right. Any idea of how old he might have been?
LOUISE: Around twelve years old?
OFFICER: And can you remember anything else about his appearance?
LOUISE: Not much. He was quite thin …
OFFICER: Colour of hair?
LOUISE: I do remember that – he was blond. All the others were dark-haired.
OFFICER: And any details of the others?
LOUISE: Not really. They came and went so quickly.
OFFICER: Right. So what I’m going to do now is give you a crime reference number so you can contact your insurance company. So this is ten digits: 87954 82361.
LOUISE: Thank you. So should I …', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(140101, 14011, 'text_input', 'CRIME REPORT FORM  
  Type of crime :             theft 
  Personal information  
  Example  
 Name                    Louise … Taylor … 
 Nationality            <strong', '[]'::jsonb, 'Canadian', 1, 1),
(140102, 14011, 'text_input', 'g>    
 Date of birth        14 December 1977 
 Occupation           interior designer 
 Reason for visit    business (to buy antique  <strong', '[]'::jsonb, 'furniture', 1, 2),
(140103, 14011, 'text_input', 'listening-question-number-2" class="ielts-listening-question-number">2    ) 
 Length of stay       two months 
 Current address     <strong', '[]'::jsonb, 'Park', 1, 3),
(140104, 14011, 'text_input', 'on-number">3    Apartments (No 15) 
  Details of theft  
 Items stolen         – a wallet containing approximately £ <strong', '[]'::jsonb, '250 / 250 sterling', 1, 4),
(140105, 14011, 'text_input', 'lass="ielts-listening-question-item"> 4     
 – a  <strong', '[]'::jsonb, 'phone', 1, 5),
(140106, 14011, 'text_input', 'ning-question-item"> 5     
 Date of theft         <strong', '[]'::jsonb, '10 September / September 10 / 10th September / September 10th', 1, 6),
(140107, 14011, 'text_input', 'lts-listening-question-number">6     
  Possible time and place of theft  
 Location                    outside the  <strong', '[]'::jsonb, 'museum', 1, 7),
(140108, 14011, 'text_input', 'ning-question-number-7" class="ielts-listening-question-number">7     at about 4 pm 
 Details of suspect      – some boys asked for the  <strong', '[]'::jsonb, 'time', 1, 8),
(140109, 14011, 'text_input', 'listening-question-number">8     then ran off 
 – one had a T-shirt with a picture of a tiger 
 – he was about 12, slim build with  <strong', '[]'::jsonb, 'blond / blonde', 1, 9),
(140110, 14011, 'text_input', 'tening-question-number-9" class="ielts-listening-question-number">9     hair 
  Crime reference number allocated  
  <strong', '[]'::jsonb, '87954 82361 / 8795482361', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(14012, 1401, 'listening', 'Listening Part 2', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-12                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="11,12"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong> <strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>Which  pieces of advice for the first week of an apprenticeship does the manager give?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> get to know colleagues</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> learn from any mistakes</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> ask lots of questions</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> react positively to feedback</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> enjoy new challenges</span></label></div></div></div>
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
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="13,14"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong> <strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>Which  things does the manager say mentors can help with?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> confidence-building</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> making career plans</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> completing difficult tasks</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> making a weekly timetable</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> reviewing progress</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 15-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What does the manager say about each of the following aspects of the company policy for apprentices?</p>
<p>Write the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>, next to Questions.</p>
<p><strong>Company policy for apprentices</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>Using the internet</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">15</strong><select data-qnum="15" name="question_15" class="ielts-inline-select"><option value="">[ 15 ] Tanlang...</option><option value="A. It is encouraged.">A. It is encouraged.</option><option value="B. There are some restrictions.">B. There are some restrictions.</option><option value="C. It is against the rules.">C. It is against the rules.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Flexible working</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">16</strong><select data-qnum="16" name="question_16" class="ielts-inline-select"><option value="">[ 16 ] Tanlang...</option><option value="A. It is encouraged.">A. It is encouraged.</option><option value="B. There are some restrictions.">B. There are some restrictions.</option><option value="C. It is against the rules.">C. It is against the rules.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Booking holidays</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">17</strong><select data-qnum="17" name="question_17" class="ielts-inline-select"><option value="">[ 17 ] Tanlang...</option><option value="A. It is encouraged.">A. It is encouraged.</option><option value="B. There are some restrictions.">B. There are some restrictions.</option><option value="C. It is against the rules.">C. It is against the rules.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Working overtime</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">18</strong><select data-qnum="18" name="question_18" class="ielts-inline-select"><option value="">[ 18 ] Tanlang...</option><option value="A. It is encouraged.">A. It is encouraged.</option><option value="B. There are some restrictions.">B. There are some restrictions.</option><option value="C. It is against the rules.">C. It is against the rules.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Wearing trainers</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">19</strong><select data-qnum="19" name="question_19" class="ielts-inline-select"><option value="">[ 19 ] Tanlang...</option><option value="A. It is encouraged.">A. It is encouraged.</option><option value="B. There are some restrictions.">B. There are some restrictions.</option><option value="C. It is against the rules.">C. It is against the rules.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Bringing food to work</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">20</strong><select data-qnum="20" name="question_20" class="ielts-inline-select"><option value="">[ 20 ] Tanlang...</option><option value="A. It is encouraged.">A. It is encouraged.</option><option value="B. There are some restrictions.">B. There are some restrictions.</option><option value="C. It is against the rules.">C. It is against the rules.</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12512" data-allow-duplicates="true">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. It is encouraged.">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">It is encouraged.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. There are some restrictions.">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">There are some restrictions.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. It is against the rules.">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">It is against the rules.</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12557-cambridge-ielts-14-academic-listening-1-audio-2.mp3', 'Good morning everyone. My name’s Janet Parker and I’m the human resources manager. We’re very happy to welcome you to your new apprenticeship. I hope that the next six months will be a positive and enjoyable experience for you.
I’d like to start with some general advice about being an apprentice. Most of you have very little or no experience of working for a big organisation and the first week or so may be quite challenging. There will be a lot of new information to take in but don’t worry too much about trying to remember everything. The important thing is to check with someone if you’re not sure what to do – you’ll find your supervisor is very approachable and won’t mind explaining things or helping you out. You’re here to learn so make the most of that opportunity. You’ll be spending time in different departments during your first week so make an effort to talk to as many people as possible about their work – you’ll make some new friends and find out lots of useful information.
As well as having a supervisor, you’ll each be assigned a mentor. This person will be someone who’s recently completed an apprenticeship and you’ll meet with them on a weekly basis. Their role is to provide help and support throughout your apprenticeship. Of course, this doesn’t mean they’ll actually do any of your work for you – instead they’ll be asking you about what goals you’ve achieved so far, as well as helping you to identify any areas for improvement. You can also discuss your more long-term ambitions with them as well.
————————
Now I just want to run through a few company policies for our apprenticeship scheme with you… Most importantly, the internet. As part of your job you’ll be doing some research online so obviously you’ll have unlimited access for that but please don’t use it for personal use – you’ll have your own phones for that.
Some of you have already asked me about flexible working. After your probationary three-month period – some of you will be eligible for this – but it will depend on which department you’re in and what your personal circumstances are. So please don’t assume you’ll automatically be permitted to do this.
I want to make sure there’s no confusion about our holiday policy. Apart from any statutory public holidays we ask that you don’t book any holidays until after your six-month apprenticeship has finished. Time off should only be taken if you are unwell. Please speak to your supervisor if this is going to be a problem.
You’ll be expected to work a 40-hour week but there may be opportunities to do overtime during busy periods. Although you’re not required to do this, it can be a valuable experience – so we advise you to take it up if possible. Obviously, we understand that people do have commitments outside work, so don’t worry if there are times when you are unavailable.
As you know, we don’t have a formal dress code here – you may wear casual clothes as long as they’re practical – and the only restriction for shoes we have is on high heels for health and safety reasons. Comfortable shoes like trainers are preferable.
There’s a heavily subsidised canteen on site where you can get hot meals or salads cheaply. Snacks and drinks are also provided – so we’ve decided to introduce a no packed lunch policy. This is partly to encourage healthy eating at work and partly to stop people from eating at their workstation, which is unhygienic.
OK moving on to …', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(140111, 14012, 'multiple_choice', 'Question 11', '["A", "B", "C", "D", "E"]'::jsonb, 'A / C', 1, 11),
(140112, 14012, 'multiple_choice', 'Which&nbsp; TWO &nbsp;pieces of advice for the first week of an apprenticeship does the manager give?', '["A", "B", "C", "D", "E"]'::jsonb, 'A / C', 1, 12),
(140113, 14012, 'multiple_choice', 'Question 13', '["A", "B", "C", "D", "E"]'::jsonb, 'B / E', 1, 13),
(140114, 14012, 'multiple_choice', 'Which&nbsp; TWO &nbsp;things does the manager say mentors can help with?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / E', 1, 14),
(140115, 14012, 'single_choice', 'Question 15', '["A", "B", "C"]'::jsonb, 'B', 1, 15),
(140116, 14012, 'single_choice', 'Question 16', '["A", "B", "C"]'::jsonb, 'B', 1, 16),
(140117, 14012, 'single_choice', 'Question 17', '["A", "B", "C"]'::jsonb, 'C', 1, 17),
(140118, 14012, 'single_choice', 'Question 18', '["A", "B", "C"]'::jsonb, 'A', 1, 18),
(140119, 14012, 'single_choice', 'Question 19', '["A", "B", "C"]'::jsonb, 'A', 1, 19),
(140120, 14012, 'single_choice', 'Question 20', '["A", "B", "C"]'::jsonb, 'C', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(14013, 1401, 'listening', 'Listening Part 3', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-25                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
<p>Cities built by the sea</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="21"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong><span class="ielts-q-title"><span>Carla and Rob were surprised to learn that coastal cities</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="A"><span class="ielts-radio-text"><strong>A</strong> contain nearly half the world’s population.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="B"><span class="ielts-radio-text"><strong>B</strong> include most of the world’s largest cities.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="C"><span class="ielts-radio-text"><strong>C</strong> are growing twice as fast as other cities.</span></label></div></div><div class="ielts-standalone-q" data-qnum="22"><div class="ielts-q-header"><strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>According to Rob, building coastal cities near to rivers</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="A"><span class="ielts-radio-text"><strong>A</strong> may bring pollution to the cities.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="B"><span class="ielts-radio-text"><strong>B</strong> may reduce the land available for agriculture.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="C"><span class="ielts-radio-text"><strong>C</strong> may mean the countryside is spoiled by industry.</span></label></div></div><div class="ielts-standalone-q" data-qnum="23"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong><span class="ielts-q-title"><span>What mistake was made when building water drainage channels in Miami in the 1950s?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="A"><span class="ielts-radio-text"><strong>A</strong> There were not enough for them.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="B"><span class="ielts-radio-text"><strong>B</strong> They were made of unsuitable materials.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="C"><span class="ielts-radio-text"><strong>C</strong> They did not allow for the effects of climate change.</span></label></div></div><div class="ielts-standalone-q" data-qnum="24"><div class="ielts-q-header"><strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>What do Rob and Carla think that the authorities in Miami should do immediately?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="A"><span class="ielts-radio-text"><strong>A</strong> take measures to restore ecosystems</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="B"><span class="ielts-radio-text"><strong>B</strong> pay for a new flood prevention system</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="C"><span class="ielts-radio-text"><strong>C</strong> stop disposing of waste materials into the ocean</span></label></div></div><div class="ielts-standalone-q" data-qnum="25"><div class="ielts-q-header"><strong class="ielts-q-badge">25</strong><span class="ielts-q-title"><span>What do they agree should be the priority for international action?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="A"><span class="ielts-radio-text"><strong>A</strong> greater coordination of activities</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="B"><span class="ielts-radio-text"><strong>B</strong> more sharing of information</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="C"><span class="ielts-radio-text"><strong>C</strong> agreement on shared policies</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 26-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What decision do the students make about each of the following parts of their presentation?</p>
<p>Choose <strong>FIVE</strong> answers from the box and write the correct letter, A-G, next to Questions.</p>
<p><strong>Decisions</strong></p>
<p><strong>Parts of the presentation</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>Historical background</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">26</strong><select data-qnum="26" name="question_26" class="ielts-inline-select"><option value="">[ 26 ] Tanlang...</option><option value="A. use visuals">A. use visuals</option><option value="B. keep it short">B. keep it short</option><option value="C. involve other students">C. involve other students</option><option value="D. check the information is accurate">D. check the information is accurate</option><option value="E. provide a handout">E. provide a handout</option><option value="F. focus on one example">F. focus on one example</option><option value="G. do online research">G. do online research</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Geographical factors</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. use visuals">A. use visuals</option><option value="B. keep it short">B. keep it short</option><option value="C. involve other students">C. involve other students</option><option value="D. check the information is accurate">D. check the information is accurate</option><option value="E. provide a handout">E. provide a handout</option><option value="F. focus on one example">F. focus on one example</option><option value="G. do online research">G. do online research</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Past mistakes</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">28</strong><select data-qnum="28" name="question_28" class="ielts-inline-select"><option value="">[ 28 ] Tanlang...</option><option value="A. use visuals">A. use visuals</option><option value="B. keep it short">B. keep it short</option><option value="C. involve other students">C. involve other students</option><option value="D. check the information is accurate">D. check the information is accurate</option><option value="E. provide a handout">E. provide a handout</option><option value="F. focus on one example">F. focus on one example</option><option value="G. do online research">G. do online research</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Future risks</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">29</strong><select data-qnum="29" name="question_29" class="ielts-inline-select"><option value="">[ 29 ] Tanlang...</option><option value="A. use visuals">A. use visuals</option><option value="B. keep it short">B. keep it short</option><option value="C. involve other students">C. involve other students</option><option value="D. check the information is accurate">D. check the information is accurate</option><option value="E. provide a handout">E. provide a handout</option><option value="F. focus on one example">F. focus on one example</option><option value="G. do online research">G. do online research</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>International implications</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">30</strong><select data-qnum="30" name="question_30" class="ielts-inline-select"><option value="">[ 30 ] Tanlang...</option><option value="A. use visuals">A. use visuals</option><option value="B. keep it short">B. keep it short</option><option value="C. involve other students">C. involve other students</option><option value="D. check the information is accurate">D. check the information is accurate</option><option value="E. provide a handout">E. provide a handout</option><option value="F. focus on one example">F. focus on one example</option><option value="G. do online research">G. do online research</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12520">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. use visuals">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">use visuals</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. keep it short">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">keep it short</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. involve other students">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">involve other students</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. check the information is accurate">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">check the information is accurate</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. provide a handout">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">provide a handout</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. focus on one example">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">focus on one example</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. do online research">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">do online research</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12556-cambridge-ielts-14-academic-listening-1-audio-3.mp3', 'TUTOR: OK, so what I’d like you to do now is to talk to your partner about your presentations on urban planning. You should have done most of the reading now, so I’d like you to share your ideas, and talk about the structure of your presentation and what you need to do next.
CARLA: OK Rob. I’m glad we chose quite a specific topic – cities built next to the sea. It made it much easier to find relevant information.
ROB: Yeah. And cities are growing so quickly – I mean, we know that more than half the world’s population lives in cities now.
CARLA: Yeah, though that’s all cities, not just ones on the coast. But most of the biggest cities are actually built by the sea. I’d not realised that before.
ROB: Nor me. And what’s more, a lot of them are built at places where rivers come out into the sea. But apparently this can be a problem.
CARLA: Why?
ROB: Well, as the city expands, agriculture and industry tend to spread further inland along the rivers, and so agriculture moves even further inland up the river. That’s not necessarily a problem, except it means more and more pollutants are discharged into the rivers.
CARLA: So these are brought downstream to the cities?
ROB: Right. Hmm. Did you read that article about Miami, on the east coast of the USA?
CARLA: No.
ROB: Well, apparently back in the 1950s they build channels to drain away the water in case of flooding.
CARLA: Sounds sensible.
ROB: Yeah, they spent quite a lot of money on them. But what they didn’t take into account was global warming. So they built the drainage channels too close to sea level, and now sea levels are rising, they’re more or less useless. If there’s a lot of rain, the water can’t run away, there’s nowhere for it to go. The whole design was faulty.
CARLA: So what are the authorities doing about it now?
ROB: I don’t know. I did read that they’re aiming to stop disposing of waste into the ocean over the next ten years.
CARLA: But that won’t help with flood prevention now, will it?
ROB: No. Really they just need to find the money for something to replace the drainage channels, in order to protect against flooding now. But in the long term they need to consider the whole ecosystem.
CARLA: Right. Really, though, coastal cities can’t deal with their problems on their own, can they? I mean, they’ve got to start acting together at an international level instead of just doing their own thing.
ROB: Absolutely. The thing is, everyone knows what the problems are and environmentalists have a pretty good idea of what we should be doing about them, so they should be able to work together to some extent. But it’s going to be a long time before countries come to a decision on what principles they’re prepared to abide by.
CARLA: Yes, if they ever do.
——————————
CARLA: So I think we’ve probably got enough for our presentation. It’s only fifteen minutes.
ROB: OK. So I suppose we’ll begin with some general historical background about why coastal cities were established. But we don’t want to spend too long on that, the other students will already know a bit about it. It’s all to do with communications and so on.
CARLA: Yes. We should mention some geographical factors, things like wetlands and river estuaries and coastal erosion and so on. We could have some maps of different cities with these features marked.
ROB: On a handout you mean? Or some slides everyone can see?
CARLA: Yeah, that’d be better.
ROB: It’d be good to go into past mistakes in a bit more detail. Did you read that case study of the problems there were in New Orleans with flooding a few years ago?
CARLA: Yes, We could use that as the basis for that part of the talk. I don’t think the other students will have read it, but they’ll remember hearing about the flooding at the time.
ROB: OK. So that’s probably enough background.
CARLA: So then we’ll go on to talk about what action’s being taken to deal with the problems of coastal cities.
ROB: OK. What else do we need to talk about? Maybe something on future risks, looking more at the long term, if populations continue to grow.
CARLA: Yeah. We’ll need to do a bit of work there, I haven’t got much information, have you?
ROB: No. We’ll need to look at some websites. Shouldn’t take too long.
CARLA: OK. And I think we should end by talking about international implications. Maybe we could ask people in the audience. We’ve got people from quite a lot of different places.
ROB: That’d be interesting, if we have time, yes. So now shall we …', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(140121, 14013, 'single_choice', 'Carla and Rob were surprised to learn that coastal cities', '["A", "B", "C"]'::jsonb, 'B', 1, 21),
(140122, 14013, 'single_choice', 'According to Rob, building coastal cities near to rivers', '["A", "B", "C"]'::jsonb, 'A', 1, 22),
(140123, 14013, 'single_choice', 'What mistake was made when building water drainage channels in Miami in the 1950s?', '["A", "B", "C"]'::jsonb, 'C', 1, 23),
(140124, 14013, 'single_choice', 'What do Rob and Carla think that the authorities in Miami should do immediately?', '["A", "B", "C"]'::jsonb, 'B', 1, 24),
(140125, 14013, 'single_choice', 'What do they agree should be the priority for international action?', '["A", "B", "C"]'::jsonb, 'A', 1, 25),
(140126, 14013, 'single_choice', 'Question 26', '["A", "B", "C"]'::jsonb, 'B', 1, 26),
(140127, 14013, 'single_choice', 'Question 27', '["A", "B", "C"]'::jsonb, 'A', 1, 27),
(140128, 14013, 'single_choice', 'Question 28', '["A", "B", "C"]'::jsonb, 'F', 1, 28),
(140129, 14013, 'single_choice', 'Question 29', '["A", "B", "C"]'::jsonb, 'G', 1, 29),
(140130, 14013, 'single_choice', 'Question 30', '["A", "B", "C"]'::jsonb, 'C', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(14014, 1401, 'listening', 'Listening Part 4', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write <strong>ONE WORD ONLY</strong> for each answer.</p>
<p><strong>Marine renewable energy (ocean energy)</strong></p>
<p><strong>Introduction</strong></p>
<p>More energy required because of growth in population and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>What’s needed:</p>
<ul>
<li>renewable energy sources</li>
<li>methods that won’t create pollution</li>
</ul>
<p><strong>Wave energy</strong></p>
<p>Advantage: waves provide a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> source of renewable energy</p>
<p>Electricity can be generated using offshore or onshore systems</p>
<p>Onshore systems may use a reservoir</p>
<p><strong>Problems:</strong></p>
<ul>
<li>waves can move in any <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>movement of sand, etc. on the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> of the ocean may be affected</li>
</ul>
<p><strong>Tidal energy</strong></p>
<p>Tides are more <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span> than waves</p>
<p>Planned tidal lagoon in Wales:</p>
<ul>
<li>will be created in a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> at Swansea</li>
<li>breakwater (dam) containing 16 turbines</li>
<li>rising tide forces water through turbines, generating electricity</li>
<li>stored water is released through <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span>, driving the turbines in the reverse direction</li>
</ul>
<p><strong>Advantages:</strong></p>
<ul>
<li>not dependent on weather</li>
<li>no <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> is required to make it work</li>
<li>likely to create a number of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Problem:</strong></p>
<ul>
<li>may ham fish and birds, e.g. by affecting <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span> and building up silt</li>
</ul>
<p><strong>Ocean thermal energy conversion</strong></p>
<p>Uses a difference in temperature between the surface and lower levels</p>
<p>Water brought to the surface in a pipe</p>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12555-cambridge-ielts-14-academic-listening-1-audio-4.mp3', 'Producing enough energy to meet our needs has become a serious problem. Demand is rising rapidly, because of the world’s increasing population and expanding industry. Burning fossil fuels, like gas, coal and oil, seriously damages the environment and they’ll eventually run out. For a number of years now, scientists have been working out how we can derive energy from renewable sources, such as the sun and wind, without causing pollution. Today I’ll outline marine renewable energy – also called ocean energy – which harnesses the movement of the oceans.
Marine renewable energy can be divided into three main categories: wave energy, tidal energy and ocean thermal energy conversion, and I’ll say a few words about each one.
First, wave energy. Numerous devices have been invented to harvest wave energy, with names such as Wave Dragon, the Penguin and Mighty Whale, and research is going on to try and come up with a really efficient method. This form of energy has plenty of potential, as the source is constant, and there’s no danger of waves coming to s standstill. Electricity can be generated using onshore systems, using a reservoir, or offshore systems. But the problem with ocean waves is that they’re erratic, with the wind making them travel in every direction. This adds to the difficulty of creating efficient technology: ideally all the waves would travel smoothly and regularly along the same straight line. Another drawback is that sand and other sediment on the ocean floor might be stopped from flowing normally, which can lead to environmental problems.
——————————
The second category of marine energy that I’ll mention is tidal energy. One major advantage of using the tide, rather than waves, as a source of energy is that it’s predictable: we know the exact time of high and low tides for years to come.
For tidal energy to be effective, the difference between high and low tides needs to be at least five metres, and this occurs naturally in only about forty places on Earth. But the right conditions can be created by constructing a tidal lagoon, an area of sea water separated from the sea.
One current plan is to create a tidal lagoon on the coast of Wales. This will be an area of water within a bay at Swansea, sheltered by a U-shaped breakwater, or dam, built out from the coast. The breakwater will contain sixteen hydro turbines, and as the tide rises, water rushes through the breakwater, activating the turbines, which turn a generator to produce electricity. Then, for three hours as the tide goes out, the water is held back within the breakwater, increasing the difference in water level, until it’s several metres higher within the lagoon than in the open sea. Then, in order to release the stored water, gates in the breakwater are opened. It pours powerfully out of the lagoon, driving the turbines in the breakwater in the opposite direction and again generating thousands of megawatts of electricity. As there are two high tides a day, this lagoon scheme would generate electricity four times a day, every day, for a total of around 14 hours in every 24 – and enough electricity for over 150,000 homes.
This system has quite a lot in its favour: unlike solar and wind energy it doesn’t depend on the weather; the turbines are operated without the need for fuel, so it doesn’t create any greenhouse gas emissions; and very little maintenance is needed. It’s estimated that electricity generated in this way will be relatively cheap, and that manufacturing the components would create than 2,000 jobs, a big boost to the local economy.
On the other hand, there are fears that lagoons might harm both fish and birds, for example by disturbing migration patterns, and causing a build-up of silt, affecting local ecosystems.
There are other forms of tidal energy, but I’ll go on to the third category of marine energy: ocean thermal energy conversion. This depends on there being a big difference in temperature between surface water and the water a couple of kilometres below the surface, and this occurs in tropical coastal areas. The idea is to bring cold water up to the surface using a submerged pipe. The concept dates back to 1881, when …', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(140131, 14014, 'text_input', 'Marine renewable energy (ocean energy)  
  Introduction  
 More energy required because of growth in population and  <strong', '[]'::jsonb, 'industry', 1, 31),
(140132, 14014, 'text_input', 'ing_answer_12522_1" id="ielts_listening_answer_12522_1" aria-label="Question 31" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  
 What’s needed: 
 
 renewable energy sources 
 methods that won’t create pollution 
 
  Wave energy  
 Advantage: waves provide a  <strong', '[]'::jsonb, 'constant', 1, 32),
(140133, 14014, 'text_input', 'ts_listening_answer_12522_2" aria-label="Question 32" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  source of renewable energy 
 Electricity can be generated using offshore or onshore systems 
 Onshore systems may use a reservoir 
  Problems:  
 
 waves can move in any  <strong', '[]'::jsonb, 'direction', 1, 33),
(140134, 14014, 'text_input', 'on the  <strong', '[]'::jsonb, 'floor', 1, 34),
(140135, 14014, 'text_input', 'ass="ielts-listening-question-number">34     of the ocean may be affected 
 
  Tidal energy  
 Tides are more  <strong', '[]'::jsonb, 'predictable', 1, 35),
(140136, 14014, 'text_input', 'umber-35" class="ielts-listening-question-number">35     than waves 
 Planned tidal lagoon in Wales: 
 
 will be created in a  <strong', '[]'::jsonb, 'bay', 1, 36),
(140137, 14014, 'text_input', 'istening_answer_12522_6" id="ielts_listening_answer_12522_6" aria-label="Question 36" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  at Swansea 
 breakwater (dam) containing 16 turbines 
 rising tide forces water through turbines, generating electricity 
 stored water is released through  <strong', '[]'::jsonb, 'gates', 1, 37),
(140138, 14014, 'text_input', 'ong>   , driving the turbines in the reverse direction 
 
  Advantages:  
 
 not dependent on weather 
 no  <strong', '[]'::jsonb, 'fuel', 1, 38),
(140139, 14014, 'text_input', 'tening-question-number-38" class="ielts-listening-question-number">38     is required to make it work 
 likely to create a number of  <strong', '[]'::jsonb, 'jobs', 1, 39),
(140140, 14014, 'text_input', 'by affecting  <strong', '[]'::jsonb, 'migration', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
