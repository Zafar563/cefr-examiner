-- Cambridge IELTS 14 Academic Listening Test 4
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1404, 'Cambridge IELTS 14 Academic Listening Test 4', 'Rasmiy Cambridge IELTS 14 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(14041, 1404, 'listening', 'Listening Part 1: Enquiry about booking hotel room for event', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-7                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Enquiry about booking hotel room for event</strong></strong></p>
<p class="ielts-listening-transcript-subhead"><strong><em>Example</em></strong></p>
<p>Andrew is the ……<em>Events</em>…… Manager</p>
<p><strong>Rooms</strong></p>
<p>Adelphi Room</p>
<p>number of people who can sit down to eat: <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>has a gallery suitable for musicians</p>
<p>can go out and see the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span> in pots on the terrace</p>
<p>terrace has a view of a group of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>Carlton Room</p>
<p>number of people who can sit down to eat: 110</p>
<p>has a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>View of the lake</p>
<p><strong>Options</strong></p>
<p>Master of Ceremonies:</p>
<p>can give a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span> while people are eating</p>
<p>will provide <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span> if there are any problems</p>
<p>Accommodation:</p>
<p>in the hotel rooms or <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span></p>
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
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 8-10                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What is said about using each of the following hotel facilities?</p>
<p>Choose <strong>THREE</strong> answers from the box and write the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>, next to Questions.</p>
<p><strong>Availability</strong></p>
<p><strong>Hotel facilities</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>outdoor swimming pool</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">8</strong><select data-qnum="8" name="question_8" class="ielts-inline-select"><option value="">[ 8 ] Tanlang...</option><option value="A. included in cost of hiring room">A. included in cost of hiring room</option><option value="B. available at extra charge">B. available at extra charge</option><option value="C. not available">C. not available</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>gym</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">9</strong><select data-qnum="9" name="question_9" class="ielts-inline-select"><option value="">[ 9 ] Tanlang...</option><option value="A. included in cost of hiring room">A. included in cost of hiring room</option><option value="B. available at extra charge">B. available at extra charge</option><option value="C. not available">C. not available</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>tennis courts</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">10</strong><select data-qnum="10" name="question_10" class="ielts-inline-select"><option value="">[ 10 ] Tanlang...</option><option value="A. included in cost of hiring room">A. included in cost of hiring room</option><option value="B. available at extra charge">B. available at extra charge</option><option value="C. not available">C. not available</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12723">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. included in cost of hiring room">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">included in cost of hiring room</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. available at extra charge">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">available at extra charge</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. not available">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">not available</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12745-cambridge-ielts-14-academic-listening-4-audio-1.mp3', 'ANDREW: Good morning, Clare House Hotel. Andrew speaking. I’m the Events Manager.
SAM: Good morning, Andrew. My name’s Samantha. I’m arranging a party for my parents’ fiftieth wedding anniversary, and I’m ringing to ask about hiring a room some time next September. Also my parents and several of the guests will need accommodation.
ANDREW: OK, I’m sure we can help you with that. Will you be having a sit-down meal or a buffet?
SAM: Probably a sit-down.
ANDREW: And do you know how many people there’ll be?
SAM: Around eighty, I think.
ANDREW: Well we have two rooms that can hold that number. One is the Adelphi Room. That can seat eighty-five, or hold over a hundred if people are standing for a buffet.
SAM: Right.
ANDREW: If you have live music, there’s room for four or five musicians in the gallery overlooking the room. Our guests usually appreciate the fact that the music can be loud enough for dancing, but not too loud for conversation.
SAM: Yes, I really don’t like it when you can’t talk.
ANDREW: Exactly. Now the Adelphi Room is at the back of the hotel, and there are French windows leading out onto the terrace. This has a beautiful display of pots of roses at that time of the year.
SAM: Which direction does it face?
ANDREW: Southwest, so that side of the hotel gets the sun in the afternoon and early evening.
SAM: Very nice.
ANDREW: From the terrace you can see the area of trees within the grounds of the hotel, or you can stroll through there to the river – that’s on the far side, so it isn’t visible from the hotel.
SAM: OK.
ANDREW: Then another option is the Carlton Room. This is a bit bigger – it can hold up to a hundred and ten people – and it has the advantage of a stage, which is useful if you have any entertainment, or indeed a small band can fit onto it.
SAM: And can you go outside from the room?
ANDREW: No, the Carlton Room is on the first floor, but on one side the windows look out onto the lake.
SAM: Lovely. I think either of those rooms would be suitable.
ANDREW: Can I tell you about some of the options we offer in addition?
SAM: Please do.
ANDREW: As well as a meal, you can have an MC, a Master of Ceremonies, who’ll be with you throughout the party.
SAM: What exactly is the MC’s function? I suppose they make a speech during the meal if we need one, do they?
ANDREW: That’s right. All our MCs are trained as public speakers, so they can easily get people’s attention – many guests are glad to have someone who can make themselves heard above the chatter! And they’re also your support – if anything goes wrong, the MC will deal with it, so you can relax.
SAM: Great! I’ll need to ask you about food, but something else that’s important is accommodation. You obviously have rooms in the hotel, but do you also have any other accommodation, like cabins, for example?
ANDREW: Yes, there are five in the grounds, all self-contained. They each sleep two to four people and have their own living room, bathroom and small kitchen.
SAM: That sounds perfect for what we’ll need.
——————————
SAM: Now you have various facilities, don’t you? Are they all included in the price of hiring the room? The pool, for instance.
ANDREW: Normally you’d be able to use it, but it’ll be closed throughout September for refurbishment, I’m afraid. The gym will be available, though, at no extra charge. That’s open all day, from six in the morning until midnight.
SAM: Right.
ANDREW: And the tennis courts, but there is a small additional payment for those. We have four courts, and it’s worth booking in advance if you possibly can, as there can be quite a long waiting list for them!
SAM: Right. Now could we discuss the food? This would be dinner, around seven o’clock …', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(140401, 14041, 'text_input', 's="ielts-listening-transcript-subhead">  Enquiry about booking hotel room for event   
   Example   
 Andrew is the …… Events …… Manager 
  Rooms  
 Adelphi Room 
 number of people who can sit down to eat:  <strong', '[]'::jsonb, '85', 1, 1),
