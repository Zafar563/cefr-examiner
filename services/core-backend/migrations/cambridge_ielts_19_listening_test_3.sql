-- Cambridge IELTS 19 Academic Listening Test 3
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1903, 'Cambridge IELTS 19 Academic Listening Test 3', 'Rasmiy Cambridge IELTS 19 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(19031, 1903, 'listening', 'Listening Part 1', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-6                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p><em>Complete the notes below.</p>
<p>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</em></p>
<p><b>Local food shops</b></p>
<p><b>Where to go</b></p>
<p>- Kite Place - near the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p><b>Fish market</b></p>
<p>- cross the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span> and turn right</p>
<p>- best to go before <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span> pm, earlier than closing time</p>
<p><b>Organic shop</b></p>
<p>- called <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>- below a restaurant in the large, grey building</p>
<p>- look for the large <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span> outside</p>
<p><b>Supermarket</b></p>
<p>take a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span> minibus, number 289</p>
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
                                            Questions 7-10                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Complete the table below.</p>
<p>Write <strong>ONE WORD ONLY</strong> for each answer.</em></p>
<table>
<tbody>
<tr>
<td colspan="3">
<p style="text-align: center"><strong>Shopping</strong></p>
</td>
</tr>
<tr>
<td></td>
<td><strong>To buy</strong></td>
<td><strong>Other ideas</strong></td>
</tr>
<tr>
<td><strong>Fish market</strong></td>
<td>a dozen prawns</td>
<td>a handful of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span> <span style="font-size: 16px;font-family: inherit">(type of seaweed)</span></td>
</tr>
<tr>
<td><strong>Organic shop</strong></td>
<td>beans and a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span> for dessert</td>
<td>spices and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span></td>
</tr>
<tr>
<td><strong>Bakery</strong></td>
<td>a brown loaf</td>
<td>a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span> tart</td>
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
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/161246-cambridge-ielts-19-academic-listening-3-audio-1.mp3', 'LEON: Hi Shannon – how are you settling into your new flat?
SHANNON: Really well, thanks.
LEON: You look like you’re going shopping.
SHANNON: Yes, I am. My cousins are coming to stay for a couple of days, and I have to cook for them.
LEON: Well, there are plenty of places to buy food in Kite Place- it’s the area by the harbour.
SHANNON: Oh. OK, I’ll find that on the map. Thanks.
LEON: What sort of food do you need to get?
SHANNON: Well, neither of them eats meat but they both like fish.
LEON: Well, there’s a really good fish market there.
SHANNON: Oh great – where is it exactly?
LEON: It’s at the far end of Kite Place, so you have to go over the bridge and then it’s on the right.
SHANNON: OK – is it open all day?
LEON: It doesn’t close until four, but I’d recommend going earlier than that – it does run out of some things.
SHANNON: Oh, I don’t want that to happen.
LEON: As long as you get there by 3.30. you should be fine. It’s only 11 now, so plenty of time.
SHANNON: Right.
LEON: Do you need to buy vegetables too?
SHANNON: I do, and I want to avoid all the plastic packaging in the supermarket!
LEON: Well, there’s a really nice organic shop there. Now what’s it called … it’s the name of a flower. I know, it’s ’Rose’.
SHANNON: That’s a nice name.
LEON: Yeah – it sells vegetables and quite a lot of other stuff.
SHANNON: And where’s that?
LEON: Well, as you reach the market, you’ll see a big grey building on your left – I think it used to be a warehouse. Anyway, now it’s a restaurant upstairs, but the ground floor has two shops either side of the entrance and it’s the one on the left.
SHANNON: That’s easy enough.
LEON: You can’t miss it-there’s also a big sign on the pavement so you can look for that.
SHANNON: Fine! I guess if I need anything else, I’ll have to go to the supermarket.
LEON: Yeah- you should be able to get everything you need, but there’s a minibus that goes to the supermarket if you need it. It’s purple and the number is 289.
SHANNON: Thanks, that’s great.
LEON: So what do you need to get at the fish market? The salmon is always very good and the shellfish.
SHANNON: I’m going to make a curry, I think, and I need about 12 prawns for that.
LEON: They’ll have plenty of those.
SHANNON: OK.
LEON: Have you ever tried samphire?
SHANNON: No – what’s that?
LEON: It’s a type of seaweed. I just ask for a handful and you fry it in butter. It’s delicious!
SHANNON: Oh, I might try that- how do you spell it?
LEON: It’s S-A-M-P-H-l-R-E.
SHANNON: Great – it’s always good to try something different.
LEON: Yeah.
SHANNON: I’ll see what beans they have in the organic shop and I think I’ll get something for dessert there.
LEON: How about a mango?
SHANNON: I’m not sure- they’re not always ripe. I’d prefer a melon- it’s bigger too.
LEON: Good idea. The owner also sells a lot of spices there that you can put in a curry, and things like coconut.
SHANNON: Oh, that’s very helpful. I’ll have a look.
LEON: No problem.
SHANNON: I know bread doesn’t really go with curry but I always like to have some in case.
LEON: As I said – all the bread is home-made and there’s lots of variety. I like the brown bread myself.
SHANNON: Mm, sounds good.
LEON: They sell other things there too.
SHANNON: Like cakes? I love chocolate cake.
LEON: Well – not that, but they have a whole range of tarts and the best are the strawberry ones.
SHANNON: Perfect – hopefully I won t even have to go to the supermarket!', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(190301, 19031, 'text_input', 'Local food shops  
  Where to go  
 - Kite Place - near the  <strong', '[]'::jsonb, 'harbour / harbor', 1, 1),
