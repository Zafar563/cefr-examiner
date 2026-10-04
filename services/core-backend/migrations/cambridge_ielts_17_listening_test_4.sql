-- Cambridge IELTS 17 Academic Listening Test 4
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1704, 'Cambridge IELTS 17 Academic Listening Test 4', 'Rasmiy Cambridge IELTS 17 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(17041, 1704, 'listening', 'Listening Part 1: Easy Life Cleaning Services', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-10                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p><em>Complete the notes below.</em></p>
<p><em>Write <strong>ONE WORD </strong>for each answer.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Easy Life Cleaning Services</strong></strong></p>
<p><strong>Basic cleaning package offered</strong></p>
<ul>
<li>Cleaning all surfaces</li>
<li>Cleaning the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span> throughout the apartment</li>
<li>Cleaning shower, sinks, toilet etc.</li>
</ul>
<p><strong>Additional services agreed</strong></p>
<ul>
<li>Every week</li>
</ul>
<p>–  Cleaning the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>–  Ironing clothes – <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span> only</p>
<ul>
<li>Every month</li>
</ul>
<p>–  Cleaning all the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span> from the inside</p>
<p>–  Washing down the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p><strong>Other possibilities</strong></p>
<ul>
<li>They can organise a plumber or an <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span> if necessary.</li>
<li>A special cleaning service is available for customers who are allergic to <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Information on the cleaners</strong></p>
<ul>
<li>Before being hired, all cleaners have a background check carried out by the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>References are required.</li>
<li>All cleaners are given <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span> for two weeks.</li>
<li>Customers send a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span> after each visit.</li>
<li>Usually, each customer has one regular cleaner.</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13843-cambridge-ielts-17-academic-listening-4-audio-1.mp3', 'JACINTA: Hello, Easy Life Cleaning Services, Jacinta speaking.
CLIENT: Oh hello. I’m looking for a cleaning service for my apartment – do you do domestic cleaning?
JACINTA: Sure.
CLIENT: Well, it’s just a one-bedroom flat. Do you have a basic cleaning package?
JACINTA: Yes. For a one-bedroom flat we’re probably looking at about two hours for a clean. So we’d do a thorough clean of all surfaces in each room, and polish them where necessary. Does your apartment have carpets?
CLIENT: No, I don’t have any, but the floor would need cleaning.
JACINTA: Of course – we’d do that in every room. And we’d do a thorough clean of the kitchen and bathroom.
CLIENT: OK.
JACINTA: Then we have some additional services which you can request if you want – so for example, we can clean your oven for you every week.
CLIENT: Actually, I hardly ever use that, but can you do the fridge?
JACINTA: Sure. Would you like that done every week?
CLIENT: Yes, definitely. And would ironing clothes be an additional service you can do?
JACINTA: Yes, of course.
CLIENT: It wouldn’t be much, just my shirts for work that week.
JACINTA: That’s fine. And we could also clean your microwave if you want.
CLIENT: No, I wipe that out pretty regularly so there’s no need for that.
JACINTA: We also offer additional services that you might want a bit less often, say every month. So for example, if the inside of your windows need cleaning, we could do that.
CLIENT: Yes, that’d be good. I’m on the fifteenth floor, so the outside gets done regularly by specialists, but the inside goes get a bit grubby.
JACINTA: And we could arrange for your curtains to get cleaned if necessary.
CLIENT: No, they’re OK. But would you be able to do something about the balcony? It’s quite small and I don’t use it much, but it could do with a wash every month or so.
JACINTA: Yes, we can get the pressure washer onto that.
———————————
JACINTA: Now if you’re interested, we do offer some other possibilities to do with general maintenance. For example, if you have a problem with water and you need a plumber in a hurry, we can put you in touch with a reliable one who can come out straightaway. And the same thing if you need an electrician.
CLIENT: Right. That’s good to know. I’ve only just moved here so I don’t have any of those sorts of contacts.
JACINTA: And I don’t know if this is of interest to you, but we also offer a special vacuum cleaning system which can improve the indoor air quality of your home by capturing up to 99% of all the dust in the air. So if you’re troubled by allergies, this can make a big difference.
CLIENT: Right. In fact, I don’t have that sort of problem, but I’ll bear it in mind. Now can you tell me a bit about your cleaning staff?
JACINTA: Of course. So all our cleaners are very carefully selected. When they apply to us, they have to undergo a security check with the police to make sure they don’t have any sort of criminal background, and, of course, they have to provide references as well. Then if we think they might be suitable for the job, we give them training for it. That lasts for two weeks so it’s very thorough, and at the end of it, they have a test. If they pass that, we take them on, but we monitor them very carefully – we ask all our clients to complete a review of their performance after every visit and to email it to us. So we can pick up any problems straightaway and deal with them.
CLIENT: OK, well that all sounds good. And will I always have the same cleaner?
JACINTA: Yes, we do our best to organise it that way, and we usually manage it.
CLIENT: Good. That’s fine. Right, so I’d like to go ahead and …', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(170401, 17041, 'text_input', 'Easy Life Cleaning Services   
  Basic cleaning package offered  
 
 Cleaning all surfaces 
 Cleaning the  <strong', '[]'::jsonb, 'floor / floors', 1, 1),
