-- Cambridge IELTS 16 Academic Listening Test 2
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1602, 'Cambridge IELTS 16 Academic Listening Test 2', 'Rasmiy Cambridge IELTS 16 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(16021, 1602, 'listening', 'Listening Part 1: Copying photos to digital format', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-10                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Complete the notes below.</p>
<p>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</p>
<table>
<tbody>
<tr>
<td width="623">
<p class="ielts-listening-transcript-subhead"><strong><strong>Copying photos to digital format</strong></strong></p>
</td>
</tr>
<tr>
<td width="623"><strong>Name of company: Picturerep</strong></td>
</tr>
<tr>
<td width="623"><strong>Requirements</strong></p>
<ul>
<li>Maximum size of photos is 30 cm, minimum size 4 cm.</li>
<li>Photos must not be in a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span> or an album.</li>
</ul>
<p><strong>Cost</strong></p>
<ul>
<li>The cost for 360 photos is £<span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span> (including one disk).</li>
<li>Before the complete order is sent, <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span> is required.</li>
</ul>
<p><strong>Services</strong> <strong>included</strong> <strong>in the price</strong></p>
<ul>
<li>Photos can be placed in a folder, e.g. with the name <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>The <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span> and contrast can be improved if necessary.</li>
<li>Photos which are very fragile will be scanned by <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
</ul>
<p><strong>Special restore service (costs extra)</strong></p>
<ul>
<li>It may be possible to remove an object from a photo, or change the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>A photo which is not correctly in <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span> cannot be fixed.</li>
</ul>
<p><strong>Other</strong> <strong>information</strong></p>
<ul>
<li>Orders are completed within <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>Send the photos in a box (not <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span>).</li>
</ul>
</td>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13211-cambridge-ielts-16-academic-listening-2-audio-1.mp3', 'EMPLOYEE: Hello, Picturerep. Can I help you?
WOMAN: Oh, hi. I saw your advertisement about copying pictures to disk and I’d like a bit more information about what you do.
EMPLOYEE: Sure. What would you like to know?
WOMAN: Well, I’ve got a box full of old family photos that’s been up in the attic for years, some of them must be 50 or 60 years old, and I’d like to get them converted to digital format.
EMPLOYEE: Sure, we can do that for you.
WOMAN: Right. And what about size? The photos are all sorts of sizes – are there any restrictions?
EMPLOYEE: Well the maximum size of photo we can do with our normal services is 30 centimetres. And each picture must be a least 4 centimetres, that’s the minimum we can cope with.
WOMAN: That should be fine. And some of them are in a frame – should I take them out before I send them?
EMPLOYEE: Yes please, we can’t copy them otherwise. And also the photos must all be separate, they mustn’t be stuck into an album.
WOMAN: OK, that’s not a problem. So can you give me an idea of how much this will cost? I’ve got about 360 photos I think.
EMPLOYEE: We charge £195 for 300 to 400 photos for the basic service.
WOMAN: OK. And does that include the disk?
EMPLOYEE: Yes, one disk – but you can get extra ones for £5 each.
WOMAN: That’s good. So do I need to pay when I send you the photos?
EMPLOYEE: No, we won’t need anything until we’ve actually copied the pictures. Then we’ll let you know how much it is, and once we’ve received the payment, we’ll send the parcel off to you.
WOMAN: Right.
—————————
EMPLOYEE: Is there anything else you’d like to ask about our services?
WOMAN: Yes. I’ve roughly sorted out the photos into groups, according to what they’re about – so can you keep them in those groups when you copy them?
EMPLOYEE: Sure. We’ll save each group in a different folder on the disk and if you like, you can suggest a name for each folder.
WOMAN: So I could have one called ‘Grandparents’ for instance?
EMPLOYEE: Exactly.
WOMAN: And do you do anything besides scan the photos? Like, can you make any improvements?
EMPLOYEE: Yes, in the standard service each photo is checked, and we can sometimes touch up the colour a bit, or improve the contrast – that can make a big difference.
WOMAN: OK. And some of the photos are actually quite fragile – they won’t get damaged in the process, will they?
EMPLOYEE: No, if any look particularly fragile, we’d do them by hand. We do realise how precious these old photos can be.
WOMAN: Sure.
EMPLOYEE: And another thing is we can make changes to a photo if you want – so if you want to remove an object from a photo, or maybe alter the background, we can do that.
WOMAN: Really? I might be interested in that. I’ll have a look through the photos and see. Oh, and talking of fixing photos – I’ve got a few that aren’t properly in focus. Can you do anything to make that better?
EMPLOYEE: No, I’m afraid that’s one thing we can’t do.
WOMAN: OK.
EMPLOYEE: Any other information I can give you?
WOMAN: Er … oh, how long will it all take?
EMPLOYEE: We aim to get the copying done in ten days.
WOMAN: Fine. Right, well I’ll get the photos packed up in a box and post them off to you.
EMPLOYEE: Right. If you’ve got a strong cardboard box, that’s best. We’ve found that plastic ones sometimes break in the post.
WOMAN: OK. Right, thanks for your help. Bye.
EMPLOYEE: Bye.', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(160201, 16021, 'text_input', 'Photos must not be in a  <strong', '[]'::jsonb, 'frame', 1, 1),
(160202, 16021, 'text_input', 'Cost  
 
 The cost for 360 photos is £ <strong', '[]'::jsonb, '195', 1, 2),
(160203, 16021, 'text_input', 'Before the complete order is sent,  <strong', '[]'::jsonb, 'payment', 1, 3),
(160204, 16021, 'text_input', 'with the name  <strong', '[]'::jsonb, 'Grandparents', 1, 4),
(160205, 16021, 'text_input', 'The  <strong', '[]'::jsonb, 'colour / color', 1, 5),
(160206, 16021, 'text_input', 'Photos which are very fragile will be scanned by  <strong', '[]'::jsonb, 'hand', 1, 6),
(160207, 16021, 'text_input', 'Special restore service (costs extra)  
 
 It may be possible to remove an object from a photo, or change the  <strong', '[]'::jsonb, 'background', 1, 7),
(160208, 16021, 'text_input', 'A photo which is not correctly in  <strong', '[]'::jsonb, 'focus', 1, 8),
(160209, 16021, 'text_input', 'Other   information  
 
 Orders are completed within  <strong', '[]'::jsonb, 'ten / 10 days', 1, 9),
(160210, 16021, 'text_input', 'Send the photos in a box (not  <strong', '[]'::jsonb, 'plastic', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(16022, 1602, 'listening', 'Listening Part 2: Minster Park', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-15                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Minster Park</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="11"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong><span class="ielts-q-title"><span>Dartfield House school used to be</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="A"><span class="ielts-radio-text"><strong>A</strong> a tourist information centre.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="B"><span class="ielts-radio-text"><strong>B</strong> a private home.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="C"><span class="ielts-radio-text"><strong>C</strong> a local council building.</span></label></div></div><div class="ielts-standalone-q" data-qnum="12"><div class="ielts-q-header"><strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>What is planned with regard to the lower school?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="A"><span class="ielts-radio-text"><strong>A</strong> All buildings on the main site will be improved.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="B"><span class="ielts-radio-text"><strong>B</strong> The lower school site will be used for new homes.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="C"><span class="ielts-radio-text"><strong>C</strong> Additional school buildings will be constructed on the lower school site.</span></label></div></div><div class="ielts-standalone-q" data-qnum="13"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong><span class="ielts-q-title"><span>The catering has been changed because of</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="A"><span class="ielts-radio-text"><strong>A</strong> long queuing times.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="B"><span class="ielts-radio-text"><strong>B</strong> changes to the school timetable.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="C"><span class="ielts-radio-text"><strong>C</strong> dissatisfaction with the menus.</span></label></div></div><div class="ielts-standalone-q" data-qnum="14"><div class="ielts-q-header"><strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>Parents are asked to</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="A"><span class="ielts-radio-text"><strong>A</strong> help their children to decide in advance which serving point to use.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="B"><span class="ielts-radio-text"><strong>B</strong> make sure their children have enough money for food.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="C"><span class="ielts-radio-text"><strong>C</strong> advise their children on healthy food to eat.</span></label></div></div><div class="ielts-standalone-q" data-qnum="15"><div class="ielts-q-header"><strong class="ielts-q-badge">15</strong><span class="ielts-q-title"><span>What does the speaker say about the existing canteen?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="A"><span class="ielts-radio-text"><strong>A</strong> Food will still be served there.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="B"><span class="ielts-radio-text"><strong>B</strong> Only staff will have access to it.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="C"><span class="ielts-radio-text"><strong>C</strong> Pupils can take their food into it.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 16-18                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What comment does the speaker make about each of the following serving points in the Food Hall?</p>
<p><em>Choose <strong>THREE</strong> answers from the box and write the correct letter, <strong>A-D</strong>, next to Questions.</em></p>
<p><strong>Comments</strong></p>
<p><strong>Food available at serving points in Food Hall</strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>World Adventures</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">16</strong><select data-qnum="16" name="question_16" class="ielts-inline-select"><option value="">[ 16 ] Tanlang...</option><option value="A. pupils help to plan menus">A. pupils help to plan menus</option><option value="B. only vegetarian food">B. only vegetarian food</option><option value="C. different food every week">C. different food every week</option><option value="D. daily change in menu">D. daily change in menu</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Street Life</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">17</strong><select data-qnum="17" name="question_17" class="ielts-inline-select"><option value="">[ 17 ] Tanlang...</option><option value="A. pupils help to plan menus">A. pupils help to plan menus</option><option value="B. only vegetarian food">B. only vegetarian food</option><option value="C. different food every week">C. different food every week</option><option value="D. daily change in menu">D. daily change in menu</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <div class="ielts-listening-question-item"> • <span>Speedy Italian</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">18</strong><select data-qnum="18" name="question_18" class="ielts-inline-select"><option value="">[ 18 ] Tanlang...</option><option value="A. pupils help to plan menus">A. pupils help to plan menus</option><option value="B. only vegetarian food">B. only vegetarian food</option><option value="C. different food every week">C. different food every week</option><option value="D. daily change in menu">D. daily change in menu</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="13196">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. pupils help to plan menus">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">pupils help to plan menus</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. only vegetarian food">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">only vegetarian food</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. different food every week">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">different food every week</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. daily change in menu">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">daily change in menu</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
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
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="19,20"><div class="ielts-q-header"><strong class="ielts-q-badge">19</strong> <strong class="ielts-q-badge">20</strong><span class="ielts-q-title"><span>Which  optional after-school lessons are new?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> swimming</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> piano</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> acting</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> cycling</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="19,20" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> theatre sound and lighting</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13210-cambridge-ielts-16-academic-listening-2-audio-2.mp3', 'Good morning and thank you for coming here today. I’d like to bring you up to date with changes in the school that will affect your children.
As you know, the school buildings date from various times: some from the 1970s, some from the last five years, and of course Dartfield House is over a century old. It was commissioned by a businessman. Neville Richards, and intended as his family home, but he died before it was completed. His heir chose to sell it to the local council, who turned it into offices. A later plan to convert it into a tourist information centre didn’t come about, through lack of money, and instead it formed the nucleus of this school when it opened 40 years ago.
The school has grown as the local population has increased, and I can now give you some news about the lower school site, which is separated from the main site by a road. Planning permission has been granted for development of both sites. The lower school will move to new buildings that will be constructed on the main site. Developers will construct houses on the existing lower school site. Work on the new school buildings should start within the next few months.
A more imminent change concerns the catering facilities and the canteen. The canteen is always very busy throughout the lunch period – in fact it’s often full to capacity, because a lot of our pupils like the food that’s on offer there. But there’s only one serving point, so most pupils have to wait a considerable time to be served. This is obviously unsatisfactory, as they may have hardly finished their lunch before afternoon lessons start.
So we’ve had a new Food Hall built, and this will come into use next week. It’ll have several serving areas, and I’ll give you more details about those in a minute, but one thing we ask you to do, to help in the smooth running of the Food Hall, is to discuss with your children each morning which type of food they want to eat that day, so they can go straight to the relevant serving point. There won’t be any junk food – everything on offer will be healthy – and there’s no change to the current system of paying for lunches by topping up your child’s electronic payment card online.
You may be wondering what will happen to the old canteen. We’ll still have tables and chairs in there, and pupils can eat food from the Food Hall or lunch they’ve brought from home. Eventually we may use part of the canteen for storage, but first we’ll see how many pupils go in there at lunchtime.
————————
OK, back to the serving points in the Food Hall, which will all have side dishes, desserts and drinks on sale, as well as main courses.
One serving point we call World Adventures. This will serve a different country’s cuisine each day, maybe Chinese one day and Lebanese the next. The menus will be planned for a week at a time, so pupils will know what’s going to be available the whole of the week.
Street Life is also international, with food from three particular cultures. We’ll ask pupils to make suggestions, so perhaps sometimes there’ll be food from Thailand, Ethiopia and Mexico, and then one of them will be replaced by Jamaican food for a week or two.
The Speedy Italian serving point will cater particularly for the many pupils who don’t eat meat or fish: they can be sure that all the food served there is suitable for them. There’ll be plenty of variety, so they shouldn’t get bored with the food.
OK, that’s all on the new Food Hall. Now after-school lessons. There are very popular with pupils, particularly swimming – in fact there’s a waiting list for lessons. Cycling is another favourite, and I’m delighted that dozens of pupils make use of the chance to learn to ride in off-road conditions. It means that more and more cycle to and from school every day. As you know, we have a well-equipped performance centre, and we’re going to start drama classes in there, too. Pupils will be able to join in just for fun or work up to taking part in a play – we hope to put on at least one a year. We already teach a number of pupils to use the sound and lighting systems in the centre. And a former pupil has given a magnificent grand piano to the school, so a few pupils will be able to learn at the school instead of going to the local college, as many of them do at the moment.', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(160211, 16022, 'single_choice', 'Dartfield House school used to be', '["A", "B", "C"]'::jsonb, 'C', 1, 11),
(160212, 16022, 'single_choice', 'What is planned with regard to the lower school?', '["A", "B", "C"]'::jsonb, 'B', 1, 12),
(160213, 16022, 'single_choice', 'The catering has been changed because of', '["A", "B", "C"]'::jsonb, 'A', 1, 13),
(160214, 16022, 'single_choice', 'Parents are asked to', '["A", "B", "C"]'::jsonb, 'A', 1, 14),
(160215, 16022, 'single_choice', 'What does the speaker say about the existing canteen?', '["A", "B", "C"]'::jsonb, 'C', 1, 15),
(160216, 16022, 'single_choice', 'Question 16', '["A", "B", "C"]'::jsonb, 'D', 1, 16),
(160217, 16022, 'single_choice', 'Question 17', '["A", "B", "C"]'::jsonb, 'A', 1, 17),
(160218, 16022, 'single_choice', 'Question 18', '["A", "B", "C", "D"]'::jsonb, 'B', 1, 18),
(160219, 16022, 'multiple_choice', 'Question 19', '["A", "B"]'::jsonb, 'B / C', 1, 19),
(160220, 16022, 'multiple_choice', 'Which&nbsp; TWO &nbsp;optional after-school lessons are new?', '["A", "B"]'::jsonb, 'B / C', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(16023, 1602, 'listening', 'Listening Part 3: Assignment on sleep and dreams', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-24                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Assignment on sleep and dreams</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="21"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong><span class="ielts-q-title"><span>Luke read that one reason why we often forget dreams is that</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="A"><span class="ielts-radio-text"><strong>A</strong> our memories cannot cope with too much information.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="B"><span class="ielts-radio-text"><strong>B</strong> we might other wise be confused about what is real.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="21" name="question_21" value="C"><span class="ielts-radio-text"><strong>C</strong> we do not think they are important.</span></label></div></div><div class="ielts-standalone-q" data-qnum="22"><div class="ielts-q-header"><strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>What do Luke and Susie agree about dreams predicting the future?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="A"><span class="ielts-radio-text"><strong>A</strong> It may just be due to chance.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="B"><span class="ielts-radio-text"><strong>B</strong> It only happens with certain types of event.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="22" name="question_22" value="C"><span class="ielts-radio-text"><strong>C</strong> It happens more often than some people think.</span></label></div></div><div class="ielts-standalone-q" data-qnum="23"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong><span class="ielts-q-title"><span>Susie says that a study on pre-school children having a short nap in the day</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="A"><span class="ielts-radio-text"><strong>A</strong> had controversial results.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="B"><span class="ielts-radio-text"><strong>B</strong> used faulty researh methodology.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="23" name="question_23" value="C"><span class="ielts-radio-text"><strong>C</strong> failed to reach any clear conclusions.</span></label></div></div><div class="ielts-standalone-q" data-qnum="24"><div class="ielts-q-header"><strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>In their last assignment, both students had problems with</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="A"><span class="ielts-radio-text"><strong>A</strong> statistical analysis.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="B"><span class="ielts-radio-text"><strong>B</strong> making an action plan.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="24" name="question_24" value="C"><span class="ielts-radio-text"><strong>C</strong> self-assessment</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 25-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>Complete the flow chart below.</p>
<p>Write <strong>ONE WORD ONLY</strong> for each answer.</p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Assignment plan</strong></strong></p>
<table class=" aligncenter">
<tbody>
<tr>
<td width="528">Decide on research question:</p>
<p>Is there a relationship between hours of sleep and number of dreams?</td>
</tr>
</tbody>
</table>
<p style="text-align: center">↓</p>
<table class=" aligncenter">
<tbody>
<tr>
<td width="528">Decide on sample:</p>
<p>Twelve students from the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">25</strong><input type="text" data-qnum="25" name="question_25" class="ielts-inline-input" placeholder="[25] javob..." autocomplete="off" spellcheck="false"></span></span> department</td>
</tr>
</tbody>
</table>
<p style="text-align: center">↓</p>
<table class=" aligncenter">
<tbody>
<tr>
<td width="528">Decide on methodology:</p>
<p>Self-reporting</td>
</tr>
</tbody>
</table>
<p style="text-align: center">↓</p>
<table class=" aligncenter">
<tbody>
<tr>
<td width="528">Decide on procedure:</p>
<p>Answers on <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">26</strong><input type="text" data-qnum="26" name="question_26" class="ielts-inline-input" placeholder="[26] javob..." autocomplete="off" spellcheck="false"></span></span></td>
</tr>
</tbody>
</table>
<p style="text-align: center">↓</p>
<table class=" aligncenter">
<tbody>
<tr>
<td width="528">Check ethical guidelines for working with <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">27</strong><input type="text" data-qnum="27" name="question_27" class="ielts-inline-input" placeholder="[27] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>Ensure that risk is assessed and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">28</strong><input type="text" data-qnum="28" name="question_28" class="ielts-inline-input" placeholder="[28] javob..." autocomplete="off" spellcheck="false"></span></span> is kept to a minimum</td>
</tr>
</tbody>
</table>
<p style="text-align: center">↓</p>
<table class=" aligncenter">
<tbody>
<tr>
<td width="528">Analyse the results</p>
<p>Calculate the correlation and make a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">29</strong><input type="text" data-qnum="29" name="question_29" class="ielts-inline-input" placeholder="[29] javob..." autocomplete="off" spellcheck="false"></span></span></td>
</tr>
</tbody>
</table>
<p style="text-align: center">↓</p>
<table>
<tbody>
<tr>
<td width="528">
<p style="text-align: center"><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">30</strong><input type="text" data-qnum="30" name="question_30" class="ielts-inline-input" placeholder="[30] javob..." autocomplete="off" spellcheck="false"></span></span> the research</p>
</td>
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
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13209-cambridge-ielts-16-academic-listening-2-audio-3.mp3', 'SUSIE: So Luke, for our next psychology assignment we have to do something on sleep and dreams.
LUKE: Right. I’ve just read an article suggesting why we tend to forget most of our dreams soon after we wake up. I mean, most of my dreams aren’t that interesting anyway, but what it said was that if we remembered everything, we might get mixed up about what actually happened and what we dreamed. So it’s a sort of protection. I hadn’t heard that idea before. I’d always assumed that it was just that we didn’t have room in our memories for all that stuff.
SUSIE: Me too. What do you think about the idea that our dreams may predict the future?
LUKE: It’s a belief that you get all over the world.
SUSIE: Yeah, lots of people have a story of it happening to them, but the explanation I’ve read is that for each dream that comes true, we have thousands that don’t, but we don’t notice those, we don’t even remember them. We just remember the ones where something in the real world, like a view or an action, happens to trigger a dream memory.
LUKE: Right. So it’s just a coincidence really. Something else I read about is what they call segmented sleeping. That’s a theory that hundreds of years ago, people used to get up in the middle of the night and have a chat or something to eat, then go back to bed. So I tried it myself.
SUSIE: Why?
LUKE: Well it’s meant to make you more creative. I don’t know why. But I gave it up after a week. It just didn’t fit in with my lifestyle.
SUSIE: But most pre-school children have a short sleep in the day don’t they? There was an experiment some students did here last term to see at what age kids should stop having naps. But they didn’t really find an answer. They spent a lot of time working out the most appropriate methodology, but the results didn’t seem to show any obvious patterns.
LUKE: Right. Anyway, let’s think about our assignment. Last time I had problems with the final stage, where we had to describe and justify how successful we thought we’d been. I struggled a bit with the action plan too.
SUSIE: I was OK with the planning, but I got marked down for the self-assessment as well. And I had big problems with the statistical stuff, that’s where I really lost marks.
LUKE: Right.
————————
SUSIE: So shall we plan what we have to do for this assignment?
LUKE: OK.
SUSIE: First, we have to decide on our research question. So how about ‘Is there a relationship between hours of sleep and number of dreams?’
LUKE: OK. Then we need to think about who we’ll do they study on. About 12 people?
SUSIE: Right. And shall we use other psychology students?
LUKE: Let’s use people from a different department. What about history?
SUSIE: Yes, they might have interesting dreams! Or literature students?
LUKE: I don’t really know any.
SUSIE: OK, forget that idea. Then we have to think about our methodology. So we could use observation, but that doesn’t seem appropriate.
LUKE: No. it needs to be self-reporting I think. And we could ask them to answer questions online.
SUSIE: But in this case, paper might be better as they’ll be doing it straight after they wake up … in fact while they’re still half-asleep.
LUKE: Right. And we’ll have to check the ethical guidelines for this sort of research.
SUSIE: Mm, because our experiment involves humans, so there are special regulations.
LUKE: Yes, I had a look at those for another assignment I did. There’s a whole section on risk assessment, and another section on making sure they aren’t put under any unnecessary stress.
SUSIE: Let’s hope they don’t have any bad dreams!
LUKE: Yeah.
SUSIE: Then when we’ve collected all our data we have to analyse it and calculate the correlation between our two variables, that’s time sleeping and number of dreams and then present our results visually in a graph.
LUKE: Right. And the final thing is to think about our research and evaluate it. So that seems quite straightforward.
SUSIE: Yeah. So now let’s …', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(160221, 16023, 'single_choice', 'Luke read that one reason why we often forget dreams is that', '["A", "B", "C"]'::jsonb, 'B', 1, 21),
(160222, 16023, 'single_choice', 'What do Luke and Susie agree about dreams predicting the future?', '["A", "B", "C"]'::jsonb, 'A', 1, 22),
(160223, 16023, 'single_choice', 'Susie says that a study on pre-school children having a short nap in the day', '["A", "B", "C"]'::jsonb, 'C', 1, 23),
(160224, 16023, 'single_choice', 'In their last assignment, both students had problems with', '["A", "B", "C"]'::jsonb, 'C', 1, 24),
(160225, 16023, 'text_input', 'strong> 
 
 
 
 Decide on research question: 
 Is there a relationship between hours of sleep and number of dreams? 
 
 
 
 ↓ 
 
 
 
 Decide on sample: 
 Twelve students from the  <strong', '[]'::jsonb, 'history', 1, 25),
(160226, 16023, 'text_input', '/span> department 
 
 
 
 ↓ 
 
 
 
 Decide on methodology: 
 Self-reporting 
 
 
 
 ↓ 
 
 
 
 Decide on procedure: 
 Answers on  <strong', '[]'::jsonb, 'paper', 1, 26),
(160227, 16023, 'text_input', 'ame="ielts_listening_answer_13202_2" id="ielts_listening_answer_13202_2" aria-label="Question 26" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  
 
 
 
 ↓ 
 
 
 
 Check ethical guidelines for working with  <strong', '[]'::jsonb, 'humans / people', 1, 27),
(160228, 16023, 'text_input', 'tem"> 27     
 Ensure that risk is assessed and  <strong', '[]'::jsonb, 'stress', 1, 28),
(160229, 16023, 'text_input', 'lts_listening_answer_13202_4" aria-label="Question 28" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off">  is kept to a minimum 
 
 
 
 ↓ 
 
 
 
 Analyse the results 
 Calculate the correlation and make a  <strong', '[]'::jsonb, 'graph', 1, 29),
(160230, 16023, 'text_input', '29     
 
 
 
 ↓ 
 
 
 
 
  <strong', '[]'::jsonb, 'evaluate', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(16024, 1602, 'listening', 'Listening Part 4: Health benefits of dance', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p>Complete the notes below.</p>
<p><em>Write <strong>ONE WORD ONLY</strong> for each answer.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Health benefits of dance</strong></strong></p>
<p><strong>Recent findings:</strong></p>
<ul>
<li>All forms of dance produce various hormones associated with feelings of happiness.</li>
<li>Dancing with others has a more positive impact than dancing alone.</li>
<li>An experiment on university students suggested that dance increases <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>For those with mental illness, dance could be used as a form of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
</ul>
<p><strong>Benefits of dance for older people:</strong></p>
<ul>
<li>accessible for people with low levels of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span></li>
<li>reduces the risk of heart disease</li>
<li>better <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> reduces the risk of accidents</li>
<li>improves <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span> function by making it work faster</li>
<li>improves participants’ general well-being</li>
<li>gives people more <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> to take exercise</li>
<li>can lessen the feeling of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span>, very common in older people</li>
</ul>
<p><strong>Benefits of Zumba:</strong></p>
<ul>
<li>A study at The University of Wisconsin showed that doing Zumba for 40 minutes uses up as many <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> as other quite intense forms of exercise.</li>
<li><em>The American Journal of Health Behavior</em> study showed that:</li>
</ul>
<p>–  women suffering from <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span> benefited from doing Zumba.</p>
<p>–  Zumba became a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span> for the participants.</p>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/13208-cambridge-ielts-16-academic-listening-2-audio-4.mp3', 'Dancing is something that humans do when they want to have a good time. It’s a universal response to music, found in all cultures. But what’s only been discovered recently is that dancing not only makes us feel good, it’s also extremely good for our health.
Dancing, like other forms of exercise, releases hormones, such as dopamine, which make us feel relaxed and happy. And it also reduces feelings of stress or anxiety.
Dancing is also a sociable activity, which is another reason it makes us feel good.
One study compared people’s enjoyment of dancing at home in front of a video with dancing in a group in a studio.
The people dancing in a group reported feeling happier, whereas those dancing alone did not.
In another experiment, university researchers at York and Sheffield took a group of students and sent each of them into a lab where music was played for five minutes. Each had to choose from three options: to sit and listen quietly to the music, to cycle on an exercise bike while they listened, or to get up and dance. All were given cognitive tasks to perform before and after. The result showed that those who chose to dance showed much more creativity when doing problem-solving tasks.
Doctor Lovatt at the University of Hertfordshire believes dance could be a very useful way to help people suffering from mental health problems. He thinks dance should be prescribed ad therapy to help people overcome issues such as depression.
————————
It’s well established that dance is a good way of encouraging adolescent girls to take exercise but what about older people? Studies have shown that there are enormous benefits for people in their sixties and beyond. One of the great things about dance is that there are no barriers to participation. Anyone can have a go, even those whose standard of fitness is quite low.
Dance can be especially beneficial for older adults who can’t run or do more intense workouts, or for those who don’t want to. One 2015 study found that even a gently dance workout helps to promote a healthy heart. And there’s plenty of evidence which suggests that dancing lowers the risk of falls, which could result in a broken hip, for example, by helping people to improve their balance.
There are some less obvious benefits of dance for older people too. One thing I hadn’t realised before researching this topic was that dance isn’t just a physical challenge. It also requires a lot of concentration because you need to remember different steps and routines. For older people, this kind of activity is especially important because it forces their brain to process things more quickly and to retain more information.
Current research also shows that dance promotes a general sense of well-being in older participants, which can last up to a week after a class. Participants report feeling less tired and having greater motivation to be more active and do daily activities such as gardening or walking to the shops or a park.
Ballroom or country dancing, both popular with older people, have to be done in groups. They require collaboration and often involve touching a dance partner, all of which encourages interaction on the dance floor. This helps to develop new relationships and can reduce older people’s sense of isolation, which is a huge problem in many countries.
I also looked at the benefits of Zumba. Fifteen million people in 180 countries now regularly take a Zumba class, an aerobic workout based on Latin American dance moves. John Porcari, a professor of exercise and sport science at the University of Wisconsin, analysed a group of women who were Zumba regulars and found that a class lasting 40 minutes burns about 370 calories. This is similar to moderately intense exercises like step aerobics or kickboxing.
A study in the American Journal of Health Behavior showed that when women with obesity did Zumba three times a week for 16 weeks, they lost an average of 1.2 kilos and lowered their percentage of body fat by 1%. More importantly, the women enjoyed the class so much that they made it a habit and continued to attend classes at least once a week – very unusual for an aerobic exercise programme.
Dance is never going to compete with high-intensity workouts when it comes to physical fitness gains, but its popularity is likely to keep on rising because it’s such a fun way to keep fit.', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(160231, 16024, 'text_input', 'An experiment on university students suggested that dance increases  <strong', '[]'::jsonb, 'creativity', 1, 31),
(160232, 16024, 'text_input', 'For those with mental illness, dance could be used as a form of  <strong', '[]'::jsonb, 'therapy', 1, 32),
(160233, 16024, 'text_input', 'Benefits of dance for older people:  
 
 accessible for people with low levels of  <strong', '[]'::jsonb, 'fitness', 1, 33),
(160234, 16024, 'text_input', 'lts-listening-question-number-33" class="ielts-listening-question-number">33     
 reduces the risk of heart disease 
 better  <strong', '[]'::jsonb, 'balance', 1, 34),
(160235, 16024, 'text_input', 'rong id="ielts-listening-question-number-34" class="ielts-listening-question-number">34     reduces the risk of accidents 
 improves  <strong', '[]'::jsonb, 'brain', 1, 35),
(160236, 16024, 'text_input', 'ing-question-number">35     function by making it work faster 
 improves participants’ general well-being 
 gives people more  <strong', '[]'::jsonb, 'motivation', 1, 36),
(160237, 16024, 'text_input', 'id="ielts-listening-question-number-36" class="ielts-listening-question-number">36     to take exercise 
 can lessen the feeling of  <strong', '[]'::jsonb, 'isolation', 1, 37),
(160238, 16024, 'text_input', 'answer_13204_7" id="ielts_listening_answer_13204_7" aria-label="Question 37" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off"> , very common in older people 
 
  Benefits of Zumba:  
 
 A study at The University of Wisconsin showed that doing Zumba for 40 minutes uses up as many  <strong', '[]'::jsonb, 'calories', 1, 38),
(160239, 16024, 'text_input', 'The American Journal of Health Behavior  study showed that: 
 
 –  women suffering from  <strong', '[]'::jsonb, 'obesity', 1, 39),
(160240, 16024, 'text_input', '–  Zumba became a  <strong', '[]'::jsonb, 'habit', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
