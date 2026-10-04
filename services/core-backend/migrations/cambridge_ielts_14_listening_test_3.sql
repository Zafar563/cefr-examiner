-- Cambridge IELTS 14 Academic Listening Test 3
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1403, 'Cambridge IELTS 14 Academic Listening Test 3', 'Rasmiy Cambridge IELTS 14 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(14031, 1403, 'listening', 'Listening Part 1: Flanders Conference Hotel', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-10                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</p>
<p> </p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Flanders Conference Hotel</strong></strong></p>
<p><em>Example</em></p>
<p>Customer Services Manager: …………<em>Angela………..</em></p>
<p><strong>Date available</strong></p>
<ul>
<li>weekend beginning February 4th</li>
</ul>
<p><strong>Conference facilities</strong></p>
<ul>
<li>the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span> room for talks</li>
</ul>
<p>(projector and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span> available)</p>
<ul>
<li>area for coffee and an <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>free <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span> throughout</li>
<li>a standard buffet lunch costs $<span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span> per head</li>
</ul>
<p><strong>Accommodation</strong></p>
<ul>
<li>Rooms will cost $<span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span> including breakfast.</li>
</ul>
<p><strong>Other facilities</strong></p>
<ul>
<li>The hotel also has a spa and rooftop <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>There’s a free shuttle service to the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Location</strong></p>
<ul>
<li>Wilby Street (quite near the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span>)</li>
<li>near to restaurants and many <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span></li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12712-cambridge-ielts-14-academic-listening-3-audio-1.mp3', 'ANGELA: Hello, Flanders conference hotel.
MAN: Oh, hi. I wanted to ask about conference facilities at the hotel. Have I come through to the right person?
ANGELA: You have. I’m the customer services manager. My name’s Angela. So how can I help you?
MAN: Well, I’m calling from Barrett and Stansons, we’re a medical company based in Perth.
ANGELA: Oh yes.
MAN: And we’re organising a conference for our clients to be held in Sydney. It’ll be held over two days and we’re expecting about fifty or sixty people.
ANGELA: When were you thinking of having it?
MAN: Some time early next year, like the end of January? It’d have to be a weekend.
ANGELA: Let me see … our conference facilities are already booked for the weekend beginning January 28th. We could do the first weekend in February?
MAN: How about January 21st?
ANGELA: I’m afraid that’s booked too.
MAN: Well, let’s go for the February date then.
ANGELA: So that’s the weekend beginning the 4th.
MAN: OK. Now can you tell me a bit about what conference facilities you have?
ANGELA: Sure. So for talks and presentations we have the Tesla room.
MAN: Sorry?
ANGELA: Tesla – that’s spelled T-E-S-L-A. it holds up to a hundred people, and it’s fully equipped with a projector and so on.
MAN: How about a microphone?
ANGELA: Yes, that’ll be all set up ready for you, and there’ll be one that members of the audience can use too, for questions, if necessary.
MAN: Fine. And we’ll also need some sort of open area where people can sit and have a cup of coffee, and we’d like to have an exhibition of our products and services there as well, so that’ll need to be quite a big space.
ANGELA: That’s fine, there’s a central atrium with all those facilities, and you can come before the conference starts if you want to set everything up.
MAN: Great. And I presume there’s wifi?
ANGELA: Oh yes, that’s free and available throughout the hotel.
MAN: OK.
ANGELA: Would you also like us to provide a buffet lunch? We can do a two-course meal with a number of different options.
MAN: What sort of price are we looking at for that?
ANGELA: Well, I can send you a copy of the standard menu. That’s $45 per person. Or you can have the special for $25 more.
MAN: I think the standard should be OK, but yes, send me the menu.
———————
MAN: Now we’re also going to need accommodation on the Saturday night for some of the participants … I’m not sure how many, but probably about 25. So what do you change for a room?
ANGELA: Well, for conference attendees we have a 25% reduction, so we can offer you rooms at $135. Normally a standard room’s $180.
MAN: And does that include breakfast?
ANGELA: Sure. And of course, guests can also make use of all the other facilities at the hotel. So we’ve got a spa where you can get massages and facials and so on, and there’s a pool up on the roof for the use of guests.
MAN: Great. Now what about transport links? The hotel’s downtown, isn’t it?
ANGELA: Yes, it’s about 12 kilometres from the airport, but there’s a complimentary shuttle bus for guests. And it’s only about ten minutes’ walk from the central railway station.
MAN: OK. Now, I don’t know Sydney very well, can you just give me an idea of the location of the hotel?
ANGELA: Well, it’s downtown on Wilby Street, that’s quite a small street, and it’s not very far from the sea. And of course if the conference attendees want to go out on the Saturday evening there’s a huge choice of places to eat. Then if they want to make a night of it, they can go on to one of the clubs in the area – there are a great many to choose from.
MAN: OK. So if we go ahead with this, can you give me some information about how much …', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(140301, 14031, 'text_input', 'Date available  
 
 weekend beginning February 4th 
 
  Conference facilities  
 
 the  <strong', '[]'::jsonb, 'Tesla', 1, 1),
