-- Cambridge IELTS 18 Academic Listening Test 1
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1801, 'Cambridge IELTS 18 Academic Listening Test 1', 'Rasmiy Cambridge IELTS 18 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(18011, 1801, 'listening', 'Listening Part 1: Transport survey', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-10                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p><em>Complete the notes below.</em></p>
<p><em>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Transport survey</strong></strong></p>
<p><strong>Name: </strong>  Sadie Jones</p>
<p><strong>Year of birth: </strong>  1991</p>
<p><strong>Postcode: </strong>  <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p><strong>Travelling by bus</strong></p>
<p>Date of bus journey:  <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>Reason for trip:   shopping and visit to the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>Travelled by bus because cost of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span> too high</p>
<p>Got on bus at <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span> Street</p>
<p>Complaints about bus service:</p>
<p>–   bus today was <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>–   frequency of buses in the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p><strong>Travelling by car</strong></p>
<p>Goes to the   <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span> by car</p>
<p><strong>Travelling by bicycle</strong></p>
<p>Dislikes travelling by bike in the city centre because of the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>Doesn’t own a bike because of a lack of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span></p>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/14074-cambridge-ielts-18-academic-listening-1-audio-1.mp3', 'MAN: Excuse me. Would you mind if I asked you some questions? We’re doing a survey on transport.
SADIE: Yes, that’s OK.
MAN: First of all, can I take your name?
SADIE: Yes. It’s Sadie Jones.
MAN: Thanks very much. And could I have your date of birth – just the year will do, actually. Is that all right?
SADIE: Yes, that’s fine. It’s 1991.
MAN: So next your postcode, please.
SADIE: It’s DW30 7YZ.
MAN: Great. Thanks. Is that in Wells?
SADIE: No it’s actually in Harborne- Wells isn’t far from there, though.
MAN: I really like that area. My grandmother lived there when I was a kid.
SADIE: Yes, it is nice.
MAN: Right, so now I want to ask you some questions about how you travelled here today. Did you use public transport?
SADIE: Yes. I came by bus.
MAN: OK. And that was today. It’s the 24th of April, isn’t it?
SADIE: Isn’t it the 25th? No, actually, you’re right.
MAN: Ha ha. And what was the reason for your trip today? I can see you’ve got some shopping with you.
SADIE: Yes. I did some shopping but the main reason I came here was to go to the dentist.
MAN: That’s not much fun. Hope it was nothing serious.
SADIE: No, it was just a check-up. It’s fine.
MAN: Good. Do you normally travel by bus into the city centre?
SADIE: Yes. I stopped driving in ages ago because parking was so difficult to find and it costs so much.
MAN: I see.
SADIE: The bus is much more convenient too. It only takes about 30 minutes.
MAN: That’s good. So where did you start your journey?
SADIE: At the bus stop on Claxby Street.
MAN: Is that C-L-A-X-B-Y?
SADIE: That’s right.
—————
MAN: And how satisfied with the service are you? Do you have any complaints?
SADIE: Well, as I said, it’s very convenient and quick when it’s on time, but this morning it was late. Only about 10 minutes, but still.
MAN: Yes, I understand that’s annoying. And what about the timetable? Do you have any comments about that?
SADIE: Mmm. I suppose I mainly use the bus during the day, but any time I’ve been in town in the evening – for dinner or at the cinema – I’ve noticed you have to wait a long time for a bus – there aren’t that many.
MAN: OK, thanks. So now I’d like to ask you about your car use.
SADIE: Well, I have got a car but I don’t use it that often. Mainly just to go to the supermarket. But that’s about it really. My husband uses it at the weekends to go to the golf club.
MAN: And what about a bicycle?
SADIE: I don’t actually have one at the moment.
MAN: What about the city bikes you can rent? Do you ever use those?
SADIE: No – I’m not keen on cycling there because of all the pollution. But I would like to get a bike – it would be good to use it to get to work.
MAN: So why haven’t you got one now?
SADIE: Well, I live in a flat – on the second floor and it doesn’t have any storage – so we’d have to leave it in the hall outside the flat.
MAN: I see. OK. Well, I think that’s all …', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(180101, 18011, 'text_input', 'Transport survey   
  Name:    Sadie Jones 
  Year of birth:    1991 
  Postcode:     <strong', '[]'::jsonb, 'DW30 7YZ / DW307YZ', 1, 1),