(140402, 14041, 'text_input', 'g-question-number-1" class="ielts-listening-question-number">1     
 has a gallery suitable for musicians 
 can go out and see the  <strong', '[]'::jsonb, 'roses', 1, 2),
(140403, 14041, 'text_input', 'ts-listening-question-number-2" class="ielts-listening-question-number">2     in pots on the terrace 
 terrace has a view of a group of  <strong', '[]'::jsonb, 'trees', 1, 3),
(140404, 14041, 'text_input', 'umber-3" class="ielts-listening-question-number">3     
 Carlton Room 
 number of people who can sit down to eat: 110 
 has a  <strong', '[]'::jsonb, 'stage', 1, 4),
(140405, 14041, 'text_input', 'elts-listening-question-number">4     
 View of the lake 
  Options  
 Master of Ceremonies: 
 can give a  <strong', '[]'::jsonb, 'speech', 1, 5),
(140406, 14041, 'text_input', 'em"> 5     while people are eating 
 will provide  <strong', '[]'::jsonb, 'support', 1, 6),
(140407, 14041, 'text_input', 'uestion-number-6" class="ielts-listening-question-number">6     if there are any problems 
 Accommodation: 
 in the hotel rooms or  <strong', '[]'::jsonb, 'cabins', 1, 7),
(140408, 14041, 'single_choice', 'Question 8', '["A", "B", "C"]'::jsonb, 'C', 1, 8),
(140409, 14041, 'single_choice', 'Question 9', '["A", "B", "C"]'::jsonb, 'A', 1, 9),
(140410, 14041, 'single_choice', 'Question 10', '["A", "B", "C"]'::jsonb, 'B', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(14042, 1404, 'listening', 'Listening Part 2', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-16                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What information does the speaker give about each of the following excursions?</p>
<p>Choose <strong>SIX</strong> answers from the box and write the correct letter, <strong>A-H</strong>, next to Questions</p>
<p><strong>Information</strong></p>
<p><strong>Excursions</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>dolphin watching</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">11</strong><select data-qnum="11" name="question_11" class="ielts-inline-select"><option value="">[ 11 ] Tanlang...</option><option value="A. all downhill">A. all downhill</option><option value="B. suitable for beginners">B. suitable for beginners</option><option value="C. only in good weather">C. only in good weather</option><option value="D. food included">D. food included</option><option value="E. no charge">E. no charge</option><option value="F. swimming possible">F. swimming possible</option><option value="G. fully booked today">G. fully booked today</option><option value="H. transport not included">H. transport not included</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>forest walk</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">12</strong><select data-qnum="12" name="question_12" class="ielts-inline-select"><option value="">[ 12 ] Tanlang...</option><option value="A. all downhill">A. all downhill</option><option value="B. suitable for beginners">B. suitable for beginners</option><option value="C. only in good weather">C. only in good weather</option><option value="D. food included">D. food included</option><option value="E. no charge">E. no charge</option><option value="F. swimming possible">F. swimming possible</option><option value="G. fully booked today">G. fully booked today</option><option value="H. transport not included">H. transport not included</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>cycle trip</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">13</strong><select data-qnum="13" name="question_13" class="ielts-inline-select"><option value="">[ 13 ] Tanlang...</option><option value="A. all downhill">A. all downhill</option><option value="B. suitable for beginners">B. suitable for beginners</option><option value="C. only in good weather">C. only in good weather</option><option value="D. food included">D. food included</option><option value="E. no charge">E. no charge</option><option value="F. swimming possible">F. swimming possible</option><option value="G. fully booked today">G. fully booked today</option><option value="H. transport not included">H. transport not included</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>local craft tour</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">14</strong><select data-qnum="14" name="question_14" class="ielts-inline-select"><option value="">[ 14 ] Tanlang...</option><option value="A. all downhill">A. all downhill</option><option value="B. suitable for beginners">B. suitable for beginners</option><option value="C. only in good weather">C. only in good weather</option><option value="D. food included">D. food included</option><option value="E. no charge">E. no charge</option><option value="F. swimming possible">F. swimming possible</option><option value="G. fully booked today">G. fully booked today</option><option value="H. transport not included">H. transport not included</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>observatory trip</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">15</strong><select data-qnum="15" name="question_15" class="ielts-inline-select"><option value="">[ 15 ] Tanlang...</option><option value="A. all downhill">A. all downhill</option><option value="B. suitable for beginners">B. suitable for beginners</option><option value="C. only in good weather">C. only in good weather</option><option value="D. food included">D. food included</option><option value="E. no charge">E. no charge</option><option value="F. swimming possible">F. swimming possible</option><option value="G. fully booked today">G. fully booked today</option><option value="H. transport not included">H. transport not included</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>horse riding</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">16</strong><select data-qnum="16" name="question_16" class="ielts-inline-select"><option value="">[ 16 ] Tanlang...</option><option value="A. all downhill">A. all downhill</option><option value="B. suitable for beginners">B. suitable for beginners</option><option value="C. only in good weather">C. only in good weather</option><option value="D. food included">D. food included</option><option value="E. no charge">E. no charge</option><option value="F. swimming possible">F. swimming possible</option><option value="G. fully booked today">G. fully booked today</option><option value="H. transport not included">H. transport not included</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12725">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. all downhill">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">all downhill</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. suitable for beginners">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">suitable for beginners</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. only in good weather">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">only in good weather</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. food included">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">food included</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. no charge">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">no charge</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. swimming possible">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">swimming possible</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. fully booked today">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">fully booked today</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="H" data-text="H. transport not included">
                                                                                        <span class="dnd-label">H.</span>
                                                                                        <span class="dnd-text">transport not included</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
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
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="17,18"><div class="ielts-q-header"><strong class="ielts-q-badge">17</strong> <strong class="ielts-q-badge">18</strong><span class="ielts-q-title"><span>Which  things does the speaker say about the attraction called <em>Musical Favourites</em>?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> You pay extra for drinks.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> You must book it in advance.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> You get a reduction if you buy two tickets.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> You can meet the performers.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> You can take part in the show.</span></label></div></div></div>
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
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="19,20"><div class="ielts-q-header"><strong class="ielts-q-badge">19</strong> <strong class="ielts-q-badge">20</strong><span class="ielts-q-title"><span>Which  things does the speaker say about the <em>Castle Feast</em>?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> Visitors can dance after the meal.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> There is a choice of food.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> Visitors wear historical costume.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> Knives and forks are not used.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> The entertainment includes horse races.</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12746-cambridge-ielts-14-academic-listening-4-audio-2.mp3', 'Hello everyone. I’m Jake Stevens and I’m your rep here at the hotel. I’m sure you’ll all have a great time here. So let me tell you a bit about what’s on offer. I’ll start by telling you about some of the excursions that are available for guests.
One thing you have to do while you’re here is go dolphin watching. On our boat trips, we pretty well guarantee you’ll see dolphins – if you don’t you can repeat the trip free of charge. We organise daily trips for just 35 euros. Unfortunately there aren’t any places left for this afternoon’s trip, but come and see me to book for later in the week.
If you’re energetic, I’d recommend our forest walk. It’s a guided walk of about seven kilometres. There’ll be a stop half way, and you’ll be provided with a drink and sandwiches. There’s some fairly steep climbs up the hills, so you need to be reasonably fit for this one, with good shoes, and bring a waterproof in case it rains. It’s just 25 euros all inclusive, and it’s every Wednesday.
Then on Thursdays we organise a cycle trip, which will give you all the fun of biking without the effort. We’ll take you and your bike up to the top of Mount Larna, and leave you to bike back – it’s a 700-metre drop in just 20 kilometres so this isn’t really for inexperienced cyclists as you’ll be going pretty fast. And if it’s a clear day, you’ll have fantastic views.
On our local craft tour you can find out about the traditional activities in the island. And the best thing about this trip is that it’s completely free. You’ll be taken to a factory where jewellery is made, and also a ceramics centre. If you want, you can buy some of the products but that’s entirely up to you. The trip starts after lunch on Thursday, and you’ll return by 6 pm.
If you’re interested in astronomy you may already know that the island’s one of the best places in the world to observe the night sky. We can offer trips to the observatory on Friday for those who are interested. They cost 90 euros per person and you’ll be shown the huge telescopes and have a talk from an expert, who’ll explain all about how they work. Afterwards we’ll head down to Sunset Beach, where you can have a dip in the ocean if you want before we head off back to the hotel.
Finally, there’s horse riding. This is organised by the Equestrian Centre over near Playa Cortino and it’s a great experience if you’re a keen horseback rider, or even if you’ve never been on a horse before. They take you down to the beach, and you can canter along the sand and through the waves. It costs 35 euros and it’s available every day.
———————————
So there’s plenty to do in the daytime, but what about night life?
Well, the number one attraction’s called ‘Musical Favourites’. Guests enjoy a three-course meal and unlimited free drinks, and watch a fantastic show, starting with musicals set in Paris and then crossing the Atlantic to Las Vegas and finally Copacabana. At the end the cast members come down from the stage, still in their stunning costumes, and you’ll have a chance to chat with them. It’s hugely popular, so let me know now if you’re interested because it’s no good leaving it until the last minute. It’s on Friday night. Tickets are just 50 euros each, but for an extra 10 euros you can have a table right by the stage.
If you’d like to go back in time, there’s the Castle Feast on Saturday evening. It’s held in a twelfth-century castle, and you eat in the great courtyard, with ladies in long gowns serving your food. You’re given a whole chicken each, which you eat in the medieval way, using your hands instead of cutlery, and you’re entertained by competitions where the horseback riders attempt to knock one another off their horses. Then you can watch the dancers in the ballroom and join in as well if you want. OK, so now if anyone …', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(140411, 14042, 'single_choice', 'Question 11', '["A", "B", "C"]'::jsonb, 'G', 1, 11),
(140412, 14042, 'single_choice', 'Question 12', '["A", "B", "C"]'::jsonb, 'D', 1, 12),
(140413, 14042, 'single_choice', 'Question 13', '["A", "B", "C"]'::jsonb, 'A', 1, 13),
(140414, 14042, 'single_choice', 'Question 14', '["A", "B", "C"]'::jsonb, 'E', 1, 14),
(140415, 14042, 'single_choice', 'Question 15', '["A", "B", "C"]'::jsonb, 'F', 1, 15),
(140416, 14042, 'single_choice', 'Question 16', '["A", "B", "C", "D", "E", "F", "G", "H"]'::jsonb, 'B', 1, 16),
(140417, 14042, 'multiple_choice', 'Question 17', '["A", "B", "C", "D", "E"]'::jsonb, 'B / D', 1, 17),
(140418, 14042, 'multiple_choice', 'Which&nbsp; TWO &nbsp;things does the speaker say about the attraction called&nbsp; Musical Favourites ?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / D', 1, 18),
(140419, 14042, 'multiple_choice', 'Question 19', '["A", "B"]'::jsonb, 'A / D', 1, 19),
(140420, 14042, 'multiple_choice', 'Which&nbsp; TWO &nbsp;things does the speaker say about the&nbsp; Castle Feast ?', '["A", "B"]'::jsonb, 'A / D', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(14043, 1404, 'listening', 'Listening Part 3', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-25                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="21"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong><span class="ielts-q-title"><span>What does Trevor find interesting about the purpose of children’s literature?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="A"><span class="ielts-radio-text"><strong>A</strong> the fact that authors may not realise what values they’re teaching</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="B"><span class="ielts-radio-text"><strong>B</strong> the fact that literature can be entertaining and educational at the same time</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="C"><span class="ielts-radio-text"><strong>C</strong> the fact that adults expect children to imitate characters in literature</span></label></div></div><div class="ielts-standalone-q" data-qnum="22"><div class="ielts-q-header"><strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>Trevor says the module about the purpose of children’s literature made him</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="A"><span class="ielts-radio-text"><strong>A</strong> analyse some of the stories that his niece reads.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="B"><span class="ielts-radio-text"><strong>B</strong> wonder how far popularity reflects good qualify.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="C"><span class="ielts-radio-text"><strong>C</strong> decide to start writing some children’s stories.</span></label></div></div><div class="ielts-standalone-q" data-qnum="23"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong><span class="ielts-q-title"><span>Stephanie is interested in the Pictures module because</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="A"><span class="ielts-radio-text"><strong>A</strong> she intends to become an illustrator.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="B"><span class="ielts-radio-text"><strong>B</strong> she can remember beautiful illustrations from her childhood.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="C"><span class="ielts-radio-text"><strong>C</strong> she believes illustrations are more important than words.</span></label></div></div><div class="ielts-standalone-q" data-qnum="24"><div class="ielts-q-header"><strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>Trevor and Stephanie agree that comics</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="A"><span class="ielts-radio-text"><strong>A</strong> are inferior to books.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="B"><span class="ielts-radio-text"><strong>B</strong> have the potential for being useful.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="C"><span class="ielts-radio-text"><strong>C</strong> discourage children from using their imagination.</span></label></div></div><div class="ielts-standalone-q" data-qnum="25"><div class="ielts-q-header"><strong class="ielts-q-badge">25</strong><span class="ielts-q-title"><span>With regard to books aimed at only boys or only girls, Trevor was surprised</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="A"><span class="ielts-radio-text"><strong>A</strong> how long the distinction had gone unquestioned.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="B"><span class="ielts-radio-text"><strong>B</strong> how few books were aimed at both girls and boys.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="C"><span class="ielts-radio-text"><strong>C</strong> how many children enjoyed books intended for the opposite sex.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 26-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What comment is made about each of these stories?</p>
<p>Choose <strong>FIVE</strong> answers from the box and write the correct letter, <strong>A-G</strong>, next to Questions</p>
<p><strong>Comments</strong></p>
<p><strong>Stories</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>Perrault’s fairy tales</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">26</strong><select data-qnum="26" name="question_26" class="ielts-inline-select"><option value="">[ 26 ] Tanlang...</option><option value="A. translated into many other languages">A. translated into many other languages</option><option value="B. hard to read">B. hard to read</option><option value="C. inspired a work in a different area of art">C. inspired a work in a different area of art</option><option value="D. more popular than the author’s other works">D. more popular than the author’s other works</option><option value="E. original title refers to another book">E. original title refers to another book</option><option value="F. started a new genre">F. started a new genre</option><option value="G. unlikely topic">G. unlikely topic</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span><em>The Swiss Family Robinson</em></span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. translated into many other languages">A. translated into many other languages</option><option value="B. hard to read">B. hard to read</option><option value="C. inspired a work in a different area of art">C. inspired a work in a different area of art</option><option value="D. more popular than the author’s other works">D. more popular than the author’s other works</option><option value="E. original title refers to another book">E. original title refers to another book</option><option value="F. started a new genre">F. started a new genre</option><option value="G. unlikely topic">G. unlikely topic</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span><em>The Nutcracker and the Mouse King</em></span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">28</strong><select data-qnum="28" name="question_28" class="ielts-inline-select"><option value="">[ 28 ] Tanlang...</option><option value="A. translated into many other languages">A. translated into many other languages</option><option value="B. hard to read">B. hard to read</option><option value="C. inspired a work in a different area of art">C. inspired a work in a different area of art</option><option value="D. more popular than the author’s other works">D. more popular than the author’s other works</option><option value="E. original title refers to another book">E. original title refers to another book</option><option value="F. started a new genre">F. started a new genre</option><option value="G. unlikely topic">G. unlikely topic</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span><em>The Lord of the Rings</em></span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">29</strong><select data-qnum="29" name="question_29" class="ielts-inline-select"><option value="">[ 29 ] Tanlang...</option><option value="A. translated into many other languages">A. translated into many other languages</option><option value="B. hard to read">B. hard to read</option><option value="C. inspired a work in a different area of art">C. inspired a work in a different area of art</option><option value="D. more popular than the author’s other works">D. more popular than the author’s other works</option><option value="E. original title refers to another book">E. original title refers to another book</option><option value="F. started a new genre">F. started a new genre</option><option value="G. unlikely topic">G. unlikely topic</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span><em>War Horse</em></span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">30</strong><select data-qnum="30" name="question_30" class="ielts-inline-select"><option value="">[ 30 ] Tanlang...</option><option value="A. translated into many other languages">A. translated into many other languages</option><option value="B. hard to read">B. hard to read</option><option value="C. inspired a work in a different area of art">C. inspired a work in a different area of art</option><option value="D. more popular than the author’s other works">D. more popular than the author’s other works</option><option value="E. original title refers to another book">E. original title refers to another book</option><option value="F. started a new genre">F. started a new genre</option><option value="G. unlikely topic">G. unlikely topic</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12733">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. translated into many other languages">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">translated into many other languages</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. hard to read">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">hard to read</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. inspired a work in a different area of art">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">inspired a work in a different area of art</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. more popular than the author’s other works">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">more popular than the author’s other works</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. original title refers to another book">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">original title refers to another book</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. started a new genre">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">started a new genre</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. unlikely topic">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">unlikely topic</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12744-cambridge-ielts-14-academic-listening-4-audio-3.mp3', 'STEPHANIE: Hello, Trevor.
TREVOR: Hello, Stephanie. You said you wanted to talk about the course I’m taking on literature for children.
STEPHANIE: That’s right. I’m thinking of doing it next year, but I’d like to find out more about it first.
TREVOR: OK, well, as you probably know, it’s a one-year course. It’s divided into six modules, and you have to take all of them. One of the most interesting ones, for me, at least, was about the purpose of children’s literature.
STEPHANIE: You mean, whether it should just entertain children or should be educational, as well.
TREVOR: Right, and whether the teaching should be factual – giving them information about the world – or ethical, teaching them values. What’s fascinating is that the writer isn’t necessarily conscious of the message they’re conveying. For instance, a story might show a child who has a problem as a result of not doing what an adult has told them to do, implying that children should always obey adults.
STEPHANIE: I see what you mean.
TREVOR: That module made me realise how important stories are – they can have a significant effect on children as they grow up. Actually, it inspired me to have a go at it myself, just for my own interest. I know can’t compete with the really popular stories, like the Harry Potter books – they’re very good, and even young kids like my seven-year-old niece love reading them.
STEPHANIE: Mm. I’m very interested in illustrations in stories. Is that covered in the course?
TREVOR: Yes, there’s a module on pictures, and how they’re sometimes central to the story.
STEPHANIE: That’s good. I remember some frightening ones I saw as a child and I can still see them vividly in my mind, years later! Pictures can be so powerful, just as powerful as words. I’ve always enjoyed drawing, so that’s the field I want to go into when I finish the course. I bet that module will be really helpful.
TREVOR: I’m sure it will. We also studied comics in that module, but I’m not convinced of their value, not compared with books. One of the great things about words is that you use your imagination, but with a comic you don’t have to.
STEPHANIE: But children are so used to visual input – on TV, video games, and so on. There are plenty of kids who wouldn’t even try to read a book, so I think comics can serve a really useful purpose.
TREVOR: You mean, it’s better to read a comic than not to read at all? Yes, I suppose you’re right. I just think its sad when children don’t read books.
STEPHANIE: What about books for girls and books for boys? Does the course go into that?
TREVOR: Yes, there’s a module on it. For years, lots of stories, in English, at least, assumed that boys went out and did adventurous things and girls stayed at home and played with dolls. I was amazed how many books were targeted at just one sex or the other. Of course this reflects society as it is when the books are written.
STEPHANIE: That’s true. So it sounds as though you think it’s a good course.
TREVOR: Definitely.
———————————
TREVOR: Have you been reading lots of children’s stories, to help you decide whether to take the course?
STEPHANIE: Yeah. I’ve gone as far back as the late seventeenth century, though I know there were earlier children’s stories.
TREVOR: So does that mean you’ve read Perrault’s fairy tales? Cinderella, The Sleeping Beauty , and so on.
STEPHANIE: Yes. They must be important, because no stories of that type had been written before, there were the first. Then there’s The Swiss Family Robinson .
TREVOR: I haven’t read that.
STEPHANIE: The English name makes it sound as though Robinson is the family’s surname, but a more accurate translation would be The Swiss Robinsons , because it’s about a Swiss family who are shipwrecked, like Robinson Crusoe in the novel of a century earlier.
TREVOR: Well I never knew that!
STEPHANIE: Have you read Hoffmann’s The Nutcracker and the Mouse King ?
TREVOR: Wasn’t that the basis for Tchaikovsky’s ballet The Nutcracker ?
STEPHANIE: That’s right. It has some quite bizarre elements.
TREVOR: I hope you’ve read Oscar Wilde’s The Happy Prince . It’s probably my favourite children’s story of all time.
STEPHANIE: Mine too! And it’s so surprising, because Wilde is best known for his plays, and most of them are very witty, but The Happy Prince is really moving. I struggled with Tolkien’s The Lord of the Rings – there long books, and I gave up after one .
TREVOR: It’s extremely popular, though.
STEPHANIE: Yeah, but whereas something like The Happy Prince just carried me along with it, The Lord of the Rings took more effort than I was prepared to give it.
TREVOR: I didn’t find that – I love it.
STEPHANIE: Another one I’ve read is War Horse.
TREVOR: Oh yes. It’s about the First Word War, isn’t it? Hardly what you’d expect for a children’s story.
STEPHANIE: Exactly, but it’s been very successful. Have you read any …', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(140421, 14043, 'single_choice', 'What does Trevor find interesting about the purpose of children&rsquo;s literature?', '["A", "B", "C"]'::jsonb, 'A', 1, 21),
(140422, 14043, 'single_choice', 'Trevor says the module about the purpose of children&rsquo;s literature made him', '["A", "B", "C"]'::jsonb, 'C', 1, 22),
(140423, 14043, 'single_choice', 'Stephanie is interested in the Pictures module because', '["A", "B", "C"]'::jsonb, 'A', 1, 23),
(140424, 14043, 'single_choice', 'Trevor and Stephanie agree that comics', '["A", "B", "C"]'::jsonb, 'B', 1, 24),
(140425, 14043, 'single_choice', 'With regard to books aimed at only boys or only girls, Trevor was surprised', '["A", "B", "C"]'::jsonb, 'B', 1, 25),
(140426, 14043, 'single_choice', 'Question 26', '["A", "B", "C"]'::jsonb, 'F', 1, 26),
(140427, 14043, 'single_choice', 'Question 27', '["A", "B", "C"]'::jsonb, 'E', 1, 27),
(140428, 14043, 'single_choice', 'Question 28', '["A", "B", "C"]'::jsonb, 'C', 1, 28),
(140429, 14043, 'single_choice', 'Question 29', '["A", "B", "C"]'::jsonb, 'B', 1, 29),
(140430, 14043, 'single_choice', 'Question 30', '["A", "B", "C"]'::jsonb, 'G', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(14044, 1404, 'listening', 'Listening Part 4', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write <strong>ONE WORD ONLY</strong> for each answer.</p>
<p><strong>The hunt for sunken settlements and ancient shipwrecks</strong></p>
<p><strong>ATLIT-YAM</strong></p>
<ul>
<li>was a village on coast of eastern Mediterranean</li>
<li>thrived until about 7,000 BC</li>
<li>stones homes had a courtyard</li>
<li>had a semicircle of large stones round a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>cause of destruction unknown – now under the sea</li>
<li>biggest settlement from the prehistoric period found on the seabed</li>
<li>research carried out into structures, <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> and human remains</li>
</ul>
<p><strong>TRADITIOINAL AUTONOMOUS UNDERWATER VEHICLES (AUVs)</strong></p>
<ul>
<li>used in the oil industry, e.g. to make <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>problems: they were expensive and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
</ul>
<p><strong>LATEST AUVs</strong></p>
<ul>
<li>much easier to use, relatively cheap, sophisticated</li>
</ul>
<p><strong>Tests</strong>:</p>
<ul>
<li>Marzamemi, Sicily: found ancient Roman ships carrying architectural elements made of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Underwater internet:</strong></p>
<ul>
<li><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> is used for short distance communication, acoustic waves for long distance</li>
<li>plans for communication with researchers by satellite</li>
<li>AUV can send data to another AUV that has better <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span>, for example</li>
</ul>
<p><strong>Planned research in Gulf of Baratti:</strong></p>
<ul>
<li>to find out more about wrecks of ancient Roman ships, including</li>
</ul>
<p>–  one carrying <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> supplies; tablets may have been used for cleaning the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>–  others carrying containers of olive oil or <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span></p>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12743-cambridge-ielts-14-academic-listening-4-audio-4.mp3', 'In today’s class I’m going to talk about marine archaeology, the branch of archaeology focusing on human interaction with the sea, lakes and rivers. It’s the study of ships, cargoes, shipping facilities, and other physical remains. I’ll give you an example, then go on to show how this type of research is being transformed by the use of the latest technology.
Atlit-Yam was a village on the coast of the eastern Mediterranean, which seems to have been thriving until around 7,000 BC. The residents kept cattle, caught fish and stored grain. They had wells for fresh water, many of their houses were built around a courtyard and were constructed of stone. The village contained an impressive monument: seven half-tonne stones standing in a semicircle around a spring, that might have been used for ceremonial purposes.
Atlit-Yam may have been destroyed swiftly by a tsunami, or climate change may have caused glaciers to melt and sea levels to rise, flooding the village gradually. Whatever the cause, it now lies ten metres below the surface of the Mediterranean, buried under sand at the bottom of the sea. It’s been described as the largest and best preserved prehistoric settlement ever found on the seabed.
For marine archaeologists, Atlit-Yam is a treasure trove. Research on the buildings, tools and the human remains has revealed how the bustling village once functioned, and even what diseases some of its residents suffered from. But of course this is only one small village, one window into a lost world. For a fuller picture, researchers need more sunken settlements, but the hard part is finding them.
Underwater research used to require divers to find shipwrecks or artefacts, but in the second half of the twentieth century, various types of underwater vehicles were developed, some controlled from a ship on the surface, and some of them autonomous, which means they don’t need to be operated by a person.
Autonomous underwater vehicles, or AUVs, are used in the oil industry, for instance, to create maps of the seabed before rigs and pipelines are installed. To navigate they use sensors, such as compasses and sonar. Until relatively recently they were very expensive, and so heavy that they had to be launched from a large vessel with a winch.
————————
But the latest AUVs are much easier to manoeuvre – they can be launched from the shore or a small ship. And they’re much cheaper, which makes them more accessible to research teams. They’re also very sophisticated. They can communicate with each other and, for example, work out the most efficient way to survey a site, or to find particular objects on the seabed.
Field tests show the approach can work. For example, in a trial in 2015, three AUVs searched for wrecks at Marzamemi, off the coast of Sicily. The site is the final resting place of an ancient Roman ship, which sank in the sixth century AD while ferrying prefabricated marble elements for the construction of an early church. The AUVs mapped the area in detail, finding other ships carrying columns of the same material.
Creating an internet in the sea for AUVs to communicate is no easy matter. Wifi networks on land use electromagnetic waves, but in water these will only travel a few centimetres. Instead, a more complex mix of technologies is required. For short distances, AUVs can share date using light, while acoustic waves are used to communicate over long distances. But more creative solutions are also being developed, where an AUV working on the seabed offloads data to a second AUV, which then surfaces and beams the data home to the research team using a satellite.
There’s also a system that enables AUVs to share information from seabed scans, and other data. So if an AUV surveying the seabed finds an intriguing object, it can share the coordinates of the object – that is, its position – with a nearby AUV that carries superior cameras, and arrange for that AUV to make a closer inspection of the object.
Marine archaeologists are excited about the huge potential of these AUVs for their discipline. One site where they’re going to be deployed is the Gulf of Baratti, off the Italian coast. In 1974, a 2,000-year-old Roman vessel was discovered here, in 18 metres of water. When it sank, it was carrying medical goods, in wooden or tin receptacles. Its cargo gives us insight into the treatments available all those years ago, including tablets that are thought to have been dissolved to form a cleansing liquid for the eyes.
Other Roman ships went down nearby, taking their cargoes with them. Some held huge pots made of terracotta. Some were used for transporting cargoes of olive oil, and others held wine. In many cases it’s only these containers that remain, while the wooden ships have been buried under silt on the seabed.
Another project that’s about to …', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(140431, 14044, 'text_input', 'The hunt for sunken settlements and ancient shipwrecks  
  ATLIT-YAM  
 
 was a village on coast of eastern Mediterranean 
 thrived until about 7,000 BC 
 stones homes had a courtyard 
 had a semicircle of large stones round a  <strong', '[]'::jsonb, 'spring', 1, 31),
(140432, 14044, 'text_input', 'ning_answer_12735_1" id="ielts_listening_answer_12735_1" aria-label="Question 31" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  
 cause of destruction unknown – now under the sea 
 biggest settlement from the prehistoric period found on the seabed 
 research carried out into structures,  <strong', '[]'::jsonb, 'tools', 1, 32),
(140433, 14044, 'text_input', 'to make  <strong', '[]'::jsonb, 'maps', 1, 33),
(140434, 14044, 'text_input', '"> 33     
 problems: they were expensive and  <strong', '[]'::jsonb, 'heavy', 1, 34),
(140435, 14044, 'text_input', 'LATEST AUVs  
 
 much easier to use, relatively cheap, sophisticated 
 
  Tests : 
 
 Marzamemi, Sicily: found ancient Roman ships carrying architectural elements made of  <strong', '[]'::jsonb, 'marble', 1, 35),
(140436, 14044, 'text_input', 'stening-question-number-35" class="ielts-listening-question-number">35     
 
  Underwater internet:  
 
  <strong', '[]'::jsonb, 'light', 1, 36),
(140437, 14044, 'text_input', '35_6" id="ielts_listening_answer_12735_6" aria-label="Question 36" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  is used for short distance communication, acoustic waves for long distance 
 plans for communication with researchers by satellite 
 AUV can send data to another AUV that has better  <strong', '[]'::jsonb, 'camera / cameras', 1, 37),
(140438, 14044, 'text_input', 'swer_12735_7" id="ielts_listening_answer_12735_7" aria-label="Question 37" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off"> , for example 
 
  Planned research in Gulf of Baratti:  
 
 to find out more about wrecks of ancient Roman ships, including 
 
 –  one carrying  <strong', '[]'::jsonb, 'medical', 1, 38),
(140439, 14044, 'text_input', 'd="ielts-listening-question-number-38" class="ielts-listening-question-number">38     supplies; tablets may have been used for cleaning the  <strong', '[]'::jsonb, 'eyes', 1, 39),
(140440, 14044, 'text_input', 'id="ielts-listening-question-number-39" class="ielts-listening-question-number">39     
 –  others carrying containers of olive oil or  <strong', '[]'::jsonb, 'wine', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
