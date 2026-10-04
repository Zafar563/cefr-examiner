-- Cambridge IELTS 17 Academic Listening Test 3
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1703, 'Cambridge IELTS 17 Academic Listening Test 3', 'Rasmiy Cambridge IELTS 17 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(17031, 1703, 'listening', 'Listening Part 1: Advice on surfing holidays', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-10                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p><em>Complete the notes below.</em></p>
<p><em>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Advice on surfing holidays</strong></strong></p>
<p><strong>Jack’s advice</strong></p>
<ul>
<li>Recommends surfing for <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span> holidays in the summer</li>
<li>Need to be quite <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Irish surfing locations</strong></p>
<ul>
<li>County Clare</li>
</ul>
<p>–  Lahinch has some good quality <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span> and surf schools</p>
<p>–  There are famous cliffs nearby</p>
<ul>
<li>County Mayo</li>
</ul>
<p>–  Good surf school at <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span> beach</p>
<p>–  Surf camp lasts for one <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>–  Can also explore the local <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span> by kayak</p>
<p><strong>Weather</strong></p>
<ul>
<li>Best month to go: <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>Average temperature in summer: approx. <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span> degrees</li>
</ul>
<p><strong>Costs</strong></p>
<ul>
<li>Equipment</li>
</ul>
<p>–  Wetsuit and surfboard: <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span> euros per day</p>
<p>–  Also advisable to hire <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span> for warmth</p>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13670-cambridge-ielts-17-academic-listening-3-audio-1.mp3', 'WOMAN: Jack, I’m thinking of taking the kids to the seaside on a surfing holiday this summer and I wanted to ask your advice – as I know you’re such an expert.
JACK: Well, I don’t know about that, but yes, I’ve done a bit of surfing over the years. I’d thoroughly recommend it. I think it’s the kind of holiday all the family can enjoy together. The thing about surfing is that it’s great for all ages and all abilities. My youngest started when he was only three!
WOMAN: Wow! But it’s quite physically demanding, isn’t it? I’ve heard you need to be pretty fit.
JACK: Yes. You’ll certainly learn more quickly and won’t tire as easily.
WOMAN: Well – that should be OK for us. You’ve been surfing a few times in Ireland, haven’t you?
JACK: Yes. There’s some great surfing there, which people don’t always realise.
WOMAN: And which locations would you recommend? – there seem to be quite a few.
JACK: Yes, there are loads. Last year we went to County Donegal. There are several great places to surf there.
WOMAN: What about in County Clare? I read that’s also really good for surfing.
JACK: Yes, it is. I’ve been there a few times. Most people go to Lahinch. My kids love it there. The waves aren’t too challenging and the town is very lively.
WOMAN: Are there good hotels there?
JACK: Yes – some very nice ones and there are also a few basic hostels and campsites. It’s great if you need lessons as the surf schools are excellent.
WOMAN: Sounds good.
JACK: Yes and there’s lots to see in the area – like those well-known cliffs – … I’ve forgotten the name of them …
WOMAN: Oh don’t worry – I can look them up.
JACK: I’ve also been surfing in County Mayo, which is less well-known for surfing, but we had a really good time. That was a few years ago when the kids were younger. There’s a good surf school at Carrowniskey beach.
WOMAN: How do you spell that?
JACK: C-A-double R-O-W-N-I-S-K-E-Y
WOMAN: OK.
JACK: I put the kids into the surf camp they run during the summer for 10-16 year olds.
WOMAN: Oh right. How long was that for?
JACK: Three hours every day for a week. It was perfect – they were so tired out after that.
WOMAN: I can imagine.
JACK: One thing we did while the kids were surfing was to rent some kayaks to have a look around the bay which is nearby. It’s really beautiful.
WOMAN: Oh, I’d love to do that.
—————————
WOMAN: Now the only time I went to Ireland it rained practically every day.
JACK: Mmm yes – that can be a problem – but you can surf in the rain, you know.
WOMAN: It doesn’t have the same appeal, somehow.
JACK: Well, the weather’s been fine the last couple of years when I’ve been there, but actually, it tends to rain more in August than in the spring or autumn. September’s my favourite month because the water is warmer then.
WOMAN: The only problem is that the kids are back to school then.
JACK: I know. But one good thing about Irish summers is that it doesn’t get too hot. The average temperature is about 19 degrees and it usually doesn’t go above 25 degrees.
WOMAN: That sounds alright. Now what about costs?
JACK: Surfing is a pretty cheap holiday really – the only cost is the hire of equipment. You can expect to pay a daily rate of about 30 euros for the hire of a wetsuit and board – but you can save about 40 euros if you hire by the week.
WOMAN: That’s not too bad.
JACK: No. It’s important to make sure you get good quality wetsuits – you’ll all get too cold if you don’t. And make sure you also get boots. They keep your feet warm and it’s easier to surf with them on too.
WOMAN: OK. Well, thanks very much …', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(170301, 17031, 'text_input', 'Advice on surfing holidays   
  Jack’s advice  
 
 Recommends surfing for  <strong', '[]'::jsonb, 'family', 1, 1),
