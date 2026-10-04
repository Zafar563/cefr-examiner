-- Cambridge IELTS 17 Academic Listening Test 2
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1702, 'Cambridge IELTS 17 Academic Listening Test 2', 'Rasmiy Cambridge IELTS 17 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(17021, 1702, 'listening', 'Listening Part 1: Opportunities for voluntary work in Southoe village', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-7                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p><em>Complete the notes below.</em></p>
<p><em>Write <strong>ONE WORD ONLY</strong> for each answer.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Opportunities for voluntary work in Southoe village</strong></strong></p>
<p><strong>Library</strong></p>
<ul>
<li>Help with <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span> books (times to be arranged)</li>
<li>Help needed to keep <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span> of books up to date</li>
<li>Library is in the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span> Room in the village hall</li>
</ul>
<p><strong>Lunch club</strong></p>
<ul>
<li>Help by providing <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>Help with hobbies such as <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Help for individuals needed next week</strong></p>
<ul>
<li>Taking Mrs Carroll to <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>Work in the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span> at Mr Selsbury’s house</li>
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
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 8-10                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Complete the table below.</em></p>
<p><em>Write <strong>ONE WORD ONLY</strong> for each answer.</em></p>
<table>
<tbody>
<tr>
<td colspan="4" width="515">
<p class="ielts-listening-transcript-subhead"><strong><strong>Village social events</strong></strong></p>
</td>
</tr>
<tr>
<td width="64"><strong>Date</strong></td>
<td width="147"><strong>Event</strong></td>
<td width="120"><strong>Location</strong></td>
<td width="184"><strong>Help needed</strong></td>
</tr>
<tr>
<td width="64">19 Oct</td>
<td width="147"><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span></td>
<td width="120">Village hall</td>
<td width="184">providing refreshments</td>
</tr>
<tr>
<td width="64">18 Nov</td>
<td width="147">dance</td>
<td width="120">Village hall</td>
<td width="184">checking <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span></td>
</tr>
<tr>
<td width="64">31 Dec</td>
<td width="147">New Year’s Eve party</td>
<td width="120">Mountfort Hotel</td>
<td width="184">designing the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span></td>
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
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13590-cambridge-ielts-17-academic-listening-2-audio-1.mp3', 'JANE: Hello, Jane Fairbanks speaking.
FRANK: Oh, good morning. My name’s Frank Pritchard. I’ve just retired and moved to Southoe. I’d like to become a volunteer, and I gather you co-ordinate voluntary work in the village.
JANE: That’s right.
FRANK: What sort of thing could I do?
JANE: Well, we need help with the village library. We borrow books from the town library, and individuals also donate them. So, one thing you could do is get involved in collecting them – if you’ve got a car, that is.
FRANK: Yes, that’s no problem.
JANE: The times are pretty flexible so we can arrange it to suit you. Another thing is the records that we keep of the books we’re given, and those we borrow and need to return to the town library. It would be very useful to have another person to help keep them up to date.
FRANK: Right. I’m used to working on a computer – I presume they’re computerised?
JANE: Oh yes.
FRANK: Is the library purpose-built? I haven’t noticed it when I’ve walked round the village.
JANE: No, we simply have the use of a room in the village hall, the West Room. It’s on the left as you go in.
FRANK: I must go and have a look inside the hall.
JANE: Yes, it’s a nice building.
FRANK: Do you run a lunch club in the village for elderly people? I know a lot of places do.
JANE: Yes, we have a very successful club.
FRANK: I could help with transport, if that’s of any use.
JANE: Ooo definitely. People come to the club from neighbouring villages, and we’re always in need of more drivers.
FRANK: And does the club have groups that focus on a particular hobby, too? I could get involved in one or two, particularly if there are any art groups.
JANE: Excellent. I’ll find out where we need help and get back to you.
FRANK: Fine. What about help for individual residents. Do you arrange that at all?
JANE: Yes, we do it as a one-off. In fact, there’s Mrs Carroll. She needs a lift to the hospital next week, and we’re struggling to find someone.
FRANK: When’s her appointment?
JANE: On Tuesday. It would take the whole morning.
FRANK: I could do that.
JANE: Oh, that would be great. Thank you. And also, next week, we’re arranging to have some work done to Mr Selsbury’s house before he moves, as he isn’t healthy enough to do it himself. We’re got some people to decorate his kitchen, but if you could do some weeding in his garden, that would be wonderful.
FRANK: OK. I’d enjoy that. And presumably the day and time are flexible.
JANE: Oh yes. Just say when would suit you best, and we’ll let Mr Selsbury know.
FRANK: Good.
—————————
JANE: The volunteers group also organises monthly social events, which is a great way to meet other people, of course.
FRANK: Uhuh.
JANE: So next month, on the 19th of October, we’re holding a quiz – a couple of residents are great at planning unusual ones, and we always fill the village hall.
FRANK: That sounds like fun. Can I do anything to help?
JANE: Well, because of the summer of people, we need plenty of refreshments for halfway through. So, if you could provide any, we’d be grateful.
FRANK: I’m sure I could. I’ll think about what to make, and let you know.
JANE: Thank you. Then on November the 18th, we’re holding a dance, also in the village hall. We’ve booked a band that specialises in music of the 1930s – they’ve been before, and we’ve had a lot of requests to bring them back.
FRANK: I’m not really a dancer, but I’d like to do something to help.
JANE: Well, we sell tickets in advance, and having an extra person to check them at the door, as people arrive, would be good – it can be quite a bottleneck if everyone arrives at once!
FRANK: OK, I’m happy with that.
JANE: We’re also arranging a New Year’s Eve party. We’re expecting that to be a really big event, so instead of the village hall, it’ll be held in the Mountfort Hotel.
FRANK: The …?
JANE: Mountfort. M-O-U-N-T-F-O-R-T Hotel. It isn’t in Southoe itself, but it’s only a couple of miles away. The hotel will be providing dinner and we’ve booked a band. The one thing we haven’t got yet is a poster. That isn’t something you could do, by any chance, is it?
FRANK: Well actually, yes. Before I retired I was a graphic designer, so that’s right up my street.
JANE: Oh perfect! I’ll give you the details, and then perhaps you could send me a draft …
FRANK: Of course.', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(170201, 17021, 'text_input', 'Opportunities for voluntary work in Southoe village   
  Library  
 
 Help with  <strong', '[]'::jsonb, 'collecting', 1, 1),