(170402, 17041, 'text_input', 'Additional services agreed  
 
 Every week 
 
 –  Cleaning the  <strong', '[]'::jsonb, 'fridge', 1, 2),
(170403, 17041, 'text_input', 'ning-question-item"> 2     
 –  Ironing clothes –  <strong', '[]'::jsonb, 'shirts', 1, 3),
(170404, 17041, 'text_input', 's-listening-question-number-3" class="ielts-listening-question-number">3     only 
 
 Every month 
 
 –  Cleaning all the  <strong', '[]'::jsonb, 'windows', 1, 4),
(170405, 17041, 'text_input', 'tem"> 4     from the inside 
 –  Washing down the  <strong', '[]'::jsonb, 'balcony', 1, 5),
(170406, 17041, 'text_input', '-5" class="ielts-listening-question-number">5     
  Other possibilities  
 
 They can organise a plumber or an  <strong', '[]'::jsonb, 'electrician', 1, 6),
(170407, 17041, 'text_input', 'A special cleaning service is available for customers who are allergic to  <strong', '[]'::jsonb, 'dust', 1, 7),
(170408, 17041, 'text_input', 'nput type="text" name="ielts_listening_answer_13822_7" id="ielts_listening_answer_13822_7" aria-label="Question 7" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  
 
  Information on the cleaners  
 
 Before being hired, all cleaners have a background check carried out by the  <strong', '[]'::jsonb, 'police', 1, 8),
(170409, 17041, 'text_input', 'All cleaners are given  <strong', '[]'::jsonb, 'training', 1, 9),
(170410, 17041, 'text_input', 'Customers send a  <strong', '[]'::jsonb, 'review', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(17042, 1704, 'listening', 'Listening Part 2', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-14                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="11"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong><span class="ielts-q-title"><span>Many hotel managers are unaware that their staff often leave because of</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="A"><span class="ielts-radio-text"><strong>A</strong> a lack of training.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="B"><span class="ielts-radio-text"><strong>B</strong> long hours.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="C"><span class="ielts-radio-text"><strong>C</strong> low pay.</span></label></div></div><div class="ielts-standalone-q" data-qnum="12"><div class="ielts-q-header"><strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>What is the impact of high staff turnover on managers?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="A"><span class="ielts-radio-text"><strong>A</strong> an increased workload</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="B"><span class="ielts-radio-text"><strong>B</strong> low morale</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="C"><span class="ielts-radio-text"><strong>C</strong> an inability to meet targets</span></label></div></div><div class="ielts-standalone-q" data-qnum="13"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong><span class="ielts-q-title"><span>What mistake should managers always avoid?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="A"><span class="ielts-radio-text"><strong>A</strong> failing to treat staff equally</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="B"><span class="ielts-radio-text"><strong>B</strong> reorganising shifts without warning</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="C"><span class="ielts-radio-text"><strong>C</strong> neglecting to have enough staff during busy periods</span></label></div></div><div class="ielts-standalone-q" data-qnum="14"><div class="ielts-q-header"><strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>What unexpected benefit did Dunwich Hotel notice after improving staff retention rates?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="A"><span class="ielts-radio-text"><strong>A</strong> a fall in customer complaints</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="B"><span class="ielts-radio-text"><strong>B</strong> an increase in loyalty club membership</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="C"><span class="ielts-radio-text"><strong>C</strong> a rise in spending per customer</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 15-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Which way of reducing staff turnover was used in each of the following hotels?</p>
<p><em>Write the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>, next to Questions.</em></p>
<p><strong>Ways of reducing staff turnover</strong></p>
<p><strong>Hotels</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>The Sun Club</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">15</strong><select data-qnum="15" name="question_15" class="ielts-inline-select"><option value="">[ 15 ] Tanlang...</option><option value="A. improving relationships and teamwork">A. improving relationships and teamwork</option><option value="B. offering incentives and financial benefits">B. offering incentives and financial benefits</option><option value="C. providing career opportunities">C. providing career opportunities</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>The Portland</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">16</strong><select data-qnum="16" name="question_16" class="ielts-inline-select"><option value="">[ 16 ] Tanlang...</option><option value="A. improving relationships and teamwork">A. improving relationships and teamwork</option><option value="B. offering incentives and financial benefits">B. offering incentives and financial benefits</option><option value="C. providing career opportunities">C. providing career opportunities</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Bluewater Hotels</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">17</strong><select data-qnum="17" name="question_17" class="ielts-inline-select"><option value="">[ 17 ] Tanlang...</option><option value="A. improving relationships and teamwork">A. improving relationships and teamwork</option><option value="B. offering incentives and financial benefits">B. offering incentives and financial benefits</option><option value="C. providing career opportunities">C. providing career opportunities</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Pentlow Hotels</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">18</strong><select data-qnum="18" name="question_18" class="ielts-inline-select"><option value="">[ 18 ] Tanlang...</option><option value="A. improving relationships and teamwork">A. improving relationships and teamwork</option><option value="B. offering incentives and financial benefits">B. offering incentives and financial benefits</option><option value="C. providing career opportunities">C. providing career opportunities</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Green Planet</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">19</strong><select data-qnum="19" name="question_19" class="ielts-inline-select"><option value="">[ 19 ] Tanlang...</option><option value="A. improving relationships and teamwork">A. improving relationships and teamwork</option><option value="B. offering incentives and financial benefits">B. offering incentives and financial benefits</option><option value="C. providing career opportunities">C. providing career opportunities</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>The Amesbury</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">20</strong><select data-qnum="20" name="question_20" class="ielts-inline-select"><option value="">[ 20 ] Tanlang...</option><option value="A. improving relationships and teamwork">A. improving relationships and teamwork</option><option value="B. offering incentives and financial benefits">B. offering incentives and financial benefits</option><option value="C. providing career opportunities">C. providing career opportunities</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="13827" data-allow-duplicates="true">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. improving relationships and teamwork">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">improving relationships and teamwork</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. offering incentives and financial benefits">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">offering incentives and financial benefits</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. providing career opportunities">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">providing career opportunities</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13842-cambridge-ielts-17-academic-listening-4-audio-2.mp3', 'As many of you here today have worked in the hotel industry for some time, I’m sure you have experienced the problem of high staff turnover in your hotels. Every hotel relies on having loyal and experienced members of staff who make sure that everything runs smoothly. If staff are constantly changing, it can make life difficult for everyone. But why do staff leave frequently in many hotels? Of course, many hotel jobs, such as cleaning, are low-skilled and are not well-paid. A lot of managers think it’s this and the long hours that are the main causes of high staff turnover – but what they don’t realise is that it’s the lack of training in many hotel jobs which is a huge factor.
So, what kind of problems does a high turnover of staff cause? Well, having to recruit new staff all the time can be very time-consuming, and managers may have to cover some duties while waiting for new staff to arrive. This means they don’t have time to think about less immediate problems such as how to improve their service. When staff leave, it can also severely affect the colleagues they leave behind. It has a negative effect on remaining staff, who may start to feel that they too should be thinking about leaving.
So, what can be done to change this situation? Firstly, managers should stop making basic errors which leave their staff feeling upset and resentful. When organising shifts, for example, make sure you never give certain staff preferential treatment. All staff should be given some choice about when they work, and everyone should have to work some evening and weekend shifts. If you treat staff fairly, they’ll be more likely to step in and help when extra staff are needed.
Keeping staff happy has other tangible benefits for the business. Take the Dunwich Hotel as an example. It had been experiencing a problem with staff complaints and in order to deal with this, invested in staff training and improved staff conditions. Not only did the level of complaints fall, but they also noticed a significant increase in the amount each customer spent during their stay. They have now introduced a customer loyalty scheme which is going really well.
————————————
Now I’d like to look at some ways you can reduce staff turnover in your hotels, and I’ll do this by giving some examples of hotels where I’ve done some training recently.
The Sun Club received feedback which showed that staff thought managers didn’t value their opinions. They weren’t made to feel they were partners who were contributing to the success of the business as a whole. This situation has changed. Junior staff at all levels are regularly invited to meetings where their ideas are welcomed.
A year ago, The Portland recognised the need to invest in staff retention. Their first step was to introduce a scheme for recognising talent amongst their employees. The hope is that organising training for individuals with management potential will encourage them to stay with the business.
At Bluewater, managers decided to recognise 50 high achievers from across the company’s huge hotel chain. As a reward, they’re sent on an all-expenses-paid trip abroad every year. Fun is an important element in the trips, but there’s also the opportunity to learn something useful. This year’s trip included a visit to a brewery, where staff learned about the new beer that would be served in the hotel.
Pentlow Hotels identified that retention of junior reception staff was an issue. In order to encourage them to see that working in a hotel could be worthwhile and rewarding, with good prospects, they introduced a management programme. These staff were given additional responsibilities and the chance to work in various roles in the hotel.
Green Planet wanted to be seen as a caring employer. To make life easier for staff, many of whom had childcare responsibilities, the hotel began issuing vouchers to help cover the cost of childcare.
Louise Marsh at The Amesbury has one of the best staff retention rates in the business. Since she joined the company, she has made a huge effort to achieve this by creating a co-operative and supportive environment. For her, the staff are part of a large family where everyone is valued.
OK, now I’d like to …', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(170411, 17042, 'single_choice', 'Many hotel managers are unaware that their staff often leave because of', '["A", "B", "C"]'::jsonb, 'A', 1, 11),
(170412, 17042, 'single_choice', 'What is the impact of high staff turnover on managers?', '["A", "B", "C"]'::jsonb, 'A', 1, 12),
(170413, 17042, 'single_choice', 'What mistake should managers always avoid?', '["A", "B", "C"]'::jsonb, 'A', 1, 13),
(170414, 17042, 'single_choice', 'What unexpected benefit did Dunwich Hotel notice after improving staff retention rates?', '["A", "B", "C"]'::jsonb, 'C', 1, 14),
(170415, 17042, 'single_choice', 'Question 15', '["A", "B", "C"]'::jsonb, 'A', 1, 15),
(170416, 17042, 'single_choice', 'Question 16', '["A", "B", "C"]'::jsonb, 'C', 1, 16),
(170417, 17042, 'single_choice', 'Question 17', '["A", "B", "C"]'::jsonb, 'B', 1, 17),
(170418, 17042, 'single_choice', 'Question 18', '["A", "B", "C"]'::jsonb, 'C', 1, 18),
(170419, 17042, 'single_choice', 'Question 19', '["A", "B", "C"]'::jsonb, 'B', 1, 19),
(170420, 17042, 'single_choice', 'Question 20', '["A", "B", "C"]'::jsonb, 'A', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(17043, 1704, 'listening', 'Listening Part 3', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-22                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="21,22"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong> <strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>Which  points do Thomas and Jeanne make about Thomas’s sporting activities at school?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> He should have felt more positive about them.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> The training was too challenging for him.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> He could have worked harder at them.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> His parents were disappointed in him.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> His fellow students admired him.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 23-24                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="23,24"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong> <strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>Which  feelings did Thomas experience when he was in Kenya?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> disbelief</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> relief</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> stress</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> gratitude</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> homesickness</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 25-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What comment do the students make about the development of each of the following items of sporting equipment?</p>
<p><em>Choose <strong>SIX</strong> answers from the box and write the correct letter, <strong>A-H</strong>, next to Questions.</em></p>
<p>Comments about the development of the equipment</p>
<p><strong>Items of sporting equipment</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>the table tennis bat</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">25</strong><select data-qnum="25" name="question_25" class="ielts-inline-select"><option value="">[ 25 ] Tanlang...</option><option value="A. It could cause excessive sweating.">A. It could cause excessive sweating.</option><option value="B. The material was being mass produced for another purpose.">B. The material was being mass produced for another purpose.</option><option value="C. People often needed to make their own.">C. People often needed to make their own.</option><option value="D. It often had to be replaced.">D. It often had to be replaced.</option><option value="E. The material was expensive.">E. The material was expensive.</option><option value="F. It was unpopular among spectators.">F. It was unpopular among spectators.</option><option value="G. It caused injuries.">G. It caused injuries.</option><option value="H. No one ring it liked it at first.">H. No one ring it liked it at first.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>the cricket helmet</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">26</strong><select data-qnum="26" name="question_26" class="ielts-inline-select"><option value="">[ 26 ] Tanlang...</option><option value="A. It could cause excessive sweating.">A. It could cause excessive sweating.</option><option value="B. The material was being mass produced for another purpose.">B. The material was being mass produced for another purpose.</option><option value="C. People often needed to make their own.">C. People often needed to make their own.</option><option value="D. It often had to be replaced.">D. It often had to be replaced.</option><option value="E. The material was expensive.">E. The material was expensive.</option><option value="F. It was unpopular among spectators.">F. It was unpopular among spectators.</option><option value="G. It caused injuries.">G. It caused injuries.</option><option value="H. No one ring it liked it at first.">H. No one ring it liked it at first.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>the cycle helmet</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. It could cause excessive sweating.">A. It could cause excessive sweating.</option><option value="B. The material was being mass produced for another purpose.">B. The material was being mass produced for another purpose.</option><option value="C. People often needed to make their own.">C. People often needed to make their own.</option><option value="D. It often had to be replaced.">D. It often had to be replaced.</option><option value="E. The material was expensive.">E. The material was expensive.</option><option value="F. It was unpopular among spectators.">F. It was unpopular among spectators.</option><option value="G. It caused injuries.">G. It caused injuries.</option><option value="H. No one ring it liked it at first.">H. No one ring it liked it at first.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>the golf club</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">28</strong><select data-qnum="28" name="question_28" class="ielts-inline-select"><option value="">[ 28 ] Tanlang...</option><option value="A. It could cause excessive sweating.">A. It could cause excessive sweating.</option><option value="B. The material was being mass produced for another purpose.">B. The material was being mass produced for another purpose.</option><option value="C. People often needed to make their own.">C. People often needed to make their own.</option><option value="D. It often had to be replaced.">D. It often had to be replaced.</option><option value="E. The material was expensive.">E. The material was expensive.</option><option value="F. It was unpopular among spectators.">F. It was unpopular among spectators.</option><option value="G. It caused injuries.">G. It caused injuries.</option><option value="H. No one ring it liked it at first.">H. No one ring it liked it at first.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>the hockey stick</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">29</strong><select data-qnum="29" name="question_29" class="ielts-inline-select"><option value="">[ 29 ] Tanlang...</option><option value="A. It could cause excessive sweating.">A. It could cause excessive sweating.</option><option value="B. The material was being mass produced for another purpose.">B. The material was being mass produced for another purpose.</option><option value="C. People often needed to make their own.">C. People often needed to make their own.</option><option value="D. It often had to be replaced.">D. It often had to be replaced.</option><option value="E. The material was expensive.">E. The material was expensive.</option><option value="F. It was unpopular among spectators.">F. It was unpopular among spectators.</option><option value="G. It caused injuries.">G. It caused injuries.</option><option value="H. No one ring it liked it at first.">H. No one ring it liked it at first.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>the football</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">30</strong><select data-qnum="30" name="question_30" class="ielts-inline-select"><option value="">[ 30 ] Tanlang...</option><option value="A. It could cause excessive sweating.">A. It could cause excessive sweating.</option><option value="B. The material was being mass produced for another purpose.">B. The material was being mass produced for another purpose.</option><option value="C. People often needed to make their own.">C. People often needed to make their own.</option><option value="D. It often had to be replaced.">D. It often had to be replaced.</option><option value="E. The material was expensive.">E. The material was expensive.</option><option value="F. It was unpopular among spectators.">F. It was unpopular among spectators.</option><option value="G. It caused injuries.">G. It caused injuries.</option><option value="H. No one ring it liked it at first.">H. No one ring it liked it at first.</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="13834">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. It could cause excessive sweating.">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">It could cause excessive sweating.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. The material was being mass produced for another purpose.">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">The material was being mass produced for another purpose.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. People often needed to make their own.">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">People often needed to make their own.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. It often had to be replaced.">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">It often had to be replaced.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. The material was expensive.">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">The material was expensive.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. It was unpopular among spectators.">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">It was unpopular among spectators.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. It caused injuries.">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">It caused injuries.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="H" data-text="H. No one ring it liked it at first.">
                                                                                        <span class="dnd-label">H.</span>
                                                                                        <span class="dnd-text">No one ring it liked it at first.</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13841-cambridge-ielts-17-academic-listening-4-audio-3.mp3', 'JEANNE: Hi Thomas, how are you enjoying the course so far?
THOMAS: Yeah, I think it’s good.
JEANNE: Remind me – why did you decide to study sports science? Didn’t you want to be a professional athlete when you were at school?
THOMAS: Yeah – that was my goal, and all my classmates assumed I would achieve it; they thought I was brilliant.
JEANNE: That must have been a nice feeling.
THOMAS: Mm, I thought I could win anything. There was no one who could run faster than me.
JEANNE: Exactly – so what happened? Did your mum and dad want you to be more ‘academic’?
THOMAS: Not at all. Perhaps they should have pushed me harder, though.
JEANNE: What do you mean?
THOMAS: I think I should have practised more.
JEANNE: What makes you say that?
THOMAS: Well, I went out to Kenya for a couple of weeks to train …
JEANNE: Really! I didn’t know that.
THOMAS: I was chosen to go there out of loads of kids and run with some of the top teenage athletes in the world. And … I was so calm about it. I just kept thinking how fortunate I was. What a great chance this was! Everyone back home was so proud of me. But once we started competing, I very quickly realised I wasn’t good enough.
JEANNE: That must have been a huge shock.
THOMAS: I thought ‘this can’t be happening’! I was used to winning.
JEANNE: I’m sorry to hear that.
THOMAS: It’s OK. I’m over it now and I think it’s much better to do a university course and this one has such a variety of sports-related areas. It’s going to be good.
JEANNE: Oh, I agree – I chose it because of that.
——————————
THOMAS: So Jeanne – have you thought of any ideas for the discussion session next week on technology and sport?
JEANNE: We have to cover more than one sport, don’t we?
THOMAS: Yeah.
JEANNE: You know – we always think technology is about the future, but we could gather some ideas about past developments in sport.
THOMAS: Look at early types of equipment perhaps? Uh, I remember reading something about table tennis bats once – how they ended up being covered with pimpled rubber.
JEANNE: Cos they were just wooden at first, I’d imagine.
THOMAS: Yeah. In about the 1920s, a factory was making rolls of the rubber in bulk for something like horse harnesses.
JEANNE: Really!
THOMAS: Yeah – and someone realised that it’d make a perfect covering for the wooden bats.
JEANNE: So what about cricket – that’s had a few innovative changes. Maybe the pads they were on their legs?
THOMAS: I don’t think they’ve changed much but, I’m just looking on the internet … and it says that when the first cricket helmet came in, in 1978, the Australian batsman who first wore it was booed and jeered by people watching because it was so ugly!
JEANNE: Wow, players have to protect themselves from getting hurt! I mean everyone wears one now.
THOMAS: Mm, unlike the cycle helmet.
JEANNE: Well, unless you’re a professional, but you’re right, many ordinary bikers don’t wear a helmet.
THOMAS: Hey, look at these pictures of original helmet designs. This one looks like an upside-down bowl!
JEANNE: Yet, the woman’s laughing – she’s so proud to be wearing it!
THOMAS: It says serious cyclists ended up with wet hair from all the hard exercise.
JEANNE: I guess that’s why they have large air vents in them now so that the skin can breathe more easily.
THOMAS: OK, so we’ve done helmets. What about golf balls or better still golf clubs – they’ve changed a lot.
JEANNE: Yeah – I remember my great grandfather telling me that because a club was made entirely of wood, it would easily break and players had to get another.
THOMAS: There’s no wood at all in them now, is there?
JEANNE: No – they’re much more powerful.
THOMAS: The same must be true of hockey sticks.
JEANNE: I don’t think so because players still use wooden sticks today. What it does say here, though, is that when the game started you had to produce a stick yourself.
THOMAS: I guess they just weren’t being manufactured. So, one more perhaps. What about football?
JEANNE: Well, I know the first balls were made of animal skin.
THOMAS: Yeah, they covered them with pieces of leather that were stitched together, but … the balls let in water when it rained.
JEANNE: Oh, that would have made them much heavier.
THOMAS: That’s right. You can imagine the damage to player’s necks when the ball was headed.
JEANNE: How painful that must have been!
THOMAS: Yeah, well, I think we can put together some useful ideas …', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(170421, 17043, 'multiple_choice', 'Question 21', '["A", "B", "C", "D", "E"]'::jsonb, 'C / E', 1, 21),
(170422, 17043, 'multiple_choice', 'Which&nbsp; TWO &nbsp;points do Thomas and Jeanne make about Thomas&rsquo;s sporting activities at school?', '["A", "B", "C", "D", "E"]'::jsonb, 'C / E', 1, 22),
(170423, 17043, 'multiple_choice', 'Question 23', '["A", "B", "C", "D", "E"]'::jsonb, 'A / D', 1, 23),
(170424, 17043, 'multiple_choice', 'Which&nbsp; TWO &nbsp;feelings did Thomas experience when he was in Kenya?', '["A", "B", "C", "D", "E"]'::jsonb, 'A / D', 1, 24),
(170425, 17043, 'single_choice', 'Question 25', '["A", "B", "C"]'::jsonb, 'B', 1, 25),
(170426, 17043, 'single_choice', 'Question 26', '["A", "B", "C"]'::jsonb, 'F', 1, 26),
(170427, 17043, 'single_choice', 'Question 27', '["A", "B", "C"]'::jsonb, 'A', 1, 27),
(170428, 17043, 'single_choice', 'Question 28', '["A", "B", "C"]'::jsonb, 'D', 1, 28),
(170429, 17043, 'single_choice', 'Question 29', '["A", "B", "C"]'::jsonb, 'C', 1, 29),
(170430, 17043, 'single_choice', 'Question 30', '["A", "B", "C"]'::jsonb, 'G', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(17044, 1704, 'listening', 'Listening Part 4: Maple syrup', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p><em>Complete the notes below.</em></p>
<p><em>Write <strong>ONE WORD ONLY</strong> for each answer.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Maple syrup</strong></strong></p>
<p><strong>What is maple syrup?</strong></p>
<ul>
<li>made from the sap of the maple tree</li>
<li>added to food or used in cooking</li>
<li>colour described as <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>very <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> compared to refined sugar</li>
</ul>
<p><strong>The maple tree</strong></p>
<ul>
<li>has many species</li>
<li>needs sunny days and cool nights</li>
<li>maple leaf has been on the Canadian flag since 1964</li>
<li>needs moist soil but does not need fertiliser as well</li>
<li>best growing conditions and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span> are in Canada and North America</li>
</ul>
<p><strong>Early maple sugar producers</strong></p>
<ul>
<li>made holes in the tree trunks</li>
<li>used hot <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> to heat the sap</li>
<li>used tree bark to make containers for collection</li>
<li>sweetened food and drink with sugar</li>
</ul>
<p><strong>Today’s maple syrup</strong></p>
<p><em>The trees</em></p>
<ul>
<li>Tree trunks may not have the correct <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span> until they have been growing for 40 years.</li>
<li>The changing temperature and movement of water within the tree produces the sap.</li>
</ul>
<p><em>The production</em></p>
<ul>
<li>A tap drilled into the trunk and a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> carries the sap into a bucket.</li>
<li>Large pans of sap called evaporators are heated by means of a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>A lot of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> is produced during the evaporation process.</li>
<li>‘Sugar sand’ is removed because it makes the syrup look <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span> and affects the taste.</li>
<li>The syrup is ready for use.</li>
<li>A huge quantity of sap is needed to make a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span> of maple syrup.</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13840-cambridge-ielts-17-academic-listening-4-audio-4.mp3', 'Hello everyone. Today we’re going to look at another natural food product and that’s maple syrup. What is this exactly? Well, maple syrup looks rather like clear honey, but it’s not made by bees; it’s produced from the plant fluid – or sap – inside the maple tree and that makes maple syrup a very natural product. Maple syrup is a thick, golden, sweet-tasting liquid that can be bought in bottles or jars and poured onto food such as waffles and ice cream or used in the baking of cakes and pastries. It contains no preservatives or added ingredients, and it provides a healthy alternative to refined sugar.
Let’s just talk a bit about the maple tree itself, which is where maple syrup comes from. So, there are many species of maple tree, and they’ll grow without fertilizer in areas where there’s plenty of moisture in the soil. However, they’ll only do this if another important criterion is fulfilled, which is that they must have full or partial sun exposure during the day and very cool nights – and I’ll talk more about that in a minute. There are only certain parts of the world that provide all these conditions: one is Canada, and by that, I mean all parts of Canada, and the other is the north-eastern states of North America. In these areas, the climate suits the trees perfectly. In fact, Canada produces over two-thirds of the world’s maple syrup, which is why the five-pointed maple leaf is a Canadian symbol and has features on the flag since 1964.
So how did maple syrup production begin? Well, long before Europeans settled in these parts of the world, the indigenous communities had started producing maple sugar. They bored holes in the trunks of maple trees and used containers made of tree bark to collect the liquid sap as it poured out. As they were unable to keep the liquid for any length of time – they didn’t have storage facilities in those days – they boiled the liquid by placing pieces of rock that had become scorching hot from the sun into the sap. They did this until it turned into sugar, and they were then able to use this to sweeten their food and drinks. Since that time, improvements have been made to the process, but it has changed very little overall.
———————————
So let’s look at the production of maple syrup today. Clearly, the maple forests are a valuable resource in many Canadian and North American communities. The trees have to be well looked after and they cannot be used to make syrup until the trunks reach a diameter of around 25 centimetres. This can take anything up to 40 years. As I’ve already mentioned, maple trees need the right conditions to grow and also to produce sap. Why is this? Well, what happens is that during a cold night, the tree absorbs water from the soil, and that rises through the tree’s vascular system. But then in the warmer daytime, the change in temperature causes the water to be pushed back down to the bottom of the tree. This continual movement – up and down – leads to the formation of the sap needed for maple syrup production.
When the tree is ready, it can be tapped and this involves drilling a small hole into the trunk and inserting a tube into it that ends in a bucket. The trees can often take several taps, though the workers take care not to cause any damage to the healthy growth of the tree itself. The sap that comes out of the trees consists of 98 percent water and 2 percent sugar and other nutrients. It has to be boiled so that much of that water evaporates, and this process has to take place immediately, using what are called evaporators. These are basically extremely large pans – the sap is poured into these, a fire is built and the pans are then heated until the sap boils. As it does this, the water evaporates, and the syrup begins to form. The evaporation process creates large quantities of steam, and the sap becomes thicker and denser, and, at just the right moment, when the sap is thick enough to be called maple syrup, the worker removes it from the heat. After this process, something called ‘sugar sand’ has to be filtered out as this builds up during the boiling and gives the syrup a cloudy appearance and a slightly gritty taste. Once this has been done, the syrup is ready to be packaged so that it can be used for a whole variety of products. It takes 40 litres of sap to produce one litre of maple syrup so you can get an idea of how much is needed!
So that’s the basic process. In places like Quebec where …', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(170431, 17044, 'text_input', 'Maple syrup   
  What is maple syrup?  
 
 made from the sap of the maple tree 
 added to food or used in cooking 
 colour described as  <strong', '[]'::jsonb, 'golden', 1, 31),
(170432, 17044, 'text_input', 'ielts-listening-question-item"> 31     
 very  <strong', '[]'::jsonb, 'healthy', 1, 32),
(170433, 17044, 'text_input', 'correct="off" autocapitalize="off">  compared to refined sugar 
 
  The maple tree  
 
 has many species 
 needs sunny days and cool nights 
 maple leaf has been on the Canadian flag since 1964 
 needs moist soil but does not need fertiliser as well 
 best growing conditions and  <strong', '[]'::jsonb, 'climate', 1, 33),
(170434, 17044, 'text_input', 'type="text" name="ielts_listening_answer_13836_3" id="ielts_listening_answer_13836_3" aria-label="Question 33" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  are in Canada and North America 
 
  Early maple sugar producers  
 
 made holes in the tree trunks 
 used hot  <strong', '[]'::jsonb, 'rock / rocks', 1, 34),
(170435, 17044, 'text_input', 'el="Question 34" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  to heat the sap 
 used tree bark to make containers for collection 
 sweetened food and drink with sugar 
 
  Today’s maple syrup  
  The trees  
 
 Tree trunks may not have the correct  <strong', '[]'::jsonb, 'diameter', 1, 35),
(170436, 17044, 'text_input', 'The production  
 
 A tap drilled into the trunk and a  <strong', '[]'::jsonb, 'tube', 1, 36),
(170437, 17044, 'text_input', 'Large pans of sap called evaporators are heated by means of a  <strong', '[]'::jsonb, 'fire', 1, 37),
(170438, 17044, 'text_input', 'A lot of  <strong', '[]'::jsonb, 'steam', 1, 38),
(170439, 17044, 'text_input', '‘Sugar sand’ is removed because it makes the syrup look  <strong', '[]'::jsonb, 'cloudy', 1, 39),
(170440, 17044, 'text_input', 'A huge quantity of sap is needed to make a  <strong', '[]'::jsonb, 'litre / liter', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