(180102, 18011, 'text_input', 'ning-question-number-1" class="ielts-listening-question-number">1     
  Travelling by bus  
 Date of bus journey:   <strong', '[]'::jsonb, '24 April / 24th April / April 24 / April 24th / 24 / 04', 1, 2),
(180103, 18011, 'text_input', 'ong id="ielts-listening-question-number-2" class="ielts-listening-question-number">2     
 Reason for trip:   shopping and visit to the  <strong', '[]'::jsonb, 'dentist', 1, 3),
(180104, 18011, 'text_input', 'n-item"> 3     
 Travelled by bus because cost of  <strong', '[]'::jsonb, 'parking', 1, 4),
(180105, 18011, 'text_input', 'ng-question-item"> 4     too high 
 Got on bus at  <strong', '[]'::jsonb, 'Claxby', 1, 5),
(180106, 18011, 'text_input', 'tening-question-number-5" class="ielts-listening-question-number">5     Street 
 Complaints about bus service: 
 –   bus today was  <strong', '[]'::jsonb, 'late', 1, 6),
(180107, 18011, 'text_input', 'tion-item"> 6     
 –   frequency of buses in the  <strong', '[]'::jsonb, 'evening', 1, 7),
(180108, 18011, 'text_input', 'ts-listening-question-number-7" class="ielts-listening-question-number">7     
  Travelling by car  
 Goes to the    <strong', '[]'::jsonb, 'supermarket', 1, 8),
(180109, 18011, 'text_input', 'tion-number">8     by car 
  Travelling by bicycle  
 Dislikes travelling by bike in the city centre because of the  <strong', '[]'::jsonb, 'pollution', 1, 9),
(180110, 18011, 'text_input', '> 9     
 Doesn’t own a bike because of a lack of  <strong', '[]'::jsonb, 'storage', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(18012, 1801, 'listening', 'Listening Part 2: Becoming a volunteer for ACE', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-13                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Becoming a volunteer for ACE</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="11"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong><span class="ielts-q-title"><span>Why does the speaker apologise about the seats?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="A"><span class="ielts-radio-text"><strong>A</strong> They are too small.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="B"><span class="ielts-radio-text"><strong>B</strong> There are not enough of them.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="C"><span class="ielts-radio-text"><strong>C</strong> Some of them are very close together.</span></label></div></div><div class="ielts-standalone-q" data-qnum="12"><div class="ielts-q-header"><strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>What does the speaker say about the age of volunteers?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="A"><span class="ielts-radio-text"><strong>A</strong> The age of volunteers is less important than other factors.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="B"><span class="ielts-radio-text"><strong>B</strong> Young volunteers are less reliable than older ones.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="C"><span class="ielts-radio-text"><strong>C</strong> Most volunteers are about 60 years old.</span></label></div></div><div class="ielts-standalone-q" data-qnum="13"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong><span class="ielts-q-title"><span>What does the speaker say about training?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="A"><span class="ielts-radio-text"><strong>A</strong> It is continuous.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="B"><span class="ielts-radio-text"><strong>B</strong> It is conducted by a manager.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="C"><span class="ielts-radio-text"><strong>C</strong> It takes place online.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 14-15                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="14,15"><div class="ielts-q-header"><strong class="ielts-q-badge">14</strong> <strong class="ielts-q-badge">15</strong><span class="ielts-q-title"><span>Which  issues does the speaker ask the audience to consider before they apply to be volunteers?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="14,15" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> their financial situation</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="14,15" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> their level of commitment</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="14,15" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> their work experience</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="14,15" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> their ambition</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="14,15" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> their availability</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 16-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What does the speaker suggest would be helpful for each of the following areas of voluntary work?</p>
<p><em>Choose <strong>FIVE</strong> answers from the box and write the correct letter, <strong>A-G</strong>, next to Questions.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Helpful things volunteers might offer</strong></strong></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Area of voluntary work</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>Fundraising</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">16</strong><select data-qnum="16" name="question_16" class="ielts-inline-select"><option value="">[ 16 ] Tanlang...</option><option value="A. experience on stage">A. experience on stage</option><option value="B. original, new ideas">B. original, new ideas</option><option value="C. parenting skills">C. parenting skills</option><option value="D. an understanding of food and diet">D. an understanding of food and diet</option><option value="E. retail experience">E. retail experience</option><option value="F. a good memory">F. a good memory</option><option value="G. a good level of fitness">G. a good level of fitness</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Litter collection</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">17</strong><select data-qnum="17" name="question_17" class="ielts-inline-select"><option value="">[ 17 ] Tanlang...</option><option value="A. experience on stage">A. experience on stage</option><option value="B. original, new ideas">B. original, new ideas</option><option value="C. parenting skills">C. parenting skills</option><option value="D. an understanding of food and diet">D. an understanding of food and diet</option><option value="E. retail experience">E. retail experience</option><option value="F. a good memory">F. a good memory</option><option value="G. a good level of fitness">G. a good level of fitness</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>‘Playmates’</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">18</strong><select data-qnum="18" name="question_18" class="ielts-inline-select"><option value="">[ 18 ] Tanlang...</option><option value="A. experience on stage">A. experience on stage</option><option value="B. original, new ideas">B. original, new ideas</option><option value="C. parenting skills">C. parenting skills</option><option value="D. an understanding of food and diet">D. an understanding of food and diet</option><option value="E. retail experience">E. retail experience</option><option value="F. a good memory">F. a good memory</option><option value="G. a good level of fitness">G. a good level of fitness</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Story club</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">19</strong><select data-qnum="19" name="question_19" class="ielts-inline-select"><option value="">[ 19 ] Tanlang...</option><option value="A. experience on stage">A. experience on stage</option><option value="B. original, new ideas">B. original, new ideas</option><option value="C. parenting skills">C. parenting skills</option><option value="D. an understanding of food and diet">D. an understanding of food and diet</option><option value="E. retail experience">E. retail experience</option><option value="F. a good memory">F. a good memory</option><option value="G. a good level of fitness">G. a good level of fitness</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>First aid</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">20</strong><select data-qnum="20" name="question_20" class="ielts-inline-select"><option value="">[ 20 ] Tanlang...</option><option value="A. experience on stage">A. experience on stage</option><option value="B. original, new ideas">B. original, new ideas</option><option value="C. parenting skills">C. parenting skills</option><option value="D. an understanding of food and diet">D. an understanding of food and diet</option><option value="E. retail experience">E. retail experience</option><option value="F. a good memory">F. a good memory</option><option value="G. a good level of fitness">G. a good level of fitness</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="14010">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. experience on stage">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">experience on stage</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. original, new ideas">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">original, new ideas</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. parenting skills">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">parenting skills</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. an understanding of food and diet">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">an understanding of food and diet</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. retail experience">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">retail experience</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. a good memory">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">a good memory</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. a good level of fitness">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">a good level of fitness</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/14072-cambridge-ielts-18-academic-listening-1-audio-2.mp3', 'Good evening, everyone. Let me start by welcoming you all to this talk and thanking you for taking the time to consider joining ACE voluntary organisation. ACE offers support to people and services in the local area and we’re now looking for more volunteers to help us do this.
By the way, I hope you’re all comfortable – we have brought in extra seats so that no one has to stand, but it does mean that the people at the back of the room may be a bit squashed. We’ll only be here for about half an hour so, hopefully, that’s OK.
One of the first questions we’re often asked is how old you need to be to volunteer. Well, you can be as young as 16 or you can be 60 or over; it all depends on what type of voluntary work you want to do. Other considerations, such as reliability, are crucial in voluntary work and age isn’t related to these, in our experience.
Another question we get asked relates to training. Well, there’s plenty of that and it’s all face-to-face. What’s more, training doesn’t end when you start working for us – it takes place before, during and after periods of work. Often, it’s run by other experienced volunteers as managers tend to prefer to get on with other things.
Now, I would ask you to consider a couple of important issues before you decide to apply for voluntary work. We don’t worry about why you want to be a volunteer- people have many different reasons that range from getting work experience to just doing something they’ve always wanted to do. But it is critical that you have enough hours in the day for whatever role we agree is suitable for you- if being a volunteer becomes stressful then it’s best not to do it at all. You may think that your income is important, but we don’t ask about that. It’s up to you to decide if you can work without earning money. What we value is dedication. Some of our most loyal volunteers earn very little themselves but still give their full energy to the work they do with us.
—————
OK, so let’s take a look at some of the work areas that we need volunteers for and the sort of things that would help you in those.
You may wish simply to help us raise money. If you have the creativity to come up with an imaginative or novel way of fundraising, we’d be delighted, as standing in the local streets or shops with a collection box can be rather boring!
One outdoor activity that we need volunteers for is litter collection and for this it’s useful if you can walk for long periods, sometimes uphill. Some of our regular collectors are quite elderly, but very active and keen to protect the environment.
If you enjoy working with children, we have three vacancies for what are called ‘playmates’. These volunteers help children learn about staying healthy through a range of out-of-school activities. You don’t need to have children yourself, but it’s good if you know something about nutrition and can give clear instructions.
If that doesn’t appeal to you, maybe you would be interested in helping out at our story club for disabled children, especially if you have done some acting. We put on three performances a year based on books they have read and we’re always looking for support with the theatrical side of this.
The last area I’ll mention today is first aid. Volunteers who join this group can end up teaching others in vulnerable groups who may be at risk of injury. Initially, though, your priority will be to take in a lot of information and not forget any important steps or details.
Right, so does anyone have any questions …', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(180111, 18012, 'single_choice', 'Why does the speaker apologise about the seats?', '["A", "B", "C"]'::jsonb, 'C', 1, 11),
(180112, 18012, 'single_choice', 'What does the speaker say about the age of volunteers?', '["A", "B", "C"]'::jsonb, 'A', 1, 12),
(180113, 18012, 'single_choice', 'What does the speaker say about training?', '["A", "B", "C"]'::jsonb, 'A', 1, 13),
(180114, 18012, 'multiple_choice', 'Question 14', '["A", "B", "C", "D", "E"]'::jsonb, 'B / E', 1, 14),
(180115, 18012, 'multiple_choice', 'Which&nbsp; TWO &nbsp;issues does the speaker ask the audience to consider before they apply to be volunteers?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / E', 1, 15),
(180116, 18012, 'single_choice', 'Question 16', '["A", "B", "C"]'::jsonb, 'B', 1, 16),
(180117, 18012, 'single_choice', 'Question 17', '["A", "B", "C"]'::jsonb, 'G', 1, 17),
(180118, 18012, 'single_choice', 'Question 18', '["A", "B", "C"]'::jsonb, 'D', 1, 18),
(180119, 18012, 'single_choice', 'Question 19', '["A", "B", "C"]'::jsonb, 'A', 1, 19),
(180120, 18012, 'single_choice', 'Question 20', '["A", "B", "C"]'::jsonb, 'F', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(18013, 1801, 'listening', 'Listening Part 3: Talk on jobs in fashion design', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-26                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Talk on jobs in fashion design</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="21"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong><span class="ielts-q-title"><span>What problem did Chantal have at the start of the talk?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="A"><span class="ielts-radio-text"><strong>A</strong> Her view of the speaker was blocked.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="B"><span class="ielts-radio-text"><strong>B</strong> She was unable to find an empty seat.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="C"><span class="ielts-radio-text"><strong>C</strong> The students next to her were talking.</span></label></div></div><div class="ielts-standalone-q" data-qnum="22"><div class="ielts-q-header"><strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>What were Hugo and Chantal surprised to hear about the job market?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="A"><span class="ielts-radio-text"><strong>A</strong> It has become more competitive than it used to be.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="B"><span class="ielts-radio-text"><strong>B</strong> There is more variety in it than they had realised.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="C"><span class="ielts-radio-text"><strong>C</strong> Some areas of it are more exciting than others.</span></label></div></div><div class="ielts-standalone-q" data-qnum="23"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong><span class="ielts-q-title"><span>Hugo and Chantal agree that the speaker’s message was</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="A"><span class="ielts-radio-text"><strong>A</strong> unfair to them at times.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="B"><span class="ielts-radio-text"><strong>B</strong> hard for them to follow.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="C"><span class="ielts-radio-text"><strong>C</strong> critical of the industry.</span></label></div></div><div class="ielts-standalone-q" data-qnum="24"><div class="ielts-q-header"><strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>What do Hugo and Chantal criticise about their school careers advice?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="A"><span class="ielts-radio-text"><strong>A</strong> when they received the advice</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="B"><span class="ielts-radio-text"><strong>B</strong> how much advice was given</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="C"><span class="ielts-radio-text"><strong>C</strong> who gave the advice</span></label></div></div><div class="ielts-standalone-q" data-qnum="25"><div class="ielts-q-header"><strong class="ielts-q-badge">25</strong><span class="ielts-q-title"><span>When discussing their future, Hugo and Chantal disagree on</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="A"><span class="ielts-radio-text"><strong>A</strong> which is the best career in fashion.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="B"><span class="ielts-radio-text"><strong>B</strong> when to choose a career in fashion.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="C"><span class="ielts-radio-text"><strong>C</strong> why they would like a career in fashion.</span></label></div></div><div class="ielts-standalone-q" data-qnum="26"><div class="ielts-q-header"><strong class="ielts-q-badge">26</strong><span class="ielts-q-title"><span>How does Hugo feel about being an unpaid assistant?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="26" name="question_26" value="A"><span class="ielts-radio-text"><strong>A</strong> He is realistic about the practice.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="26" name="question_26" value="B"><span class="ielts-radio-text"><strong>B</strong> He feels the practice is dishonest.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="26" name="question_26" value="C"><span class="ielts-radio-text"><strong>C</strong> He thinks others want to change the practice.</span></label></div></div></div>
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
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="27,28"><div class="ielts-q-header"><strong class="ielts-q-badge">27</strong> <strong class="ielts-q-badge">28</strong><span class="ielts-q-title"><span>Which  mistakes did the speaker admit she made in her first job?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="27,28" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> being dishonest to her employer</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="27,28" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> paying too much attention to how she looked</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="27,28" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> expecting to become well known</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="27,28" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> trying to earn a lot of money</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="27,28" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> openly disliking her client</span></label></div></div></div>
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
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="29,30"><div class="ielts-q-header"><strong class="ielts-q-badge">29</strong> <strong class="ielts-q-badge">30</strong><span class="ielts-q-title"><span>Which  pieces of retail information do Hugo and Chantal agree would be useful?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> the reasons people return fashion items</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> how much time people have to shop for clothes</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> fashion designs people want but can’t find</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> the best time of year for fashion buying</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="29,30" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> the most popular fashion sizes</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/14071-cambridge-ielts-18-academic-listening-1-audio-3.mp3', 'HUGO: Hi Chantal. What did you think of the talk, then?
CHANTAL: Hi Hugo. I thought it was good once I’d moved seats.
HUGO: Oh- were the people beside you chatting or something?
CHANTAL: It wasn’t that. I went early so that I’d get a seat and not have to stand, but then this guy sat right in front of me and he was so tall!
HUGO: It’s hard to see through people’s heads, isn’t it?
CHANTAL: Impossible! Anyway, to answer your question, I thought it was really interesting, especially what the speaker said about the job market.
HUGO: Me too. I mean we know we’re going into a really competitive field so it’s obvious that we may struggle to get work.
CHANTAL: That’s right – and we know we can’t all have that ‘dream job’.
HUGO: Yeah, but it looks like there’s a whole range of … areas of work that we hadn’t even thought of – like fashion journalism, for instance.
CHANTAL: Yeah – I wasn’t expecting so many career options.
HUGO: Mmm. Overall, she had quite a strong message, didn’t she?
CHANTAL: She did. She kept saying things like ‘I know you all think this, but …’ and then she’d tell us how it really is.
HUGO: Perhaps she thinks students are a bit narrow-minded about the industry.
CHANTAL: It was a bit harsh, though! We know it’s a tough industry.
HUGO: Yeah – and we’re only first years, after all. We’ve got a lot to learn.
CHANTAL: Exactly. Do you think our secondary-school education should have been more career-focused?
HUGO: Well, we had numerous talks on careers, which was good, but none of them were very inspiring. They could have asked more people like today’s speaker to talk to us.
CHANTAL: I agree. We were told about lots of different careers – just when we needed to be, but not by the experts who really know stuff.
HUGO: So did today’s talk influence your thoughts on what career you’d like to take up in the future?
CHANTAL: Well. I promised myself that I’d go through this course and keep an open mind till the end.
HUGO: But I think it’s better to pick an area of the industry now and then aim to get better and better at it.
CHANTAL: Well, I think we’ll just have to differ on that issue!
HUGO: One thing’s for certain, though. From what she said, we’ll be unpaid assistants in the industry for quite a long time.
CHANTAL: Mmm.
HUGO: I’m prepared for that, aren’t you?
CHANTAL: Actually, I’m not going to accept that view.
HUGO: Really? But she knows it’s the case- and everyone else says the same.
CHANTAL: That doesn’t mean it has to be true for me.
HUGO: OK. Well – I hope you’re right!
—————
CHANTAL: I thought the speaker’s account of her first job was fascinating.
HUGO: Yeah – she admitted she was lucky to get work being a personal dresser for a musician. She didn’t even apply for the job and there she was getting paid to choose all his clothes.
CHANTAL: It must have felt amazing – though she said all she was looking for back then was experience, not financial reward.
HUGO: Mmm. And then he was so mean, telling her she was more interested in her own appearance than his!
CHANTAL: But – she did realise he was right about that, which really made me think. I’m always considering my own clothes but now I can see you should be focusing on your client!
HUGO: She obviously regretted losing the job.
CHANTAL: Well, as she said, she should have hidden her negative feelings about him, but she didn’t.
HUGO: It was really brave the way she picked herself up and took that job in retail. Fancy working in a shop after that!
CHANTAL: Yeah – well, she recommended we all do it at some point. I guess as a designer you’d get to find out some useful information, like how big or small the average shopper is.
HUGO: I think that’s an issue for manufacturers, not designers. However, it would be useful to know if there’s a gap in the market – you know, an item that no one’s stocking but that consumers are looking for.
CHANTAL: Yeah, people don’t give up searching. They also take things back to the store if they aren’t right.
HUGO: Yeah. Imagine you worked in an expensive shop and you found out the garments sold there were being returned because they … fell apart in the wash!
CHANTAL: Yeah, it would be good to know that kind of thing.
HUGO: Yeah.', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(180121, 18013, 'single_choice', 'What problem did Chantal have at the start of the talk?', '["A", "B", "C"]'::jsonb, 'A', 1, 21),
(180122, 18013, 'single_choice', 'What were Hugo and Chantal surprised to hear about the job market?', '["A", "B", "C"]'::jsonb, 'B', 1, 22),
(180123, 18013, 'single_choice', 'Hugo and Chantal agree that the speaker&rsquo;s message was', '["A", "B", "C"]'::jsonb, 'A', 1, 23),
(180124, 18013, 'single_choice', 'What do Hugo and Chantal criticise about their school careers advice?', '["A", "B", "C"]'::jsonb, 'C', 1, 24),
(180125, 18013, 'single_choice', 'When discussing their future, Hugo and Chantal disagree on', '["A", "B", "C"]'::jsonb, 'B', 1, 25),
(180126, 18013, 'single_choice', 'How does Hugo feel about being an unpaid assistant?', '["A", "B", "C"]'::jsonb, 'A', 1, 26),
(180127, 18013, 'multiple_choice', 'Question 27', '["A", "B", "C", "D", "E"]'::jsonb, 'B / E', 1, 27),
(180128, 18013, 'multiple_choice', 'Which&nbsp; TWO &nbsp;mistakes did the speaker admit she made in her first job?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / E', 1, 28),
(180129, 18013, 'multiple_choice', 'Question 29', '["A", "B"]'::jsonb, 'A / C', 1, 29),
(180130, 18013, 'multiple_choice', 'Which&nbsp; TWO &nbsp;pieces of retail information do Hugo and Chantal agree would be useful?', '["A", "B"]'::jsonb, 'A / C', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(18014, 1801, 'listening', 'Listening Part 4: Elephant translocation', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p><em>Complete the notes below.</em></p>
<p><em>Write <strong>ONE WORD ONLY</strong> for each answer.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Elephant translocation</strong></strong></p>
<p><strong>Reasons for overpopulation at Majete National Park</strong></p>
<ul>
<li>strict enforcement of anti-poaching laws</li>
<li>successful breeding</li>
</ul>
<p><strong>Problems caused by elephant overpopulation</strong></p>
<ul>
<li>greater competition, causing hunger for elephants</li>
<li>damage to <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span> in the park</li>
</ul>
<p><strong>The translocation process</strong></p>
<ul>
<li>a suitable group of elephants from the same <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> was selected</li>
<li>vets and park staff made use of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span> to help guide the elephants into an open plain</li>
<li>elephants were immobilised with tranquilisers</li>
</ul>
<p>–   this process had to be completed quickly to reduce <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>–   elephants had to be turned on their <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span> to avoid damage to their lungs</p>
<p>–   elephants’ <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> had to be monitored constantly</p>
<p>–   tracking devices were fitted to the matriarchs</p>
<p>–   data including the size of their tusks and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span> was taken</p>
<ul>
<li>elephants were taken by truck to their new reserve</li>
</ul>
<p><strong>Advantages of translocation at Nkhotakota Wildlife Park</strong></p>
<ul>
<li><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> opportunities</li>
<li>a reduction in the number of poachers and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>an example of conservation that other parks can follow</li>
<li>an increase in <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span> as a contributor to GDP</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/14070-cambridge-ielts-18-academic-listening-1-audio-4.mp3', 'For my presentation today I want to tell you about how groups of elephants have been moved and settled in new reserves. This is known as translocation and has been carried out in Malawi in Africa in recent years. The reason this is being done is because of overpopulation of elephants in some areas.
Overpopulation is a good problem to have and not one we tend to hear about very often. In Malawi’s Majete National Park the elephant population had been wiped out by poachers, who killed the elephants for their ivory. But in 2003, the park was restocked and effective law enforcement was introduced. Since then, not a single elephant has been poached. In this safe environment, the elephant population boomed. Breeding went so well that there were more elephants than the park could support.
This led to a number of problems. Firstly, there was more competition for food, which meant that some elephants were suffering from hunger. As there was a limit to the amount of food in the national park, some elephants began looking further afield. Elephants were routinely knocking down fences around the park, which then had to be repaired at a significant cost.
To solve this problem, the decision was made to move dozens of elephants from Majete National Park to Nkhotakota Wildlife Park, where there were no elephants. But, obviously, attempting to move significant numbers of elephants to a new home 300 kilometres away is quite a challenge.
—————
So how did this translocation process work in practice?
Elephants were moved in groups of between eight and twenty, all belonging to one family. Because relationships are very important to elephants, they all had to be moved at the same time. A team of vets and park rangers flew over the park in helicopters and targeted a group, which were rounded up and directed to a designated open plain.
The vets then used darts to immobilise the elephants – this was a tricky manoeuvre, as they not only had to select the right dose of tranquiliser for different-sized elephants but they had to dart the elephants as they were running around. This also had to be done as quickly as possible so as to minimise the stress caused. As soon as the elephants began to flop onto the ground, the team moved in to take care of them.
To avoid the risk of suffocation, the team had to make sure none of the elephants were lying on their chests because their lungs could be crushed in this position. So all the elephants had to be placed on their sides. One person stayed with each elephant while they waited for the vets to do checks. It was very important to keep an eye on their breathing – if there were fewer than six breaths per minute, the elephant would need urgent medical attention. Collars were fitted to the matriarch in each group so their movements could be tracked in their new home. Measurements were taken of each elephant’s tusks – elephants with large tusks would be at greater risk from poachers – and also of their feet. The elephants were then taken to a recovery area before being loaded onto trucks and transported to their new home.
The elephants translocated to Nkhotakota settled in very well and the project has generally been accepted to have been a huge success – and not just for the elephants. Employment prospects have improved enormously, contributing to rising living standards for the whole community. Poaching is no longer an issue, as former poachers are able to find more reliable sources of income. In fact, many of them volunteered to give up their weapons, as they were no longer of any use to them.
More than two dozen elephants have been born at Nkhotakota since relocation. With an area of more than 1,800 square kilometres, there’s plenty of space for the elephant population to continue to grow. Their presence is also helping to rebalance Nkhotakota’s damaged ecosystem and providing a sustainable conservation model, which could be replicated in other parks. All this has been a big draw for tourism, which contributes five times more than the illegal wildlife trade to GDP, and this is mainly because of the elephants. There’s also been a dramatic rise in interest …', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(180131, 18014, 'text_input', 't translocation   
  Reasons for overpopulation at Majete National Park  
 
 strict enforcement of anti-poaching laws 
 successful breeding 
 
  Problems caused by elephant overpopulation  
 
 greater competition, causing hunger for elephants 
 damage to  <strong', '[]'::jsonb, 'fences', 1, 31),
(180132, 18014, 'text_input', 'umber">31     in the park 
 
  The translocation process  
 
 a suitable group of elephants from the same  <strong', '[]'::jsonb, 'family', 1, 32),
(180133, 18014, 'text_input', 'd="ielts-listening-question-number-32" class="ielts-listening-question-number">32     was selected 
 vets and park staff made use of  <strong', '[]'::jsonb, 'helicopters', 1, 33),
(180134, 18014, 'text_input', 'elts_listening_answer_14018_3" id="ielts_listening_answer_14018_3" aria-label="Question 33" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  to help guide the elephants into an open plain 
 elephants were immobilised with tranquilisers 
 
 –   this process had to be completed quickly to reduce  <strong', '[]'::jsonb, 'stress', 1, 34),
(180135, 18014, 'text_input', 'trong id="ielts-listening-question-number-34" class="ielts-listening-question-number">34     
 –   elephants had to be turned on their  <strong', '[]'::jsonb, 'sides', 1, 35),
(180136, 18014, 'text_input', 'id="ielts-listening-question-number-35" class="ielts-listening-question-number">35     to avoid damage to their lungs 
 –   elephants’  <strong', '[]'::jsonb, 'breathing', 1, 36),
(180137, 18014, 'text_input', '>    had to be monitored constantly 
 –   tracking devices were fitted to the matriarchs 
 –   data including the size of their tusks and  <strong', '[]'::jsonb, 'feet', 1, 37),
(180138, 18014, 'text_input', 's_listening_answer_14018_7" id="ielts_listening_answer_14018_7" aria-label="Question 37" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  was taken 
 
 elephants were taken by truck to their new reserve 
 
  Advantages of translocation at Nkhotakota Wildlife Park  
 
  <strong', '[]'::jsonb, 'employment', 1, 38),
(180139, 18014, 'text_input', 'stening-question-number-38" class="ielts-listening-question-number">38     opportunities 
 a reduction in the number of poachers and  <strong', '[]'::jsonb, 'weapons', 1, 39),
(180140, 18014, 'text_input', '-39" class="ielts-listening-question-number">39     
 an example of conservation that other parks can follow 
 an increase in  <strong', '[]'::jsonb, 'tourism', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