(190302, 19031, 'text_input', '> 1     
  Fish market  
 - cross the  <strong', '[]'::jsonb, 'bridge', 1, 2),
(190303, 19031, 'text_input', 'em"> 2     and turn right 
 - best to go before  <strong', '[]'::jsonb, '3.30 / 3:30 / three thirty / half 3 / three', 1, 3),
(190304, 19031, 'text_input', '-question-number-3" class="ielts-listening-question-number">3     pm, earlier than closing time 
  Organic shop  
 - called  <strong', '[]'::jsonb, 'Rose / rose', 1, 4),
(190305, 19031, 'text_input', 'umber-4" class="ielts-listening-question-number">4     
 - below a restaurant in the large, grey building 
 - look for the large  <strong', '[]'::jsonb, 'sign', 1, 5),
(190306, 19031, 'text_input', 'trong id="ielts-listening-question-number-5" class="ielts-listening-question-number">5     outside 
  Supermarket  
 take a  <strong', '[]'::jsonb, 'purple', 1, 6),
(190307, 19031, 'text_input', 'Shopping  
 
 
 
  
  To buy  
  Other ideas  
 
 
  Fish market  
 a dozen prawns 
 a handful of  <strong', '[]'::jsonb, 'samphire', 1, 7),
(190308, 19031, 'text_input', 'put type="text" name="ielts_listening_answer_154874_1" id="ielts_listening_answer_154874_1" aria-label="Question 7" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">   (type of seaweed)  
 
 
  Organic shop  
 beans and a  <strong', '[]'::jsonb, 'melon', 1, 8),
(190309, 19031, 'text_input', 'uestion-item"> 8     for dessert 
 spices and  <strong', '[]'::jsonb, 'coconut / cocoanut', 1, 9),
(190310, 19031, 'text_input', 'stion-number-9" class="ielts-listening-question-number">9     
 
 
  Bakery  
 a brown loaf 
 a  <strong', '[]'::jsonb, 'strawberry', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(19032, 1903, 'listening', 'Listening Part 2', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-16                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What information is given about each of the following festival workshops?</p>
<p>Choose <strong>SIX</strong> answers from the box and write the correct letter,<strong> A-H</strong>.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>Superheroes</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">11</strong><select data-qnum="11" name="question_11" class="ielts-inline-select"><option value="">[ 11 ] Tanlang...</option><option value="A. involves painting and drawing">A. involves painting and drawing</option><option value="B. will be led by a prize-winning author">B. will be led by a prize-winning author</option><option value="C. is aimed at children with a disability">C. is aimed at children with a disability</option><option value="D. involves a drama activity">D. involves a drama activity</option><option value="E. focuses on new relationships">E. focuses on new relationships</option><option value="F. is aimed at a specific age group">F. is aimed at a specific age group</option><option value="G. explores an unhappy feeling">G. explores an unhappy feeling</option><option value="H. raises awareness of a particular culture">H. raises awareness of a particular culture</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Just do it</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">12</strong><select data-qnum="12" name="question_12" class="ielts-inline-select"><option value="">[ 12 ] Tanlang...</option><option value="A. involves painting and drawing">A. involves painting and drawing</option><option value="B. will be led by a prize-winning author">B. will be led by a prize-winning author</option><option value="C. is aimed at children with a disability">C. is aimed at children with a disability</option><option value="D. involves a drama activity">D. involves a drama activity</option><option value="E. focuses on new relationships">E. focuses on new relationships</option><option value="F. is aimed at a specific age group">F. is aimed at a specific age group</option><option value="G. explores an unhappy feeling">G. explores an unhappy feeling</option><option value="H. raises awareness of a particular culture">H. raises awareness of a particular culture</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Count on me</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">13</strong><select data-qnum="13" name="question_13" class="ielts-inline-select"><option value="">[ 13 ] Tanlang...</option><option value="A. involves painting and drawing">A. involves painting and drawing</option><option value="B. will be led by a prize-winning author">B. will be led by a prize-winning author</option><option value="C. is aimed at children with a disability">C. is aimed at children with a disability</option><option value="D. involves a drama activity">D. involves a drama activity</option><option value="E. focuses on new relationships">E. focuses on new relationships</option><option value="F. is aimed at a specific age group">F. is aimed at a specific age group</option><option value="G. explores an unhappy feeling">G. explores an unhappy feeling</option><option value="H. raises awareness of a particular culture">H. raises awareness of a particular culture</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Speak up</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">14</strong><select data-qnum="14" name="question_14" class="ielts-inline-select"><option value="">[ 14 ] Tanlang...</option><option value="A. involves painting and drawing">A. involves painting and drawing</option><option value="B. will be led by a prize-winning author">B. will be led by a prize-winning author</option><option value="C. is aimed at children with a disability">C. is aimed at children with a disability</option><option value="D. involves a drama activity">D. involves a drama activity</option><option value="E. focuses on new relationships">E. focuses on new relationships</option><option value="F. is aimed at a specific age group">F. is aimed at a specific age group</option><option value="G. explores an unhappy feeling">G. explores an unhappy feeling</option><option value="H. raises awareness of a particular culture">H. raises awareness of a particular culture</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Jump for joy</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">15</strong><select data-qnum="15" name="question_15" class="ielts-inline-select"><option value="">[ 15 ] Tanlang...</option><option value="A. involves painting and drawing">A. involves painting and drawing</option><option value="B. will be led by a prize-winning author">B. will be led by a prize-winning author</option><option value="C. is aimed at children with a disability">C. is aimed at children with a disability</option><option value="D. involves a drama activity">D. involves a drama activity</option><option value="E. focuses on new relationships">E. focuses on new relationships</option><option value="F. is aimed at a specific age group">F. is aimed at a specific age group</option><option value="G. explores an unhappy feeling">G. explores an unhappy feeling</option><option value="H. raises awareness of a particular culture">H. raises awareness of a particular culture</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Sticks and stones</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">16</strong><select data-qnum="16" name="question_16" class="ielts-inline-select"><option value="">[ 16 ] Tanlang...</option><option value="A. involves painting and drawing">A. involves painting and drawing</option><option value="B. will be led by a prize-winning author">B. will be led by a prize-winning author</option><option value="C. is aimed at children with a disability">C. is aimed at children with a disability</option><option value="D. involves a drama activity">D. involves a drama activity</option><option value="E. focuses on new relationships">E. focuses on new relationships</option><option value="F. is aimed at a specific age group">F. is aimed at a specific age group</option><option value="G. explores an unhappy feeling">G. explores an unhappy feeling</option><option value="H. raises awareness of a particular culture">H. raises awareness of a particular culture</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="154884">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. involves painting and drawing">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">involves painting and drawing</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. will be led by a prize-winning author">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">will be led by a prize-winning author</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. is aimed at children with a disability">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">is aimed at children with a disability</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. involves a drama activity">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">involves a drama activity</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. focuses on new relationships">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">focuses on new relationships</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. is aimed at a specific age group">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">is aimed at a specific age group</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. explores an unhappy feeling">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">explores an unhappy feeling</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="H" data-text="H. raises awareness of a particular culture">
                                                                                        <span class="dnd-label">H.</span>
                                                                                        <span class="dnd-text">raises awareness of a particular culture</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 17-18                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose TWO letters, A–E.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="17,18"><div class="ielts-q-header"><strong class="ielts-q-badge">17</strong> <strong class="ielts-q-badge">18</strong><span class="ielts-q-title"><span>Which TWO reasons does the speaker give for recommending Alive and Kicking</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> It will appeal to both boys and girls.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> The author is well known.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> It has colourful illustrations.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> It is funny.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="17,18" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> It deals with an important topic.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 19-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose TWO letters, A–E.</p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="19,20"><div class="ielts-q-header"><strong class="ielts-q-badge">19</strong> <strong class="ielts-q-badge">20</strong><span class="ielts-q-title"><span>Which TWO pieces of advice does the speaker give to parents about reading?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> Encourage children to write down new vocabulary.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> Allow children to listen to audio books.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> Get recommendations from librarians.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> Give children a choice about what they read.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> Only read aloud to children until they can read independently.</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/161249-cambridge-ielts-19-academic-listening-3-audio-2.mp3', 'PRESENTER: The children’s book festival is coming up again soon and here to tell us all about it is the festival’s organiser, Jenny Morgan. So tell us what we can expect this year, Jenny.
JENNY: Well, as usual we’ve got five days of action-packed exciting events for children, with writers coming from all over the country getting involved.
Just to give you an idea of what’s on offer in the workshops, first of all, there’s a very special event called Superheroes. This is a chance for deaf children to share their reading experiences with author Madeleine Gordon, who is herself hearing impaired.
‘Just do it’ is a practical workshop led by the well-known illustrator Mark Keane. He’ll take participants on a magical journey to faraway lands with an opportunity for aspiring actors to do some role play.
‘Count on me’ is an inspiring and entertaining look at the issues of friendship for 13-14-year-olds. It looks at some of the friendships described in popular books and asks participants to compare these with their own experiences.
‘Speak up’ is part of a series of workshops on the subject of mental health. This is a creative writing workshop encouraging children to describe situations where young people experience loneliness. A recent survey revealed that children can be lonely even when they’re at home with their families.
‘Jump for joy’, as many of you will know, is the heart-warming, best-selling story by Nina Karan about a young girl’s trip to visit her relatives in India. It recently received the gold medal at the Waterford Awards. Nina will get children to celebrate the word ‘joy’ by writing a poem.
‘Sticks and stones’ is the beautifully illustrated picture book for young readers about a community who organise an African-Caribbean festival to help local children learn about their Jamaican roots. This will be a musical event where children will have the chance to play steel drums. This is bound to be very popular, so please book as soon as possible.
PRESENTER: Thanks Jenny. That all sounds really interesting. I’m just wondering if you have a favourite book you could recommend for our readers?
JENNY: It’s hard to choose, but Alive and Kicking is definitely worth mentioning. You won’t have heard of the writer as it’s her first book – which is really impressive. It’s basically the teenage diary of a boy from Somalia who comes to live in the UK. It deals with the serious issue of immigration and all the challenges the boy has to face at school and with the language barrier, etc. Usually, books like this are quite sad, but this one actually made me cry with laughter. On each page, there are simple but hilarious black and white stick drawings of the boy with his friends and teachers. At the end of each diary entry, there are new English words the boy learns each day, which may help develop some children’s vocabulary.
PRESENTER: I think my kids would enjoy that. What about any advice for parents on how to encourage their children to read more?
JENNY: Well, this is something I get asked about a lot. There are so many distractions for kids these days that it can be hard to find time for reading. One thing I’d say is to make time to sit down with your child and share books with them. A lot of parents give up reading aloud to their children as soon as they learn to read
independently, but this is a mistake. It’s good to read more advanced books to them as it helps to develop their vocabulary. If you don’t have time for this, then let them listen to audio books. Often, they’ll want to read books they’ve listened to for themselves. I think it’s a good idea to make a mental note of the type of books your child is reading – often they just read the same genre all the time, which can get a bit boring. You can introduce new authors and genres to them. Librarians should be able to help you with this.
PRESENTER: Well Jenny, I think that’s really useful… .', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(190311, 19032, 'single_choice', 'Question 11', '["A", "B", "C"]'::jsonb, 'C', 1, 11),
(190312, 19032, 'single_choice', 'Question 12', '["A", "B", "C"]'::jsonb, 'D', 1, 12),
(190313, 19032, 'single_choice', 'Question 13', '["A", "B", "C"]'::jsonb, 'F', 1, 13),
(190314, 19032, 'single_choice', 'Question 14', '["A", "B", "C"]'::jsonb, 'G', 1, 14),
(190315, 19032, 'single_choice', 'Question 15', '["A", "B", "C"]'::jsonb, 'B', 1, 15),
(190316, 19032, 'single_choice', 'Question 16', '["A", "B", "C", "D", "E", "F", "G", "H"]'::jsonb, 'H', 1, 16),
(190317, 19032, 'multiple_choice', 'Question 17', '["A", "B", "C", "D", "E"]'::jsonb, 'D / E', 1, 17),
(190318, 19032, 'multiple_choice', 'Which TWO reasons does the speaker give for recommending Alive and Kicking', '["A", "B", "C", "D", "E"]'::jsonb, 'D / E', 1, 18),
(190319, 19032, 'multiple_choice', 'Question 19', '["A", "B"]'::jsonb, 'B / C', 1, 19),
(190320, 19032, 'multiple_choice', 'Which TWO pieces of advice does the speaker give to parents about reading?', '["A", "B"]'::jsonb, 'B / C', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(19033, 1903, 'listening', 'Listening Part 3', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-25                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><i>Choose the correct letter, <b>A, B</b> or <b>C</b>.</i></p>
<p><b>Science experiment for Year 12 students</b></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="21"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong><span class="ielts-q-title"><span>How does Clare feel about the students in her Year 12 science class?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="A"><span class="ielts-radio-text"><strong>A</strong> worried that they are not making progress</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="B"><span class="ielts-radio-text"><strong>B</strong> challenged by their poor behaviour in class</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="C"><span class="ielts-radio-text"><strong>C</strong> frustrated at their lack of interest in the subject</span></label></div></div><div class="ielts-standalone-q" data-qnum="22"><div class="ielts-q-header"><strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>How does Jake react to Clare’s suggestion about an experiment based on children’s diet?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="A"><span class="ielts-radio-text"><strong>A</strong> He is concerned that the results might not be meaningful.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="B"><span class="ielts-radio-text"><strong>B</strong> He feels some of the data might be difficult to obtain.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="C"><span class="ielts-radio-text"><strong>C</strong> He suspects that the conclusions might be upsetting.</span></label></div></div><div class="ielts-standalone-q" data-qnum="23"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong><span class="ielts-q-title"><span>What problem do they agree may be involved in an experiment involving animals?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="A"><span class="ielts-radio-text"><strong>A</strong> Any results may not apply to humans.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="B"><span class="ielts-radio-text"><strong>B</strong> It may be complicated to get permission.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="C"><span class="ielts-radio-text"><strong>C</strong> Students may not be happy about animal experiments.</span></label></div></div><div class="ielts-standalone-q" data-qnum="24"><div class="ielts-q-header"><strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>What question do they decide the experiment should address?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="A"><span class="ielts-radio-text"><strong>A</strong> Are mice capable of controlling their food intake?</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="B"><span class="ielts-radio-text"><strong>B</strong> Does an increase in sugar lead to health problems?</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="C"><span class="ielts-radio-text"><strong>C</strong> How much do supplements of different kinds affect health?</span></label></div></div><div class="ielts-standalone-q" data-qnum="25"><div class="ielts-q-header"><strong class="ielts-q-badge">25</strong><span class="ielts-q-title"><span>Clare might also consider doing another experiment involving</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="A"><span class="ielts-radio-text"><strong>A</strong> other types of food supplement.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="B"><span class="ielts-radio-text"><strong>B</strong> different genetic strains of mice.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="25" name="question_25" value="C"><span class="ielts-radio-text"><strong>C</strong> varying amounts of exercise.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 26-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Complete the flowchart below.</p>
<p><i>Choose <b>FIVE</b> answers from the box and write the correct letter, <b>A-H</b>.</i></p>
<div dir="ltr" align="left">
<table>
<colgroup>
<col /></colgroup>
<tbody>
<tr>
<td>
<p dir="ltr">Choose mice which are all the same <span class="ielts-listening-question-item"><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">26</strong><select data-qnum="26" name="question_26" class="ielts-inline-select"><option value="">[ 26 ] Tanlang...</option><option value="A. size">A. size</option><option value="B. escape">B. escape</option><option value="C. age">C. age</option><option value="D. water">D. water</option><option value="E. cereal">E. cereal</option><option value="F. calculations">F. calculations</option><option value="G. changes">G. changes</option><option value="H. colour">H. colour</option></select></span></span>.</p>
</td>
</tr>
</tbody>
</table>
</div>
<p dir="ltr" style="text-align: center">⭣</p>
<div dir="ltr" align="left">
<table>
<colgroup>
<col /></colgroup>
<tbody>
<tr>
<td>
<p dir="ltr">Divide the mice into two groups, each with a different <span class="ielts-listening-question-item"><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. size">A. size</option><option value="B. escape">B. escape</option><option value="C. age">C. age</option><option value="D. water">D. water</option><option value="E. cereal">E. cereal</option><option value="F. calculations">F. calculations</option><option value="G. changes">G. changes</option><option value="H. colour">H. colour</option></select></span></span>.</p>
</td>
</tr>
</tbody>
</table>
</div>
<p dir="ltr" style="text-align: center">⭣</p>
<div dir="ltr" align="left">
<table>
<colgroup>
<col /></colgroup>
<tbody>
<tr>
<td>
<p dir="ltr">Put each group in a separate cage.</p>
<p dir="ltr">Feed group A commercial mouse food.</p>
<p dir="ltr">Feed group B the same, but also sugar contained in <span class="ielts-listening-question-item"><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">28</strong><select data-qnum="28" name="question_28" class="ielts-inline-select"><option value="">[ 28 ] Tanlang...</option><option value="A. size">A. size</option><option value="B. escape">B. escape</option><option value="C. age">C. age</option><option value="D. water">D. water</option><option value="E. cereal">E. cereal</option><option value="F. calculations">F. calculations</option><option value="G. changes">G. changes</option><option value="H. colour">H. colour</option></select></span></span>.</p>
</td>
</tr>
</tbody>
</table>
</div>
<p dir="ltr" style="text-align: center">⭣</p>
<div dir="ltr" align="left">
<table>
<colgroup>
<col /></colgroup>
<tbody>
<tr>
<td>
<p dir="ltr">Take measurements using an electronic scale.</p>
<p dir="ltr">Place them in a weighing chamber to prevent <span class="ielts-listening-question-item"><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">29</strong><select data-qnum="29" name="question_29" class="ielts-inline-select"><option value="">[ 29 ] Tanlang...</option><option value="A. size">A. size</option><option value="B. escape">B. escape</option><option value="C. age">C. age</option><option value="D. water">D. water</option><option value="E. cereal">E. cereal</option><option value="F. calculations">F. calculations</option><option value="G. changes">G. changes</option><option value="H. colour">H. colour</option></select></span></span>.</p>
</td>
</tr>
</tbody>
</table>
</div>
<p dir="ltr" style="text-align: center">⭣</p>
<div dir="ltr" align="left">
<table>
<colgroup>
<col /></colgroup>
<tbody>
<tr>
<td>
<p dir="ltr">Do all necessary <span class="ielts-listening-question-item"><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">30</strong><select data-qnum="30" name="question_30" class="ielts-inline-select"><option value="">[ 30 ] Tanlang...</option><option value="A. size">A. size</option><option value="B. escape">B. escape</option><option value="C. age">C. age</option><option value="D. water">D. water</option><option value="E. cereal">E. cereal</option><option value="F. calculations">F. calculations</option><option value="G. changes">G. changes</option><option value="H. colour">H. colour</option></select></span></span>.</p>
</td>
</tr>
</tbody>
</table>
</div>
                                                <div class="options-dnd-panel dnd-panel dnd-panel--inline" data-dnd-group="154895">
                                                    <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                    <div class="dnd-cards-container">
                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. size">
                                                                <span class="dnd-label">A.</span>
                                                                <span class="dnd-text">size</span>
                                                            </div>
                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. escape">
                                                                <span class="dnd-label">B.</span>
                                                                <span class="dnd-text">escape</span>
                                                            </div>
                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. age">
                                                                <span class="dnd-label">C.</span>
                                                                <span class="dnd-text">age</span>
                                                            </div>
                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. water">
                                                                <span class="dnd-label">D.</span>
                                                                <span class="dnd-text">water</span>
                                                            </div>
                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. cereal">
                                                                <span class="dnd-label">E.</span>
                                                                <span class="dnd-text">cereal</span>
                                                            </div>
                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. calculations">
                                                                <span class="dnd-label">F.</span>
                                                                <span class="dnd-text">calculations</span>
                                                            </div>
                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. changes">
                                                                <span class="dnd-label">G.</span>
                                                                <span class="dnd-text">changes</span>
                                                            </div>
                                                                                                                    <div class="dnd-card" draggable="true" data-value="H" data-text="H. colour">
                                                                <span class="dnd-label">H.</span>
                                                                <span class="dnd-text">colour</span>
                                                            </div>
                                                                                                            </div>
                                                </div>
                                                                                    </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/161248-cambridge-ielts-19-academic-listening-3-audio-3.mp3', 'CLARE: Hi Jake. How are you getting on with the practical teaching?
JAKE: It’s harder than I expected, but I’ve got some great classes. How about you?
CLARE: Not brilliant. I’m really struggling with my Year 12 science class.
JAKE: Are they hard to control?
CLARE: Well, I don’t have discipline problems as such. It’s just that they don’t seem to think that science has anything to do with their lives. It’s depressing. They listen to what I say, and I gave them a test last week and the results weren’t too bad, but there’s no real engagement.
JAKE: Right.
CLARE: And as part of my teaching practice, I have to design an experiment for them to do. I was wondering about something on the children’s diets… you know, asking them to record what they eat and maybe linking it to their state of health.
JAKE: Mmm. Let’s think. So your methodology would involve the children recording what they eat. OK, but you’d also need to have access to the children’s medical records and I don’t think people would be happy about that; confidentiality would be an issue. If you could get the right data, the conclusions might be significant, but I suspect it’s just not going to be easy.
CLARE: Right.
JAKE: Have you thought about doing an experiment using animals?
CLARE: Wouldn’t that be upsetting for the children?
JAKE: Well, the animals don’t have to be harmed in any way. It could just be an experiment where they’re given a certain diet and the effects are observed.
CLARE: Would I have to get permission to use animals?
JAKE: Yes, you’d have to submit an outline of the experiment and fill in a form, but it’s quite straightforward.
CLARE: But if we found out that, say, a particular diet affects the health of animals, the same thing wouldn’t necessarily be true for people, would it?
JAKE: No that’s true, but the findings for any experiment are going to be limited. It’s inevitable.
CLARE: I suppose so. So what animals could I use to investigate the effects of diet? Mice?
JAKE: Yes. You’d need experimental mice – ones that have been specially bred for experiments.
OK, so what will your experiment be investigating exactly?
CLARE: Well, something to do with nutrition. So maybe we could look at food supplements… things like extra iron and extra protein, and their impact on health.
JAKE:Mmm. That might be rather broad. Maybe just look at the effects of one supplement, like sugar, on the health of the mice?
CLARE: In fact, maybe the focus could be on whether mice can control their own diet.
JAKE: So, what happens when they have access to more sugar, that they don’t really need?
CLARE: Exactly. Do they eat it or do they decide to leave it?
JAKE: Great. Then later on, you could do a follow-up experiment adding another variable. Like, you could give some of the mice the chance to be more active, running on a wheel or something, and the others just sit around and don’t do much.
CLARE: Or I could repeat the experiment but change the type of food I provided . . . or use mice with a different genetic structure. But I think your idea would be more interesting, I might think about that some more.
CLARE: So can I talk through a possible procedure for the experiment where mice are given a sugar supplement?
JAKE: Sure. I did a similar experiment in college actually.
CLARE: Great. So how many mice would I need?
JAKE: I’d say about 12. And all young ones, not a mixture of old and young.
CLARE: OK. And I’d need two groups of equal sizes, so six in each group. And how would I tell them apart? I suppose I could put some sort of tag on one group… or just mark them in some way?
JAKE: You could use food colouring, that wouldn’t hurt them.
CLARE: Perfect. Then each group would go into a separate cage, and one group, let’s call them group A, would be the control group. So they’d just have ordinary mouse food. I suppose you can buy that?
JAKE: Yes, it comes in dry pellets.
CLARE: And the other group would have the same as the first group, but they’d also have the extra sugar.
JAKE: Would you just give them straight sugar?
CLARE: I might be better to give them something like cereal with it.
JAKE: Hmm. Then you’d need to weigh the mice, I should think once a week. And you’d need an electronic balance.
CLARE: But we can’t hold them on the balance, or it’d affect the reading.
JAKE: Exactly. So you need something called a weighing chamber to stop the mice from running away. It sounds complicated, but actually you can just use a plastic box with holes in the top.
CLARE: OK. So once we’ve measured the weight gain of each mouse we can work out the average for each group, as well as the standard deviation. And then see where we go from there. That sounds cool, I think the students will enjoy it.
JAKE: Yes. One thing…', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(190321, 19033, 'single_choice', 'How does Clare feel about the students in her Year 12 science class?', '["A", "B", "C"]'::jsonb, 'C', 1, 21),
(190322, 19033, 'single_choice', 'How does Jake react to Clare&rsquo;s suggestion about an experiment based on children&rsquo;s diet?', '["A", "B", "C"]'::jsonb, 'B', 1, 22),
(190323, 19033, 'single_choice', 'What problem do they agree may be involved in an experiment involving animals?', '["A", "B", "C"]'::jsonb, 'A', 1, 23),
(190324, 19033, 'single_choice', 'What question do they decide the experiment should address?', '["A", "B", "C"]'::jsonb, 'A', 1, 24),
(190325, 19033, 'single_choice', 'Clare might also consider doing another experiment involving', '["A", "B", "C"]'::jsonb, 'C', 1, 25),
(190326, 19033, 'single_choice', 'Question 26', '["A", "B", "C"]'::jsonb, 'C', 1, 26),
(190327, 19033, 'single_choice', 'Question 27', '["A", "B", "C"]'::jsonb, 'H', 1, 27),
(190328, 19033, 'single_choice', 'Question 28', '["A", "B", "C"]'::jsonb, 'E', 1, 28),
(190329, 19033, 'single_choice', 'Question 29', '["A", "B", "C"]'::jsonb, 'B', 1, 29),
(190330, 19033, 'single_choice', 'Question 30', '["A", "B", "C"]'::jsonb, 'F', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(19034, 1903, 'listening', 'Listening Part 4', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p><i>Write ONE WORD ONLY for each answer.</i></p>
<p style="text-align: center"><strong>Microplastics</strong></p>
<p><strong>Where microplastics come from</strong></p>
<p>fibres from some <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span> during washing</p>
<p>the breakdown of large pieces of plastic</p>
<p>waste from industry</p>
<p>the action of vehicle tyres on roads</p>
<p><strong>Effects of microplastics</strong></p>
<p>They cause injuries to the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> of wildlife and affect their digestive systems.</p>
<p>They enter the food chain, e.g., in bottled and tap water, <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span> and seafood.</p>
<p>They may not affect human health, but they are already banned in skin cleaning products and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> in some countries.</p>
<p>Microplastics enter the soil through the air, rain and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span>.</p>
<p><strong>Microplastics in the soil – a study by Anglia Ruskin University</strong></p>
<p>Earthworms are important because they add <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> to the soil.</p>
<p>The study aimed to find whether microplastics in earthworms affect the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span> of plants.</p>
<p>The study found that microplastics caused:</p>
<p><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> loss in earthworms</p>
<p>fewer seeds to germinate</p>
<p>a rise in the level of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span> in the soil.</p>
<p>The study concluded:</p>
<p>soil should be seen as an important natural process.</p>
<p>changes to soil damage both ecosystems and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span></p>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/161247-cambridge-ielts-19-academic-listening-3-audio-4.mp3', 'In today’s lecture, I’m going to be talking about microplastics.
Microplastics are tiny pieces of plastic smaller than five millimetres in size. Recently there’s been a greater awareness that there are large quantities of plastic waste – big and small – in the environment. The amount of plastic waste in the oceans has received widespread attention, but far less is known about the effects of microplastics in freshwater and particularly in soil.
Microplastics can enter the environment via a number of different sources. Threads and microfibres detach from synthetic clothing every time they’re put in a washing machine, and these find their way into the water system. Other sources include big pieces of plastic waste that are already in the environment, and these break down into microscopic particles over a period of time. On a larger scale, factory waste is another route, as are tyres which wear down as cars, lorries and so on travel along road surfaces.
We already understand some of the impacts of microplastics from studies involving fish and other animals. There is evidence that microplastics harm small creatures in a variety of ways, such as by damaging their mouths, or by impairing their ability to feed, for example when microplastics get lodged in their digestive system.
Surprisingly perhaps, it is likely that humans consume microplastics, as these have been detected in a wide range of food and drink products, including bottled water, as well as in water that comes direct from the tap. What’s more, salt and many kinds of seafood have also been found to contain microplastics.
However, it’s important to underline that there is not yet conclusive proof that microplastics cause significant harm to people. In many countries, including here in the UK, there is legislation which prevents manufacturers from adding plastic microbeads to shower gels, facial cleansers and toothpaste.
It is very difficult to accurately estimate the total amount of microplastic particles in the soil as they can be hard to detect, but we do know they are carried in the air and deposited in the soil by rain. What’s more, many of the fertilisers used by both farmers and gardeners contain microplastics.
A team from the Anglia Ruskin University in Cambridge has carried out a study of the effects of microplastics on the digestive tracts of earthworms. These worms, which live in topsoil, are an essential component of our agricultural system. By feeding on soil, they mix nutrients into it, thereby making it more fertile.
The researchers set out to discover whether the introduction of microplastics into the soil- and the subsequent ingestion of these by earthworms- would impact soil quality and ultimately inhibit plant growth. The short answer was, yes, it did. After placing three different types of microplastic particles into the soil, they planted perennial rye grass. The particles of microplastic, which included biodegradable PLA and conventional high-density polyethylene, or HDPE, were then ingested by the earthworms in the soil. The result was that the worms lost weight rapidly. What’s more, a lower percentage than normal of the rye grass seeds germinated, and the researchers concluded that this was a direct result of the earthworms being unable to fulfil their normal role in making soil more fertile. The team also discovered that there was an increase in the amount of acid found in the soil, and this was attributed mainly to the microplastic particles from conventional HDPE plastic.
The conclusions of the study make for very interesting reading – I’ve included the reference in the notes to give you at the end of this session. To summarise, the authors proposed the idea that we need to regard soil as we would regard any other process in nature. This means we should accept the implications of soil being dependent on decaying and dead matter constantly being passed through the bodies of earthworms. That is, when soil becomes impoverished by the presence of microplastics, not only ecosystems but also the whole of society are negatively impacted.', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(190331, 19034, 'text_input', 'Microplastics  
  Where microplastics come from  
 fibres from some  <strong', '[]'::jsonb, 'clothing', 1, 31),
(190332, 19034, 'text_input', 'ing_answer_154898_1" aria-label="Question 31" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  during washing 
 the breakdown of large pieces of plastic 
 waste from industry 
 the action of vehicle tyres on roads 
  Effects of microplastics  
 They cause injuries to the  <strong', '[]'::jsonb, 'mouths', 1, 32),
(190333, 19034, 'text_input', ', in bottled and tap water,  <strong', '[]'::jsonb, 'salt', 1, 33),
(190334, 19034, 'text_input', 'They may not affect human health, but they are already banned in skin cleaning products and  <strong', '[]'::jsonb, 'toothpaste', 1, 34),
(190335, 19034, 'text_input', 'Microplastics enter the soil through the air, rain and  <strong', '[]'::jsonb, 'fertilizers / fertilisers', 1, 35),
(190336, 19034, 'text_input', 'Microplastics in the soil – a study by Anglia Ruskin University  
 Earthworms are important because they add  <strong', '[]'::jsonb, 'nutrients', 1, 36),
(190337, 19034, 'text_input', 'The study aimed to find whether microplastics in earthworms affect the  <strong', '[]'::jsonb, 'growth', 1, 37),
(190338, 19034, 'text_input', 'The study found that microplastics caused: 
  <strong', '[]'::jsonb, 'weight', 1, 38),
(190339, 19034, 'text_input', 'umber-38" class="ielts-listening-question-number">38     loss in earthworms 
 fewer seeds to germinate 
 a rise in the level of  <strong', '[]'::jsonb, 'acid', 1, 39),
(190340, 19034, 'text_input', 'changes to soil damage both ecosystems and  <strong', '[]'::jsonb, 'society', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