(170302, 17031, 'text_input', 'strong id="ielts-listening-question-number-1" class="ielts-listening-question-number">1     holidays in the summer 
 Need to be quite  <strong', '[]'::jsonb, 'fit', 1, 2),
(170303, 17031, 'text_input', 'umber">2     
 
  Irish surfing locations  
 
 County Clare 
 
 –  Lahinch has some good quality  <strong', '[]'::jsonb, 'hotels', 1, 3),
(170304, 17031, 'text_input', 'estion-number">3     and surf schools 
 –  There are famous cliffs nearby 
 
 County Mayo 
 
 –  Good surf school at  <strong', '[]'::jsonb, 'Carrowniskey', 1, 4),
(170305, 17031, 'text_input', 'n-item"> 4     beach 
 –  Surf camp lasts for one  <strong', '[]'::jsonb, 'week', 1, 5),
(170306, 17031, 'text_input', 'tion-item"> 5     
 –  Can also explore the local  <strong', '[]'::jsonb, 'bay', 1, 6),
(170307, 17031, 'text_input', 'ing-question-number-6" class="ielts-listening-question-number">6     by kayak 
  Weather  
 
 Best month to go:  <strong', '[]'::jsonb, 'September', 1, 7),
(170308, 17031, 'text_input', '<strong', '[]'::jsonb, '19 / nineteen', 1, 8),
(170309, 17031, 'text_input', 'listening-question-number">8     degrees 
 
  Costs  
 
 Equipment 
 
 –  Wetsuit and surfboard:  <strong', '[]'::jsonb, '30 / thirty', 1, 9),
(170310, 17031, 'text_input', '> 9     euros per day 
 –  Also advisable to hire  <strong', '[]'::jsonb, 'boots', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(17032, 1703, 'listening', 'Listening Part 2', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-12                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="11,12"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong> <strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>Which  facts are given about the school’s extended hours childcare service?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> It started recently.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> More children attend after school than before school.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> An average of 50 children attend in the mornings.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> A child cannot attend both the before and after school sessions.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> The maximum number of children who can attend is 70.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 13-15                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="13"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong><span class="ielts-q-title"><span>How much does childcare cost for a complete afternoon session per child?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="A"><span class="ielts-radio-text"><strong>A</strong> £3.50</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="B"><span class="ielts-radio-text"><strong>B</strong> £5.70</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="C"><span class="ielts-radio-text"><strong>C</strong> £7.20</span></label></div></div><div class="ielts-standalone-q" data-qnum="14"><div class="ielts-q-header"><strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>What does the manager say about food?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="A"><span class="ielts-radio-text"><strong>A</strong> Children with allergies should bring their own food.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="B"><span class="ielts-radio-text"><strong>B</strong> Children may bring healthy snacks with them.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="C"><span class="ielts-radio-text"><strong>C</strong> Children are given a proper meal at 5 p.m.</span></label></div></div><div class="ielts-standalone-q" data-qnum="15"><div class="ielts-q-header"><strong class="ielts-q-badge">15</strong><span class="ielts-q-title"><span>What is different about arrangements in the school holidays?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="A"><span class="ielts-radio-text"><strong>A</strong> Children from other schools can attend.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="B"><span class="ielts-radio-text"><strong>B</strong> Older children can attend.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="C"><span class="ielts-radio-text"><strong>C</strong> A greater number of children can attend.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 16-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What information is given about each of the following activities on offer?</p>
<p><em>Choose <strong>FIVE</strong> answers from the box and write the correct letter, <strong>A-G</strong>, next to Questions.</em></p>
<p><strong>Information</strong></p>
<p><strong>Activities</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>Spanish</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">16</strong><select data-qnum="16" name="question_16" class="ielts-inline-select"><option value="">[ 16 ] Tanlang...</option><option value="A. has limited availability">A. has limited availability</option><option value="B. is no longer available">B. is no longer available</option><option value="C. is for over 8s only">C. is for over 8s only</option><option value="D. requires help from parents">D. requires help from parents</option><option value="E. involves an additional fee">E. involves an additional fee</option><option value="F. is a new activity">F. is a new activity</option><option value="G. was requested by children">G. was requested by children</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Music</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">17</strong><select data-qnum="17" name="question_17" class="ielts-inline-select"><option value="">[ 17 ] Tanlang...</option><option value="A. has limited availability">A. has limited availability</option><option value="B. is no longer available">B. is no longer available</option><option value="C. is for over 8s only">C. is for over 8s only</option><option value="D. requires help from parents">D. requires help from parents</option><option value="E. involves an additional fee">E. involves an additional fee</option><option value="F. is a new activity">F. is a new activity</option><option value="G. was requested by children">G. was requested by children</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Painting</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">18</strong><select data-qnum="18" name="question_18" class="ielts-inline-select"><option value="">[ 18 ] Tanlang...</option><option value="A. has limited availability">A. has limited availability</option><option value="B. is no longer available">B. is no longer available</option><option value="C. is for over 8s only">C. is for over 8s only</option><option value="D. requires help from parents">D. requires help from parents</option><option value="E. involves an additional fee">E. involves an additional fee</option><option value="F. is a new activity">F. is a new activity</option><option value="G. was requested by children">G. was requested by children</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Yoga</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">19</strong><select data-qnum="19" name="question_19" class="ielts-inline-select"><option value="">[ 19 ] Tanlang...</option><option value="A. has limited availability">A. has limited availability</option><option value="B. is no longer available">B. is no longer available</option><option value="C. is for over 8s only">C. is for over 8s only</option><option value="D. requires help from parents">D. requires help from parents</option><option value="E. involves an additional fee">E. involves an additional fee</option><option value="F. is a new activity">F. is a new activity</option><option value="G. was requested by children">G. was requested by children</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Cooking</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">20</strong><select data-qnum="20" name="question_20" class="ielts-inline-select"><option value="">[ 20 ] Tanlang...</option><option value="A. has limited availability">A. has limited availability</option><option value="B. is no longer available">B. is no longer available</option><option value="C. is for over 8s only">C. is for over 8s only</option><option value="D. requires help from parents">D. requires help from parents</option><option value="E. involves an additional fee">E. involves an additional fee</option><option value="F. is a new activity">F. is a new activity</option><option value="G. was requested by children">G. was requested by children</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="13638">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. has limited availability">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">has limited availability</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. is no longer available">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">is no longer available</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. is for over 8s only">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">is for over 8s only</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. requires help from parents">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">requires help from parents</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. involves an additional fee">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">involves an additional fee</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. is a new activity">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">is a new activity</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. was requested by children">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">was requested by children</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13669-cambridge-ielts-17-academic-listening-3-audio-2.mp3', 'Good afternoon. My name’s Mrs Carter and I run the before and after school extended hours childcare service. I hope you’ve had a chance to have a good look around the school and talk to staff and pupils. I know that many of you are interested in using our childcare service when your child joins the school, and perhaps you already know something about it, but for those that don’t, I’ll go through the main details now.
We offer childcare for children from the ages of four to eleven both before and after school. I know that many parents who work find this service invaluable. You can leave your child with us safe in the knowledge that they will be extremely well cared for.
We are insured to provide care for up to 70 children, although we rarely have this many attending at any one session. I think we generally expect around 50-60 children for the afternoon sessions and about half that number for the breakfast sessions. Although we currently do have 70 children registered with us, not all of these attend every day. It’s ten years since we began offering an extended hours service and we’ve come a long way during that time. When we first opened, we only had about 20 children attending regularly.
We try to keep our costs as low as we can and we think we provide very good value for money. For the afternoon sessions, which run from 3.30 until 6 p.m., it’s £7.20. But if you prefer, you can pay for one hour only, which costs £3.50, or two hours which costs £5.70.
The cost of the childcare includes food and snacks. They’ll be given breakfast in the morning and in the afternoon, a healthy snack as soon as they finish school. At 5 p.m. children are given something more substantial, such as pasta or a casserole. Please inform us of any allergies that your child might have and we’ll make sure they’re offered a suitable alternative.
As you may know, the childcare service runs through the school holidays from 8 a.m. to 6 p.m. We offer a really varied and exciting programme to keep the children entertained – we don’t want them to feel as if they are still at school! It will also feel different because they’ll get the chance to make new friends with children from other schools – spaces are available for them because a lot of our term-time children don’t always attend during the holiday. In the past, parents have asked if children over the age of 11 are allowed to come with their younger brothers and sisters – but I’m afraid we’re unable to do this because of the type of insurance we have.
————————
So now let me tell you about some of the activities that your child can do during the after-school sessions. As well as being able to use the playground equipment, computers and the library, there is usually at least one ‘special’ activity that children can do each day. For example, Spanish. We have a specialist teacher coming in every Thursday to give a basic introduction to the language through games and songs. She does two sessions: one for the over 8s and one for the younger children. This is the only activity which we have to make an extra charge for – but it’s well worth it.
Once a week the children have the opportunity to do some music. We’re very lucky that one of our staff is a member of a folk band. On Mondays, she teaches singing and percussion to groups of children. We do rely on parental support for this, so if any of you sing or play an instrument and would be prepared to help out at these sessions, we’d be delighted.
Painting continues to be one of the most popular activities. To begin with we weren’t keen on offering this because of the extra mess involved, but children kept asking if they could do some art and so we finally gave in. Art is great for helping the children to relax after working hard at school all day.
Yoga is something that we’ve been meaning to introduce for some time but haven’t been able to find anyone available to teach it – until now that is. So we’ll see how this goes. Hopefully, children will benefit in all sorts of ways from this.
Cooking is another popular activity. They make a different sort of cake, or pizza or bread each week. Although the younger children love doing it, we found that the mess was just too much, so we’ve decided to restrict this to the over 8s, as they are better able to clean up after themselves.', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(170311, 17032, 'multiple_choice', 'Question 11', '["A", "B", "C", "D", "E"]'::jsonb, 'B / E', 1, 11),
(170312, 17032, 'multiple_choice', 'Which&nbsp; TWO &nbsp;facts are given about the school&rsquo;s extended hours childcare service?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / E', 1, 12),
(170313, 17032, 'single_choice', 'How much does childcare cost for a complete afternoon session per child?', '["A", "B", "C"]'::jsonb, 'C', 1, 13),
(170314, 17032, 'single_choice', 'What does the manager say about food?', '["A", "B", "C"]'::jsonb, 'C', 1, 14),
(170315, 17032, 'single_choice', 'What is different about arrangements in the school holidays?', '["A", "B", "C"]'::jsonb, 'A', 1, 15),
(170316, 17032, 'single_choice', 'Question 16', '["A", "B", "C"]'::jsonb, 'E', 1, 16),
(170317, 17032, 'single_choice', 'Question 17', '["A", "B", "C"]'::jsonb, 'D', 1, 17),
(170318, 17032, 'single_choice', 'Question 18', '["A", "B", "C"]'::jsonb, 'G', 1, 18),
(170319, 17032, 'single_choice', 'Question 19', '["A", "B", "C"]'::jsonb, 'F', 1, 19),
(170320, 17032, 'single_choice', 'Question 20', '["A", "B", "C"]'::jsonb, 'C', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(17033, 1703, 'listening', 'Listening Part 3: Holly’s Work Placement Tutorial', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-24                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Holly’s Work Placement Tutorial</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="21"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong><span class="ielts-q-title"><span>Holly has chosen the Orion Stadium placement because</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="A"><span class="ielts-radio-text"><strong>A</strong> it involves children.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="B"><span class="ielts-radio-text"><strong>B</strong> it is outdoors.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="C"><span class="ielts-radio-text"><strong>C</strong> it sounds like fun.</span></label></div></div><div class="ielts-standalone-q" data-qnum="22"><div class="ielts-q-header"><strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>Which aspect of safety does Dr Green emphasise most?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="A"><span class="ielts-radio-text"><strong>A</strong> ensuring children stay in the stadium</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="B"><span class="ielts-radio-text"><strong>B</strong> checking the equipment children will use</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="C"><span class="ielts-radio-text"><strong>C</strong> removing obstacles in changing rooms</span></label></div></div><div class="ielts-standalone-q" data-qnum="23"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong><span class="ielts-q-title"><span>What does Dr Green say about the spectators?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="A"><span class="ielts-radio-text"><strong>A</strong> They can be hard to manage.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="B"><span class="ielts-radio-text"><strong>B</strong> They make useful volunteers.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="C"><span class="ielts-radio-text"><strong>C</strong> They shouldn’t take photographs.</span></label></div></div><div class="ielts-standalone-q" data-qnum="24"><div class="ielts-q-header"><strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>What has affected the schedule in the past?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="A"><span class="ielts-radio-text"><strong>A</strong> bad weather</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="B"><span class="ielts-radio-text"><strong>B</strong> an injury</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="C"><span class="ielts-radio-text"><strong>C</strong> extra time</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 25-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What do Holly and her tutor agree is an important aspect of each of the following events management skills?</p>
<p><em>Choose <strong>SIX</strong> answers from the box and write the correct letter, <strong>A-H</strong>, next to Questions.</em></p>
<p><strong>Important aspects</strong></p>
<p><strong>Events management skills</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>Communication</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">25</strong><select data-qnum="25" name="question_25" class="ielts-inline-select"><option value="">[ 25 ] Tanlang...</option><option value="A. being flexible">A. being flexible</option><option value="B. focusing on details">B. focusing on details</option><option value="C. having a smart appearance">C. having a smart appearance</option><option value="D. hiding your emotions">D. hiding your emotions</option><option value="E. relying on experts">E. relying on experts</option><option value="F. trusting your own views">F. trusting your own views</option><option value="G. doing one thing at a time">G. doing one thing at a time</option><option value="H. thinking of the future">H. thinking of the future</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Organisation</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">26</strong><select data-qnum="26" name="question_26" class="ielts-inline-select"><option value="">[ 26 ] Tanlang...</option><option value="A. being flexible">A. being flexible</option><option value="B. focusing on details">B. focusing on details</option><option value="C. having a smart appearance">C. having a smart appearance</option><option value="D. hiding your emotions">D. hiding your emotions</option><option value="E. relying on experts">E. relying on experts</option><option value="F. trusting your own views">F. trusting your own views</option><option value="G. doing one thing at a time">G. doing one thing at a time</option><option value="H. thinking of the future">H. thinking of the future</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Time management</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. being flexible">A. being flexible</option><option value="B. focusing on details">B. focusing on details</option><option value="C. having a smart appearance">C. having a smart appearance</option><option value="D. hiding your emotions">D. hiding your emotions</option><option value="E. relying on experts">E. relying on experts</option><option value="F. trusting your own views">F. trusting your own views</option><option value="G. doing one thing at a time">G. doing one thing at a time</option><option value="H. thinking of the future">H. thinking of the future</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Creativity</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">28</strong><select data-qnum="28" name="question_28" class="ielts-inline-select"><option value="">[ 28 ] Tanlang...</option><option value="A. being flexible">A. being flexible</option><option value="B. focusing on details">B. focusing on details</option><option value="C. having a smart appearance">C. having a smart appearance</option><option value="D. hiding your emotions">D. hiding your emotions</option><option value="E. relying on experts">E. relying on experts</option><option value="F. trusting your own views">F. trusting your own views</option><option value="G. doing one thing at a time">G. doing one thing at a time</option><option value="H. thinking of the future">H. thinking of the future</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Leadership</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">29</strong><select data-qnum="29" name="question_29" class="ielts-inline-select"><option value="">[ 29 ] Tanlang...</option><option value="A. being flexible">A. being flexible</option><option value="B. focusing on details">B. focusing on details</option><option value="C. having a smart appearance">C. having a smart appearance</option><option value="D. hiding your emotions">D. hiding your emotions</option><option value="E. relying on experts">E. relying on experts</option><option value="F. trusting your own views">F. trusting your own views</option><option value="G. doing one thing at a time">G. doing one thing at a time</option><option value="H. thinking of the future">H. thinking of the future</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Networking</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">30</strong><select data-qnum="30" name="question_30" class="ielts-inline-select"><option value="">[ 30 ] Tanlang...</option><option value="A. being flexible">A. being flexible</option><option value="B. focusing on details">B. focusing on details</option><option value="C. having a smart appearance">C. having a smart appearance</option><option value="D. hiding your emotions">D. hiding your emotions</option><option value="E. relying on experts">E. relying on experts</option><option value="F. trusting your own views">F. trusting your own views</option><option value="G. doing one thing at a time">G. doing one thing at a time</option><option value="H. thinking of the future">H. thinking of the future</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="13659">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. being flexible">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">being flexible</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. focusing on details">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">focusing on details</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. having a smart appearance">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">having a smart appearance</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. hiding your emotions">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">hiding your emotions</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. relying on experts">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">relying on experts</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. trusting your own views">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">trusting your own views</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. doing one thing at a time">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">doing one thing at a time</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="H" data-text="H. thinking of the future">
                                                                                        <span class="dnd-label">H.</span>
                                                                                        <span class="dnd-text">thinking of the future</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13668-cambridge-ielts-17-academic-listening-3-audio-3.mp3', 'HOLLY: Hello Dr Green – I’m here to talk to you about my work placement.
TUTOR: Oh yes, it’s Holly, isn’t it?
HOLLY: Yes.
TUTOR: So, which work placement have you chosen?
HOLLY: I decided to go for the Orion Stadium placement. The event I’ll be managing is one where I’m helping to set up a sports competition for primary school children.
TUTOR: Yup. That’s always a popular placement – even though it can be tougher than you think working with children.
HOLLY: I know, but it’s the fresh air that attracts me – organising something indoors doesn’t have the same appeal, even though it might be fun.
TUTOR: OK, so obviously safety’s going to be one of your key concerns for this event.
HOLLY: Yes, I’ve already thought about that. I’ll need to make sure none of the equipment’s damaged.
TUTOR: Ah well, you’ll be working with schools, so the equipment will be their responsibility. However, the grounds and what goes on there will be yours.
HOLLY: Oh I see – that’ll include keeping everyone within the boundary once they’re in their kit and on the field?
TUTOR: Exactly – you’ll need to inspect areas like changing rooms as well for anything someone can trip over, but your main priority will be not to lose anyone!
HOLLY: Right. I’ll need staff to help with that.
TUTOR: And don’t forget about the spectators.
HOLLY: Mmm. I was thinking that many of them will be parents, who could help run the event.
TUTOR: I wouldn’t rely on that. They’ll be more interested in filming their children than volunteering.
HOLLY: I’ll need to make sure they don’t interfere with events doing that!
TUTOR: And that’s not always easy, especially when a proud parent’s trying to get a snap of their child and you want them to move elsewhere.
HOLLY: OK. What about the scheduling?
TUTOR: With sporting events there are all sorts of things that can alter the timetable – like rain, for instance – though so far, we’ve always been lucky with that.
HOLLY: Yeah, and I was thinking about what to do if someone got hurt as well. I know that last year that caused a terrible delay.
TUTOR: You have to be prepared for such things.
HOLLY: Oh. What if a match ends in a draw – do you let the teams keep going until someone wins?
TUTOR: That’ll be up to you – and again, you need to plan for it.
HOLLY: Right.
—————————
TUTOR: Now, the aim of your work placement is to give you the opportunity to develop the skills that an events manager needs. So, let’s talk about those a bit.
HOLLY: Well, I think my communication skills are pretty good. I can talk on the phone to people and book venues and that kind of thing.
TUTOR: Good – just remember it isn’t only about what you say. If you meet someone face-to-face and want to persuade them to be a sponsor, for example …
HOLLY: Oh, I’ll dress up for that! Sure.
TUTOR: Good. Let’s go on to think about your organisational skills. You’re working in a very people-based industry and that means things won’t always go to plan.
HOLLY: I guess it’s being prepared to make changes that matters.
TUTOR: That’s right. You may have to make an on-the-spot change to a timetable because of a problem you hadn’t anticipated …
HOLLY: … just do it! OK
TUTOR: How’s your time management these days?
HOLLY: I’m working on it – I’m certainly better when I have a deadline, which is why this work suits me.
TUTOR: Yes, but it’s how you respond as that deadline approaches!
HOLLY: I know I’ve got to look calm even if I’m in a panic.
TUTOR: Just think to yourself – no one must know I’m under pressure.
HOLLY: Yeah – even though I’m multi-tasking like crazy!
TUTOR: Another skill that events managers need is creativity. Often your client has what we call the ‘big picture’ idea, but it’s up to the events manager to think of all the fine points that go to making it work.
HOLLY: Right, so I need to listen carefully to that idea and then fill in all the gaps.
TUTOR: That’s right. And you’ll have a team working under you, so another key skill is leadership. Your team may have lots of ideas too, but you’ve got to make the ultimate choices. Do we have refreshments inside or out, for example?
HOLLY: Isn’t it better to be democratic?
TUTOR: It’s a nice idea, but you have the ultimate responsibility. So, believe in what you think best. Be prepared to say ‘yes’, that’s a good idea but it won’t work here.
HOLLY: I see what you mean. What about the networking side of things? I know it’s an area that a lot of students worry about because we don’t have much experience to offer others.
TUTOR: But even without it – you can still be an interesting person with useful ideas. And the more people you impress, the better.
HOLLY: I guess that will help me when I apply for a real job.
TUTOR: Exactly – think ahead – remember what your ambitions are and keep them in mind.
HOLLY: Definitely.', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(170321, 17033, 'single_choice', 'Holly has chosen the Orion Stadium placement because', '["A", "B", "C"]'::jsonb, 'B', 1, 21),
(170322, 17033, 'single_choice', 'Which aspect of safety does Dr Green emphasise most?', '["A", "B", "C"]'::jsonb, 'A', 1, 22),
(170323, 17033, 'single_choice', 'What does Dr Green say about the spectators?', '["A", "B", "C"]'::jsonb, 'A', 1, 23),
(170324, 17033, 'single_choice', 'What has affected the schedule in the past?', '["A", "B", "C"]'::jsonb, 'B', 1, 24),
(170325, 17033, 'single_choice', 'Question 25', '["A", "B", "C"]'::jsonb, 'C', 1, 25),
(170326, 17033, 'single_choice', 'Question 26', '["A", "B", "C"]'::jsonb, 'A', 1, 26),
(170327, 17033, 'single_choice', 'Question 27', '["A", "B", "C"]'::jsonb, 'D', 1, 27),
(170328, 17033, 'single_choice', 'Question 28', '["A", "B", "C"]'::jsonb, 'B', 1, 28),
(170329, 17033, 'single_choice', 'Question 29', '["A", "B", "C"]'::jsonb, 'F', 1, 29),
(170330, 17033, 'single_choice', 'Question 30', '["A", "B", "C"]'::jsonb, 'H', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(17034, 1703, 'listening', 'Listening Part 4: Bird Migration Theory', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p><em>Complete the notes below.</em></p>
<p><em>Write <strong>ONE WORD ONLY</strong> for each answer.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Bird Migration Theory</strong></strong></p>
<p>Most birds are believed to migrate seasonally.</p>
<p><strong>Hibernation theory</strong></p>
<ul>
<li>It was believed that birds hibernated underwater or buried themselves in <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>This theory was later disproved by experiments on caged birds.</li>
</ul>
<p><strong>Transmutation theory</strong></p>
<ul>
<li>Aristotle believed birds changed from one species into another in summer and winter.</li>
</ul>
<p>–  In autumn he observed that redstarts experience the loss of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> and thought they then turned into robins.</p>
<p>–  Aristotle’s assumptions were logical because the two species of birds had a similar <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span>.</p>
<p><strong>17th century</strong></p>
<ul>
<li>Charles Morton popularised the idea that birds fly to the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> in winter.</li>
</ul>
<p><strong>Scientific developments</strong></p>
<ul>
<li>In 1822, a stork was killed in Germany which had an African spear in its <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
</ul>
<p>–  previously there had been no <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> that storks migrate to Africa</p>
<ul>
<li>Little was known about the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span> and journeys of migrating birds until the practice of ringing was established.</li>
</ul>
<p>–  It was thought large birds carried small birds on some journeys because they were considered incapable of travelling across huge <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> .</p>
<p>–  Ringing depended on what is called the ‘<span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span>’ of dead birds.</p>
<ul>
<li>In 1931, the first <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span> to show the migration of European birds was printed.</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13667-cambridge-ielts-17-academic-listening-3-audio-4.mp3', 'Scientists believe that a majority of the earth’s bird population migrate in some fashion or other. Some travel seasonally for relatively short distances, such as birds that move from their winter habitats in lowlands to mountain tops for the summers. Others, like the Arctic Tern, travel more than 25,000 miles seasonally between the northern and southern poles. Bird migration has been studied over many centuries through a variety of observations.
But until relatively recently, where birds went to in the winter was considered something of a mystery. The lack of modern science and technology led to many theories that we now recognize as error-filled and even somewhat amusing. Take hibernation theory for example – two thousand years ago, it was commonly believed that when birds left an area, they went underwater to hibernate in the seas and oceans. Another theory for the regular appearance and disappearance of birds was that they spend winter hidden in mud till the weather changed and food became abundant again. The theory that some birds hibernate persisted until experiments were done on caged birds in the 1940s which demonstrated that birds have no hibernation instinct.
One of the earliest naturalists and philosophers from ancient Greece was Aristotle who was the first writer to discuss the disappearance and reappearance of some bird species at certain times of year. He developed the theory of transmutation, the seasonal change of one species into another, by observing redstarts and robins. He observed that in the autumn, small birds called ‘redstarts’ began to lose their feathers, which convinced Aristotle that they changed into robins for the winter, and back into redstarts in the summer. These assumptions are understandable given that this pair of species are similar in shape, but are a classic example of an incorrect interpretation based on correct observations.
The most bizarre theory was put forward by an English amateur scientist, Charles Morton, in the seventeenth century. He wrote a surprisingly well-regarded paper claiming that birds migrate to the moon and back every year. He came to this conclusion as the only logical explanation for the total disappearance of some species.
———————————
One of the key moments in the development of migration theory came in 1822 when a white stork was shot in Germany. This particular stork made history because of the long spear in its neck which incredibly had not killed it – everyone immediately realised this spear was definitely not European. It turned out to be a spear from a tribe in Central Africa. This was a truly defining moment in the history of ornithology because it was the first evidence that storks spend their winters in sub-Saharan Africa. You can still see the ‘arrow stork’ in the Zoological Collection of the University of Rostock in Germany.
People gradually became aware that European birds moved south in autumn and north in summer but didn’t know much about it until the practice of catching birds and putting rings on their legs became established. Before this, very little information was available about the actual destinations of particular species and how they travelled there. People speculated that larger birds provided a kind of taxi service for smaller birds by carrying them on their backs. This idea came about because it seemed impossible that small birds weighing only a few grams could fly over vast oceans. This idea was supported by observations of bird behaviour such as the harassment of larger birds by smaller birds.
The development of bird ringing, by a Danish schoolteacher, Hans Christian Cornelius Mortensen, made many discoveries possible. This is still common practice today and relies upon what is known as ‘recovery’ – this is when ringed birds are found dead in the place they have migrated to, and identified. Huge amounts of data were gathered in the early part of the twentieth century and for the first time in history people understood where birds actually went to in winter. In 1931, an atlas was published showing where the most common species of European birds migrated to. More recent theories about bird migration …', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(170331, 17034, 'text_input', 'Hibernation theory  
 
 It was believed that birds hibernated underwater or buried themselves in  <strong', '[]'::jsonb, 'mud', 1, 31),
(170332, 17034, 'text_input', '–  In autumn he observed that redstarts experience the loss of  <strong', '[]'::jsonb, 'feathers', 1, 32),
(170333, 17034, 'text_input', '–  Aristotle’s assumptions were logical because the two species of birds had a similar  <strong', '[]'::jsonb, 'shape', 1, 33),
(170334, 17034, 'text_input', '17th century  
 
 Charles Morton popularised the idea that birds fly to the  <strong', '[]'::jsonb, 'moon', 1, 34),
(170335, 17034, 'text_input', 'Scientific developments  
 
 In 1822, a stork was killed in Germany which had an African spear in its  <strong', '[]'::jsonb, 'neck', 1, 35),
(170336, 17034, 'text_input', '–  previously there had been no  <strong', '[]'::jsonb, 'evidence', 1, 36),
(170337, 17034, 'text_input', 'ng-question-number-36" class="ielts-listening-question-number">36     that storks migrate to Africa 
 
 Little was known about the  <strong', '[]'::jsonb, 'destinations', 1, 37),
(170338, 17034, 'text_input', '–  It was thought large birds carried small birds on some journeys because they were considered incapable of travelling across huge  <strong', '[]'::jsonb, 'oceans', 1, 38),
(170339, 17034, 'text_input', '–  Ringing depended on what is called the ‘ <strong', '[]'::jsonb, 'recovery', 1, 39),
(170340, 17034, 'text_input', 'In 1931, the first  <strong', '[]'::jsonb, 'atlas', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
