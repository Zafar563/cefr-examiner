-- Cambridge IELTS 15 Academic Listening Test 2
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1502, 'Cambridge IELTS 15 Academic Listening Test 2', 'Rasmiy Cambridge IELTS 15 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(15021, 1502, 'listening', 'Listening Part 1: Festival information', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-4                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Complete the table below.</p>
<p>Write ONE WORD ONLY for each answer.</p>
<table>
<tbody>
<tr>
<td colspan="3" width="522">
<p class="ielts-listening-transcript-subhead"><strong><strong>Festival information</strong></strong></p>
</td>
</tr>
<tr>
<td width="114"><strong>Date</strong></td>
<td width="168"><strong>Type of event</strong></td>
<td width="240"><strong>Details</strong></td>
</tr>
<tr>
<td width="114">17th</td>
<td width="168">a concert</td>
<td width="240">performers from Canada</td>
</tr>
<tr>
<td width="114">18th</td>
<td width="168">a ballet</td>
<td width="240">company called <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span></td>
</tr>
<tr>
<td width="114">19th-20th (afternoon)</td>
<td width="168">a play</td>
<td width="240">type of play: a comedy called <em>Jemima</em> has had a good <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span></td>
</tr>
<tr>
<td width="114">20th (evening)</td>
<td width="168">a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span> show</td>
<td width="240">show is called <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span></td>
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
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 5-10                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p><em>Write <strong>ONE WORD ONLY</strong> for each answer.</em></p>
<p><strong>Workshops</strong></p>
<ul>
<li>Making <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span> food</li>
<li>(children only) Making <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>(adults only) Making toys from <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span> using various tools</li>
</ul>
<p><strong>Outdoor activities</strong></p>
<ul>
<li>Swimming in the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>Walking in the woods, led by an expert on <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p>See the festival organiser’s <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span> for more information</p>
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
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/26099-cambridge-ielts-15-academic-listening-2-audio-1.mp3', 'TIM: Good morning. You’re through to the tourist information office, Tim speaking. How can I help you?
JEAN: Oh hello. Could you give me some information about next month’s festival, please? My family and I will be staying in the town that week.
TIM: Of course. Well it starts with a concert on the afternoon of the 17th.
JEAN: Oh I heard about that. The orchestra and singers come from the USA, don’t they?
TIM: They’re from Canada. They’re very popular over there. They’re going to perform a number of well-known pieces that will appeal to children as well as adults.
JEAN: That sounds good. My whole family are interested in music.
TIM: The next day, the 18th, there’s a performance by a ballet company called Eustatis.
JEAN: Sorry?
TIM: The name is spelt E-U-S-T-A-T-I-S. They appeared in last year’s festival, and went down very well. Again, their programme is designed for all ages.
JEAN: Good. I expect we’ll go to that. I hope there’s going to be a play during the festival, a comedy, ideally.
TIM: You’re in luck! On the 19th and 20th a local amateur group are performing one written by a member of group. It’s called Jemima . That’ll be on in the town hall. They’ve already performed it two or three times. I haven’t seen it myself, but the review in the local paper was very good.
JEAN: And is it suitable for children?
TIM: Yes, in fact it’s aimed more at children than at adults, so both performances are in the afternoon.
JEAN: And what about dance? Will there by any performances?
TIM: Yes, also on the 20th, but in the evening. A professional company is putting on a show of modern pieces, with electronic music by young composers.
JEAN: Uh-huh.
TIM: The show is about how people communicate, or fail to communicate, with each other, so it’s got the rather strange name, Chat .
JEAN: I suppose that’s because that’s something we do both face to face and online.
TIM: That’s right.
———————
TIM: Now there are also some workshops and other activities. They’ll all take place at least once every day, so everyone who wants to take part will have a chance.
JEAN: Good. We’re particularly interested in cookery – you don’t happen to have a cookery workshop, do you?
TIM: We certainly do. It’s going to focus on how to make food part of a healthy lifestyle, and it’ll show that even sweet things like cakes can contain much less sugar than they usually do.
JEAN: That might be worth going to. We’re trying to encourage our children to cook.
TIM: Another workshop is just for children, and that’s on creating posters to reflect the history of the town. The aim is to make children aware of how both the town and people’s lives have changed over the centuries. The results will be exhibited in the community centre. Then the other workshop is in toy-making, and that’s for adults only.
JEAN: Oh, why’s that?
TIM: Because it involves carpentry – participants will be making toys out of wood, so there’ll be a lot of sharp chisels and other tools around.
JEAN: It makes sense to keep children away from it.
TIM: Exactly. Now let me tell you about some of the outdoor activities. There’ll be supervised wild swimming …
JEAN: Wild swimming? What’s that?
TIM: It just means swimming in natural waters, rather than a swimming pool.
JEAN: Oh OK. In a lake, for instance.
TIM: Yes, there’s a beautiful one just outside the town, and that’ll be the venue for the swimming. There’ll be lifeguards on duty, so it’s suitable for all ages. And finally, there’ll be a walk in some nearby woods every day. The leader is an expert on insects. He’ll show some that live in the woods, and how important they are for the environment. So there are going to be all sorts of different things to do during the festival.
JEAN: There certainly are.
TIM: If you’d like to read about how the preparations for the festival are going, the festival organizer is keeping a blog. Just search online for the festival website, and you’ll find it.
JEAN: Well, thank you very much for all the information.
TIM: You’re welcome. Goodbye.
JEAN: Goodbye.', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(150201, 15021, 'text_input', 'width="114"> Date  
  Type of event  
  Details  
 
 
 17th 
 a concert 
 performers from Canada 
 
 
 18th 
 a ballet 
 company called  <strong', '[]'::jsonb, 'Eustatis', 1, 1),