(140302, 14031, 'text_input', 'em"> 1     room for talks 
 
 (projector and  <strong', '[]'::jsonb, 'microphone', 1, 2),
(140303, 14031, 'text_input', '> 2     available) 
 
 area for coffee and an  <strong', '[]'::jsonb, 'exhibition', 1, 3),
(140304, 14031, 'text_input', 's="ielts-listening-question-item"> 3     
 free  <strong', '[]'::jsonb, 'wifi', 1, 4),
(140305, 14031, 'text_input', 'rong id="ielts-listening-question-number-4" class="ielts-listening-question-number">4     throughout 
 a standard buffet lunch costs $ <strong', '[]'::jsonb, '45', 1, 5),
(140306, 14031, 'text_input', '-number-5" class="ielts-listening-question-number">5     per head 
 
  Accommodation  
 
 Rooms will cost $ <strong', '[]'::jsonb, '135', 1, 6),
(140307, 14031, 'text_input', 'Other facilities  
 
 The hotel also has a spa and rooftop  <strong', '[]'::jsonb, 'pool', 1, 7),
(140308, 14031, 'text_input', '> 7     
 There’s a free shuttle service to the  <strong', '[]'::jsonb, 'airport', 1, 8),
(140309, 14031, 'text_input', 'on-number-8" class="ielts-listening-question-number">8     
 
  Location  
 
 Wilby Street (quite near the  <strong', '[]'::jsonb, 'sea', 1, 9),
(140310, 14031, 'text_input', 'on-item"> 9    ) 
 near to restaurants and many  <strong', '[]'::jsonb, 'clubs', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(14032, 1403, 'listening', 'Listening Part 2', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-12                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="11,12"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong> <strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>Which  activities that volunteers do are mentioned?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> decorating</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> cleaning</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> delivering meals</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> shopping</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> childcare</span></label></div></div></div>
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
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="13,14"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong> <strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>Which  ways that volunteers can benefit from volunteering are mentioned?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> learning how to be part of a team</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> having a sense of purpose</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> realising how lucky they are</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> improved ability at time management</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> boosting their employment prospects</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 15-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What has each of the following volunteers helped someone to do?</p>
<p>Choose <strong>SIX</strong> answers from the box and write the correct letter, <strong>A-G</strong>, next to Questions</p>
<p><strong>What volunteers have helped people to do</strong></p>
<p><strong>Volunteers</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>Habib</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">15</strong><select data-qnum="15" name="question_15" class="ielts-inline-select"><option value="">[ 15 ] Tanlang...</option><option value="A. overcome physical difficulties">A. overcome physical difficulties</option><option value="B. rediscover skills not used for a long time">B. rediscover skills not used for a long time</option><option value="C. improve their communication skills">C. improve their communication skills</option><option value="D. solve problems independently">D. solve problems independently</option><option value="E. escape isolation">E. escape isolation</option><option value="F. remember past times">F. remember past times</option><option value="G. start a new hobby">G. start a new hobby</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Consuela</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">16</strong><select data-qnum="16" name="question_16" class="ielts-inline-select"><option value="">[ 16 ] Tanlang...</option><option value="A. overcome physical difficulties">A. overcome physical difficulties</option><option value="B. rediscover skills not used for a long time">B. rediscover skills not used for a long time</option><option value="C. improve their communication skills">C. improve their communication skills</option><option value="D. solve problems independently">D. solve problems independently</option><option value="E. escape isolation">E. escape isolation</option><option value="F. remember past times">F. remember past times</option><option value="G. start a new hobby">G. start a new hobby</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Minh</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">17</strong><select data-qnum="17" name="question_17" class="ielts-inline-select"><option value="">[ 17 ] Tanlang...</option><option value="A. overcome physical difficulties">A. overcome physical difficulties</option><option value="B. rediscover skills not used for a long time">B. rediscover skills not used for a long time</option><option value="C. improve their communication skills">C. improve their communication skills</option><option value="D. solve problems independently">D. solve problems independently</option><option value="E. escape isolation">E. escape isolation</option><option value="F. remember past times">F. remember past times</option><option value="G. start a new hobby">G. start a new hobby</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Tanya</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">18</strong><select data-qnum="18" name="question_18" class="ielts-inline-select"><option value="">[ 18 ] Tanlang...</option><option value="A. overcome physical difficulties">A. overcome physical difficulties</option><option value="B. rediscover skills not used for a long time">B. rediscover skills not used for a long time</option><option value="C. improve their communication skills">C. improve their communication skills</option><option value="D. solve problems independently">D. solve problems independently</option><option value="E. escape isolation">E. escape isolation</option><option value="F. remember past times">F. remember past times</option><option value="G. start a new hobby">G. start a new hobby</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Alexei</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">19</strong><select data-qnum="19" name="question_19" class="ielts-inline-select"><option value="">[ 19 ] Tanlang...</option><option value="A. overcome physical difficulties">A. overcome physical difficulties</option><option value="B. rediscover skills not used for a long time">B. rediscover skills not used for a long time</option><option value="C. improve their communication skills">C. improve their communication skills</option><option value="D. solve problems independently">D. solve problems independently</option><option value="E. escape isolation">E. escape isolation</option><option value="F. remember past times">F. remember past times</option><option value="G. start a new hobby">G. start a new hobby</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Juba</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">20</strong><select data-qnum="20" name="question_20" class="ielts-inline-select"><option value="">[ 20 ] Tanlang...</option><option value="A. overcome physical difficulties">A. overcome physical difficulties</option><option value="B. rediscover skills not used for a long time">B. rediscover skills not used for a long time</option><option value="C. improve their communication skills">C. improve their communication skills</option><option value="D. solve problems independently">D. solve problems independently</option><option value="E. escape isolation">E. escape isolation</option><option value="F. remember past times">F. remember past times</option><option value="G. start a new hobby">G. start a new hobby</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12699">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. overcome physical difficulties">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">overcome physical difficulties</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. rediscover skills not used for a long time">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">rediscover skills not used for a long time</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. improve their communication skills">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">improve their communication skills</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. solve problems independently">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">solve problems independently</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. escape isolation">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">escape isolation</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. remember past times">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">remember past times</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. start a new hobby">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">start a new hobby</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12711-cambridge-ielts-14-academic-listening-3-audio-2.mp3', 'Good morning. My name’s Lucy Crittenden, and I’m the Director of Operations for an organisation that arranges volunteering in this part of the country. I’m hoping I can persuade one or two of you to become volunteers yourselves. Let me start by briefly explaining what we mean by volunteering.
Volunteers are teenagers and adults who choose to spend some time, unpaid, helping other people in some way. Most volunteers devote two or three hours to this every week, while a few do much more. The people they help may have physical or behavioural difficulties, for example.
Volunteers can do all sorts of things, depending on their own abilities and interests. If they’re supporting a family that’s struggling, for example, they may be able to give them tips on cooking, or recommend how to plan their budget or how to shop sensibly on their income. They might even do some painting or wallpapering, perhaps alongside any members of the family who are able to do it. Or even do some babysitting so that parents can go out for a while.
The benefit from volunteering isn’t only for the people being helped. Volunteers also gain from it: they’re using their skills to cope with somebody’s mental or physical ill health, and volunteering may be a valuable element of their CV when they’re applying for jobs: employers usually look favourably on someone who’s given up time to help others. Significantly, most volunteers feel that what they’re doing gives them a purpose in their lives. And in my opinion, they’re lucky in that respect, as many people don’t have that feeling.
——————
Now I’d like to tell you what some of our volunteers have said about what they do, to give you an idea of the range of ways in which they can help people.
Habib supports an elderly lady who’s beginning to show signs of dementia. Once a week they, along with other elderly people, go to the local community centre, where a group of people come in and sing. The songs take the listeners back to their youth, and for a little while they can forget the difficulties that they face now.
Our volunteer Consuela is an amazing woman. She has difficulty walking herself, but she doesn’t let that stop her. She helps a couple of people with similar difficulties, who had almost stopped walking altogether. By using herself as an example, Consuela encourages them to walk more and more.
Minh visits a young man who lives alone and can’t leave his home on his own, so he hardly ever saw anyone. But together they go out to the cinema, or to see friends the young man hadn’t been able to visit for a long time.
Tanya visits an elderly woman once a week. When the woman found out that Tanya is a professional dressmaker, she got interested. Tanya showed her some soft toys she’d made, and the woman decided to try it herself. And now she really enjoys it, and spends hours making toys. They’re not perhaps up to Tanya’s standard yet, but she gains a lot of pleasure from doing it.
Alexei is a volunteer with a family that faces a number of difficulties. By calmly talking over possible solutions with family members, he’s helping them to realise that they aren’t helpless, and that they can do something themselves to improve their situation. This has been great for their self-esteem.
And the last volunteer I’ll mention, though there are plenty more, is Juba. She volunteers with a teenage girl with learning difficulties, who wasn’t very good at talking to other people. Juba’s worked very patiently with her, and now the girl is far better at expressing herself, and at understanding other people.
OK, I hope that’s given you an idea of what volunteering is all about. Now I’d like …', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(140311, 14032, 'multiple_choice', 'Question 11', '["A", "B", "C", "D", "E"]'::jsonb, 'A / E', 1, 11),
(140312, 14032, 'multiple_choice', 'Which&nbsp; TWO &nbsp;activities that volunteers do are mentioned?', '["A", "B", "C", "D", "E"]'::jsonb, 'A / E', 1, 12),
(140313, 14032, 'multiple_choice', 'Question 13', '["A", "B", "C", "D", "E"]'::jsonb, 'B / E', 1, 13),
(140314, 14032, 'multiple_choice', 'Which&nbsp; TWO &nbsp;ways that volunteers can benefit from volunteering are mentioned?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / E', 1, 14),
(140315, 14032, 'single_choice', 'Question 15', '["A", "B", "C"]'::jsonb, 'F', 1, 15),
(140316, 14032, 'single_choice', 'Question 16', '["A", "B", "C"]'::jsonb, 'A', 1, 16),
(140317, 14032, 'single_choice', 'Question 17', '["A", "B", "C"]'::jsonb, 'E', 1, 17),
(140318, 14032, 'single_choice', 'Question 18', '["A", "B", "C"]'::jsonb, 'G', 1, 18),
(140319, 14032, 'single_choice', 'Question 19', '["A", "B", "C"]'::jsonb, 'D', 1, 19),
(140320, 14032, 'single_choice', 'Question 20', '["A", "B", "C"]'::jsonb, 'C', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(14033, 1403, 'listening', 'Listening Part 3', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-26                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</p>
<p><strong>Background on school marching band</strong></p>
<p>It consists of around <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">21</strong><input type="text" data-qnum="21" name="question_21" class="ielts-inline-input" placeholder="[21] javob..." autocomplete="off" spellcheck="false"></span></span> students.</p>
<p>It is due to play in a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">22</strong><input type="text" data-qnum="22" name="question_22" class="ielts-inline-input" placeholder="[22] javob..." autocomplete="off" spellcheck="false"></span></span> band competition.</p>
<p>It has been invited to play in the town’s <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">23</strong><input type="text" data-qnum="23" name="question_23" class="ielts-inline-input" placeholder="[23] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>They have listened to a talk by a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">24</strong><input type="text" data-qnum="24" name="question_24" class="ielts-inline-input" placeholder="[24] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>Joe will discuss a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">25</strong><input type="text" data-qnum="25" name="question_25" class="ielts-inline-input" placeholder="[25] javob..." autocomplete="off" spellcheck="false"></span></span> with the band.</p>
<p>Joe hopes the band will attend a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">26</strong><input type="text" data-qnum="26" name="question_26" class="ielts-inline-input" placeholder="[26] javob..." autocomplete="off" spellcheck="false"></span></span> next month.</p>
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
                                            <p>What problem does Joe mention in connection with each of the following band members?</p>
<p>Choose <strong>FOUR</strong> answers from the box and write the correct letter, <strong>A-F</strong>, next to Questions.</p>
<p><strong>Problems</strong></p>
<p><strong>Band members</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>flautist</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. makes a lot of mistakes in rehearsals">A. makes a lot of mistakes in rehearsals</option><option value="B. keeps making unhelpful suggestions">B. keeps making unhelpful suggestions</option><option value="C. has difficulty with rhythm">C. has difficulty with rhythm</option><option value="D. misses too many rehearsals">D. misses too many rehearsals</option><option value="E. has a health problem">E. has a health problem</option><option value="F. doesn’t mix with other students">F. doesn’t mix with other students</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <div class="ielts-listening-question-item"> • <span>trumpeter</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">28</strong><select data-qnum="28" name="question_28" class="ielts-inline-select"><option value="">[ 28 ] Tanlang...</option><option value="A. makes a lot of mistakes in rehearsals">A. makes a lot of mistakes in rehearsals</option><option value="B. keeps making unhelpful suggestions">B. keeps making unhelpful suggestions</option><option value="C. has difficulty with rhythm">C. has difficulty with rhythm</option><option value="D. misses too many rehearsals">D. misses too many rehearsals</option><option value="E. has a health problem">E. has a health problem</option><option value="F. doesn’t mix with other students">F. doesn’t mix with other students</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <div class="ielts-listening-question-item"> • <span>trombonist</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">29</strong><select data-qnum="29" name="question_29" class="ielts-inline-select"><option value="">[ 29 ] Tanlang...</option><option value="A. makes a lot of mistakes in rehearsals">A. makes a lot of mistakes in rehearsals</option><option value="B. keeps making unhelpful suggestions">B. keeps making unhelpful suggestions</option><option value="C. has difficulty with rhythm">C. has difficulty with rhythm</option><option value="D. misses too many rehearsals">D. misses too many rehearsals</option><option value="E. has a health problem">E. has a health problem</option><option value="F. doesn’t mix with other students">F. doesn’t mix with other students</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <div class="ielts-listening-question-item"> • <span>percussionist</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">30</strong><select data-qnum="30" name="question_30" class="ielts-inline-select"><option value="">[ 30 ] Tanlang...</option><option value="A. makes a lot of mistakes in rehearsals">A. makes a lot of mistakes in rehearsals</option><option value="B. keeps making unhelpful suggestions">B. keeps making unhelpful suggestions</option><option value="C. has difficulty with rhythm">C. has difficulty with rhythm</option><option value="D. misses too many rehearsals">D. misses too many rehearsals</option><option value="E. has a health problem">E. has a health problem</option><option value="F. doesn’t mix with other students">F. doesn’t mix with other students</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12703">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. makes a lot of mistakes in rehearsals">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">makes a lot of mistakes in rehearsals</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. keeps making unhelpful suggestions">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">keeps making unhelpful suggestions</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. has difficulty with rhythm">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">has difficulty with rhythm</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. misses too many rehearsals">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">misses too many rehearsals</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. has a health problem">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">has a health problem</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. doesn’t mix with other students">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">doesn’t mix with other students</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12710-cambridge-ielts-14-academic-listening-3-audio-3.mp3', 'LIZZIE: So how are you getting on with your teaching practice at the High School, Joe?
JOE: Well I’ve been put in charge of the school marching band, and it’s quite a responsibility. I’d like to talk it over with you.
LIZZIE: Go ahead. You’d better start by giving me a bit of background.
JOE: OK. Well the band has students in it from all years, so they’re aged 11 to 18, and there are about 50 of them altogether. It’s quite a popular activity within the school. I’ve never worked with a band of more than 20 before, and this is very different.
LIZZIE: I can imagine.
JOE: They aren’t really good enough to enter national band competitions, but they’re in a regional one later in the term. Even if they don’t win, and I don’t expect them to, hopefully it’ll be an incentive for them to try and improve.
LIZZIE: Yes, hopefully.
JOE: Well, now the town council’s organising a carnival in the summer, and the band has been asked to perform. If you ask me, they aren’t really up to it yet, and I need to get them functioning better as a band, and in a very short time.
LIZZIE: Have you been doing anything with them? Apart from practising the music, I mean.
JOE: I played a recording I came across, of a drummer talking about how playing in a band had changed his life. I think it was an after-dinner speech. I thought it was pretty inspiring, because being in the band had stopped him from getting involved in crime. The students seemed to find it interesting, too.
LIZZIE: That’s good.
JOE: I’m planning to show them that old film from the 1940s ‘Strike Up the Band’, and talk about it with the students. What do you think?
LIZZIE: Good idea. As it’s about a school band, it might make the students realise how much they can achieve if they work together.
JOE: That’s what I’ve got in mind. I’m hoping I can take some of the band to a parade that’s going to take place next month. A couple of marching bands will be performing, and the atmosphere should be quite exciting. It depends on whether I can persuade the school to hire a coach or two to take us there.
LIZZIE: Mmm. They sound like good ideas to me.
JOE: Thanks.
—————————
JOE: Can I tell you about a few people in the band who I’m finding it quite difficult to cope with? I’m sure you’ll have some ideas about what I can do.
LIZZIE: Go ahead.
JOE: There’s a flautist who says she loves playing in the band. We rehearse twice a week after school, but she’s hardly ever there. Then she looks for me the next day and gives me a very plausible reason – she says she had to help her mother, or she’s been ill, but to be honest, I don’t believe her.
LIZZIE: Oh dear! Any more students with difficulties?
JOE: Plenty! There’s a trumpeter who thinks she’s the best musician in the band, though she certainly isn’t. She’s always saying what she thinks other people should do, which makes my job pretty difficult.
LIZZIE: She sounds a bit of a nightmare!
JOE: You can say that again. One of the trombonists has got an impressive sense of rhythm, and could be an excellent musician – except that he has breathing difficulties, and he doesn’t really have enough breath for the trombone. He’d be much better of playing percussion, for instance, but he refuses to give up. So he ends up only playing half the notes.
LIZZIE: I suppose you have to admire his determination.
JOE: Maybe. One of the percussionists isn’t too bad, but he never seems to interact with other people, and he always rushes off as soon as the rehearsal ends. I don’t know if there are family reasons, or what. But it isn’t good in a band, where people really need to feel they’re part of a group.
LIZZIE: Hmm.
JOE: There are others too, but at least that gives you an idea of what I’m up against. Do you have any thoughts about what I can do, Lizzie?', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(140321, 14033, 'text_input', 'Background on school marching band  
 It consists of around  <strong', '[]'::jsonb, '50', 1, 21),
(140322, 14033, 'text_input', 'It is due to play in a  <strong', '[]'::jsonb, 'regional', 1, 22),
(140323, 14033, 'text_input', 'It has been invited to play in the town’s  <strong', '[]'::jsonb, 'carnival', 1, 23),
(140324, 14033, 'text_input', 'em"> 23     
 They have listened to a talk by a  <strong', '[]'::jsonb, 'drummer', 1, 24),
(140325, 14033, 'text_input', 'ing-question-item"> 24     
 Joe will discuss a  <strong', '[]'::jsonb, 'film', 1, 25),
(140326, 14033, 'text_input', 'Joe hopes the band will attend a  <strong', '[]'::jsonb, 'parade', 1, 26),
(140327, 14033, 'single_choice', 'Question 27', '["A", "B", "C"]'::jsonb, 'D', 1, 27),
(140328, 14033, 'single_choice', 'Question 28', '["A", "B", "C"]'::jsonb, 'B', 1, 28),
(140329, 14033, 'single_choice', 'Question 29', '["A", "B", "C"]'::jsonb, 'E', 1, 29),
(140330, 14033, 'single_choice', 'Question 30', '["A", "B", "C"]'::jsonb, 'F', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(14034, 1403, 'listening', 'Listening Part 4', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</p>
<p><strong>Concerts in university arts festival</strong></p>
<p><strong>Concert 1</strong></p>
<ul>
<li>Australian composer: Liza Lim</li>
<li>studied piano and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span> before turning to composition</li>
<li>performers and festivals around the world have given her a lot of commissions</li>
<li>compositions show a great deal of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> and are drawn from various cultural sources</li>
<li>her music is very expressive and also <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>festival will include her <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> called <em>The Oresteia</em></li>
<li>Lim described the sounds in <em>The Oresteia </em>as <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>British composers: Ralph Vaughan Williams, Frederick Delius</li>
</ul>
<p><strong>Concert</strong> <strong>2</strong></p>
<ul>
<li>British composers: Benjamin Britten, Judith Weir</li>
<li>Australian composer: Ross Edwards</li>
<li>festival will include <em>The Tower of Remoteness</em>, inspired by nature</li>
<li><em>The Tower of Remoteness </em>is performed by piano and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>compositions include music for children</li>
<li>celebrates Australia’s cultural <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Concert 3</strong></p>
<ul>
<li>Australian composer: Carl Vine</li>
<li>played cornet then piano</li>
<li>studied <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> before studying music</li>
<li>worked in Sydney as a pianist and composer</li>
<li>became well known as composer of music for <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>festival will include his music for the 1996 <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>British composers: Edward Elgar, Thomas Adès</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/12709-cambridge-ielts-14-academic-listening-3-audio-4.mp3', 'As you all know, the university is planning an arts festival for later this year, and here in the music department we’ve planned three concerts. These will be public performances, and the programme has just been finalised. The theme of the festival is links between the UK and Australia, and this is reflected in the music: each concert will feature both British and Australian composers. I’ll tell you briefly about the Australian music, as you probably won’t be familiar with that.
The first concert will include music by Liza Lim, who was born in Perth, Western Australia, in 1966. As a child, Lim originally learned to play the piano – like so many children – and also the violin. But when she was 11 her teachers encouraged her to start composing. She found this was her real strength, and she studied and later taught composition, both in Australia and in other countries. As a composer, she has received commissions from numerous orchestras, other performers and festivals in several countries.
Liza Lim’s compositions are vibrant and full of energy, and she often explores Asian and Australian Aboriginal cultural sources, including the native instrument, the didgeridoo: this is featured in a work called The Compass . Her music is very expressive, so although it is complex, it has the power of connecting with audiences and performers alike.
In the festival we’re going to give a semi-staged performance of The Oresteia . This is an opera in seven parts, based on the trilogy of ancient Greek tragedies by Aeschylus. Lim composed this when she was in her mid-20s, and she also wrote the text, along with Barrie Kosky. It’s performed by six singers, a dancer, and an orchestra that, as well as standard orchestral instruments, includes electric guitar, and a traditional Turkish stringed instrument. Lim wrote that because the stories in the tragedies are not easy to tell, the sounds she creates are also disturbing, and they include breathing, sobbing, laughing and whistling. The work lasts around 75 minutes, and the rest of the concert will consist of orchestral works by the British composers Ralph Vaughan Williams and Frederick Delius.
——————————
Moving on now to our second concert, this will begin with instrumental music by British composers – Benjamin Britten and Judith Weir. After the interval we’ll go to Australia for a piece by Ross Edwards: The Tower of Remoteness . According to Edwards, the inspiration for this piece came from nature, when he was sitting alone in the dry bed of a creek, overshadowed by the leaves of palm trees, listening to the birds and insects. The Tower of Remoteness is scored for piano and clarinet. Edwards says he realised years after writing the piece that he had subconsciously modelled its opening phrase on a bird call.
Ross Edwards was born in 1943 in Sydney, Australia, and studied at the Sydney Conservatorium of Music and the universities of Adelaide and Sydney. He’s well known in Australia, and in fact he’s one of the country’s most performed composers. He’s written a wide range of music, from symphonies and concertos to some composed specifically for children. Edward’s music has been described as being ‘deeply connected to Australia’, and it can be regarded as a celebration of the diversity of cultures that Australia can be proud of.
The last of the three Australian composers to be represented in our festival is Carl Vine. Born in 1954, Vine, like Liza Lim, comes from Perth, Western Australia. He took up the cornet at the age of five, switching to the piano five years later. However, he went to university to study physics, before changing to composition. After graduating he moved to Sydney and worked as a freelance pianist and composer. Before long he had become prominent in Australia as a composer for dance, and in fact has written 25 scores of that type.
In our third concert, Vine will be represented by his music for the flag hand-over ceremony of the Olympics held in 1996. This seven-minute orchestral piece was of course heard by millions of people worldwide, and we’ll hear it alongside works written by British composers Edward Elgar and, more recently, Thomas Adès.', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(140331, 14034, 'text_input', 'Concerts in university arts festival  
  Concert 1  
 
 Australian composer: Liza Lim 
 studied piano and  <strong', '[]'::jsonb, 'violin', 1, 31),
(140332, 14034, 'text_input', 'xt" name="ielts_listening_answer_12705_1" id="ielts_listening_answer_12705_1" aria-label="Question 31" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  before turning to composition 
 performers and festivals around the world have given her a lot of commissions 
 compositions show a great deal of  <strong', '[]'::jsonb, 'energy', 1, 32),
(140333, 14034, 'text_input', '" class="ielts-listening-question-number">32     and are drawn from various cultural sources 
 her music is very expressive and also  <strong', '[]'::jsonb, 'complex', 1, 33),
(140334, 14034, 'text_input', 'ion-item"> 33     
 festival will include her  <strong', '[]'::jsonb, 'opera', 1, 34),
(140335, 14034, 'text_input', '" class="ielts-listening-question-number">34     called  The Oresteia  
 Lim described the sounds in  The Oresteia  as  <strong', '[]'::jsonb, 'disturbing', 1, 35),
(140336, 14034, 'text_input', 'ughan Williams, Frederick Delius 
 
  Concert   2  
 
 British composers: Benjamin Britten, Judith Weir 
 Australian composer: Ross Edwards 
 festival will include  The Tower of Remoteness , inspired by nature 
  The Tower of Remoteness  is performed by piano and  <strong', '[]'::jsonb, 'clarinet', 1, 36),
(140337, 14034, 'text_input', '6" class="ielts-listening-question-number">36     
 compositions include music for children 
 celebrates Australia’s cultural  <strong', '[]'::jsonb, 'diversity', 1, 37),
(140338, 14034, 'text_input', '/strong>    
 
  Concert 3  
 
 Australian composer: Carl Vine 
 played cornet then piano 
 studied  <strong', '[]'::jsonb, 'physics', 1, 38),
(140339, 14034, 'text_input', 'umber">38     before studying music 
 worked in Sydney as a pianist and composer 
 became well known as composer of music for  <strong', '[]'::jsonb, 'dance', 1, 39),
(140340, 14034, 'text_input', 'd="ielts-listening-question-number-39" class="ielts-listening-question-number">39     
 festival will include his music for the 1996  <strong', '[]'::jsonb, 'Olympics', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
