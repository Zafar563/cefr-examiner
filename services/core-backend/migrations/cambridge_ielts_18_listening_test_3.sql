-- Cambridge IELTS 18 Academic Listening Test 3
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(1803, 'Cambridge IELTS 18 Academic Listening Test 3', 'Rasmiy Cambridge IELTS 18 to''plamidan olingan to''liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(18031, 1803, 'listening', 'Listening Part 1: Wayside Camera Club
membership form', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 1-4                                                                                                                                                                                                    
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p><em>Complete the form below.</em></p>
<p><em>Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Wayside Camera Club</p>
<p>membership form</strong></strong></p>
<p>Name:   Dan Green</p>
<p>Email address:   dan1068@market.com</p>
<p>Home address:   52 <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span> Street, Peacetown</p>
<p>Heard about us:   from a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>Reasons for joining:   to enter competitions to <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span></p>
<p>Type of membership:   <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span> membership (£30)</p>
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
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 5-10                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Complete the table below.</em></p>
<p><em>Write <strong>NO MORE THAN TWO WORDS</strong> for each answer.</em></p>
<table>
<tbody>
<tr>
<td colspan="3" width="474">
<p style="text-align: center"><strong>Photography competitions</strong></p>
</td>
</tr>
<tr>
<td width="142"><strong>Title of competition</strong></td>
<td width="152"><strong>Instructions</strong></td>
<td width="180"><strong>Feedback to Dan</strong></td>
</tr>
<tr>
<td width="142">‘<span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span>’</td>
<td width="152">A scene in the home</td>
<td width="180">The picture’s composition was not good.</td>
</tr>
<tr>
<td width="142">‘Beautiful Sunsets’</td>
<td width="152">Scene must show some <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span></td>
<td width="180">The <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span> was wrong.</td>
</tr>
<tr>
<td width="142">‘<span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span>’</td>
<td width="152">Scene must show <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span></td>
<td width="180">The photograph was too <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span>.</td>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/14614-cambridge-ielts-18-academic-listening-3-audio-1.mp3', 'BREDA: Hello, Wayside Camera Club, Breda speaking.
DAN: Oh, hello, um, my name’s Dan and I’d like to join your club.
BREDA: That’s great, Dan. We have an application form- would you like to complete it over the phone, then you can ask any questions you might have?
DAN: Oh, yes, thanks.
BREDA: OK, so what’s your family name?
DAN: It’s Green- Dan Green.
BREDA: So – can I take your email address?
DAN: Yes, it’s dan1068@market.com.
BREDA: Thanks. And what about your home address?
DAN: Well, I’m about ten miles away from your club in Peacetown. I live in a house there.
BREDA: OK, so what’s the house number and street?
DAN: It’s 52 Marrowfield Street.
BREDA: Is that M-A double R-O-W-F-l-E-L-D?
DAN: That’s right.
BREDA: … and that’s Peacetown, you said?
DAN: Uhuh.
—————
BREDA: So how did you hear about our club? Did you look on the internet?
DAN: I usually do that, but this time, well, I was talking to a relative the other day and he suggested it.
BREDA: Oh, is he a member too?
DAN: He belongs to another club – but he’d heard good things about yours.
BREDA: OK. So what do you hope to get from joining?
DAN: Well, one thing that really interests me is the competitions that you have. I enjoy entering those.
BREDA: Right. Anything else?
DAN: Well, I also like to socialise with other photographers.
BREDA: That’s great. So what type of membership would you like?
DAN: What are the options?
BREDA: It’s £30 a year for full membership or £20 a year if you’re an associate.
DAN: I think I’ll go for the full membership, then.
BREDA: That’s a good idea because you can’t vote in meetings with an associate membership.
—————
BREDA: If I could just find out a bit more about you …
DAN: OK.
BREDA: So you said you wanted to compete- have you ever won any photography competitions?
DAN: Not yet, but I have entered three in the past.
BREDA: Oh, that’s interesting. So why don’t you tell me something about those? Let’s start with the first one.
DAN: Well, the theme was entitled ‘Domestic Life’.
BREDA: I see – so it had to be something related to the home?
DAN: Yeah. I chose to take a photo of a family sitting round the dinner table having a meal, and, urn, I didn’t win, but I did get some feedback.
BREDA: Oh, what did the judges say?
DAN: That it was too ‘busy’ as a picture.
BREDA: Aha – so it was the composition of the picture that they criticised?
DAN: That’s right – and once they’d told me that, I could see my mistake.
BREDA: So what was the theme of the second competition?
DAN: Well, my university was on the coast and that area gets a lot of beautiful sunsets so that was the theme.
BREDA: Oh, sunsets, that’s a great theme.
DAN: Yes. The instructions were to capture the clouds as well – it couldn’t just be blue sky and a setting sun.
BREDA: Sure, cause they give you all those amazing pinks and purples.
DAN: Yeah – and I thought I’d done that well, but the feedback was that I should have waited a bit longer to get the shot.
BREDA: I see. So the timing wasn’t right.
DAN: Yes – I took it too soon, basically. And then the third competition I entered was called ‘Animal Magic’.
BREDA: Well, that’s a difficult subject!
DAN: I know! I had to take hundreds of shots.
BREDA: I’m sure – because animals move all the time.
DAN: That’s what we had to show – there had to be some movement in the scene. I got a great shot of a fox in the end, but I took it at night and, well, I suspected that it was a bit dark, which is what I was told.
BREDA: Well Dan – you seem to be really keen and we’d be delighted to have you in our club. I’m sure we can help with all those areas that you’ve outlined.
DAN: Thanks, that’s great.', 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(180301, 18031, 'text_input', 'com 
 Home address:   52  <strong', '[]'::jsonb, 'Marrowfield', 1, 1),
(180302, 18031, 'text_input', 'trong id="ielts-listening-question-number-1" class="ielts-listening-question-number">1     Street, Peacetown 
 Heard about us:   from a  <strong', '[]'::jsonb, 'relative', 1, 2),
(180303, 18031, 'text_input', 'id="ielts-listening-question-number-2" class="ielts-listening-question-number">2     
 Reasons for joining:   to enter competitions to  <strong', '[]'::jsonb, 'socialise / socialize', 1, 3),
(180304, 18031, 'text_input', 'ing-question-item"> 3     
 Type of membership:    <strong', '[]'::jsonb, 'full', 1, 4),
(180305, 18031, 'text_input', 'Photography competitions  
 
 
 
  Title of competition  
  Instructions  
  Feedback to Dan  
 
 
 ‘ <strong', '[]'::jsonb, 'Domestic Life', 1, 5),
(180306, 18031, 'text_input', '‘Beautiful Sunsets’ 
 Scene must show some  <strong', '[]'::jsonb, 'clouds', 1, 6),
(180307, 18031, 'text_input', 'stening-question-item"> 6     
 The  <strong', '[]'::jsonb, 'timing', 1, 7),
(180308, 18031, 'text_input', '‘ <strong', '[]'::jsonb, 'Animal Magic', 1, 8),
(180309, 18031, 'text_input', 'ion-item"> 8    ’ 
 Scene must show  <strong', '[]'::jsonb, 'movement / animal movement', 1, 9),
(180310, 18031, 'text_input', 'em"> 9     
 The photograph was too  <strong', '[]'::jsonb, 'dark', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(18032, 1803, 'listening', 'Listening Part 2', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 11-12                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="11,12"><div class="ielts-q-header"><strong class="ielts-q-badge">11</strong> <strong class="ielts-q-badge">12</strong><span class="ielts-q-title"><span>Which  warnings does Dan give about picking mushrooms?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> Don’t pick more than one variety of mushroom at a time.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> Don’t pick mushrooms near busy roads.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> Don’t eat mushrooms given to you.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> Don’t eat mushrooms while picking them.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="11,12" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> Don’t pick old mushrooms.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 13-14                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="13,14"><div class="ielts-q-header"><strong class="ielts-q-badge">13</strong> <strong class="ielts-q-badge">14</strong><span class="ielts-q-title"><span>Which  ideas about wild mushrooms does Dan say are correct?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> Mushrooms should always be peeled before eating.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> Mushrooms eaten by animals may be unsafe.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> Cooking destroys toxins in mushrooms.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> Brightly coloured mushrooms can be edible.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="13,14" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> All poisonous mushrooms have a bad smell.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 15-20                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-standalone-q" data-qnum="15"><div class="ielts-q-header"><strong class="ielts-q-badge">15</strong><span class="ielts-q-title"><span>What advice does Dan give about picking mushrooms in parks?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="A"><span class="ielts-radio-text"><strong>A</strong> Choose wooded areas.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="B"><span class="ielts-radio-text"><strong>B</strong> Don’t disturb wildlife.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="C"><span class="ielts-radio-text"><strong>C</strong> Get there early.</span></label></div></div><div class="ielts-standalone-q" data-qnum="16"><div class="ielts-q-header"><strong class="ielts-q-badge">16</strong><span class="ielts-q-title"><span>Dan says it is a good idea for beginners to</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="A"><span class="ielts-radio-text"><strong>A</strong> use a mushroom app.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="B"><span class="ielts-radio-text"><strong>B</strong> join a group.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="C"><span class="ielts-radio-text"><strong>C</strong> take a reference book.</span></label></div></div><div class="ielts-standalone-q" data-qnum="17"><div class="ielts-q-header"><strong class="ielts-q-badge">17</strong><span class="ielts-q-title"><span>What does Dan say is important for conservation?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="17" name="question_17" value="A"><span class="ielts-radio-text"><strong>A</strong> selecting only fully grown mushrooms</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="17" name="question_17" value="B"><span class="ielts-radio-text"><strong>B</strong> picking a limited amount of mushrooms</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="17" name="question_17" value="C"><span class="ielts-radio-text"><strong>C</strong> avoiding areas where rare mushroom species grow</span></label></div></div><div class="ielts-standalone-q" data-qnum="18"><div class="ielts-q-header"><strong class="ielts-q-badge">18</strong><span class="ielts-q-title"><span>According to Dan, some varieties of wild mushrooms are in decline because there is</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="18" name="question_18" value="A"><span class="ielts-radio-text"><strong>A</strong> a huge demand for them from restaurants.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="18" name="question_18" value="B"><span class="ielts-radio-text"><strong>B</strong> a lack of rain in this part of the country.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="18" name="question_18" value="C"><span class="ielts-radio-text"><strong>C</strong> a rise in building developments locally.</span></label></div></div><div class="ielts-standalone-q" data-qnum="19"><div class="ielts-q-header"><strong class="ielts-q-badge">19</strong><span class="ielts-q-title"><span>Dan says that when storing mushrooms, people should</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="19" name="question_19" value="A"><span class="ielts-radio-text"><strong>A</strong> keep them in the fridge for no more than two days.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="19" name="question_19" value="B"><span class="ielts-radio-text"><strong>B</strong> keep them in a brown bag in a dark room.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="19" name="question_19" value="C"><span class="ielts-radio-text"><strong>C</strong> leave them for a period after washing them.</span></label></div></div><div class="ielts-standalone-q" data-qnum="20"><div class="ielts-q-header"><strong class="ielts-q-badge">20</strong><span class="ielts-q-title"><span>What does Dan say about trying new varieties of mushrooms?</span></div><div class="ielts-radio-group"><label class="ielts-radio-btn"><input type="radio" data-qnum="20" name="question_20" value="A"><span class="ielts-radio-text"><strong>A</strong> Experiment with different recipes.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="20" name="question_20" value="B"><span class="ielts-radio-text"><strong>B</strong> Expect some to have a strong taste.</span></label><label class="ielts-radio-btn"><input type="radio" data-qnum="20" name="question_20" value="C"><span class="ielts-radio-text"><strong>C</strong> Cook them for a long time.</span></label></div></div></div>
                                                                                                                                    </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/14613-cambridge-ielts-18-academic-listening-3-audio-2.mp3', 'PRESENTER: This evening we’re delighted to welcome Dan Beagle, who’s just written a book on looking for and finding food in the wild. He’s going to tell us everything we need to know about picking wild mushrooms.
DAN: Thank you very much. Well, I need to start by talking about safety. You really need to know what you’re doing because some mushrooms are extremely poisonous. Having said that, once you know what to look for, it’s really worth doing for the amazing variety of mushrooms available – which you can’t get in the shops. But of course, you have to be very careful and that’s why I always say you should never consume mushrooms picked by friends or neighbours – always remember that some poisonous mushrooms look very similar to edible ones and it’s easy for people to get confused. The other thing to avoid is mushrooms growing beside busy roads for obvious reasons. But nothing beats the taste of freshly picked mushrooms – don’t forget that the ones in the shops are often several days old and past their best.
There are certain ideas about wild mushrooms that it’s important to be aware of. Don’t listen to people who tell you that it’s only OK to eat mushrooms that are pale or dull – this is completely untrue. Some edible mushrooms are bright red, for example. Personally, I prefer mushrooms cooked but it won’t do you any harm to eat them uncooked in salads – it’s not necessary to peel them. Another thing you should remember is that you can’t tell if a mushroom is safe to eat by its smell – some of the most deadly mushrooms have no smell and taste quite nice, apparently. Finally, just because deer or squirrels eat a particular mushroom doesn’t mean that you can.
—————
Of course, mushroom picking is associated with the countryside but if you haven’t got a car, your local park can be a great place to start. There are usually a range of habitats where mushrooms grow, such as playing fields and wooded areas. But you need to be there first thing in the morning, as there’s likely be a lot of competition – not just from people but wildlife too. The deer often get the best mushrooms in my local park.
If you’re a complete beginner, I wouldn’t recommend going alone or relying on photos in a book, even the one I’ve written! There are some really good phone apps for identifying mushrooms, but you can’t always rely on getting a good signal in the middle of a wood. If possible, you should go with a group led by an expert – you’ll stay safe and learn a lot that way.
Conservation is a really important consideration and you must follow a few basic rules. You should never pick all the mushrooms in one area – collect only enough for your own needs. Be very careful that you don’t trample on young mushrooms or other plants. And make sure you don’t pick any mushrooms that are endangered and protected by law.
There’s been a decline in some varieties of wild mushrooms in this part of the country. Restaurants are becoming more interested in locally sourced food like wild mushrooms, but the biggest problem is that so many new houses have been built in this area in the last ten years. And more water is being taken from rivers and reservoirs because of this, and mushroom habitats have been destroyed.
Anyway, a word of advice on storing mushrooms. Collect them in a brown paper bag and as soon as you get home, put them in the fridge. They’ll be fine for a couple of days, but it’s best to cook them as soon as possible – after washing them really carefully first, of course.
So everybody knows what a mushroom tastes like, right? Well, you’ll be surprised by the huge variety of wild mushrooms there are. Be adventurous! They’re great in so many dishes – stir fries, risottos, pasta. But just be aware that some people can react badly to certain varieties so it’s a good idea not to eat huge quantities to begin with.
OK, so now I’m going to show you …', 2)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(180311, 18032, 'multiple_choice', 'Question 11', '["A", "B", "C", "D", "E"]'::jsonb, 'B / C', 1, 11),
(180312, 18032, 'multiple_choice', 'Which&nbsp; TWO &nbsp;warnings does Dan give about picking mushrooms?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / C', 1, 12),
(180313, 18032, 'multiple_choice', 'Question 13', '["A", "B", "C", "D", "E"]'::jsonb, 'B / D', 1, 13),
(180314, 18032, 'multiple_choice', 'Which&nbsp; TWO &nbsp;ideas about wild mushrooms does Dan say are correct?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / D', 1, 14),
(180315, 18032, 'single_choice', 'What advice does Dan give about picking mushrooms in parks?', '["A", "B", "C"]'::jsonb, 'C', 1, 15),
(180316, 18032, 'single_choice', 'Dan says it is a good idea for beginners to', '["A", "B", "C"]'::jsonb, 'B', 1, 16),
(180317, 18032, 'single_choice', 'What does Dan say is important for conservation?', '["A", "B", "C"]'::jsonb, 'B', 1, 17),
(180318, 18032, 'single_choice', 'According to Dan, some varieties of wild mushrooms are in decline because there is', '["A", "B", "C"]'::jsonb, 'C', 1, 18),
(180319, 18032, 'single_choice', 'Dan says that when storing mushrooms, people should', '["A", "B", "C"]'::jsonb, 'A', 1, 19),
(180320, 18032, 'single_choice', 'What does Dan say about trying new varieties of mushrooms?', '["A", "B"]'::jsonb, 'A', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(18033, 1803, 'listening', 'Listening Part 3: Comments', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 21-22                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p><em>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</em></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                            <div class="ielts-listening-question-item">
                                                                                                    
                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="21,22"><div class="ielts-q-header"><strong class="ielts-q-badge">21</strong> <strong class="ielts-q-badge">22</strong><span class="ielts-q-title"><span>Which  opinions about the Luddites do the students express?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> Their actions were ineffective.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> They are still influential today.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> They have received unfair criticism.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> They were proved right.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> Their attitude is understandable.</span></label></div></div></div>
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
                                                                                                                                                                                                                                            <div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="23,24"><div class="ielts-q-header"><strong class="ielts-q-badge">23</strong> <strong class="ielts-q-badge">24</strong><span class="ielts-q-title"><span>Which  predictions about the future of work are the students doubtful about?</span></div><div class="ielts-checkbox-group"><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="A"><span class="ielts-radio-text"><strong>A</strong> Work will be more rewarding.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="B"><span class="ielts-radio-text"><strong>B</strong> Unemployment will fall.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="C"><span class="ielts-radio-text"><strong>C</strong> People will want to delay retiring.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="D"><span class="ielts-radio-text"><strong>D</strong> Working hours will be shorter.</span></label><label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" value="E"><span class="ielts-radio-text"><strong>E</strong> People will change jobs more frequently.</span></label></div></div></div>
                                                                                                                                    </div>
                                                                                                                                                            <h2 class="ielts-reading-question-section-heading">
                                            Questions 25-30                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <p>What comment do the students make about each of the following jobs?</p>
<p><em>Choose <strong>SIX</strong> answers from the box and write the correct letter, <strong>A-G</strong>, next to Questions.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Comments</strong></strong></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Jobs</strong></strong></p>
                                        </div>
                                        <div class="ielts-reading-questions">
                                                                                                                                                                                                <div class="matching-dnd-questions"><div class="ielts-listening-question-item"> • <span>Accountants</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">25</strong><select data-qnum="25" name="question_25" class="ielts-inline-select"><option value="">[ 25 ] Tanlang...</option><option value="A. These jobs are likely to be at risk.">A. These jobs are likely to be at risk.</option><option value="B. Their role has become more interesting in recent years.">B. Their role has become more interesting in recent years.</option><option value="C. The number of people working in this sector has fallen dramatically.">C. The number of people working in this sector has fallen dramatically.</option><option value="D. This job will require more qualifications.">D. This job will require more qualifications.</option><option value="E. Higher disposable income has led to a huge increase in jobs.">E. Higher disposable income has led to a huge increase in jobs.</option><option value="F. There is likely to be a significant rise in demand for this service.">F. There is likely to be a significant rise in demand for this service.</option><option value="G. Both employment and productivity have risen.">G. Both employment and productivity have risen.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Hairdressers</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">26</strong><select data-qnum="26" name="question_26" class="ielts-inline-select"><option value="">[ 26 ] Tanlang...</option><option value="A. These jobs are likely to be at risk.">A. These jobs are likely to be at risk.</option><option value="B. Their role has become more interesting in recent years.">B. Their role has become more interesting in recent years.</option><option value="C. The number of people working in this sector has fallen dramatically.">C. The number of people working in this sector has fallen dramatically.</option><option value="D. This job will require more qualifications.">D. This job will require more qualifications.</option><option value="E. Higher disposable income has led to a huge increase in jobs.">E. Higher disposable income has led to a huge increase in jobs.</option><option value="F. There is likely to be a significant rise in demand for this service.">F. There is likely to be a significant rise in demand for this service.</option><option value="G. Both employment and productivity have risen.">G. Both employment and productivity have risen.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Administrative staff</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">27</strong><select data-qnum="27" name="question_27" class="ielts-inline-select"><option value="">[ 27 ] Tanlang...</option><option value="A. These jobs are likely to be at risk.">A. These jobs are likely to be at risk.</option><option value="B. Their role has become more interesting in recent years.">B. Their role has become more interesting in recent years.</option><option value="C. The number of people working in this sector has fallen dramatically.">C. The number of people working in this sector has fallen dramatically.</option><option value="D. This job will require more qualifications.">D. This job will require more qualifications.</option><option value="E. Higher disposable income has led to a huge increase in jobs.">E. Higher disposable income has led to a huge increase in jobs.</option><option value="F. There is likely to be a significant rise in demand for this service.">F. There is likely to be a significant rise in demand for this service.</option><option value="G. Both employment and productivity have risen.">G. Both employment and productivity have risen.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Agricultural workers</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">28</strong><select data-qnum="28" name="question_28" class="ielts-inline-select"><option value="">[ 28 ] Tanlang...</option><option value="A. These jobs are likely to be at risk.">A. These jobs are likely to be at risk.</option><option value="B. Their role has become more interesting in recent years.">B. Their role has become more interesting in recent years.</option><option value="C. The number of people working in this sector has fallen dramatically.">C. The number of people working in this sector has fallen dramatically.</option><option value="D. This job will require more qualifications.">D. This job will require more qualifications.</option><option value="E. Higher disposable income has led to a huge increase in jobs.">E. Higher disposable income has led to a huge increase in jobs.</option><option value="F. There is likely to be a significant rise in demand for this service.">F. There is likely to be a significant rise in demand for this service.</option><option value="G. Both employment and productivity have risen.">G. Both employment and productivity have risen.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Care workers</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">29</strong><select data-qnum="29" name="question_29" class="ielts-inline-select"><option value="">[ 29 ] Tanlang...</option><option value="A. These jobs are likely to be at risk.">A. These jobs are likely to be at risk.</option><option value="B. Their role has become more interesting in recent years.">B. Their role has become more interesting in recent years.</option><option value="C. The number of people working in this sector has fallen dramatically.">C. The number of people working in this sector has fallen dramatically.</option><option value="D. This job will require more qualifications.">D. This job will require more qualifications.</option><option value="E. Higher disposable income has led to a huge increase in jobs.">E. Higher disposable income has led to a huge increase in jobs.</option><option value="F. There is likely to be a significant rise in demand for this service.">F. There is likely to be a significant rise in demand for this service.</option><option value="G. Both employment and productivity have risen.">G. Both employment and productivity have risen.</option></select></span></div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <div class="ielts-listening-question-item"> • <span>Bank clerks</span><span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">30</strong><select data-qnum="30" name="question_30" class="ielts-inline-select"><option value="">[ 30 ] Tanlang...</option><option value="A. These jobs are likely to be at risk.">A. These jobs are likely to be at risk.</option><option value="B. Their role has become more interesting in recent years.">B. Their role has become more interesting in recent years.</option><option value="C. The number of people working in this sector has fallen dramatically.">C. The number of people working in this sector has fallen dramatically.</option><option value="D. This job will require more qualifications.">D. This job will require more qualifications.</option><option value="E. Higher disposable income has led to a huge increase in jobs.">E. Higher disposable income has led to a huge increase in jobs.</option><option value="F. There is likely to be a significant rise in demand for this service.">F. There is likely to be a significant rise in demand for this service.</option><option value="G. Both employment and productivity have risen.">G. Both employment and productivity have risen.</option></select></span></div></div>                                                                        <div class="options-dnd-panel dnd-panel dnd-panel--matching" data-dnd-group="14605">
                                                                            <div class="dnd-panel-instruction">Drag and drop an option to fill in each blank.</div>
                                                                            <div class="dnd-cards-container">
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="A" data-text="A. These jobs are likely to be at risk.">
                                                                                        <span class="dnd-label">A.</span>
                                                                                        <span class="dnd-text">These jobs are likely to be at risk.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="B" data-text="B. Their role has become more interesting in recent years.">
                                                                                        <span class="dnd-label">B.</span>
                                                                                        <span class="dnd-text">Their role has become more interesting in recent years.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="C" data-text="C. The number of people working in this sector has fallen dramatically.">
                                                                                        <span class="dnd-label">C.</span>
                                                                                        <span class="dnd-text">The number of people working in this sector has fallen dramatically.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="D" data-text="D. This job will require more qualifications.">
                                                                                        <span class="dnd-label">D.</span>
                                                                                        <span class="dnd-text">This job will require more qualifications.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="E" data-text="E. Higher disposable income has led to a huge increase in jobs.">
                                                                                        <span class="dnd-label">E.</span>
                                                                                        <span class="dnd-text">Higher disposable income has led to a huge increase in jobs.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="F" data-text="F. There is likely to be a significant rise in demand for this service.">
                                                                                        <span class="dnd-label">F.</span>
                                                                                        <span class="dnd-text">There is likely to be a significant rise in demand for this service.</span>
                                                                                    </div>
                                                                                                                                                                    <div class="dnd-card" draggable="true" data-value="G" data-text="G. Both employment and productivity have risen.">
                                                                                        <span class="dnd-label">G.</span>
                                                                                        <span class="dnd-text">Both employment and productivity have risen.</span>
                                                                                    </div>
                                                                                                                                                            </div>
                                                                        </div>
                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            </div>
                                        </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/14612-cambridge-ielts-18-academic-listening-3-audio-3.mp3', 'YOUNG MAN: That seminar yesterday on automation and the future of work was really good wasn’t it? Looking at the first industrial revolution in Britain in the 19th century and seeing how people reacted to massive change was a real eye-opener.
YOUNG WOMAN: Yes. It was interesting to hear how people felt about automation then and what challenges they faced. I didn’t know that first started with workers in the textile industry.
YOUNG MAN: With those protesting workers called the Luddites destroying their knitting machines because they were so worried about losing their jobs.
YOUNG WOMAN: Yes, and ultimately, they didn’t achieve anything. And anyway, industrialisation created more jobs than it destroyed.
YOUNG MAN: Yes, that’s true – but it probably didn’t seem a positive thing at the time. I can see why the Luddites felt so threatened.
YOUNG WOMAN: I know. I’m sure I would have felt the same. The discussion about the future of work was really optimistic for a change. I like the idea that work won’t involve doing boring, repetitive tasks, as robots will do all that. Normally, you only hear negative stuff about the future.
YOUNG MAN: Bit too optimistic, don’t you think? For example, I can’t see how people are about to have more leisure time, when all the evidence shows people are spending longer than ever at work.
YOUNG WOMAN: No – that’s true. And what about lower unemployment? I’m not so sure about that.
YOUNG MAN: Perhaps in the long term – but not in the foreseeable future.
YOUNG WOMAN: Mmm. And I expect most people will be expected to work until they’re much older – as everyone’s living much longer.
YOUNG MAN: That’s already happening.
—————
YOUNG WOMAN: I enjoyed all that stuff on how technology has changed some jobs and how they’re likely to change in the near future.
YOUNG MAN: Yeah, incredible. Like accountants. You might think all the technological innovations would have put them out of a job, but in fact there are more of them than ever. They’re still really in demand and have become far more efficient.
YOUNG WOMAN: Right. That was amazing. Twenty times more accountants in this country compared to the 19th century.
YOUNG MAN: I know. I’d never have thought that demand for hairdressing would have gone up so much in the last hundred years. One hairdresser for every 287 people now, compared to one for over 1,500.
YOUNG WOMAN: Yeah because people’s earning power has gone up so they can afford to spend more on personal services like that.
YOUNG MAN: But technology hasn’t changed the actual job that much.
YOUNG WOMAN: No, they’ve got hairdryers, etc. but it’s one job where you don’t depend on a computer … The kind of work that administrative staff do has changed enormously, thanks to technology. Even 20 years ago there were secretaries doing dictation and typing.
YOUNG MAN: Yes. Really boring compared to these days, when they’re given much more responsibility and higher status.
YOUNG WOMAN: Mmm. A lot of graduates go in for this kind of work now … I’d expected there to be a much bigger change in the number of agricultural workers in the 19th century. But the 1871 census showed that roughly 25% of the population worked on the land.
YOUNG MAN: Yeah, I’d have assumed it would be more than 50%. Now it’s less than 0.2%.
YOUNG WOMAN: What about care workers?
YOUNG MAN: They barely existed in the 19th century as people’s lifespan was so much shorter. But now of course this sector will see huge growth.
YOUNG WOMAN: Yeah- and it’s hard enough to meet current demand. The future looks quite bleak for bank clerks. They’ve been in decline since ATMs were introduced in the eighties.
YOUNG MAN: And technology will certainly make most of the jobs they do now redundant, I think.
YOUNG WOMAN: I agree, although the situation may change. It’s very hard to predict what will happen.', 3)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(180321, 18033, 'multiple_choice', 'Question 21', '["A", "B", "C", "D", "E"]'::jsonb, 'A / E', 1, 21),
(180322, 18033, 'multiple_choice', 'Which&nbsp; TWO &nbsp;opinions about the Luddites do the students express?', '["A", "B", "C", "D", "E"]'::jsonb, 'A / E', 1, 22),
(180323, 18033, 'multiple_choice', 'Question 23', '["A", "B", "C", "D", "E"]'::jsonb, 'B / D', 1, 23),
(180324, 18033, 'multiple_choice', 'Which&nbsp; TWO &nbsp;predictions about the future of work are the students doubtful about?', '["A", "B", "C", "D", "E"]'::jsonb, 'B / D', 1, 24),
(180325, 18033, 'single_choice', 'Question 25', '["A", "B", "C"]'::jsonb, 'G', 1, 25),
(180326, 18033, 'single_choice', 'Question 26', '["A", "B", "C"]'::jsonb, 'E', 1, 26),
(180327, 18033, 'single_choice', 'Question 27', '["A", "B", "C"]'::jsonb, 'B', 1, 27),
(180328, 18033, 'single_choice', 'Question 28', '["A", "B", "C"]'::jsonb, 'C', 1, 28),
(180329, 18033, 'single_choice', 'Question 29', '["A", "B", "C"]'::jsonb, 'F', 1, 29),
(180330, 18033, 'single_choice', 'Question 30', '["A", "B", "C"]'::jsonb, 'A', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(18034, 1803, 'listening', 'Listening Part 4: Space Traffic Management', '<div class="ielts-reading-container">
<h2 class="ielts-reading-question-section-heading">
                                            Questions 31-40                                                                                                                                                
                                                                                                                                    </h2>
                                                                                    
                                                                                <div class="ielts-reading-question-section-content">
                                            <div class="ielts-listening-section-content-wrapper"><p><em>Complete the notes below.</em></p>
<p><em>Write <strong>ONE WORD ONLY</strong> for each answer.</em></p>
<p class="ielts-listening-transcript-subhead"><strong><strong>Space Traffic Management</strong></strong></p>
<p><strong>A Space Traffic Management system</strong></p>
<ul>
<li>is a concept similar to Air Traffic Control, but for satellites rather than planes.</li>
<li>would aim to set up legal and <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span> ways of improving safety.</li>
<li>does not actually exist at present.</li>
</ul>
<p><strong>Problems in developing effective Space Traffic Management</strong></p>
<ul>
<li>Satellites are now quite <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> and therefore more widespread (e.g. there are constellations made up of <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span> of satellites).</li>
<li>At present, satellites are not required to transmit information to help with their <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>There are few systems for <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span> satellites.</li>
<li>Small pieces of debris may be difficult to identify.</li>
<li>Operators may be unwilling to share details of satellites used for <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> or commercial reasons.</li>
<li>It may be hard to collect details of the object’s <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span> at a given time.</li>
<li>Scientists can only make a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> about where the satellite will go.</li>
</ul>
<p><strong>Solutions</strong></p>
<ul>
<li>Common standards should be agreed on for the presentation of information.</li>
<li>The information should be combined in one <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span>.</li>
<li>A coordinated system must be designed to create <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span> in its users.</li>
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
</div>', 'https://ielts-listening-audio.engnovatemedia.com/14611-cambridge-ielts-18-academic-listening-3-audio-4.mp3', 'In today’s astronomy lecture, I’m going to talk about the need for a system to manage the movement of satellites and other objects in orbit around the Earth. In other words, a Space Traffic Management system. We already have effective Air Traffic Control systems that are used internationally to ensure that planes navigate our skies safely. Well, Space Traffic Management is a similar concept, but focusing on the control of satellites.
The aim of such a system would be to prevent the danger of collisions in space between the objects in orbit around the Earth. In order to do this, we’d need to have a set of legal measures, and we’d also have to develop the technical systems to enable us to prevent such accidents.
But unfortunately, at present we don’t actually have a Space Traffic Management system that works. So why not? What are the problems in developing such a system?
Well, for one thing, satellites are relatively cheap these days, compared with how they were in the past, meaning that more people can afford to put them into space. So there’s a lot more of them out there, and people aren’t just launching single satellites but whole constellations, consisting of thousands of them designed to work together. So space is getting more crowded every day.
But in spite of this, one thing you may be surprised to learn is that you can launch a satellite into space and, once it’s out there, it doesn’t have to send back any information to Earth to allow its identification. So while we have international systems for ensuring we know where the planes in our skies are, and to prevent them from colliding with one another, when it comes to the safety of satellites, at present we don’t have anything like enough proper ways of tracking them.
And it isn’t just entire satellites that we need to consider. A greater threat is the huge amount of space debris in orbit around the Earth – broken bits of satellite and junk from space stations and so on. And some of these are so small that they can be very hard to identify, but they can still be very dangerous.
In addition, some operators may be unwilling to share information about the satellites they’ve launched. For example, a satellite may be designed for military purposes, or it may have been launched for commercial reasons, and the operators don’t want competitors to have information about it.
And even if the operators are willing to provide it, the information isn’t easy to collect. Details are needed about the object itself, as well as about its location at a particular time – and remember that a satellite isn’t very big, and it’s likely to be moving at thousands of kilometres an hour. We don’t have any sensors that can constantly follow something moving so fast, so all that the scientists can do is to put forward a prediction concerning where the satellite is heading next.
—————
So those are some of the problems that we’re facing. Let’s consider now some of the solutions that have been suggested. One key issue is the way in which information is dealt with. We need more information, but it also needs to be accessible at a global level, so we need to establish shared standards that we can all agree on for the way in which this information is presented. We already do this in other areas of science, so although this is a challenge, it’s not an impossible task. Then, as all this information’s collected, it needs to be put together so it can be used, and that will involve creating a single database on which it can be entered.
As we continue to push forward new developments, congestion of the space environment is only going to increase. To cope with this, we need to develop a system like the one I’ve described to coordinate the work of the numerous spacecraft operators, but it’s also essential that this system is one that establishes trust in the people that use it, both nationally and at a global level.
One interesting development …', 4)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(180331, 18034, 'text_input', 'would aim to set up legal and  <strong', '[]'::jsonb, 'technical', 1, 31),
(180332, 18034, 'text_input', 'Problems in developing effective Space Traffic Management  
 
 Satellites are now quite  <strong', '[]'::jsonb, 'cheap', 1, 32),
(180333, 18034, 'text_input', 'there are constellations made up of  <strong', '[]'::jsonb, 'thousands', 1, 33),
(180334, 18034, 'text_input', 'At present, satellites are not required to transmit information to help with their  <strong', '[]'::jsonb, 'identification', 1, 34),
(180335, 18034, 'text_input', 'There are few systems for  <strong', '[]'::jsonb, 'tracking', 1, 35),
(180336, 18034, 'text_input', 'Operators may be unwilling to share details of satellites used for  <strong', '[]'::jsonb, 'military', 1, 36),
(180337, 18034, 'text_input', 'It may be hard to collect details of the object’s  <strong', '[]'::jsonb, 'location', 1, 37),
(180338, 18034, 'text_input', 'Scientists can only make a  <strong', '[]'::jsonb, 'prediction', 1, 38),
(180339, 18034, 'text_input', 'The information should be combined in one  <strong', '[]'::jsonb, 'database', 1, 39),
(180340, 18034, 'text_input', 'A coordinated system must be designed to create  <strong', '[]'::jsonb, 'trust', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