(150202, 15021, 'text_input', 'name="ielts_listening_answer_12921_1" id="ielts_listening_answer_12921_1" aria-label="Question 1" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  
 
 
 19th-20th (afternoon) 
 a play 
 type of play: a comedy called  Jemima  has had a good  <strong', '[]'::jsonb, 'review', 1, 2),
(150203, 15021, 'text_input', 'ening-question-number-2" class="ielts-listening-question-number">2     
 
 
 20th (evening) 
 a  <strong', '[]'::jsonb, 'dance', 1, 3),
(150204, 15021, 'text_input', '-item"> 3     show 
 show is called  <strong', '[]'::jsonb, 'Chat', 1, 4),
(150205, 15021, 'text_input', 'Workshops  
 
 Making  <strong', '[]'::jsonb, 'healthy', 1, 5),
(150206, 15021, 'text_input', 'tion-item"> 5     food 
 (children only) Making  <strong', '[]'::jsonb, 'posters', 1, 6),
(150207, 15021, 'text_input', 'n-item"> 6     
 (adults only) Making toys from  <strong', '[]'::jsonb, 'wood', 1, 7),
(150208, 15021, 'text_input', 's="ielts-listening-question-number">7     using various tools 
 
  Outdoor activities  
 
 Swimming in the  <strong', '[]'::jsonb, 'lake', 1, 8),
(150209, 15021, 'text_input', 'rong id="ielts-listening-question-number-8" class="ielts-listening-question-number">8     
 Walking in the woods, led by an expert on  <strong', '[]'::jsonb, 'insects', 1, 9),
(150210, 15021, 'text_input', 'tem"> 9     
 
 See the festival organiser’s  <strong', '[]'::jsonb, 'blog', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(15022, 1502, 'listening', 'Listening Part 2: Minster Park', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-14                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Minster Park</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="11"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong><span class="ielts-q-title"><span>The park was originally established</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="A"><span class="ielts-radio-text"><strong>A</strong> as an amenity provided by the city council.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="B"><span class="ielts-radio-text"><strong>B</strong> as land belonging to a private house.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="C"><span class="ielts-radio-text"><strong>C</strong> as a shared area set up by the local community.</span></label></div></div><div class="ielts-standalone-q" data-qnum="12"><div class="ielts-q-header"><strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>Why is there a statue of Diane Gosforth in the park?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="A"><span class="ielts-radio-text"><strong>A</strong> She was a resident who helped to lead a campaign.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="B"><span class="ielts-radio-text"><strong>B</strong> She was a council member responsible for giving the public access.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="C"><span class="ielts-radio-text"><strong>C</strong> She was a senior worker at the park for many years.</span></label></div></div><div class="ielts-standalone-q" data-qnum="13"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong><span class="ielts-q-title"><span>During the First World War, the park was mainly used for</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="A"><span class="ielts-radio-text"><strong>A</strong> exercises by troops.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="B"><span class="ielts-radio-text"><strong>B</strong> growing vegetables.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="C"><span class="ielts-radio-text"><strong>C</strong> public meetings.</span></label></div></div><div class="ielts-standalone-q" data-qnum="14"><div class="ielts-q-header"><strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>When did the physical transformation of the park begin?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="A"><span class="ielts-radio-text"><strong>A</strong> 2013</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="B"><span class="ielts-radio-text"><strong>B</strong> 2015</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="C"><span class="ielts-radio-text"><strong>C</strong> 2016</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 15-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Label the map below.</p>
<p><em>Write the correct letter, <strong>A-I</strong>, next to Questions.</em></p>
<p><img class="alignnone wp-image-12928 size-full" src="https://engnovate.com/wp-content/uploads/2023/07/cambridge-ielts-15-academic-listening-test-2-15-20.jpg" alt="" width="1000" height="1009" /></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <table class="ielts-listening-matching-table"><thead><tr><th></th><th>A</th><th>B</th><th>C</th><th>D</th><th>E</th><th>F</th><th>G</th><th>H</th><th>I</th></tr></thead><tbody><tr class="ielts-listening-question-item"><td class="ielts-listening-matching-question-cell"><strong id="ielts-listening-question-number-15" class="ielts-q-badge">15</strong> <span>statue of Diane Gosforth</span></td>
                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_1" id="ielts_listening_answer_12927_1_0" value="A"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_1" id="ielts_listening_answer_12927_1_1" value="B"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_1" id="ielts_listening_answer_12927_1_2" value="C"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_1" id="ielts_listening_answer_12927_1_3" value="D"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_1" id="ielts_listening_answer_12927_1_4" value="E"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_1" id="ielts_listening_answer_12927_1_5" value="F"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_1" id="ielts_listening_answer_12927_1_6" value="G"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_1" id="ielts_listening_answer_12927_1_7" value="H"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_1" id="ielts_listening_answer_12927_1_8" value="I"></td></tr>                                                                                                                                                                                                                                                                                                    <tr class="ielts-listening-question-item"><td class="ielts-listening-matching-question-cell"><strong id="ielts-listening-question-number-16" class="ielts-q-badge">16</strong> <span>wooden sculptures</span></td>
                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_2" id="ielts_listening_answer_12927_2_0" value="A"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_2" id="ielts_listening_answer_12927_2_1" value="B"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_2" id="ielts_listening_answer_12927_2_2" value="C"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_2" id="ielts_listening_answer_12927_2_3" value="D"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_2" id="ielts_listening_answer_12927_2_4" value="E"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_2" id="ielts_listening_answer_12927_2_5" value="F"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_2" id="ielts_listening_answer_12927_2_6" value="G"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_2" id="ielts_listening_answer_12927_2_7" value="H"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_2" id="ielts_listening_answer_12927_2_8" value="I"></td></tr>                                                                                                                                                                                                                                                                                                    <tr class="ielts-listening-question-item"><td class="ielts-listening-matching-question-cell"><strong id="ielts-listening-question-number-17" class="ielts-q-badge">17</strong> <span>playground</span></td>
                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_3" id="ielts_listening_answer_12927_3_0" value="A"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_3" id="ielts_listening_answer_12927_3_1" value="B"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_3" id="ielts_listening_answer_12927_3_2" value="C"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_3" id="ielts_listening_answer_12927_3_3" value="D"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_3" id="ielts_listening_answer_12927_3_4" value="E"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_3" id="ielts_listening_answer_12927_3_5" value="F"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_3" id="ielts_listening_answer_12927_3_6" value="G"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_3" id="ielts_listening_answer_12927_3_7" value="H"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_3" id="ielts_listening_answer_12927_3_8" value="I"></td></tr>                                                                                                                                                                                                                                                                                                    <tr class="ielts-listening-question-item"><td class="ielts-listening-matching-question-cell"><strong id="ielts-listening-question-number-18" class="ielts-q-badge">18</strong> <span>maze</span></td>
                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_4" id="ielts_listening_answer_12927_4_0" value="A"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_4" id="ielts_listening_answer_12927_4_1" value="B"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_4" id="ielts_listening_answer_12927_4_2" value="C"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_4" id="ielts_listening_answer_12927_4_3" value="D"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_4" id="ielts_listening_answer_12927_4_4" value="E"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_4" id="ielts_listening_answer_12927_4_5" value="F"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_4" id="ielts_listening_answer_12927_4_6" value="G"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_4" id="ielts_listening_answer_12927_4_7" value="H"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_4" id="ielts_listening_answer_12927_4_8" value="I"></td></tr>                                                                                                                                                                                                                                                                                                    <tr class="ielts-listening-question-item"><td class="ielts-listening-matching-question-cell"><strong id="ielts-listening-question-number-19" class="ielts-q-badge">19</strong> <span>tennis courts</span></td>
                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_5" id="ielts_listening_answer_12927_5_0" value="A"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_5" id="ielts_listening_answer_12927_5_1" value="B"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_5" id="ielts_listening_answer_12927_5_2" value="C"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_5" id="ielts_listening_answer_12927_5_3" value="D"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_5" id="ielts_listening_answer_12927_5_4" value="E"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_5" id="ielts_listening_answer_12927_5_5" value="F"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_5" id="ielts_listening_answer_12927_5_6" value="G"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_5" id="ielts_listening_answer_12927_5_7" value="H"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_5" id="ielts_listening_answer_12927_5_8" value="I"></td></tr>                                                                                                                                                                                                                                                                                                    <tr class="ielts-listening-question-item"><td class="ielts-listening-matching-question-cell"><strong id="ielts-listening-question-number-20" class="ielts-q-badge">20</strong> <span>fitness area</span></td>
                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_6" id="ielts_listening_answer_12927_6_0" value="A"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_6" id="ielts_listening_answer_12927_6_1" value="B"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_6" id="ielts_listening_answer_12927_6_2" value="C"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_6" id="ielts_listening_answer_12927_6_3" value="D"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_6" id="ielts_listening_answer_12927_6_4" value="E"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_6" id="ielts_listening_answer_12927_6_5" value="F"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_6" id="ielts_listening_answer_12927_6_6" value="G"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_6" id="ielts_listening_answer_12927_6_7" value="H"></td>                                                                                                            <td class="ielts-listening-matching-option-cell"><input type="radio" name="ielts_listening_answer_12927_6" id="ielts_listening_answer_12927_6_8" value="I"></td></tr></tbody></table>                                                                                                                                                                                        </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/26100-cambridge-ielts-15-academic-listening-2-audio-2.mp3', 'WOMAN:
I’m very pleased to welcome this evening’s guest speaker, Mark Logan, who’s going to tell us about the recent transformation of Minster Park. Over to you, Mark.
MARK:
Thank you. I’m sure you’re all familiar with Minster Park. It’s been a feature of the city for well over a century, and has been the responsibility of the city council for most of that time. What perhaps isn’t so well known is the origin of the park: unlike many public parks that started in private ownership, as the garden of a large house, for instance, Minster was some waste land, which people living nearby started planting with flowers in 1892. It was unclear who actually owned the land, and this wasn’t settled until 20 years later, when the council took possession of it.
You may have noticed the statue near one of the entrances. It’s of Diane Gosforth, who played a key role in the history of the park. Once the council had become the legal owner, it planned to sell the land for housing. Many local people wanted it to remain a place that everyone could go to, to enjoy the fresh air and natural environment – remember the park is in a densely populated residential area. Diane Gosforth was one of those people, and she organised petitions and demonstrations, which eventually made the council change its mind about the future of the land.
Soon after this the First World War broke out, in 1914, and most of the park was dug up and planted with vegetables, which were sold locally. At one stage the army considered taking in over for troop exercises and got as far as contacting the city council, then decided the park was too small to be of use. There were occasional public meetings during the war, in an area that had been retained as grass.
After the war, the park was turned back more or less to how it had been before 1914, and continued almost unchanged until recently. Plans for transforming it were drawn up at various times, most recently in 2013, though they were revised in 2015, before any work had started. The changes finally got going in 2016, and were finished on schedule last year.
————————
OK, let me tell you about some of the changes that have been made – and some things that have been retained. If you look at this map, you’ll see the familiar outline of the park, with the river forming the northern boundary, and a gate in each of the other three walls. The statue of Diane Gosforth has been moved: it used to be close to the south gate, but it’s now immediately to the north of the lily pond, almost in the centre of the park, which makes it much more visible.
There’s a new area of wooden sculptures, which are on the river bank, where the path from the east gate makes a sharp bend.
There are two areas that are particularly intended for children. The playground has been enlarged and improved, and that’s between the river and the path that leads from the pond to the river.
Then there’s a new maze, a circular series of paths, separated by low hedges. That’s near the west gate – you go north from there towards the river and then turn left to reach it.
There have been tennis courts in the park for many years, and they’ve been doubled, from four to eight. They’re still in the south-west corner of the park, where there’s a right-angle bend in the path.
Something else I’d like to mention is the new fitness area. This is right next to the lily pond on the same side as the west gate.
Now, as you’re all gardeners, I’m sure you’ll like to hear about the plants that have been chosen for the park.', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(150211, 15022, 'single_choice', 'The park was originally established', '["A", "B", "C"]'::jsonb, 'C', 1, 11),
(150212, 15022, 'single_choice', 'Why is there a statue of Diane Gosforth in the park?', '["A", "B", "C"]'::jsonb, 'A', 1, 12),
(150213, 15022, 'single_choice', 'During the First World War, the park was mainly used for', '["A", "B", "C"]'::jsonb, 'B', 1, 13),
(150214, 15022, 'single_choice', 'When did the physical transformation of the park begin?', '["A", "B", "C"]'::jsonb, 'C', 1, 14),
(150215, 15022, 'single_choice', 'statue of Diane Gosforth', '["A", "B", "C", "D", "E", "F", "G", "H", "I"]'::jsonb, 'E', 1, 15),
(150216, 15022, 'single_choice', 'wooden sculptures', '["A", "B", "C", "D", "E", "F", "G", "H", "I"]'::jsonb, 'C', 1, 16),
(150217, 15022, 'single_choice', 'playground', '["A", "B", "C", "D", "E", "F", "G", "H", "I"]'::jsonb, 'B', 1, 17),
(150218, 15022, 'single_choice', 'maze', '["A", "B", "C", "D", "E", "F", "G", "H", "I"]'::jsonb, 'A', 1, 18),
(150219, 15022, 'single_choice', 'tennis courts', '["A", "B", "C", "D", "E", "F", "G", "H", "I"]'::jsonb, 'G', 1, 19),
(150220, 15022, 'single_choice', 'fitness area', '["A", "B", "C", "D", "E", "F", "G", "H", "I"]'::jsonb, 'D', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(15023, 1502, 'listening', 'Listening Part 3', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-22                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="21,22"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong> <strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>Which  groups of people is the display primarily intended for?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> student from the English department</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> residents of the local area</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> the university’s teaching staff</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> potential new students</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> students from other departments</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 23-24                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="23,24"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong> <strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>What are Cathy and Graham’s TWO reasons for choosing the novelist Charles Dickens?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> His speeches inspired others to try to improve society.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> He used his publications to draw attention to social problems.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> His novels are well-known now.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> He was consulted on a number of social issues.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> His reputation has changed in recent times.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 25-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What topic do Cathy and Graham choose to illustrate with each novel?</p>
<p><em>Choose <strong>SIX</strong> answers from the box and write the correct letter, <strong>A-H</strong>, next to Questions.</em></p>
<p><strong>Topics</strong></p>
<p><strong>Novels by Dickens</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span><em>The Pickwick Papers</em></span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">25</strong><select data-qnum="25" name="question_25" class="ielts-inline-select"><option value="">[ 25 ] Tanlang...</option><option value="A. poverty">A. poverty</option><option value="B. education">B. education</option><option value="C. Dickens’s travels">C. Dickens’s travels</option><option value="D. entertainment">D. entertainment</option><option value="E. crime and the law">E. crime and the law</option><option value="F. wealth">F. wealth</option><option value="G. medicine">G. medicine</option><option value="H. a woman’s life">H. a woman’s life</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span><em>Oliver Twist</em></span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">26</strong><select data-qnum="26" name="question_26" class="ielts-inline-select"><option value="">[ 26 ] Tanlang...</option><option value="A. poverty">A. poverty</option><option value="B. education">B. education</option><option value="C. Dickens’s travels">C. Dickens’s travels</option><option value="D. entertainment">D. entertainment</option><option value="E. crime and the law">E. crime and the law</option><option value="F. wealth">F. wealth</option><option value="G. medicine">G. medicine</option><option value="H. a woman’s life">H. a woman’s life</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span><em>Nicholas Nickleby</em></span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. poverty">A. poverty</option><option value="B. education">B. education</option><option value="C. Dickens’s travels">C. Dickens’s travels</option><option value="D. entertainment">D. entertainment</option><option value="E. crime and the law">E. crime and the law</option><option value="F. wealth">F. wealth</option><option value="G. medicine">G. medicine</option><option value="H. a woman’s life">H. a woman’s life</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span><em>Martin Chuzzlewit</em></span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">28</strong><select data-qnum="28" name="question_28" class="ielts-inline-select"><option value="">[ 28 ] Tanlang...</option><option value="A. poverty">A. poverty</option><option value="B. education">B. education</option><option value="C. Dickens’s travels">C. Dickens’s travels</option><option value="D. entertainment">D. entertainment</option><option value="E. crime and the law">E. crime and the law</option><option value="F. wealth">F. wealth</option><option value="G. medicine">G. medicine</option><option value="H. a woman’s life">H. a woman’s life</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span><em>Bleak House</em></span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">29</strong><select data-qnum="29" name="question_29" class="ielts-inline-select"><option value="">[ 29 ] Tanlang...</option><option value="A. poverty">A. poverty</option><option value="B. education">B. education</option><option value="C. Dickens’s travels">C. Dickens’s travels</option><option value="D. entertainment">D. entertainment</option><option value="E. crime and the law">E. crime and the law</option><option value="F. wealth">F. wealth</option><option value="G. medicine">G. medicine</option><option value="H. a woman’s life">H. a woman’s life</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span><em>Little Dorrit</em></span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">30</strong><select data-qnum="30" name="question_30" class="ielts-inline-select"><option value="">[ 30 ] Tanlang...</option><option value="A. poverty">A. poverty</option><option value="B. education">B. education</option><option value="C. Dickens’s travels">C. Dickens’s travels</option><option value="D. entertainment">D. entertainment</option><option value="E. crime and the law">E. crime and the law</option><option value="F. wealth">F. wealth</option><option value="G. medicine">G. medicine</option><option value="H. a woman’s life">H. a woman’s life</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="12934">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. poverty">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">poverty</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. education">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">education</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. Dickens’s travels">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">Dickens’s travels</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. entertainment">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">entertainment</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. crime and the law">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">crime and the law</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. wealth">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">wealth</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. medicine">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">medicine</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="H" data-text="H. a woman’s life">
                                                                                        <span class="dnd-label">H.</span>
                                                                                        <span class="dnd-text">a woman’s life</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/26101-cambridge-ielts-15-academic-listening-2-audio-3.mp3', 'CATHY: OK, Graham, so let’s check we both know what we’re supposed to be doing.
GRAHAM: OK.
CATHY: So, for the university’s open day, we have to plan a display on British life and literature in the mid-19th century.
GRAHAM: That’s right. But we’ll have some people to help us find the materials and set it up, remember – for the moment, we just need to plan it.
CATHY: Good. So have you gathered who’s expected to come and see the display? Is it for the people studying English, or students from other departments? I’m not clear about it.
GRAHAM: Nor me. That was how it used to be, but it didn’t attract many people, so this year it’s going to be part of an open day, to raise the university’s profile. It’ll be publicised in the city, to encourage people to come and find out something of what does on here. And it’s included in the information that’s sent to people who are considering applying to study here next year.
CATHY: Presumably some current students and lecturers will come?
GRAHAM: I would imagine so, but we’ve been told to concentrate on the other categories of people.
CATHY: Right. We don’t have to cover the whole range of 19th-century literature, do we?
GRAHAM: No, it’s entirely up to us. I suggest just using Charles Dickens.
CATHY: That’s a good idea. Most people have heard of him, and have probably read some of his novels, or seen films based on them, so that’s a good lead-in to life in his time.
GRAHAM: Exactly. And his novels show the awful conditions that most people had to live in, don’t they: he wanted to shock people into doing something about it.
CATHY: Did he do any campaigning, other than writing?
GRAHAM: Yes, he campaigned for education and other social reforms, and gave talks, but I’m inclined to ignore that and focus on the novels.
CATHY: Yes, I agree.
————————
CATHY: OK, so now shall we think about a topic linked to each novel?
GRAHAM: Yes. I’ve printed out a list of Dicken’s novels in the order they were published, in the hope you’d agree to focus on him!
CATHY: You’re lucky I did agree! Let’s have a look. OK, the first was The Pickwick Papers , published in 1836. It was very successful when it came out, wasn’t it, and was adapted for the theatre straight away.
GRAHAM: There’s an interesting point, though, that there’s a character who keeps falling asleep, and that medical condition was named after the book – Pickwickian Syndrome.
CATHY: Oh, so why don’t we use that as the topic, and include some quotations from the novel?
GRAHAM: Right, Next is Oliver Twist . There’s a lot in the novel about poverty. But maybe something less obvious …
CATHY: Well Oliver is taught how to steal, isn’t he? We could use that to illustrate the fact that very few children went to school, particularly not poor children, so they learnt in other ways.
GRAHAM: Good idea. What’s next?
CATHY: Maybe Nicholas Nickleby . Actually he taught in a really cruel school, didn’t he?
GRAHAM: That’s right. But there’s also the company of touring actors that Nicholas joins. We could do something on theatres and other amusements of the time. We don’t want only the bad things, do we?
CATHY: OK.
GRAHAM: What about Martin Chuzzlewit ? He goes to the USA, doesn’t he?
CATHY: Yes, and Dickens himself had been there a year before, and drew on his experience there in the novel.
GRAHAM: I wonder, though … The main theme is selfishness, so we could do something on social justice? No, too general, let’s keep to your idea – I think it would work well.
CATHY: He wrote Bleak House next – that’s my favourite of his novels.
GRAHAM: Yes, mine too. His satire of the legal system is pretty powerful.
CATHY: That’s true, but think about Esther, the heroine. As a child she lives with someone she doesn’t know is her aunt, who treats her very badly. Then she’s very happy living with her guardian, and he puts her in charge of the household. And at the end she gets married and her guardian gives her and her husband a house, where of course they’re very happy.
GRAHAM: Yes, I like that.
CATHY: What shall we take next? Little Dorrit ? Old Mr Dorrit has been in a debtors’ prison for years …
GRAHAM: So was Dicken’s father, wasn’t he?
CATHY: That’s right.
GRAHAM: What about focusing on the part when Mr Dorrit inherits a fortune, and he starts pretending he’s always been rich?
CATHY: Good idea.
GRAHAM: OK, so next we need to think about what materials we want to illustrate each issue. That’s going to be quite hard.', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(150221, 15023, 'multiple_choice', 'Question 21', '["A", "B", "C", "D", "E"]'::jsonb, 'B / D', 1, 21),
(150222, 15023, 'multiple_choice', 'Which&nbsp; TWO &nbsp;groups of people is the display primarily intended for?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / D', 1, 22),
(150223, 15023, 'multiple_choice', 'Question 23', '["A", "B", "C", "D", "E"]'::jsonb, 'B / C', 1, 23),
(150224, 15023, 'multiple_choice', 'What are Cathy and Graham&rsquo;s TWO reasons for choosing the novelist Charles Dickens?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / C', 1, 24),
(150225, 15023, 'single_choice', 'Question 25', '["A", "B", "C"]'::jsonb, 'G', 1, 25),
(150226, 15023, 'single_choice', 'Question 26', '["A", "B", "C"]'::jsonb, 'B', 1, 26),
(150227, 15023, 'single_choice', 'Question 27', '["A", "B", "C"]'::jsonb, 'D', 1, 27),
(150228, 15023, 'single_choice', 'Question 28', '["A", "B", "C"]'::jsonb, 'C', 1, 28),
(150229, 15023, 'single_choice', 'Question 29', '["A", "B", "C"]'::jsonb, 'H', 1, 29),
(150230, 15023, 'single_choice', 'Question 30', '["A", "B", "C"]'::jsonb, 'F', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(15024, 1502, 'listening', 'Listening Part 4: Agricultural programme in Mozambique', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p><em>Write <strong>ONE WORD ONLY</strong> for each answer.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Agricultural programme in Mozambique</strong></strong></p>
<p><strong>How the programme was organised</strong></p>
<ul>
<li>It focused on a dry and arid region in Chicualacuala district, near the Limpopo River.</li>
<li>People depended on the forest to provide charcoal as a source of income.</li>
<li><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span> was seen as the main priority to ensure the supply of water.</li>
<li>Most of the work organised by farmers’ associations was done by <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>Fenced areas created to keep animals away from crops.</li>
<li>The programme provided</li>
</ul>
<p>–  <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span> for the fences</p>
<p>–  <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> for suitable crops</p>
<p>–  water pumps.</p>
<ul>
<li>The farmers provided</li>
</ul>
<p>–  labour</p>
<p>–  <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span> for the fences on their land.</p>
<p><strong>Further developments</strong></p>
<ul>
<li>The marketing of produce was sometimes difficult due to lack of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>Training was therefore provided in methods of food <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>Farmers made special places where <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> could be kept.</li>
<li>Local people later suggested keeping <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
</ul>
<p><strong>Evaluation and lessons learned</strong></p>
<ul>
<li>Agricultural production increased, improving incomes and food security.</li>
<li>Enough time must be allowed, particularly for the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span> phase of the programme.</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/26102-cambridge-ielts-15-academic-listening-2-audio-4.mp3', 'I’m going to report on a case study of a programme which has been set up to help rural populations in Mozambique, a largely agricultural country in South-East Africa.
The programme worked with three communities in Chicualacuala district, near the Limpopo River. This is a dry and arid region, with unpredictable rainfall. Because of this, people in the area were unable to support themselves through agriculture and instead they used the forest as a means of providing themselves with an income, mainly by selling charcoal. However, this was not a sustainable way of living in the long term, as they were rapidly using up this resource.
To support agriculture in this dry region, the programme focused primarily on making use of existing water resources from the Limpopo River by setting up systems of irrigation, which would provide a dependable water supply for crops and animals. The programme worked closely with the district government in order to find the best way of implementing this. The region already had one farmers’ association, and it was decided to set up two more of these. These associations planned and carried out activities including water management, livestock breeding and agriculture, and it was notable that in general, women formed the majority of the workforce.
It was decided that in order to keep the crops safe from animals, both wild and domestic, special areas should be fenced off where the crops could be grown. The community was responsible for creating these fences, but the programme provided the necessary wire for making them.
Once the area had been fenced off, it could be cultivated. The land was dug, so that vegetables and cereals appropriate to the climate could be grown, and the programme provided the necessary seeds for this. The programme also provided pumps so that water could be brought from the river in pipes to the fields. However, the labour was all provided by local people, and they also provided and put up the posts that supported the fences around the fields.
———————
Once the programme had been set up, its development was monitored carefully. The farmers were able to grow enough produce not just for their own needs, but also to sell. However, getting the produce to places where it could be marketed was sometimes a problem, as the farmers did not have access to transport, and this resulted in large amounts of produce, especially vegetables, being spoiled. This problem was discussed with the farmers’ associations and it was decided that in order to prevent food from being spoiled, the farmers needed to learn techniques for its preservation.
There was also an additional initiative that had not been originally planned, but which became a central feature of the programme. This was when farmers started to dig holes for tanks in the fenced-off areas and to fill these with water and use them for breeding fish – an important source of protein. After a time, another suggestion was made by local people which hadn’t been part of the programme’s original proposal, but which was also adopted later on. They decided to try setting up colonies of bees, which would provide honey both for their own consumption and to sell.
So what lessons can be learned from this programme? First of all, it tells us that in dry, arid regions, if there is access to a reliable source of water, there is great potential for the development of agriculture. In Chicualacuala, there was a marked improvement in agricultural production, which improved food security and benefited local people by providing them with both food and income. However, it’s important to set realistic timelines for each phase of the programme, especially for its design, as mistakes made at this stage may be hard to correct later on.
The programme demonstrates that sustainable development is possible in areas where …', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(150231, 15024, 'text_input', '<strong', '[]'::jsonb, 'Irrigation', 1, 31),
(150232, 15024, 'text_input', 'Most of the work organised by farmers’ associations was done by  <strong', '[]'::jsonb, 'women', 1, 32),
(150233, 15024, 'text_input', 'The programme provided 
 
 –   <strong', '[]'::jsonb, 'wire / wires', 1, 33),
(150234, 15024, 'text_input', 'ning-question-item"> 33     for the fences 
 –   <strong', '[]'::jsonb, 'seed / seeds', 1, 34),
(150235, 15024, 'text_input', 'The farmers provided 
 
 –  labour 
 –   <strong', '[]'::jsonb, 'posts', 1, 35),
(150236, 15024, 'text_input', 'Further developments  
 
 The marketing of produce was sometimes difficult due to lack of  <strong', '[]'::jsonb, 'transport', 1, 36),
(150237, 15024, 'text_input', 'Training was therefore provided in methods of food  <strong', '[]'::jsonb, 'preservation', 1, 37),
(150238, 15024, 'text_input', 'Farmers made special places where  <strong', '[]'::jsonb, 'fish / fishes', 1, 38),
(150239, 15024, 'text_input', 'Local people later suggested keeping  <strong', '[]'::jsonb, 'bees', 1, 39),
(150240, 15024, 'text_input', 'Enough time must be allowed, particularly for the  <strong', '[]'::jsonb, 'design', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