(170202, 17021, 'text_input', '="ielts-listening-question-number-1" class="ielts-listening-question-number">1     books (times to be arranged) 
 Help needed to keep  <strong', '[]'::jsonb, 'records', 1, 2),
(170203, 17021, 'text_input', '> 2     of books up to date 
 Library is in the  <strong', '[]'::jsonb, 'West', 1, 3),
(170204, 17021, 'text_input', 'ss="ielts-listening-question-number">3     Room in the village hall 
 
  Lunch club  
 
 Help by providing  <strong', '[]'::jsonb, 'transport', 1, 4),
(170205, 17021, 'text_input', 'estion-item"> 4     
 Help with hobbies such as  <strong', '[]'::jsonb, 'art', 1, 5),
(170206, 17021, 'text_input', 'lts-listening-question-number">5     
 
  Help for individuals needed next week  
 
 Taking Mrs Carroll to  <strong', '[]'::jsonb, 'hospital', 1, 6),
(170207, 17021, 'text_input', 's-listening-question-item"> 6     
 Work in the  <strong', '[]'::jsonb, 'garden', 1, 7),
(170208, 17021, 'text_input', 'lts-listening-transcript-subhead">  Village social events   
 
 
 
  Date  
  Event  
  Location  
  Help needed  
 
 
 19 Oct 
  <strong', '[]'::jsonb, 'quiz', 1, 8),
(170209, 17021, 'text_input', 'ielts_listening_answer_13543_1" aria-label="Question 8" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  
 Village hall 
 providing refreshments 
 
 
 18 Nov 
 dance 
 Village hall 
 checking  <strong', '[]'::jsonb, 'tickets', 1, 9),
(170210, 17021, 'text_input', 'type="text" name="ielts_listening_answer_13543_2" id="ielts_listening_answer_13543_2" aria-label="Question 9" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  
 
 
 31 Dec 
 New Year’s Eve party 
 Mountfort Hotel 
 designing the  <strong', '[]'::jsonb, 'poster', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(17022, 1702, 'listening', 'Listening Part 2: Oniton Hall', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-14                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Oniton Hall</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="11"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong><span class="ielts-q-title"><span>Many past owners made changes to</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="A"><span class="ielts-radio-text"><strong>A</strong> the gardens.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="B"><span class="ielts-radio-text"><strong>B</strong> the house.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="C"><span class="ielts-radio-text"><strong>C</strong> the farm.</span></label></div></div><div class="ielts-standalone-q" data-qnum="12"><div class="ielts-q-header"><strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>Sir Edward Downes built Oniton Hall because he wanted</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="A"><span class="ielts-radio-text"><strong>A</strong> a place for discussing politics.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="B"><span class="ielts-radio-text"><strong>B</strong> a place to display his wealth.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="C"><span class="ielts-radio-text"><strong>C</strong> a place for artists and writers.</span></label></div></div><div class="ielts-standalone-q" data-qnum="13"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong><span class="ielts-q-title"><span>Visitors can learn about the work of servants in the past from</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="A"><span class="ielts-radio-text"><strong>A</strong> audio guides.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="B"><span class="ielts-radio-text"><strong>B</strong> photographs.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="C"><span class="ielts-radio-text"><strong>C</strong> people in costume.</span></label></div></div><div class="ielts-standalone-q" data-qnum="14"><div class="ielts-q-header"><strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>What is new for children at Onion Hall?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="A"><span class="ielts-radio-text"><strong>A</strong> clothes for dressing up</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="B"><span class="ielts-radio-text"><strong>B</strong> mini tractors</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="C"><span class="ielts-radio-text"><strong>C</strong> the adventure playground</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 15-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Which activity is offered at each of the following locations on the farm?</p>
<p><em>Choose <strong>SIX</strong> answers from the box and write the correct letter, <strong>A-H</strong>, next to Questions.</em></p>
<p><strong>Activities</strong></p>
<p><strong>Locations on the farm</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>dairy</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">15</strong><select data-qnum="15" name="question_15" class="ielts-inline-select"><option value="">[ 15 ] Tanlang...</option><option value="A. shopping">A. shopping</option><option value="B. watching cows being milked">B. watching cows being milked</option><option value="C. seeing old farming equipment">C. seeing old farming equipment</option><option value="D. eating and drinking">D. eating and drinking</option><option value="E. starting a trip">E. starting a trip</option><option value="F. seeing rare breeds of animals">F. seeing rare breeds of animals</option><option value="G. helping to look after animals">G. helping to look after animals</option><option value="H. using farming tools">H. using farming tools</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>large barn</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">16</strong><select data-qnum="16" name="question_16" class="ielts-inline-select"><option value="">[ 16 ] Tanlang...</option><option value="A. shopping">A. shopping</option><option value="B. watching cows being milked">B. watching cows being milked</option><option value="C. seeing old farming equipment">C. seeing old farming equipment</option><option value="D. eating and drinking">D. eating and drinking</option><option value="E. starting a trip">E. starting a trip</option><option value="F. seeing rare breeds of animals">F. seeing rare breeds of animals</option><option value="G. helping to look after animals">G. helping to look after animals</option><option value="H. using farming tools">H. using farming tools</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>small barn</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">17</strong><select data-qnum="17" name="question_17" class="ielts-inline-select"><option value="">[ 17 ] Tanlang...</option><option value="A. shopping">A. shopping</option><option value="B. watching cows being milked">B. watching cows being milked</option><option value="C. seeing old farming equipment">C. seeing old farming equipment</option><option value="D. eating and drinking">D. eating and drinking</option><option value="E. starting a trip">E. starting a trip</option><option value="F. seeing rare breeds of animals">F. seeing rare breeds of animals</option><option value="G. helping to look after animals">G. helping to look after animals</option><option value="H. using farming tools">H. using farming tools</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>stables</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">18</strong><select data-qnum="18" name="question_18" class="ielts-inline-select"><option value="">[ 18 ] Tanlang...</option><option value="A. shopping">A. shopping</option><option value="B. watching cows being milked">B. watching cows being milked</option><option value="C. seeing old farming equipment">C. seeing old farming equipment</option><option value="D. eating and drinking">D. eating and drinking</option><option value="E. starting a trip">E. starting a trip</option><option value="F. seeing rare breeds of animals">F. seeing rare breeds of animals</option><option value="G. helping to look after animals">G. helping to look after animals</option><option value="H. using farming tools">H. using farming tools</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>shed</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">19</strong><select data-qnum="19" name="question_19" class="ielts-inline-select"><option value="">[ 19 ] Tanlang...</option><option value="A. shopping">A. shopping</option><option value="B. watching cows being milked">B. watching cows being milked</option><option value="C. seeing old farming equipment">C. seeing old farming equipment</option><option value="D. eating and drinking">D. eating and drinking</option><option value="E. starting a trip">E. starting a trip</option><option value="F. seeing rare breeds of animals">F. seeing rare breeds of animals</option><option value="G. helping to look after animals">G. helping to look after animals</option><option value="H. using farming tools">H. using farming tools</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>parkland</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">20</strong><select data-qnum="20" name="question_20" class="ielts-inline-select"><option value="">[ 20 ] Tanlang...</option><option value="A. shopping">A. shopping</option><option value="B. watching cows being milked">B. watching cows being milked</option><option value="C. seeing old farming equipment">C. seeing old farming equipment</option><option value="D. eating and drinking">D. eating and drinking</option><option value="E. starting a trip">E. starting a trip</option><option value="F. seeing rare breeds of animals">F. seeing rare breeds of animals</option><option value="G. helping to look after animals">G. helping to look after animals</option><option value="H. using farming tools">H. using farming tools</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="13550">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. shopping">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">shopping</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. watching cows being milked">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">watching cows being milked</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. seeing old farming equipment">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">seeing old farming equipment</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. eating and drinking">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">eating and drinking</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. starting a trip">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">starting a trip</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. seeing rare breeds of animals">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">seeing rare breeds of animals</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. helping to look after animals">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">helping to look after animals</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="H" data-text="H. using farming tools">
                                                                                        <span class="dnd-label">H.</span>
                                                                                        <span class="dnd-text">using farming tools</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13589-cambridge-ielts-17-academic-listening-2-audio-2.mp3', 'Good morning, and welcome to Oniton Hall, one of the largest estates in the area. My name’s Nick, and I’m one of the guides. I’ll give you a brief introduction to the estate while you’re sitting down, and then we’ll walk round.
The estate consists of the house, gardens, parkland and farm, and it dates back to the fourteenth century. The original house was replaced in the late seventeenth century, and of course it has had a large number of owners. Almost all of them have left their mark, generally by adding new rooms, like the ballroom and conservatory, or by demolishing others. The farm looks much as it’s always done, although the current owner has done a great deal of work to the flower beds.
In the seventeenth century, the estate was owned by a very wealthy man called Sir Edward Downes. His intention was to escape from the world of politics, after years as an active politician, and to build a new house worthy of his big collection of books, paintings and sculptures. He broke off contact with his former political allies, and hosted meeting of creative and literary people, like painters and poets. Unusually for his time, he didn’t care whether his guests were rich or poor, as long as they had talent.
——————————
Big houses like Oniton had dozens of servants until the 1920s or 30s, and we’ve tried to show what their working lives were like. Photographs of course don’t give much of an idea, so instead, as you go round the house, you’ll see volunteers dressed up as nineteenth-century servants, going about their work. They’ll explain what they’re doing, and tell you their recipes, or what tools they’re using. We’ve just introduced this feature to replace the audio guide we used to have available.
I see there are a number of children here with you today. Well, we have several activities specially for children, like dressing up in the sorts of clothes that children wore in the past, and as it’s a fine day, some of you will probably want to play in the adventure playground. Our latest addition is child-sized tractors, that you can drive around the grounds.
————————
We’ll also be going into the farm that’s part of the estate, where there’s plenty to do. Most of the buildings date from the eighteenth century, so you can really step back into an agricultural past.
Until recently, the dairy was where milk from the cows was turned into cheese. It’s now the place to go for lunch, or afternoon tea, or just a cup of coffee and a slice of homemade cake.
The big stone building that dominates the farm is the large barn, and in here is our collection of agricultural tools. These were used in the past to plough the earth, sow seeds, make gates, and much more.
There’s a small barn, also made of stone, where you can groom the donkeys and horses, to keep their coats clean. They really seem to enjoy having it done, and children love grooming them.
The horses no longer live in the stables, which instead is the place to go to buy gifts, books, our own jams and pickles, and clothes and blankets made of wool from our sheep.
Outside the shed, which is the only brick building, you can climb into a horse-drawn carriage for a lovely, relaxing tour of the park and farm. The carriages are well over a hundred years old.
And finally, the parkland, which was laid out in the eighteenth century, with a lake and trees that are now well established. You’ll see types of cattle and sheep that are hardly ever found on farms these days. We’re helping to preserve them, to stop their numbers falling further.
OK, well if you’d like to come with me …', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(170211, 17022, 'single_choice', 'Many past owners made changes to', '["A", "B", "C"]'::jsonb, 'B', 1, 11),
(170212, 17022, 'single_choice', 'Sir Edward Downes built Oniton Hall because he wanted', '["A", "B", "C"]'::jsonb, 'C', 1, 12),
(170213, 17022, 'single_choice', 'Visitors can learn about the work of servants in the past from', '["A", "B", "C"]'::jsonb, 'C', 1, 13),
(170214, 17022, 'single_choice', 'What is new for children at Onion Hall?', '["A", "B", "C"]'::jsonb, 'B', 1, 14),
(170215, 17022, 'single_choice', 'Question 15', '["A", "B", "C"]'::jsonb, 'D', 1, 15),
(170216, 17022, 'single_choice', 'Question 16', '["A", "B", "C"]'::jsonb, 'C', 1, 16),
(170217, 17022, 'single_choice', 'Question 17', '["A", "B", "C"]'::jsonb, 'G', 1, 17),
(170218, 17022, 'single_choice', 'Question 18', '["A", "B", "C"]'::jsonb, 'A', 1, 18),
(170219, 17022, 'single_choice', 'Question 19', '["A", "B", "C"]'::jsonb, 'E', 1, 19),
(170220, 17022, 'single_choice', 'Question 20', '["A", "B", "C"]'::jsonb, 'F', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(17023, 1702, 'listening', 'Listening Part 3', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-22                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="21,22"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong> <strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>Which  things do the students agree they need to include in their review of <em>Romeo and Juliet</em>?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> analysis of the text</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> a summary of the plot</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> a description of the theatre</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> a personal reaction</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> a reference to particular scenes</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 23-27                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Which opinion do the speakers give about each of the following aspects of The Emporium’s production of <em>Romeo and Juliet</em>?</p>
<p><em>Choose <strong>FIVE</strong> answers from the box and write the correct letter, <strong>A-G</strong>, next to Questions</em></p>
<p><strong>Opinions</strong></p>
<p><strong>Aspects of the production</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>the set</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">23</strong><select data-qnum="23" name="question_23" class="ielts-inline-select"><option value="">[ 23 ] Tanlang...</option><option value="A. They both expected this to be more traditional.">A. They both expected this to be more traditional.</option><option value="B. They both thought this was original.">B. They both thought this was original.</option><option value="C. They agree this created the right atmosphere.">C. They agree this created the right atmosphere.</option><option value="D. They agree this was a major strength.">D. They agree this was a major strength.</option><option value="E. They were both disappointed by this.">E. They were both disappointed by this.</option><option value="F. They disagree about why this was an issue.">F. They disagree about why this was an issue.</option><option value="G. They disagree about how this could be improved.">G. They disagree about how this could be improved.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>the lighting</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">24</strong><select data-qnum="24" name="question_24" class="ielts-inline-select"><option value="">[ 24 ] Tanlang...</option><option value="A. They both expected this to be more traditional.">A. They both expected this to be more traditional.</option><option value="B. They both thought this was original.">B. They both thought this was original.</option><option value="C. They agree this created the right atmosphere.">C. They agree this created the right atmosphere.</option><option value="D. They agree this was a major strength.">D. They agree this was a major strength.</option><option value="E. They were both disappointed by this.">E. They were both disappointed by this.</option><option value="F. They disagree about why this was an issue.">F. They disagree about why this was an issue.</option><option value="G. They disagree about how this could be improved.">G. They disagree about how this could be improved.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>the costume design</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">25</strong><select data-qnum="25" name="question_25" class="ielts-inline-select"><option value="">[ 25 ] Tanlang...</option><option value="A. They both expected this to be more traditional.">A. They both expected this to be more traditional.</option><option value="B. They both thought this was original.">B. They both thought this was original.</option><option value="C. They agree this created the right atmosphere.">C. They agree this created the right atmosphere.</option><option value="D. They agree this was a major strength.">D. They agree this was a major strength.</option><option value="E. They were both disappointed by this.">E. They were both disappointed by this.</option><option value="F. They disagree about why this was an issue.">F. They disagree about why this was an issue.</option><option value="G. They disagree about how this could be improved.">G. They disagree about how this could be improved.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>the music</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">26</strong><select data-qnum="26" name="question_26" class="ielts-inline-select"><option value="">[ 26 ] Tanlang...</option><option value="A. They both expected this to be more traditional.">A. They both expected this to be more traditional.</option><option value="B. They both thought this was original.">B. They both thought this was original.</option><option value="C. They agree this created the right atmosphere.">C. They agree this created the right atmosphere.</option><option value="D. They agree this was a major strength.">D. They agree this was a major strength.</option><option value="E. They were both disappointed by this.">E. They were both disappointed by this.</option><option value="F. They disagree about why this was an issue.">F. They disagree about why this was an issue.</option><option value="G. They disagree about how this could be improved.">G. They disagree about how this could be improved.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>the actors’ delivery</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. They both expected this to be more traditional.">A. They both expected this to be more traditional.</option><option value="B. They both thought this was original.">B. They both thought this was original.</option><option value="C. They agree this created the right atmosphere.">C. They agree this created the right atmosphere.</option><option value="D. They agree this was a major strength.">D. They agree this was a major strength.</option><option value="E. They were both disappointed by this.">E. They were both disappointed by this.</option><option value="F. They disagree about why this was an issue.">F. They disagree about why this was an issue.</option><option value="G. They disagree about how this could be improved.">G. They disagree about how this could be improved.</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="13579">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. They both expected this to be more traditional.">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">They both expected this to be more traditional.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. They both thought this was original.">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">They both thought this was original.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. They agree this created the right atmosphere.">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">They agree this created the right atmosphere.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. They agree this was a major strength.">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">They agree this was a major strength.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. They were both disappointed by this.">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">They were both disappointed by this.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. They disagree about why this was an issue.">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">They disagree about why this was an issue.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. They disagree about how this could be improved.">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">They disagree about how this could be improved.</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 28-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="28"><div class="ielts-q-header"><strong class="ielts-q-badge">28</strong><span class="ielts-q-title"><span>The students think the story of <em>Romeo and Juliet</em> is still relevant for young people today because</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="28" name="question_28" value="A"><span class="ielts-radio-text"><strong>A</strong> it illustrates how easily conflict can start.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="28" name="question_28" value="B"><span class="ielts-radio-text"><strong>B</strong> it deals with problems that families experience.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="28" name="question_28" value="C"><span class="ielts-radio-text"><strong>C</strong> it teaches them about relationships.</span></label></div></div><div class="ielts-standalone-q" data-qnum="29"><div class="ielts-q-header"><strong class="ielts-q-badge">29</strong><span class="ielts-q-title"><span>The students found watching <em>Romeo and Juliet</em> in another language</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="29" name="question_29" value="A"><span class="ielts-radio-text"><strong>A</strong> frustrating.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="29" name="question_29" value="B"><span class="ielts-radio-text"><strong>B</strong> demanding.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="29" name="question_29" value="C"><span class="ielts-radio-text"><strong>C</strong> moving.</span></label></div></div><div class="ielts-standalone-q" data-qnum="30"><div class="ielts-q-header"><strong class="ielts-q-badge">30</strong><span class="ielts-q-title"><span>Why do the students think Shakespeare’s plays have such international appeal?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="30" name="question_30" value="A"><span class="ielts-radio-text"><strong>A</strong> The stories are exciting.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="30" name="question_30" value="B"><span class="ielts-radio-text"><strong>B</strong> There are recognisable characters.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="30" name="question_30" value="C"><span class="ielts-radio-text"><strong>C</strong> They can be interpreted in many ways.</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13588-cambridge-ielts-17-academic-listening-2-audio-3.mp3', 'ED: Did you make notes while you were watching the performances of Romeo and Juliet , Gemma?
GEMMA: Yes, I did. I found it quite hard though. I kept getting too involved in the play.
ED: Me too. I ended up not taking notes. I wrote down my impressions when I got home. Do you mind if I check a few things with you? In case I’ve missed anything. And I’ve also got some questions about our assignment.
GEMMA: No, it’s good to talk things through. I may have missed things too.
ED: OK great. So first of all, I’m not sure how much information we should include in our reviews.
GEMMA: Right. Well, I don’t think we need to describe what happens. Especially as Romeo and Juliet is one of Shakespeare’s most well-known plays.
ED: Yeah, everyone knows the story. In an essay we’d focus on the poetry and Shakespeare’s use of imagery etc., but that isn’t really relevant in a review. We’re supposed to focus on how effective this particular production is.
GEMMA: Mmm. We should say what made it a success or a failure.
ED: And part of that means talking about the emotional impact the performance had on us. I think that’s important.
GEMMA: Yes. And we should definitely mention how well the director handled important bits of the play – like when Romeo climbs onto Juliet’s balcony.
ED: And the fight between Mercutio and Tybalt.
GEMMA: Yes. It would also be interesting to mention the theatre space and how the director used it but I don’t think we’ll have space in 800 words.
ED: No. OK. That all sounds quite straightforward.
—————————
ED: So what about The Emporium Theatre’s production of the play?
GEMMA: I thought some things worked really well but there were some problems too.
ED: Yeah. What about the set, for example?
GEMMA: I think it was visually really stunning. I’d say that was probably the most memorable thing about this production.
ED: You’re right. The set design was really amazing, but actually I have seen similar ideas used in other productions.
GEMMA: What about the lighting? Some of the scenes were so dimly lit it was quite hard to see.
ED: I didn’t dislike it. It helped to change the mood of the quieter scenes.
GEMMA: That’s a good point.
ED: What did you think of the costumes?
GEMMA: I was a bit surprised by the contemporary dress, I must say.
ED: Yeah – I think it worked well, but I had assumed it would be more conventional.
GEMMA: Me too. I liked the music at the beginning and I thought the musicians were brilliant, but I thought they were wasted because the music didn’t have much impact in Acts 2 and 3.
ED: Yes – that was a shame.
GEMMA: One problem with this production was that the actors didn’t deliver the lines that well. They were speaking too fast.
ED: It was a problem I agree, but I thought it was because they weren’t speaking loudly enough – especially at key points in the play.
GEMMA: I actually didn’t have a problem with that.
ED: It’s been an interesting experience watching different versions of Romeo and Juliet , hasn’t it?
GEMMA: Definitely. It’s made me realise how relevant the play still is.
ED: Right. I mean a lot’s changed since Shakespeare’s time, but in many ways nothing’s changed. There are always disagreements and tension between teenagers and their parents.
GEMMA: Yes, that’s something all young people can relate to – more than the violence and the extreme emotions in the play.
ED: How did you find watching it in translation?
GEMMA: Really interesting. I expected to find it more challenging, but I could follow the story pretty well.
ED: I stopped worrying about not being able to understand all the words and focused on the actors’ expressions. The ending was pretty powerful.
GEMMA: Yes. That somehow intensified the emotion for me.
ED: Did you know Shakespeare’s been translated into more languages than any other writer?
GEMMA: What’s the reason for his international appeal, do you think?
ED: I was reading that it’s because his plays are about basic themes that people everywhere are familiar with.
GEMMA: Yeah, and they can also be understood on different levels. The characters have such depth.
ED: Right – which allows directors to experiment and find new angles.
GEMMA: That’s really important because …', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(170221, 17023, 'multiple_choice', 'Question 21', '["A", "B", "C", "D", "E"]'::jsonb, 'D / E', 1, 21),
(170222, 17023, 'multiple_choice', 'Which&nbsp; TWO &nbsp;things do the students agree they need to include in their review of&nbsp; Romeo and Juliet ?', '["A", "B", "C", "D", "E"]'::jsonb, 'D / E', 1, 22),
(170223, 17023, 'single_choice', 'Question 23', '["A", "B", "C"]'::jsonb, 'D', 1, 23),
(170224, 17023, 'single_choice', 'Question 24', '["A", "B", "C"]'::jsonb, 'C', 1, 24),
(170225, 17023, 'single_choice', 'Question 25', '["A", "B", "C"]'::jsonb, 'A', 1, 25),
(170226, 17023, 'single_choice', 'Question 26', '["A", "B", "C"]'::jsonb, 'E', 1, 26),
(170227, 17023, 'single_choice', 'Question 27', '["A", "B", "C", "D", "E", "F", "G"]'::jsonb, 'F', 1, 27),
(170228, 17023, 'single_choice', 'The students think the story of&nbsp; Romeo and Juliet &nbsp;is still relevant for young people today because', '["A", "B", "C"]'::jsonb, 'B', 1, 28),
(170229, 17023, 'single_choice', 'The students found watching&nbsp; Romeo and Juliet &nbsp;in another language', '["A", "B", "C"]'::jsonb, 'C', 1, 29),
(170230, 17023, 'single_choice', 'Why do the students think Shakespeare&rsquo;s plays have such international appeal?', '["A", "B"]'::jsonb, 'C', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(17024, 1702, 'listening', 'Listening Part 4: The impact of digital technology on the Icelandic language', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p><em>Complete the notes below.</em></p>
<p><em>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>The impact of digital technology on the Icelandic language</strong></strong></p>
<p><strong>The Icelandic language</strong></p>
<ul>
<li>has approximately <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span> speakers</li>
<li>has a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> that is still growing</li>
<li>has not changed a lot over the last thousand years</li>
<li>has its own words for computer-based concepts, such as web browser and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span></li>
</ul>
<p><strong>Young speakers</strong></p>
<ul>
<li>are big users of digital technology, such as <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>are becoming <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span> very quickly</li>
<li>are having discussions using only English while they are in the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> at school</li>
<li>are better able to identify the content of a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span> in English than Icelandic</li>
</ul>
<p><strong>Technology and internet companies</strong></p>
<ul>
<li>write very little in Icelandic because of the small number of speakers and because of how complicated its <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> is</li>
</ul>
<p><strong>The Icelandic government</strong></p>
<ul>
<li>has set up a fund to support the production of more digital content in the language</li>
<li>believes that Icelandic has a secure future</li>
<li>is worried that young Icelanders may lose their <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span> as Icelanders</li>
<li>is worried about the consequences of children not being <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span> in either Icelandic or English</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13587-cambridge-ielts-17-academic-listening-2-audio-4.mp3', 'Right, everyone, let’s make a start. Over the past few sessions, we’ve been considering the reasons why some world languages are in decline, and today I’m going to introduce another factor that affects languages, and the speakers of those languages, and that’s technology and, in particular, digital technology. In order to illustrate its effect, I’m going to focus on the Icelandic language, which is spoken by around 321,000 people, most of whom live in Iceland – an island in the North Atlantic Ocean.
The problem for this language is not the number of speakers – even though this number is small. Nor is it about losing words to other languages, such as English. In fact, the vocabulary of Icelandic is continually increasing because when speakers need a new word for something, they tend to create one, rather than borrowing from another language. All this makes Icelandic quite a special language – it’s changed very little in the past millennium, yet it can handle twenty-first-century concepts related to the use of computers and digital technology. Take, for example, the word for web browser … this is vafri in Icelandic, which comes from the verb ‘to wander’. I can’t think of a more appropriate term because that’s exactly what you do mentally when you browse the internet. Then there’s an Icelandic word for podcast – which is too hard to pronounce! And so on.
Icelandic, then, is alive and growing, but – and it’s a big but – young Icelanders spend a great deal of time in the digital world and this world is predominantly English. Think about smartphones. They didn’t even exist until comparatively recently, but today young people use them all the time to read books, watch TV or films, play games, listen to music, and so on. Obviously, this is a good thing in many respects because it promotes their bilingual skills, but the extent of the influence of English in the virtual world is staggering and it’s all happening really fast.
For their parents and grandparents, the change is less concerning because they already have their native-speaker skills in Icelandic. But for young speakers – well, the outcome is a little troubling. For example, teachers have found that playground conversations in Icelandic secondary schools can be conducted entirely in English, while teachers of much younger children have reported situations where their classes find it easier to say what is in a picture using English, rather than Icelandic. The very real and worrying consequence of all this is that the young generation in Iceland is at risk of losing its mother tongue.
—————————
Of course, this is happening to other European languages too, but while internet companies might be willing to offer, say, French options in their systems, it’s much harder for them to justify the expense of doing the same for a language that has a population the size of a French town, such as Nice. The other drawback of Icelandic is the grammar, which is significantly more complex than in most languages. At the moment, the tech giants are simply not interested in tackling this.
So, what is the Icelandic government doing about this? Well, large sums of money are being allocated to a language technology fund that it is hoped will lead to the development of Icelandic sourced apps and other social media and digital systems, but clearly this is going to be an uphill struggle.
On the positive side, they know that Icelandic is still the official language of education and government. It has survived for well over a thousand years and the experts predict that its future in this nation state is sound and will continue to be so. However, there’s no doubt that it’s becoming an inevitable second choice in young people’s lives.
This raises important questions. When you consider how much of the past is tied up in a language, will young Icelanders lose their sense of their own identity? Another issue that concerns the government of Iceland is this. If children are learning two languages through different routes, neither of which they are fully fluent in, will they be able to express themselves properly?', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(170231, 17024, 'text_input', 'The impact of digital technology on the Icelandic language   
  The Icelandic language  
 
 has approximately  <strong', '[]'::jsonb, '321 000 / 321,000 / 321000', 1, 31),
(170232, 17024, 'text_input', 'ening-question-item"> 31     speakers 
 has a  <strong', '[]'::jsonb, 'vocabulary', 1, 32),
(170233, 17024, 'text_input', '" name="ielts_listening_answer_13583_2" id="ielts_listening_answer_13583_2" aria-label="Question 32" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  that is still growing 
 has not changed a lot over the last thousand years 
 has its own words for computer-based concepts, such as web browser and  <strong', '[]'::jsonb, 'podcast', 1, 33),
(170234, 17024, 'text_input', 's-listening-question-number">33     
 
  Young speakers  
 
 are big users of digital technology, such as  <strong', '[]'::jsonb, 'smartphones', 1, 34),
(170235, 17024, 'text_input', 'stening-question-item"> 34     
 are becoming  <strong', '[]'::jsonb, 'bilingual', 1, 35),
(170236, 17024, 'text_input', 'er-35" class="ielts-listening-question-number">35     very quickly 
 are having discussions using only English while they are in the  <strong', '[]'::jsonb, 'playground', 1, 36),
(170237, 17024, 'text_input', 'istening-question-number-36" class="ielts-listening-question-number">36     at school 
 are better able to identify the content of a  <strong', '[]'::jsonb, 'picture', 1, 37),
(170238, 17024, 'text_input', 's_listening_answer_13583_7" aria-label="Question 37" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  in English than Icelandic 
 
  Technology and internet companies  
 
 write very little in Icelandic because of the small number of speakers and because of how complicated its  <strong', '[]'::jsonb, 'grammar', 1, 38),
(170239, 17024, 'text_input', 'llcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  is 
 
  The Icelandic government  
 
 has set up a fund to support the production of more digital content in the language 
 believes that Icelandic has a secure future 
 is worried that young Icelanders may lose their  <strong', '[]'::jsonb, 'identity', 1, 39),
(170240, 17024, 'text_input', 'on-number-39" class="ielts-listening-question-number">39     as Icelanders 
 is worried about the consequences of children not being  <strong', '[]'::jsonb, 'fluent', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
