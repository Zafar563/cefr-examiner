-- Cambridge IELTS 20 Academic Listening Test 1
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(2001, 'Cambridge IELTS 20 Academic Listening Test 1', 'Rasmiy Cambridge IELTS 20 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(20011, 2001, 'listening', 'Listening Part 1: Restaurant Recommendations', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-10                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><strong>Complete the notes below.</strong></p>
<p>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</p>
<p class="ielts-listening-transcript-subhead"><strong><span id="Restaurant_Recommendations">Restaurant Recommendations</span></strong></p>
<table>
<tbody>
<tr>
<td width="156"><strong>Name of restaurant</strong></td>
<td width="156"><strong>Location</strong></td>
<td width="156"><strong>Reason for recommendation</strong></td>
<td width="156"><strong>Other comments</strong></td>
</tr>
<tr>
<td width="156">The Junction</td>
<td width="156">Greyson Street, near the station</td>
<td width="156">Good for people who are especially keen on <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span></td>
<td width="156">Quite expensive</p>
<p>The <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span> is a good place for a drink</td>
</tr>
<tr>
<td width="156">Paloma</td>
<td width="156">In Bow Street next to the cinema</td>
<td width="156"><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span> food, good for sharing</td>
<td width="156">Staff are very friendly</p>
<p>Need to pay £50 deposit</p>
<p>A limited selection of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span> food on the menu</td>
</tr>
<tr>
<td width="156">The <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span></td>
<td width="156">At the top of a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span></td>
<td width="156">A famous chef</p>
<p>All the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span> are very good</p>
<p>Only uses <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span> ingredients</td>
<td width="156">Set lunch costs £ <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span> per person</p>
<p>Portions probably of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span> size</td>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/1696216-cambridge-ielts-20-academic-listening-1-audio-1.mp3', 'WOMAN: I’ve been meaning to ask you for some advice about restaurants. I need to book somewhere to celebrate my sister’s 30th birthday, and I liked the sound of that place you went to for your mum’s 50th.
MAN: The Junction. Yeah, I’d definitely recommend that for a special occasion. We had a great time there. Everyone really enjoyed it.
WOMAN: Where is it again? I can’t remember.
MAN: It on Grayson Street only about a two walk from the station
WOMAN: Oh that good I prefer not to have to drive anywhere But I don want to have to walk too far either.
MAN: Yes, the location’s perfect, but that’s not necessarily why I’d recommend it. The food’s amazing. If you like fish, it’s probably the best restaurant in town for that. It’s always really fresh and there are lots of interesting dishes to choose from But all the food is good there
WOMAN: Is it really expensive?
MAN: It’s certainly not cheap, but for a special occasion I think it’s fine It’s got a great atmosphere and before dinner you can go up on the roof and have a drink It’s really nice up there, but you need to book It’s very popular as the views are spectacular.
WOMAN: Sounds good. So that’s definitely a possibility then. Is there anywhere else you can think of?
MAN: If you want somewhere a bit less formal, then you could try Paloma.
WOMAN:Where’s that? I haven’t heard of it.
MAN: No, it’s quite new. It’s only been open a few months, but it’s got a great reputation already. It’s in a really beautiful old building on Bow Street.
WOMAN:Oh, I think I know where you mean. Right beside the cinema.
MAN: Yes, that’s it. I’ve only been there a couple of times, but I was really impressed. The chef used to work at Don Felipe’s, apparently. I was really sorry when that closed down.
WOMAN: So is all the food they serve Spanish, then?
MAN: Yeah. You can get lots of small dishes to share, which always works really well if you’re in a group.
WOMAN: Hmm. Worth thinking about.
MAN: Yeah. There’s a lively atmosphere and the waiters are really friendly. The only thing is that you need to pay a £50 deposit to book a table.
WOMAN: A lot of restaurants are doing that these days. I should have a look at the menu to check there a good choice of vegetarian dishes. A couple of my friends have stopped eating meat.
MAN: Not sure I say the selection of those would be quite limited.
-------------------------------------
MAN: I’ve just thought of another idea. Have you been to the Audley?
WOMAN: No, don’t think I’ve heard of it. How’s it spelt?
MAN: A-U-D-L-E-Y. You must have heard of it. There’s been a lot about it in the press.
WOMAN: I don’t tend to pay much attention to that kind of thing. So where is it exactly?
MAN: It’s in that hotel near Baxter Bridge, on the top floor.
WOMAN: Oh, the views would be incredible from up there.
MAN: Yeah, I’d love to go. I can’t think of the chef’s name, but she was a judge on that TV cookery show recently. And she’s written a couple of cookery books.
WOMAN: Oh, Angela Frayne.
MAN: That’s the one. Anyway, it’s had excellent reviews from all the newspapers.
WOMAN: That would be a memorable place for a celebration.
MAN: Definitely. Obviously it’s worth going there just for the view, but the food is supposed to be really special.
WOMAN: She only likes cooking with local products doesn''t she?
MAN: Yes. Everything at the restaurant has to be sourced within a short distance and absolutely nothing flown in from abroad.
WOMAN: I imagine it’s really expensive, though.
MAN: Well, you could go for the set lunch. That’s quite reasonable for a top-class restaurant. £30 a head. In the evening, I think it’d be more like £50.
WOMAN: At least that, I should think. But I’m sure everyone would enjoy it. It’s not the kind of place you leave feeling hungry, though, is it? With tiny portions?
MAN: No, the reviews I’ve read didn’t mention that. I imagine they’d be average.
WOMAN: Well, that’s all great. Thanks so much.', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(200101, 20011, 'text_input', 'restaurant  
  Location  
  Reason for recommendation  
  Other comments  
 
 
 The Junction 
 Greyson Street, near the station 
 Good for people who are especially keen on  <strong', '[]'::jsonb, 'Fish', 1, 1),
(200102, 20011, 'text_input', 'ong id="ielts-listening-question-number-1" class="ielts-listening-question-number">1     
 Quite expensive 
 The  <strong', '[]'::jsonb, 'Roof', 1, 2),
(200103, 20011, 'text_input', 'is a good place for a drink 
 
 
 Paloma 
 In Bow Street next to the cinema 
  <strong', '[]'::jsonb, 'Spanish', 1, 3),
(200104, 20011, 'text_input', '">3     food, good for sharing 
 Staff are very friendly 
 Need to pay £50 deposit 
 A limited selection of  <strong', '[]'::jsonb, 'Vegetarian', 1, 4),
(200105, 20011, 'text_input', 'd="ielts-listening-question-number-4" class="ielts-listening-question-number">4     food on the menu 
 
 
 The  <strong', '[]'::jsonb, 'Audley', 1, 5),
(200106, 20011, 'text_input', '-item"> 5     
 At the top of a  <strong', '[]'::jsonb, 'Hotel', 1, 6),
(200107, 20011, 'text_input', 'g id="ielts-listening-question-number-6" class="ielts-listening-question-number">6     
 A famous chef 
 All the  <strong', '[]'::jsonb, 'Reviews', 1, 7),
(200108, 20011, 'text_input', 'estion-item"> 7     are very good 
 Only uses  <strong', '[]'::jsonb, 'Local', 1, 8),
(200109, 20011, 'text_input', 'id="ielts-listening-question-number-8" class="ielts-listening-question-number">8     ingredients 
 Set lunch costs £  <strong', '[]'::jsonb, '30', 1, 9),
(200110, 20011, 'text_input', 'tem"> 9     per person 
 Portions probably of  <strong', '[]'::jsonb, 'Average', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(20012, 2001, 'listening', 'Listening Part 2', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-16                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter,<strong> A, B, or C.</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="11"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong><span class="ielts-q-title"><span>Heather says pottery differs from other art forms because</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="A"><span class="ielts-radio-text"><strong>A</strong> It lasts longer in the ground.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="B"><span class="ielts-radio-text"><strong>B</strong> It is practised by more people.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="C"><span class="ielts-radio-text"><strong>C</strong> It can be repaired more easily.</span></label></div></div><div class="ielts-standalone-q" data-qnum="12"><div class="ielts-q-header"><strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>Archaeologists sometimes identify the use of ancient pottery from</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="A"><span class="ielts-radio-text"><strong>A</strong> The clay it was made with.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="B"><span class="ielts-radio-text"><strong>B</strong> The marks that are on it.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="C"><span class="ielts-radio-text"><strong>C</strong> The basic shape of it.</span></label></div></div><div class="ielts-standalone-q" data-qnum="13"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong><span class="ielts-q-title"><span>Some people join Heather’s pottery class because they want to</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="A"><span class="ielts-radio-text"><strong>A</strong> Create an item that looks very old.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="B"><span class="ielts-radio-text"><strong>B</strong> Find something that they are good at.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="C"><span class="ielts-radio-text"><strong>C</strong> Make something that will outlive them.</span></label></div></div><div class="ielts-standalone-q" data-qnum="14"><div class="ielts-q-header"><strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>What does Heather value most about being a potter?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="A"><span class="ielts-radio-text"><strong>A</strong> Its calming effect</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="B"><span class="ielts-radio-text"><strong>B</strong> Its messy nature</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="C"><span class="ielts-radio-text"><strong>C</strong> Its physical benefits</span></label></div></div><div class="ielts-standalone-q" data-qnum="15"><div class="ielts-q-header"><strong class="ielts-q-badge">15</strong><span class="ielts-q-title"><span>Most of the visitors to Edelman Pottery</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="A"><span class="ielts-radio-text"><strong>A</strong> Bring friends to join courses.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="B"><span class="ielts-radio-text"><strong>B</strong> Have never made a pot before.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="C"><span class="ielts-radio-text"><strong>C</strong> Try to learn techniques too quickly.</span></label></div></div><div class="ielts-standalone-q" data-qnum="16"><div class="ielts-q-header"><strong class="ielts-q-badge">16</strong><span class="ielts-q-title"><span>Heather reminds her visitors that they should</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="A"><span class="ielts-radio-text"><strong>A</strong> Put on their aprons.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="B"><span class="ielts-radio-text"><strong>B</strong> Change their clothes.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="C"><span class="ielts-radio-text"><strong>C</strong> Take off their jewellery.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 17-18                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters<strong>, A–E.</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="17,18"><div class="ielts-q-header"><strong class="ielts-q-badge">17</strong> <strong class="ielts-q-badge">18</strong><span class="ielts-q-title"><span>Which  things does Heather explain about kilns?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> What their function is</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> When they were invented</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> Ways of keeping them safe</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> Where to put one in your home</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> What some people use instead of one</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 19-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters<strong>, A–E.</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="19,20"><div class="ielts-q-header"><strong class="ielts-q-badge">19</strong> <strong class="ielts-q-badge">20</strong><span class="ielts-q-title"><span>Which points does Heather make about a potter’s tools?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> Some are hard to hold.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> Some are worth buying.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> Some are essential items.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> Some have memorable names.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> Some are available for use by participants.</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/1696218-cambridge-ielts-20-academic-listening-1-audio-2.mp3', 'Hello and welcome. My name’s Heather McCallum and I’m one of the potters who work here at Edelman Pottery. Before we go into the workshop, I just want to say a bit about the craft of pottery. Then we’ll have a look at the equipment and you can try making a pot of your own. Like many people, I’m sure you know that pottery as an art form is tens of thousands of years old. And we know this because it stands the test of time. Things like baskets and pictures don’t survive in the earth in the same way that pots do. and even if ancient pots are found in small pieces they still provide a lot of information about the past. There no doubt that pottery has given archaeologists a fascinating insight into how ancient hls lived The shape of an artefact may have been lost but archaeologists can tell whether the pots were for, say, storage or cooking by examining the impressions on the clay, the scratches from tools, and the clay itself can reveal where the pots came from. When I ask people why they want to take a pottery class with me, they sometimes talk about these things. Like our ancestors, they hope that something they create will also last longer than they do, that their work, whether it is good or not, might say something about humanity many years after their death. Of course, you will all have your own reasons for coming here. As far as I’m concerned, what I love most is the concentration you need to make a good pot. That focus takes you away from the stresses of everyday life. If you’re elderly, it’s also good exercise for hands and wrists and helps with arthritis. And of course, it’s a fun activity for children because it’s so messy. Here at Edelman Pottery, we show you some of the basic pottery techniques so that you can use these to create whatever you wish. A gift for a friend, perhaps. Like nearly everyone who comes here, I’m sure this is the first time you will have tried the art So we’ll keep things simple today Now, before we move on, can I just say a word about what you’re wearing? As we said in our email please remove any watches necklaces etc and put them somewhere safe If you have long hair do tie it back now We provide aprons later but I trust your clothes are old but comfortable not your favourite T-shirt or jeans.
---------------
So now we’re in the workshop. Have a look around. There’s a lot going on. To make pottery that will last, you need a potter’s wheel, a kiln, which is basically a very hot oven where you fire the pottery, and some tools. So, first, the kiln. If you look over in the far corner, you’ll see one of ours. Since their invention, kilns have changed very little, though in the past 20 years a lot of progress has been made in temperature control. Basically, a kiln removes the water from clay at temperatures of around 1000 degrees Celsius. This allows anything you’ve made to set permanently in shape. It’s a pretty ugly heavy object that’s hard to keep in a house or flat, so most people don’t have one.
You may think, can’t I use my oven? Well, that’s possible, but domestic ovens don’t really get hot enough and eventually the clay will crack and fall apart. Some people fire pottery in a fire pit outside but bear in mind… that can be dangerous You also need to know about safety procedures for kilns as they release toxic compounds into the air Every potter needs a potter’s wheel. This machine is used to shape the clay into an object with circular walls or sides, such as a bowl. Its invention revolutionised the pottery industry, allowing multiple items to be produced in a day. Lastly, there are a number of different tools that potters use, depending on what they want to make. When you start, your hands can make all kinds of shapes and curves without relying on a sculpting tool. However, there are some basic tools that you will need to handle the clay on the wheel. Some look very strange and have even odder names that you may find hard to remember. Rather than go through them all now, I’ll just name a few tools as we go along. We can provide these and I wouldn’t recommend spending money on them yet. So, let’s try making a pot of your own. If you sit down…', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(200111, 20012, 'single_choice', 'Heather says pottery differs from other art forms because', '["A", "B", "C"]'::jsonb, 'A', 1, 11),
(200112, 20012, 'single_choice', 'Archaeologists sometimes identify the use of ancient pottery from', '["A", "B", "C"]'::jsonb, 'B', 1, 12),
(200113, 20012, 'single_choice', 'Some people join Heather&rsquo;s pottery class because they want to', '["A", "B", "C"]'::jsonb, 'C', 1, 13),
(200114, 20012, 'single_choice', 'What does Heather value most about being a potter?', '["A", "B", "C"]'::jsonb, 'A', 1, 14),
(200115, 20012, 'single_choice', 'Most of the visitors to Edelman Pottery', '["A", "B", "C"]'::jsonb, 'B', 1, 15),
(200116, 20012, 'single_choice', 'Heather reminds her visitors that they should', '["A", "B", "C"]'::jsonb, 'C', 1, 16),
(200117, 20012, 'multiple_choice', 'Question 17', '["A", "B", "C", "D", "E"]'::jsonb, 'A / E', 1, 17),
(200118, 20012, 'multiple_choice', 'Which  TWO &nbsp;things does Heather explain about kilns?', '["A", "B", "C", "D", "E"]'::jsonb, 'A / E', 1, 18),
(200119, 20012, 'multiple_choice', 'Question 19', '["A", "B"]'::jsonb, 'C / E', 1, 19),
(200120, 20012, 'multiple_choice', 'Which points does Heather make about a potter&rsquo;s tools?', '["A", "B"]'::jsonb, 'C / E', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(20013, 2001, 'listening', 'Listening Part 3', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-22                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A E.</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="21,22"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong> <strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>Which  things do the students both believe are responsible for the increase in loneliness?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> Social media</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> Smaller nuclear families</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> Urban design</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> Longer lifespans</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> A mobile workforce</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 23-24                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters<strong>, A–E.</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="23,24"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong> <strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>Which  health risks associated with loneliness do the students agree are based on solid evidence?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> A weakened immune system</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> Dementia</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> Cancer</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> Obesity</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> Cardiovascular disease</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 25-26                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose <strong>TWO</strong> letters, <strong>A–E.</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="25,26"><div class="ielts-q-header"><strong class="ielts-q-badge">25</strong> <strong class="ielts-q-badge">26</strong><span class="ielts-q-title"><span>Which  opinions do both the students express about the evolutionary theory of loneliness?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="25,26" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> It has little practical relevance.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="25,26" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> It needs further investigation.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="25,26" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> It is misleading.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="25,26" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> It should be more widely accepted.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="25,26" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> It is difficult to understand.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 27-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A, B, or C.</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="27"><div class="ielts-q-header"><strong class="ielts-q-badge">27</strong><span class="ielts-q-title"><span>When comparing loneliness to depression, the students</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="27" name="question_27" value="A"><span class="ielts-radio-text"><strong>A</strong> Doubt that there will ever be a medical cure for loneliness.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="27" name="question_27" value="B"><span class="ielts-radio-text"><strong>B</strong> Claim that the link between loneliness and mental health is overstated.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="27" name="question_27" value="C"><span class="ielts-radio-text"><strong>C</strong> Express frustration that loneliness is not taken more seriously.</span></label></div></div><div class="ielts-standalone-q" data-qnum="28"><div class="ielts-q-header"><strong class="ielts-q-badge">28</strong><span class="ielts-q-title"><span>Why do the students decide to start their presentation with an example from their own experience?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="28" name="question_28" value="A"><span class="ielts-radio-text"><strong>A</strong> To explain how difficult loneliness can be</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="28" name="question_28" value="B"><span class="ielts-radio-text"><strong>B</strong> To highlight a situation that most students will recognise</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="28" name="question_28" value="C"><span class="ielts-radio-text"><strong>C</strong> To emphasise that feeling lonely is more common for men than women</span></label></div></div><div class="ielts-standalone-q" data-qnum="29"><div class="ielts-q-header"><strong class="ielts-q-badge">29</strong><span class="ielts-q-title"><span>The students agree that talking to strangers is a good strategy for dealing with loneliness because</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="29" name="question_29" value="A"><span class="ielts-radio-text"><strong>A</strong> It creates a sense of belonging.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="29" name="question_29" value="B"><span class="ielts-radio-text"><strong>B</strong> It builds self-confidence.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="29" name="question_29" value="C"><span class="ielts-radio-text"><strong>C</strong> It makes people feel more positive.</span></label></div></div><div class="ielts-standalone-q" data-qnum="30"><div class="ielts-q-header"><strong class="ielts-q-badge">30</strong><span class="ielts-q-title"><span>The students find it difficult to understand why solitude is considered to be</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="30" name="question_30" value="A"><span class="ielts-radio-text"><strong>A</strong> Similar to loneliness.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="30" name="question_30" value="B"><span class="ielts-radio-text"><strong>B</strong> Necessary for mental health.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="30" name="question_30" value="C"><span class="ielts-radio-text"><strong>C</strong> An enjoyable experience.</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/1696219-cambridge-ielts-20-academic-listening-1-audio-3.mp3', 'TAMARA Shall we go through the notes we’ve made from our research into loneliness now, Dev?
DEV OK, Tamara. It’s been a real eye-opener. I had no idea that loneliness has been increasing steadily for the last 20 years.
TAMARA I know. And it’s the same all over the world. The downside of a modern lifestyle, I guess.
DEV Did you come to any conclusions about what the reasons for the increase are?
TAMARA Well, I’d assumed it was mainly an issue for the elderly, but in fact it’s something which affects young people just as much.
DEV So nothing really to do with longer lifespans. What about social media? In my case, far from
making me feel isolated, it actually does the opposite. it?
TAMARA It definitely does more good than harm. I’d say loneliness has a lot to do with the way cities are designed. People living in high flats with not much opportunity to speak to their neighbours
DEV I think you right
TAMARA Another possible reason is that people are having fewer children and don live in large extended family groups.
DEV But in this country anyway, that all changed decades ago. And yet loneliness is a more recent problem.
TAMARA I suppose so. A more plausible explanation is that people are having to move around for work and often end up living miles away from their family and friends.
DEV That’s true.
TAMARA Looking at the studies on health risks and loneliness, there are claims that loneliness has as much impact as smoking 15 cigarettes a day.
DEV Or similar to the risks caused by obesity. But I’m not sure there’s enough evidence for some of these claims.
TAMARA Well, what about that one in Finland, which showed that loneliness increased the risk of cancer by about 10%? And those findings have been supported by other studies too.
DEV You’re right about that one. I was actually thinking of the studies on dementia. Some found no association between loneliness and dementia, and others found the opposite.
TAMARA Not exactly reliable, then. There’s been a lot of research on cardiovascular disease and whether loneliness contributes to that.
DEV Yes, I read that it was hard to reach a judgment, as the definition of loneliness varied quite a lot, and the responses from participants were too subjective. But there’s no doubt that loneliness contributes to a weakened immune system.
TAMARA Unquestionably. The data on that is sound.
DEV What did you think about the evolutionary theory of loneliness?
TAMARA Well I thought the idea that loneliness evolved because it motivated people to be with other people is quite convincing. Survival often depended on group cooperation.
DEV But I don''t think there is enough evidence to claim that there must be a group of neurons in our brains which influence social behaviour by making us feel bad when we’re alone.
TAMARA There are a few studies which support the theory, but not conclusively enough. More evidence is needed.
DEV And anyway, this theory’s not really useful when it comes to solving the problem of loneliness today.
TAMARA True.
-------------------------------
DEV Should we look at the relationship between loneliness and mental health now?
TAMARA OK. So, loneliness and depression are clearly related and that’s been recognised by various governments around the world. But unlike depression, loneliness has no recognised clinical form.
DEV There’s no available diagnosis or effective treatment and that’s not likely to change.
TAMARA I don’t think so either I was thinking we should start our presentation with an example from our own experience. I like to talk about how lonely I was when I started university being away from home for the first time and all that
DEV Good idea. Everyone will be able to relate to that although a lot of students were probably too embarrassed to admit to it.
TAMARA Yeah. We could discuss ways of dealing with loneliness as well, like just talking to strangers.
DEV Loads of studies have shown that interactions with shop assistants and bar staff make people feel more optimistic and relaxed.
TAMARA I don’t know about that, but it must make people feel more connected with their community.
DEV True, although you need to be a certain kind of person to be able to just strike up a conversation.
TAMARA Good point. We should say something about solitude and how being alone and being lonely aren’t the same thing. It’s strange the way some people can’t stand being by themselves while others love it.
DEV Yeah, the research shows a certain amount of solitude is beneficial for wellbeing, which I appreciate, but being alone isn’t something I actually like. I’d never choose to go on holiday alone, for example.
TAMARA Me neither.
DEV Well, let’s not…', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(200121, 20013, 'multiple_choice', 'Question 21', '["A", "B", "C", "D", "E"]'::jsonb, 'C / E', 1, 21),
(200122, 20013, 'multiple_choice', 'Which&nbsp; TWO &nbsp;things do the students both believe are responsible for the increase in loneliness?', '["A", "B", "C", "D", "E"]'::jsonb, 'C / E', 1, 22),
(200123, 20013, 'multiple_choice', 'Question 23', '["A", "B", "C", "D", "E"]'::jsonb, 'A / C', 1, 23),
(200124, 20013, 'multiple_choice', 'Which  TWO &nbsp;health risks associated with loneliness do the students agree are based on solid evidence?', '["A", "B", "C", "D", "E"]'::jsonb, 'A / C', 1, 24),
(200125, 20013, 'multiple_choice', 'Question 25', '["A", "B", "C", "D", "E"]'::jsonb, 'A / B', 1, 25),
(200126, 20013, 'multiple_choice', 'Which  TWO &nbsp;opinions do both the students express about the evolutionary theory of loneliness?', '["A", "B", "C", "D", "E"]'::jsonb, 'A / B', 1, 26),
(200127, 20013, 'single_choice', 'When comparing loneliness to depression, the students', '["A", "B", "C"]'::jsonb, 'A', 1, 27),
(200128, 20013, 'single_choice', 'Why do the students decide to start their presentation with an example from their own experience?', '["A", "B", "C"]'::jsonb, 'B', 1, 28),
(200129, 20013, 'single_choice', 'The students agree that talking to strangers is a good strategy for dealing with loneliness because', '["A", "B", "C"]'::jsonb, 'A', 1, 29),
(200130, 20013, 'single_choice', 'The students find it difficult to understand why solitude is considered to be', '["A", "B"]'::jsonb, 'C', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(20014, 2001, 'listening', 'Listening Part 4: Reclaiming Urban Rivers', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p><strong>Complete the notes below.</strong></p>
<p>Write <strong>ONE WORD ONLY</strong> for each answer.</p>
<p class="ielts-listening-transcript-subhead"><strong><span id="Reclaiming_Urban_Rivers">Reclaiming Urban Rivers</span></strong></p>
<div class="code-block code-block-14"></div>
<p><strong>Historical Background</strong></p>
<p>Nearly all major cities were built on a river.</p>
<p>Rivers were traditionally used for transport, fishing, and recreation.</p>
<p>Industrial development and rising populations later led to:</p>
<p>-More sewage from houses being discharged into the river.</p>
<p>-Pollution from <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span> on the river bank.</p>
<p>In 1957, the River Thames in London was declared biologically <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p><strong>Recent Improvements</strong></p>
<p>Seals and even a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span> have been seen in the River Thames.</p>
<p>Riverside warehouses are converted to restaurants and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>In Los Angeles, there are plans to:</p>
<p>Build a riverside <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>Display <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> projects.</p>
<p>In Paris, <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span> are created on the sides of the river every summer.</p>
<p><strong>Transport Possibilities</strong></p>
<p>Over 2 billion passengers already travel by <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> in cities around the world.</p>
<p>Changes in shopping habits mean the number of deliveries that are made is increasing.</p>
<p>Instead of road transport, goods can be transported by large freight barges and electric <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span><strong>,</strong> or, in future, by <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span></p>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/1696220-cambridge-ielts-20-academic-listening-1-audio-4.mp3', 'It’s quite hard to think of a city that doesn’t have a big river running through it. If you think about the major cities in the world, Shanghai, New York, Mumbai, London, they’re nearly all built on rivers. When these cities were established hundreds or even thousands of years ago, the rivers were a big part of people’s lives. In 16th century London, the quickest way to get from one part of the city to another was by river. But people also used the river for fishing, as the water then was relatively clean, and they would also go on boat trips up and down the river just for pleasure, as a relaxing escape from the noise and bustle of the city streets But as industries developed and populations increased city rivers suffered The rising number of people meant there was a huge increase in the amount of sewage discharged into the rivers. Rivers had always been used for this purpose, but when the number of inhabitants was so small, that wasn’t such a problem. However, as cities grew to over a million inhabitants, the impact on the rivers became more serious. In addition, other types of pollution increased, as factories were built beside the river and discharged their waste materials into the water. This got worse over time. As recently as 1957, scientists at London’s Natural History Museum declared that the River Thames was dead in biological terms, as the water was too filthy to support any kind of life. But in recent years, as rivers lost their industrial function, cities have begun to recognise their true value and to take steps to clean them up. For example, the River Thames is now cleaner than it’s been for 150 years. These days you can see seals swimming in the water, and recently people had to try to rescue a whale, which had got lost and swum up the river from the sea by mistake. Unfortunately, they didn’t succeed, but the problem was disorientation rather than the quality of the water. Then, all around the world, riverside areas are now seen as prime sites for development. Warehouses that were once used for storing goods are now being converted into expensive restaurants and also into apartments with river views, which are in great demand and sell for astronomical prices. In Los Angeles, on the west coast of the USA, an architect has plans to revitalise the banks of the river and to make a park there which can provide facilities for sports as well as a natural environment for relaxing in It also hoped that the riverside can be used for other purposes It’s been proposed that facilities could be provided for displaying projects related to various kinds of art that have been produced by local people, for example. In the city of Paris, During the summer months of July and August, all the traffic is banned from the roads by the sides of the river, and the banks are transformed into beaches, where people can relax in deck chairs under potted palm trees, sunbathe or buy a drink or a snack while enjoying the view. But to make the most of our rivers in our increasingly crowded cities, we need to allow them to regain their original purpose and be used as a means of transport, reclaiming our streets from cars and lorries. To do this, we’ll have to shift more traffic back to the river, but this time cleanly and silently, making the most of modern technology. Already, more than two billion passengers use the ferry to travel in cities around the world, like Istanbul, San Francisco and New York, and these numbers are set to rise further. Admittedly, it’s not a fast way of travelling, but neither is a car when it’s stuck in traffic. Of course, passenger traffic on roads might decrease as more people start working from home, but another recent development, the huge rise in online shopping, has meant that another form of urban traffic just keeps on growing, and that’s deliveries. Trucks and vans in the city pollute and double-park while dropping off parcels. Imagine using the immense capacity of shipping to take these trucks off the road One freight barge can replace 44 large trucks uses far less energy and causes less pollution When the barge docks at the riverside the parcels could be taken the last few kilometres to their final destination on cargo bikes, electric ones of course. This is already happening in the Dutch city of Amsterdam, and in future the final stage could even be carried out by drone, although at present this isn’t allowed. Wouldn’t it be great to unblock our city centres in this way? Looking further ahead…', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(200131, 20014, 'text_input', '-Pollution from  <strong', '[]'::jsonb, 'Factories', 1, 31),
(200132, 20014, 'text_input', 'In 1957, the River Thames in London was declared biologically  <strong', '[]'::jsonb, 'Dead', 1, 32),
(200133, 20014, 'text_input', '-question-number-32" class="ielts-listening-question-number">32     
  Recent Improvements  
 Seals and even a  <strong', '[]'::jsonb, 'Whale', 1, 33),
(200134, 20014, 'text_input', 'Riverside warehouses are converted to restaurants and  <strong', '[]'::jsonb, 'Apartments', 1, 34),
(200135, 20014, 'text_input', '-question-number-34" class="ielts-listening-question-number">34     
 In Los Angeles, there are plans to: 
 Build a riverside  <strong', '[]'::jsonb, 'Park', 1, 35),
(200136, 20014, 'text_input', '-listening-question-item"> 35     
 Display  <strong', '[]'::jsonb, 'Art', 1, 36),
(200137, 20014, 'text_input', 'In Paris,  <strong', '[]'::jsonb, 'Beaches', 1, 37),
(200138, 20014, 'text_input', 'Transport Possibilities  
 Over 2 billion passengers already travel by  <strong', '[]'::jsonb, 'Ferry', 1, 38),
(200139, 20014, 'text_input', 'Instead of road transport, goods can be transported by large freight barges and electric  <strong', '[]'::jsonb, 'Bikes', 1, 39),
(200140, 20014, 'text_input', 'tem"> 39     ,  or, in future, by  <strong', '[]'::jsonb, 'Drone', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
