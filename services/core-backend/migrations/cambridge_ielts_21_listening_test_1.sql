-- ====================================================================
-- Seed Cambridge IELTS 21 Academic Listening Test 1
-- Total 1 full test, 4 parts, 40 questions with verified answer keys
-- Includes authentic IELTS HTML in sections.instructions & audio URLs
-- ====================================================================

INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(25, 'Cambridge IELTS 21 Academic Listening Test 1', 'Rasmiy Cambridge IELTS 21 to''plamidan olingan to''liq 4 ta qism (Part 1: Oyster Bay Sailing Club, Part 2: Working as a Film Makeup Artist, Part 3: Ocean Biodiversity Research, Part 4: The Importance of Rubber) va 40 ta savoldan iborat akademik Listening imtihoni.', 'Multi-level (A1-C1)', 30, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;

-- Section 251: Listening Part 1: Oyster Bay Sailing Club
INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(251, 25, 'listening', 'Listening Part 1: Oyster Bay Sailing Club', '<div class="ielts-reading-container">
  <h2 class="ielts-reading-question-section-heading">Questions 1-6</h2>
  <div class="ielts-reading-question-section-content">
    <div class="ielts-reading-section-content-wrapper">
      <p><strong>Complete the table below.</strong></p>
      <p class="text-xs text-slate-500 mb-3">Write <strong>ONE WORD AND/OR A NUMBER</strong> for each answer.</p>
      <div class="overflow-x-auto my-3">
        <table class="w-full text-sm border-collapse border border-slate-300">
          <thead>
            <tr class="bg-slate-100 border-b border-slate-300 text-slate-800">
              <th class="p-3 text-left border-r border-slate-300 font-bold">Name of course</th>
              <th class="p-3 text-left border-r border-slate-300 font-bold">What you learn</th>
              <th class="p-3 text-left border-r border-slate-300 font-bold">Cost</th>
              <th class="p-3 text-left font-bold">Other information</th>
            </tr>
          </thead>
          <tbody>
            <tr class="border-b border-slate-200">
              <td class="p-3 align-top font-semibold text-slate-900 border-r border-slate-300">Taster day</td>
              <td class="p-3 align-top border-r border-slate-300">introduction to sailing</td>
              <td class="p-3 align-top border-r border-slate-300">£120 if booking one place</td>
              <td class="p-3 align-top">small groups (max <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">1</strong><input type="text" data-qnum="1" name="question_1" class="ielts-inline-input" placeholder="[1] javob..." autocomplete="off" spellcheck="false"></span></span> people)</td>
            </tr>
            <tr class="border-b border-slate-200 bg-slate-50/50">
              <td class="p-3 align-top font-semibold text-slate-900 border-r border-slate-300">Level 1</td>
              <td class="p-3 align-top border-r border-slate-300">
                basic theory e.g. understanding the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">2</strong><input type="text" data-qnum="2" name="question_2" class="ielts-inline-input" placeholder="[2] javob..." autocomplete="off" spellcheck="false"></span></span> and tides<br><br>
                basic sailing skills including <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">3</strong><input type="text" data-qnum="3" name="question_3" class="ielts-inline-input" placeholder="[3] javob..." autocomplete="off" spellcheck="false"></span></span> information
              </td>
              <td class="p-3 align-top border-r border-slate-300">
                £200<br><br>
                <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">4</strong><input type="text" data-qnum="4" name="question_4" class="ielts-inline-input" placeholder="[4] javob..." autocomplete="off" spellcheck="false"></span></span> available for club members
              </td>
              <td class="p-3 align-top">
                all inclusive (plus a useful <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">5</strong><input type="text" data-qnum="5" name="question_5" class="ielts-inline-input" placeholder="[5] javob..." autocomplete="off" spellcheck="false"></span></span>)<br><br>
                a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">6</strong><input type="text" data-qnum="6" name="question_6" class="ielts-inline-input" placeholder="[6] javob..." autocomplete="off" spellcheck="false"></span></span> at the end of the course for all participants
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <h2 class="ielts-reading-question-section-heading mt-6">Questions 7-10</h2>
  <div class="ielts-reading-question-section-content">
    <div class="ielts-reading-section-content-wrapper">
      <p><strong>Complete the notes below.</strong></p>
      <p class="text-xs text-slate-500 mb-3">Write <strong>ONE WORD ONLY</strong> for each answer.</p>
      <div class="p-4 bg-slate-50 rounded-xl border border-slate-200 my-3 space-y-3">
        <h4 class="font-bold text-slate-900 border-b pb-2">General information</h4>
        <ul class="list-disc pl-5 space-y-2 text-slate-800 text-sm">
          <li>Participants must be able to swim.</li>
          <li>Bring suitable clothing, a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">7</strong><input type="text" data-qnum="7" name="question_7" class="ielts-inline-input" placeholder="[7] javob..." autocomplete="off" spellcheck="false"></span></span> and toiletries (e.g. shampoo).</li>
          <li>There is a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">8</strong><input type="text" data-qnum="8" name="question_8" class="ielts-inline-input" placeholder="[8] javob..." autocomplete="off" spellcheck="false"></span></span> at the club.</li>
          <li>Online training <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">9</strong><input type="text" data-qnum="9" name="question_9" class="ielts-inline-input" placeholder="[9] javob..." autocomplete="off" spellcheck="false"></span></span> are recommended.</li>
          <li><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">10</strong><input type="text" data-qnum="10" name="question_10" class="ielts-inline-input" placeholder="[10] javob..." autocomplete="off" spellcheck="false"></span></span> are available for course participants.</li>
        </ul>
      </div>
    </div>
  </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/3178700-cambridge-ielts-21-academic-listening-test-1-1.mp3', 'WOMAN: Hello, Oyster Bay Sailing Club. How can I help you?
MAN: Oh hi. I''d like to find out about sailing courses for beginners.
WOMAN: No problem. Is it for yourself?
MAN: Yes. I had a look online but I''m not sure which course would be best.
WOMAN: OK. Well you might be interested in our Taster Days?
MAN: Possibly.
WOMAN: So these are for people who''ve never sailed before - it''s basically an introduction to sailing to find out whether you enjoy it and want to carry on with it.
MAN: And how much is that?
WOMAN: It''s £120 for the day - but it''s reduced to £110 each if there are two of you.
MAN: No, it would just be me.
WOMAN: Oh that''s fine. You''d be in a small group, usually about eight people but no more than ten - and everyone''s always very friendly.
MAN: Uh huh. And are there any other suitable courses?
WOMAN: The other option is the Level 1 course. These are two-day weekend courses and we run those all year round.
MAN: OK. And what do you learn on that course?
WOMAN: This is a mix of theory and practical skills. So you learn about things like the weather, which is obviously really important and also the tides, as well as learning basic sailing skills. You go out into the harbour in special training dinghies for beginners, two people in each dinghy and an instructor. He or she will make sure you understand everything you need to know about safety.
MAN: It sounds like hard work!
WOMAN: Yes, but you''ll have a lot of fun too.
MAN: And the cost of that one is ... ?
WOMAN: £200. But it''s a bit cheaper if you decide to join the club. There''s a discount for members.
MAN: Well, I''m not sure about that yet.
WOMAN: You''ve got plenty of time to decide.
MAN: And does the cost include everything?
WOMAN: Yes, everything''s included and you also get a really good dictionary explaining all the sailing terminology. A lot of people struggle with this at first. It''s got lots of pictures, so I''m sure you''d find it really helpful. And on completion of the course you get a certificate. Then you''re ready to move on to the Level 2 course.
MAN: Sounds good.
WOMAN: I think that''s all the info you need for now. Just a couple of general things. For example, it''s really important that you know how to swim.
MAN: Yes, I''m pretty confident in the water.
WOMAN: Great. The other thing I should tell you is that we provide wetsuits and life jackets but you need to bring swimming trunks and some old trainers.
MAN: And a towel?
WOMAN: Yes definitely. And you might want to bring your own toiletries, things like shampoo.
MAN: OK. What about food and drink? Do I need to bring that or is there a café at the club?
WOMAN: Yes, you can get sandwiches, cakes and snacks there. The food''s pretty reasonable.
MAN: OK good. Well I think I''m interested in the Level 1 course. But I know absolutely nothing about sailing so is there anything I can do to prepare myself a bit?
WOMAN: I recommend you watch some videos we use for training. They''re available online. I can send you the link. They''ll give you an idea of what to expect.
MAN: Perfect, thanks. That would be very helpful. Oh and just one other thing - I''ll be cycling to the club and will need somewhere to put valuables. I''m just wondering if there are lockers for people to use?
WOMAN: Yes, there are plenty in the changing rooms.
MAN: Great. OK well could you book me onto...', 1)
ON CONFLICT (id) DO UPDATE SET passage_text = EXCLUDED.passage_text, title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(2501, 251, 'text_input', 'Taster day: small groups (max 1 ... people)', '[]'::jsonb, '10|ten', 1, 1),
(2502, 251, 'text_input', 'Level 1: basic theory e.g. understanding the 2 ... and tides', '[]'::jsonb, 'weather', 1, 2),
(2503, 251, 'text_input', 'Level 1: basic sailing skills including 3 ... information', '[]'::jsonb, 'safety', 1, 3),
(2504, 251, 'text_input', 'Level 1: Cost £200, 4 ... available for club members', '[]'::jsonb, 'discount', 1, 4),
(2505, 251, 'text_input', 'Level 1: all inclusive (plus a useful 5 ...)', '[]'::jsonb, 'dictionary', 1, 5),
(2506, 251, 'text_input', 'Level 1: a 6 ... at the end of the course for all participants', '[]'::jsonb, 'certificate', 1, 6),
(2507, 251, 'text_input', 'Bring suitable clothing, a 7 ... and toiletries (e.g. shampoo).', '[]'::jsonb, 'towel', 1, 7),
(2508, 251, 'text_input', 'There is a 8 ... at the club.', '[]'::jsonb, 'café|cafe', 1, 8),
(2509, 251, 'text_input', 'Online training 9 ... are recommended.', '[]'::jsonb, 'videos', 1, 9),
(2510, 251, 'text_input', '10 ... are available for course participants.', '[]'::jsonb, 'lockers', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

-- Section 252: Listening Part 2: Working as a Film Makeup Artist
INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(252, 25, 'listening', 'Listening Part 2: Working as a Film Makeup Artist', '<div class="ielts-reading-container">
  <h2 class="ielts-reading-question-section-heading">Questions 11-16</h2>
  <div class="ielts-reading-question-section-content">
    <p>Choose the correct letter, <strong>A</strong>, <strong>B</strong> or <strong>C</strong>.</p>
  </div>
  <div class="ielts-reading-questions">
    <div class="ielts-standalone-q" data-qnum="11">
      <div class="ielts-q-header"><strong class="ielts-q-badge">11</strong><span class="ielts-q-title">What should trainees always expect to get when working on low budget short films?</span></div>
      <div class="ielts-radio-group">
        <label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="A"><span class="ielts-radio-text"><strong>A</strong> travel expenses</span></label>
        <label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="B"><span class="ielts-radio-text"><strong>B</strong> a minimum wage</span></label>
        <label class="ielts-radio-btn"><input type="radio" data-qnum="11" name="question_11" value="C"><span class="ielts-radio-text"><strong>C</strong> meals</span></label>
      </div>
    </div>
    <div class="ielts-standalone-q" data-qnum="12">
      <div class="ielts-q-header"><strong class="ielts-q-badge">12</strong><span class="ielts-q-title">According to the speaker, on big budget films trainees may get experience of</span></div>
      <div class="ielts-radio-group">
        <label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="A"><span class="ielts-radio-text"><strong>A</strong> makeup for special effects.</span></label>
        <label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="B"><span class="ielts-radio-text"><strong>B</strong> working with different ethnicities.</span></label>
        <label class="ielts-radio-btn"><input type="radio" data-qnum="12" name="question_12" value="C"><span class="ielts-radio-text"><strong>C</strong> creating a variety of hair styles.</span></label>
      </div>
    </div>
    <div class="ielts-standalone-q" data-qnum="13">
      <div class="ielts-q-header"><strong class="ielts-q-badge">13</strong><span class="ielts-q-title">The speaker says a problem for makeup artists is</span></div>
      <div class="ielts-radio-group">
        <label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="A"><span class="ielts-radio-text"><strong>A</strong> dealing with difficult directors.</span></label>
        <label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="B"><span class="ielts-radio-text"><strong>B</strong> being shouted at by their supervisor.</span></label>
        <label class="ielts-radio-btn"><input type="radio" data-qnum="13" name="question_13" value="C"><span class="ielts-radio-text"><strong>C</strong> waiting around for hours doing nothing.</span></label>
      </div>
    </div>
    <div class="ielts-standalone-q" data-qnum="14">
      <div class="ielts-q-header"><strong class="ielts-q-badge">14</strong><span class="ielts-q-title">How did the speaker feel when she met famous actors for the first time?</span></div>
      <div class="ielts-radio-group">
        <label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="A"><span class="ielts-radio-text"><strong>A</strong> very shy</span></label>
        <label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="B"><span class="ielts-radio-text"><strong>B</strong> very proud</span></label>
        <label class="ielts-radio-btn"><input type="radio" data-qnum="14" name="question_14" value="C"><span class="ielts-radio-text"><strong>C</strong> very disappointed</span></label>
      </div>
    </div>
    <div class="ielts-standalone-q" data-qnum="15">
      <div class="ielts-q-header"><strong class="ielts-q-badge">15</strong><span class="ielts-q-title">What advice does the speaker give about makeup kits?</span></div>
      <div class="ielts-radio-group">
        <label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="A"><span class="ielts-radio-text"><strong>A</strong> Always carry a basic kit with you.</span></label>
        <label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="B"><span class="ielts-radio-text"><strong>B</strong> Only buy the best products for a makeup kit.</span></label>
        <label class="ielts-radio-btn"><input type="radio" data-qnum="15" name="question_15" value="C"><span class="ielts-radio-text"><strong>C</strong> Ask other makeup artists to check your kit.</span></label>
      </div>
    </div>
    <div class="ielts-standalone-q" data-qnum="16">
      <div class="ielts-q-header"><strong class="ielts-q-badge">16</strong><span class="ielts-q-title">What advice does the speaker give about creating a portfolio?</span></div>
      <div class="ielts-radio-group">
        <label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="A"><span class="ielts-radio-text"><strong>A</strong> Keep print and digital photos.</span></label>
        <label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="B"><span class="ielts-radio-text"><strong>B</strong> Only include a small selection of photos.</span></label>
        <label class="ielts-radio-btn"><input type="radio" data-qnum="16" name="question_16" value="C"><span class="ielts-radio-text"><strong>C</strong> Get permission to use photos.</span></label>
      </div>
    </div>
  </div>

  <h2 class="ielts-reading-question-section-heading mt-6">Questions 17-20</h2>
  <div class="ielts-reading-question-section-content">
    <p>What ability is required for each of the following duties?</p>
    <p class="text-xs text-slate-500 mb-3">Choose the correct letter, <strong>A</strong>, <strong>B</strong>, or <strong>C</strong>, next to Questions 17-20.</p>
    <div class="p-4 bg-slate-50 border border-slate-200 rounded-xl my-3 space-y-1.5 text-sm font-medium">
      <p><strong>A</strong> being well-organised</p>
      <p><strong>B</strong> being flexible</p>
      <p><strong>C</strong> working quickly</p>
    </div>
    <div class="space-y-3 mt-4">
      <div class="flex items-center justify-between p-3.5 bg-white border border-slate-200 rounded-xl shadow-xs">
        <span class="text-sm font-semibold text-slate-800"><strong class="ielts-q-badge mr-2">17</strong> Prepping an actor</span>
        <select data-qnum="17" name="question_17" class="ielts-inline-select px-3 py-2 border border-slate-300 rounded-lg text-sm bg-white font-semibold text-slate-800">
          <option value="">-- Tanlang --</option>
          <option value="A">A - being well-organised</option>
          <option value="B">B - being flexible</option>
          <option value="C">C - working quickly</option>
        </select>
      </div>
      <div class="flex items-center justify-between p-3.5 bg-white border border-slate-200 rounded-xl shadow-xs">
        <span class="text-sm font-semibold text-slate-800"><strong class="ielts-q-badge mr-2">18</strong> Continuity</span>
        <select data-qnum="18" name="question_18" class="ielts-inline-select px-3 py-2 border border-slate-300 rounded-lg text-sm bg-white font-semibold text-slate-800">
          <option value="">-- Tanlang --</option>
          <option value="A">A - being well-organised</option>
          <option value="B">B - being flexible</option>
          <option value="C">C - working quickly</option>
        </select>
      </div>
      <div class="flex items-center justify-between p-3.5 bg-white border border-slate-200 rounded-xl shadow-xs">
        <span class="text-sm font-semibold text-slate-800"><strong class="ielts-q-badge mr-2">19</strong> General</span>
        <select data-qnum="19" name="question_19" class="ielts-inline-select px-3 py-2 border border-slate-300 rounded-lg text-sm bg-white font-semibold text-slate-800">
          <option value="">-- Tanlang --</option>
          <option value="A">A - being well-organised</option>
          <option value="B">B - being flexible</option>
          <option value="C">C - working quickly</option>
        </select>
      </div>
      <div class="flex items-center justify-between p-3.5 bg-white border border-slate-200 rounded-xl shadow-xs">
        <span class="text-sm font-semibold text-slate-800"><strong class="ielts-q-badge mr-2">20</strong> Applying makeup</span>
        <select data-qnum="20" name="question_20" class="ielts-inline-select px-3 py-2 border border-slate-300 rounded-lg text-sm bg-white font-semibold text-slate-800">
          <option value="">-- Tanlang --</option>
          <option value="A">A - being well-organised</option>
          <option value="B">B - being flexible</option>
          <option value="C">C - working quickly</option>
        </select>
      </div>
    </div>
  </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/3178722-cambridge-ielts-21-academic-listening-test-1-2.mp3', 'MAN: Hello and welcome to the film making podcast. In this week''s episode, Claire Lemarre talks to us about how to become a makeup artist. Claire''s been working as a makeup artist in the film industry for over 20 years and has lots of useful advice about how to get started.
WOMAN: Thanks Ian. Well, before you can become a makeup artist on films you have to spend about 2 years working as a makeup trainee.
A good place to get your first job would be on a low budget short film. Of course, this means that you''ll be working for free. But it''s often worth it for the experience. Make sure your transport costs are covered - and remember, there''s very unlikely to be any catering provided, so bring plenty of food.
If you''re lucky, you might start out on a big budget film where you''ll get the most useful experience. On productions like this, makeup and hair styling are separate departments - so you won''t need to bring your curling tongs! But you''re likely to get the opportunity to work with a range of age groups, as well as different ethnicities. Doing makeup for special effects is highly specialised, so don''t expect to be offered any practical experience in that.
One problem with working in the makeup department is that it''s a high-pressure environment. There are very few times when you''ll be bored or have nothing to do. It can be stressful but you''ll see that the top makeup artists are very professional - even when they''re having to work with directors who are impatient, or unhappy with the makeup artist''s work. Follow your supervisor''s lead and try to remain calm at all times.
I''ve worked with many very famous actors over the years. At first, I found it overwhelming and could hardly speak. I was so in awe. That''s preferable, by the way, to becoming too excited and asking for selfies. Now meeting the talent is just a normal part of the job and to be honest most actors don''t look that special without all the makeup!
Every makeup trainee will need a makeup kit, which they''ll be expected to have with them at all times. Just the essentials will do for the kinds of tasks you''ll be given - it won''t be anything complicated. It''s worth looking at what the other makeup artists have in their kits - but whatever you do, don''t borrow anything without asking first.
It''s very important to build your portfolio. You should take photos of all the work you do and ideally show the different stages of makeup application if you can. But remember you''ll need to get approval from the makeup designer in charge of the department. As you''ll be sending your portfolio digitally, you won''t need to get photos printed.
So what does a makeup trainee actually do? You need to think about whether you''re the right kind of person to do the job and whether you''d enjoy it. So, to give you some idea, here are some of the things you might be required to do.
You may be asked to help prep an actor ready for makeup. Some actors will arrive having already cleansed and moisturized their skin. But sometimes you''ll need to step in and get this done without wasting any time, otherwise the makeup artist will get behind schedule.
Trainees play a useful role in continuity. It will be your responsibility to take photos, log them digitally and print out a hard copy to put in each actor''s file. This information needs to be kept in good order as a reshoot can mean replicating makeup months later.
General duties mean doing anything from getting the teas and coffees to putting on a wash. Having a positive attitude and being willing to do whatever is asked of you will help you get your next film job.
You won''t be asked to apply makeup to any of the principal cast, only the extras. If there are dozens of extras involved you''ll need to keep up a swift pace and not spend too long on each person. It takes quite a lot of confidence to be able to do this well.
OK now about terms and conditions....', 2)
ON CONFLICT (id) DO UPDATE SET passage_text = EXCLUDED.passage_text, title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(2511, 252, 'single_choice', 'What should trainees always expect to get when working on low budget short films?', '["A", "B", "C"]'::jsonb, 'A', 1, 11),
(2512, 252, 'single_choice', 'According to the speaker, on big budget films trainees may get experience of', '["A", "B", "C"]'::jsonb, 'B', 1, 12),
(2513, 252, 'single_choice', 'The speaker says a problem for makeup artists is', '["A", "B", "C"]'::jsonb, 'A', 1, 13),
(2514, 252, 'single_choice', 'How did the speaker feel when she met famous actors for the first time?', '["A", "B", "C"]'::jsonb, 'A', 1, 14),
(2515, 252, 'single_choice', 'What advice does the speaker give about makeup kits?', '["A", "B", "C"]'::jsonb, 'A', 1, 15),
(2516, 252, 'single_choice', 'What advice does the speaker give about creating a portfolio?', '["A", "B", "C"]'::jsonb, 'C', 1, 16),
(2517, 252, 'single_choice', 'What ability is required for Prepping an actor?', '["A", "B", "C"]'::jsonb, 'C', 1, 17),
(2518, 252, 'single_choice', 'What ability is required for Continuity?', '["A", "B", "C"]'::jsonb, 'A', 1, 18),
(2519, 252, 'single_choice', 'What ability is required for General duties?', '["A", "B", "C"]'::jsonb, 'B', 1, 19),
(2520, 252, 'single_choice', 'What ability is required for Applying makeup?', '["A", "B", "C"]'::jsonb, 'C', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

-- Section 253: Listening Part 3: Ocean Biodiversity Research
INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(253, 25, 'listening', 'Listening Part 3: Ocean Biodiversity Research', '<div class="ielts-reading-container">
  <h2 class="ielts-reading-question-section-heading">Questions 21-22</h2>
  <div class="ielts-reading-question-section-content">
    <p>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</p>
    <div class="ielts-standalone-q mt-3" data-qnum="21">
      <div class="ielts-q-header">
        <strong class="ielts-q-badge">21-22</strong>
        <span class="ielts-q-title">Which TWO features of the lecture on ocean biodiversity had the greatest impact on the students?</span>
      </div>
      <div class="ielts-radio-group">
        <label class="ielts-radio-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" name="question_21_22[]" value="A"><span class="ielts-radio-text"><strong>A</strong> the references to local problems</span></label>
        <label class="ielts-radio-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" name="question_21_22[]" value="B"><span class="ielts-radio-text"><strong>B</strong> the broad focus of the examples</span></label>
        <label class="ielts-radio-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" name="question_21_22[]" value="C"><span class="ielts-radio-text"><strong>C</strong> the practical suggestions for solutions</span></label>
        <label class="ielts-radio-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" name="question_21_22[]" value="D"><span class="ielts-radio-text"><strong>D</strong> the type of issues discussed</span></label>
        <label class="ielts-radio-btn"><input type="checkbox" data-multi-qnums="21,22" data-limit="2" name="question_21_22[]" value="E"><span class="ielts-radio-text"><strong>E</strong> the implications for government policy</span></label>
      </div>
    </div>
  </div>

  <h2 class="ielts-reading-question-section-heading mt-6">Questions 23-24</h2>
  <div class="ielts-reading-question-section-content">
    <p>Choose <strong>TWO</strong> letters, <strong>A-E</strong>.</p>
    <div class="ielts-standalone-q mt-3" data-qnum="23">
      <div class="ielts-q-header">
        <strong class="ielts-q-badge">23-24</strong>
        <span class="ielts-q-title">Which TWO details about the research project particularly impressed the students?</span>
      </div>
      <div class="ielts-radio-group">
        <label class="ielts-radio-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" name="question_23_24[]" value="A"><span class="ielts-radio-text"><strong>A</strong> the team''s previous successes</span></label>
        <label class="ielts-radio-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" name="question_23_24[]" value="B"><span class="ielts-radio-text"><strong>B</strong> its wide geographical scale</span></label>
        <label class="ielts-radio-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" name="question_23_24[]" value="C"><span class="ielts-radio-text"><strong>C</strong> the use of new technology</span></label>
        <label class="ielts-radio-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" name="question_23_24[]" value="D"><span class="ielts-radio-text"><strong>D</strong> the extensive statistical evidence</span></label>
        <label class="ielts-radio-btn"><input type="checkbox" data-multi-qnums="23,24" data-limit="2" name="question_23_24[]" value="E"><span class="ielts-radio-text"><strong>E</strong> the large range of specialists involved</span></label>
      </div>
    </div>
  </div>

  <h2 class="ielts-reading-question-section-heading mt-6">Questions 25-30</h2>
  <div class="ielts-reading-question-section-content">
    <p>What is the students'' opinion of each of the following resources related to ocean biodiversity?</p>
    <p class="text-xs text-slate-500 mb-3">Choose <strong>SIX</strong> answers from the box and write the correct letter, <strong>A-H</strong>, next to Questions 25-30.</p>
    <div class="p-4 bg-slate-50 border border-slate-200 rounded-xl my-3 space-y-1.5 text-sm font-medium">
      <p><strong>A</strong> This is aimed at a very specialist audience.</p>
      <p><strong>B</strong> This is now rather outdated.</p>
      <p><strong>C</strong> This was an effective description of a new danger.</p>
      <p><strong>D</strong> This suggests possible ways to improve the situation.</p>
      <p><strong>E</strong> This does not give a balanced account.</p>
      <p><strong>F</strong> This is too predictable to be useful.</p>
      <p><strong>G</strong> This gives insufficient evidence for its claims.</p>
      <p><strong>H</strong> This gives a clear explanation of the problems.</p>
    </div>
    <div class="space-y-3 mt-4">
      <div class="flex items-center justify-between p-3.5 bg-white border border-slate-200 rounded-xl shadow-xs">
        <span class="text-sm font-semibold text-slate-800"><strong class="ielts-q-badge mr-2">25</strong> Article on invasive lionfish</span>
        <select data-qnum="25" name="question_25" class="ielts-inline-select px-3 py-2 border border-slate-300 rounded-lg text-sm bg-white font-semibold text-slate-800">
          <option value="">-- Tanlang --</option>
          <option value="A">A - aimed at a very specialist audience</option>
          <option value="B">B - now rather outdated</option>
          <option value="C">C - effective description of a new danger</option>
          <option value="D">D - suggests possible ways to improve</option>
          <option value="E">E - does not give a balanced account</option>
          <option value="F">F - too predictable to be useful</option>
          <option value="G">G - gives insufficient evidence for its claims</option>
          <option value="H">H - gives a clear explanation of the problems</option>
        </select>
      </div>
      <div class="flex items-center justify-between p-3.5 bg-white border border-slate-200 rounded-xl shadow-xs">
        <span class="text-sm font-semibold text-slate-800"><strong class="ielts-q-badge mr-2">26</strong> Documentary on microplastics</span>
        <select data-qnum="26" name="question_26" class="ielts-inline-select px-3 py-2 border border-slate-300 rounded-lg text-sm bg-white font-semibold text-slate-800">
          <option value="">-- Tanlang --</option>
          <option value="A">A - aimed at a very specialist audience</option>
          <option value="B">B - now rather outdated</option>
          <option value="C">C - effective description of a new danger</option>
          <option value="D">D - suggests possible ways to improve</option>
          <option value="E">E - does not give a balanced account</option>
          <option value="F">F - too predictable to be useful</option>
          <option value="G">G - gives insufficient evidence for its claims</option>
          <option value="H">H - gives a clear explanation of the problems</option>
        </select>
      </div>
      <div class="flex items-center justify-between p-3.5 bg-white border border-slate-200 rounded-xl shadow-xs">
        <span class="text-sm font-semibold text-slate-800"><strong class="ielts-q-badge mr-2">27</strong> Podcast on ocean pollution</span>
        <select data-qnum="27" name="question_27" class="ielts-inline-select px-3 py-2 border border-slate-300 rounded-lg text-sm bg-white font-semibold text-slate-800">
          <option value="">-- Tanlang --</option>
          <option value="A">A - aimed at a very specialist audience</option>
          <option value="B">B - now rather outdated</option>
          <option value="C">C - effective description of a new danger</option>
          <option value="D">D - suggests possible ways to improve</option>
          <option value="E">E - does not give a balanced account</option>
          <option value="F">F - too predictable to be useful</option>
          <option value="G">G - gives insufficient evidence for its claims</option>
          <option value="H">H - gives a clear explanation of the problems</option>
        </select>
      </div>
      <div class="flex items-center justify-between p-3.5 bg-white border border-slate-200 rounded-xl shadow-xs">
        <span class="text-sm font-semibold text-slate-800"><strong class="ielts-q-badge mr-2">28</strong> Book on coastal ecosystems</span>
        <select data-qnum="28" name="question_28" class="ielts-inline-select px-3 py-2 border border-slate-300 rounded-lg text-sm bg-white font-semibold text-slate-800">
          <option value="">-- Tanlang --</option>
          <option value="A">A - aimed at a very specialist audience</option>
          <option value="B">B - now rather outdated</option>
          <option value="C">C - effective description of a new danger</option>
          <option value="D">D - suggests possible ways to improve</option>
          <option value="E">E - does not give a balanced account</option>
          <option value="F">F - too predictable to be useful</option>
          <option value="G">G - gives insufficient evidence for its claims</option>
          <option value="H">H - gives a clear explanation of the problems</option>
        </select>
      </div>
      <div class="flex items-center justify-between p-3.5 bg-white border border-slate-200 rounded-xl shadow-xs">
        <span class="text-sm font-semibold text-slate-800"><strong class="ielts-q-badge mr-2">29</strong> Article on metal toxicity</span>
        <select data-qnum="29" name="question_29" class="ielts-inline-select px-3 py-2 border border-slate-300 rounded-lg text-sm bg-white font-semibold text-slate-800">
          <option value="">-- Tanlang --</option>
          <option value="A">A - aimed at a very specialist audience</option>
          <option value="B">B - now rather outdated</option>
          <option value="C">C - effective description of a new danger</option>
          <option value="D">D - suggests possible ways to improve</option>
          <option value="E">E - does not give a balanced account</option>
          <option value="F">F - too predictable to be useful</option>
          <option value="G">G - gives insufficient evidence for its claims</option>
          <option value="H">H - gives a clear explanation of the problems</option>
        </select>
      </div>
      <div class="flex items-center justify-between p-3.5 bg-white border border-slate-200 rounded-xl shadow-xs">
        <span class="text-sm font-semibold text-slate-800"><strong class="ielts-q-badge mr-2">30</strong> Podcast on floating marine cities</span>
        <select data-qnum="30" name="question_30" class="ielts-inline-select px-3 py-2 border border-slate-300 rounded-lg text-sm bg-white font-semibold text-slate-800">
          <option value="">-- Tanlang --</option>
          <option value="A">A - aimed at a very specialist audience</option>
          <option value="B">B - now rather outdated</option>
          <option value="C">C - effective description of a new danger</option>
          <option value="D">D - suggests possible ways to improve</option>
          <option value="E">E - does not give a balanced account</option>
          <option value="F">F - too predictable to be useful</option>
          <option value="G">G - gives insufficient evidence for its claims</option>
          <option value="H">H - gives a clear explanation of the problems</option>
        </select>
      </div>
    </div>
  </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/3178721-cambridge-ielts-21-academic-listening-test-1-3.mp3', 'PHIL: That lecture from the visiting speaker yesterday was good, wasn''t it?
LUCY: Yeah. I learned a lot from her about ocean biodiversity. I''ve already done some reading on it, and I did an assignment on some of the problems associated with it last year, but I especially liked the way her lecture focused on more long-term issues.
PHIL: Yes, things that aren''t currently receiving widespread attention but are likely to be important in the future. That impressed me too. It wasn''t exactly a feel-good conclusion because it''s hard to see any real solution for a lot of the problems.
LUCY: No, though she did point to where policy changes could be made to protect our marine and coastal environments.
PHIL: Mm. But that''s just at a national level. The examples she gave were at a more global level, and they really made it clear to me just how wide-ranging the threats to ocean biodiversity are.
LUCY: Yes, me too.
PHIL: The research project she described was impressive, wasn''t it? I''d have thought it was quite unusual to have so many experts working together.
LUCY: Yeah, and from such different backgrounds. Must have been a really exciting team to work with. I''d heard of a couple of them before - they were involved in research way back in 2009 warning about the dangers of ocean pollution.
PHIL: But now people are much more aware of that, aren''t they?
LUCY: I suppose so.
PHIL: Another thing about the research is that the team members came from all round the world. Though I suppose that''s not unusual nowadays, now everyone can work remotely.
LUCY: Right. I liked the way she didn''t bombard us with figures - I mean, they were available, but she focused more on the general points they indicated.
PHIL: Mm. And the description of improvements in systems used for tracking marine animals and things like robots were really interesting.
LUCY: Yes, and her description of how robotics can be used to investigate threats to biodiversity.
PHIL: Absolutely.
PHIL: While you''re here, can we talk about the list of resources we have to evaluate for the seminar tomorrow. I''ve had a look at them all, but it''s been a bit of a rush.
LUCY: Yeah. What did you think of that article on invasive lionfish? The one claiming they were expanding their habitat throughout the Mediterranean Sea.
PHIL: Well, the writer went on about how dangerous they were in environmental terms, which is probably true, but he didn''t really provide much information to explain why.
LUCY: I know what you mean.
PHIL: I watched the documentary on microplastics, at least I started to, but then I found it was made ten years ago so I gave up.
LUCY: I watched to the end but you''re right, it was showing its age. People had hardly heard of microplastics then, whereas now everyone knows about them and how dangerous they are.
PHIL: Yeah. Did you listen to the podcast on ocean pollution?
LUCY: Mm. I didn''t get anything out of it though. Most of it was stating the obvious.
PHIL: Yes, it mentioned pesticides and plastic and things, and it clearly made the point that they were a bad thing, but everybody knows that anyway. Did you read that book on coastal ecosystems?
LUCY: The one by John Harper? Yes, I found it hard going at first, it went into a lot of detail about things like the effects of offshore windfarms and fish farms, but actually I ended up with a much better understanding of the issues.
PHIL: Yes, I agree and I thought it was a well-written summary of those. And the diagrams helped a lot too.
LUCY: The article on metal toxicity was way above my head, I didn''t know anything about how metals from industrial emissions react in the ocean... and I still don''t understand it.
PHIL: I gave up reading after the first chapter - I just couldn''t follow it.
LUCY: That podcast on floating marine cities was interesting, though it presented a rather one-sided picture, I thought.
PHIL: Yes, it focused on how this would benefit people and ignored the effects on the environment.
LUCY: But anyway, shall we ...', 3)
ON CONFLICT (id) DO UPDATE SET passage_text = EXCLUDED.passage_text, title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(2521, 253, 'single_choice', 'Which TWO features of the lecture on ocean biodiversity had the greatest impact on the students? (Answer 1)', '["A", "B", "C", "D", "E"]'::jsonb, 'B|D', 1, 21),
(2522, 253, 'single_choice', 'Which TWO features of the lecture on ocean biodiversity had the greatest impact on the students? (Answer 2)', '["A", "B", "C", "D", "E"]'::jsonb, 'D|B', 1, 22),
(2523, 253, 'single_choice', 'Which TWO details about the research project particularly impressed the students? (Answer 1)', '["A", "B", "C", "D", "E"]'::jsonb, 'C|E', 1, 23),
(2524, 253, 'single_choice', 'Which TWO details about the research project particularly impressed the students? (Answer 2)', '["A", "B", "C", "D", "E"]'::jsonb, 'E|C', 1, 24),
(2525, 253, 'single_choice', 'What is the students'' opinion of Article on invasive lionfish?', '["A", "B", "C", "D", "E", "F", "G", "H"]'::jsonb, 'G', 1, 25),
(2526, 253, 'single_choice', 'What is the students'' opinion of Documentary on microplastics?', '["A", "B", "C", "D", "E", "F", "G", "H"]'::jsonb, 'B', 1, 26),
(2527, 253, 'single_choice', 'What is the students'' opinion of Podcast on ocean pollution?', '["A", "B", "C", "D", "E", "F", "G", "H"]'::jsonb, 'F', 1, 27),
(2528, 253, 'single_choice', 'What is the students'' opinion of Book on coastal ecosystems?', '["A", "B", "C", "D", "E", "F", "G", "H"]'::jsonb, 'H', 1, 28),
(2529, 253, 'single_choice', 'What is the students'' opinion of Article on metal toxicity?', '["A", "B", "C", "D", "E", "F", "G", "H"]'::jsonb, 'A', 1, 29),
(2530, 253, 'single_choice', 'What is the students'' opinion of Podcast on floating marine cities?', '["A", "B", "C", "D", "E", "F", "G", "H"]'::jsonb, 'E', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;

-- Section 254: Listening Part 4: The Importance of Rubber
INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(254, 25, 'listening', 'Listening Part 4: The Importance of Rubber', '<div class="ielts-reading-container">
  <h2 class="ielts-reading-question-section-heading">Questions 31-40</h2>
  <div class="ielts-reading-question-section-content">
    <div class="ielts-reading-section-content-wrapper">
      <p><strong>Complete the notes below.</strong></p>
      <p class="text-xs text-slate-500 mb-3">Write <strong>ONE WORD ONLY</strong> for each answer.</p>

      <div class="p-4 bg-slate-50 border border-slate-200 rounded-xl my-4 space-y-4 text-sm leading-relaxed">
        <h3 class="text-base font-bold text-slate-900 border-b pb-2">Sources of rubber</h3>

        <div>
          <p class="font-semibold text-slate-800 mb-2">Three resources which are essential for industrial civilisation</p>
          <ul class="list-disc pl-5 space-y-1.5 text-slate-700">
            <li><span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">31</strong><input type="text" data-qnum="31" name="question_31" class="ielts-inline-input" placeholder="[31] javob..." autocomplete="off" spellcheck="false"></span></span></li>
            <li>fossil fuels</li>
            <li>rubber</li>
          </ul>
        </div>

        <div>
          <p class="font-semibold text-slate-800 mb-1">Natural rubber</p>
          <p class="text-slate-600 mb-2">This mainly comes from the Pará rubber tree, now cultivated in South-East Asia.</p>
          <p class="text-slate-800 font-medium mb-1">The supply is limited because</p>
          <ul class="list-disc pl-5 space-y-1.5 text-slate-700">
            <li>the growth of the tree is <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">32</strong><input type="text" data-qnum="32" name="question_32" class="ielts-inline-input" placeholder="[32] javob..." autocomplete="off" spellcheck="false"></span></span> .</li>
            <li>production cannot easily be adjusted because of increasing or decreasing <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">33</strong><input type="text" data-qnum="33" name="question_33" class="ielts-inline-input" placeholder="[33] javob..." autocomplete="off" spellcheck="false"></span></span> .</li>
            <li>the tree only grows near the <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">34</strong><input type="text" data-qnum="34" name="question_34" class="ielts-inline-input" placeholder="[34] javob..." autocomplete="off" spellcheck="false"></span></span> .</li>
            <li>extracting the latex (rubber) is labour-intensive</li>
            <li>it is very difficult to <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">35</strong><input type="text" data-qnum="35" name="question_35" class="ielts-inline-input" placeholder="[35] javob..." autocomplete="off" spellcheck="false"></span></span> rubber after production.</li>
          </ul>
        </div>

        <div>
          <p class="font-semibold text-slate-800 mb-1">New threats include</p>
          <ul class="list-disc pl-5 space-y-1.5 text-slate-700">
            <li>lack of genetic diversity, leading to danger of disease caused by a <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">36</strong><input type="text" data-qnum="36" name="question_36" class="ielts-inline-input" placeholder="[36] javob..." autocomplete="off" spellcheck="false"></span></span> .</li>
            <li>a shift to the cultivation of palm oil</li>
            <li>extreme <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">37</strong><input type="text" data-qnum="37" name="question_37" class="ielts-inline-input" placeholder="[37] javob..." autocomplete="off" spellcheck="false"></span></span> events.</li>
          </ul>
        </div>

        <div>
          <p class="font-semibold text-slate-800 mb-1">Synthetic rubber</p>
          <ul class="list-disc pl-5 space-y-1.5 text-slate-700">
            <li>may be used for engine parts and cooking utensils</li>
            <li>is less <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">38</strong><input type="text" data-qnum="38" name="question_38" class="ielts-inline-input" placeholder="[38] javob..." autocomplete="off" spellcheck="false"></span></span> than natural rubber</li>
            <li>is unsuitable for many purposes e.g. the tyres of aircraft.</li>
          </ul>
        </div>

        <div>
          <p class="font-semibold text-slate-800 mb-1">An alternative source of natural rubber</p>
          <ul class="list-disc pl-5 space-y-1.5 text-slate-700">
            <li>A wild flower (a type of dandelion) has rubber in its <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">39</strong><input type="text" data-qnum="39" name="question_39" class="ielts-inline-input" placeholder="[39] javob..." autocomplete="off" spellcheck="false"></span></span> .</li>
            <li>It can be grown in many locations and does not require good <span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">40</strong><input type="text" data-qnum="40" name="question_40" class="ielts-inline-input" placeholder="[40] javob..." autocomplete="off" spellcheck="false"></span></span> .</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>', 'https://ielts-listening-audio.engnovatemedia.com/3178719-cambridge-ielts-21-academic-listening-test-1-4.mp3', 'Much of the world now lives in an industrial civilisation. But this has only become possible because we have the necessary natural resources. There are three types of natural resource without which industry could not exist. One of these is metal - without that we''d have no machines and no transportation. Another is fossil fuels, which we need to power those machines. But there''s a third resource that''s essential to connect the different parts of a machine together with belts and pipes and shock absorbers, and that is rubber. It''s now used in over 40,000 products, from waterproof footwear to surgical gloves.
At present, we have two types of rubber in common use. One is natural rubber, which nearly all comes from the Pará rubber tree. This was originally native to Brazil, but is now cultivated on plantations in South-East Asia. Recently, however, concern''s been growing that supplies may soon be insufficient for the world''s needs. So what exactly is limiting the supply of natural rubber?
Well, for one thing, rubber trees don''t just spring up overnight. It can take eight to ten years for a tree to start producing rubber, so cultivating them''s a slow process. And this leads to another problem. With most crops, farmers don''t have to think very far ahead, so they can easily change what crop they produce, or how much of a crop they produce, if they find the demand for that crop is rising or falling. But if you have to plant eight or ten years ahead, that''s much harder. And also the rubber tree''s very choosy about where it grows. It needs the right temperature, the right amount of rainfall, and the right altitude - not too high and not too low. The result is that it can''t be grown in the northern or southern parts of the globe, only around the equator. Another problem is that the rubber is basically extracted in the same way as it''s been done for hundreds of years, and that''s by hand, by making small cuts in the trunk of the tree, and putting a little cup there to catch the latex, as the rubber is called. It''s very labour-intensive. And it''s not just the initial production that''s limiting supplies. With other resources such as water and glass, when we''ve finished using them we can recycle them, but although this is also possible with rubber, it''s very difficult, so that also reduces the amount we have available.
And in the last few years, there have been new threats to the supply of natural rubber. One problem is linked to the fact that nearly all the rubber trees in South-East Asia are descended from just a small number of seeds brought from Brazil in the nineteenth century. This means that there''s very little genetic diversity among the trees, which in turn makes them very vulnerable to disease. The most dangerous threat is a fungus, which destroyed large numbers of rubber trees in Brazil, and which could cause devastation to plantations worldwide. Another problem is that farmers in South-East Asia are increasingly turning to the cultivation of palm oil, which is easier and more profitable for them. And finally, in recent years South-East Asia, like other parts of the world, has been repeatedly hit by extreme types of weather, and this looks likely to continue in the future.
However, as well as using natural rubber, it''s also possible to make rubber synthetically. This works very well for some purposes, for example, making engine parts, or silicone pots and pans used for cooking. But compared with natural rubber, it''s not anything like as strong, and this means it can''t replace natural rubber in other products. For example, while a mixture of natural rubber and synthetic rubber works well in car tyres, only natural rubber can stand up to the extreme speeds of aircraft tyres during take-off and landing.
So for some time, scientists have been looking for alternative sources of natural rubber. One that''s been known about for some time seems initially to be a rather unlikely source. It''s a wild plant with yellow flowers that we normally regard as a weed when we see it in our gardens. But when it''s pulled up and its roots cut open, they''re found to contain rubber.
Now, compared to the rubber tree, dandelions produce relatively small amounts of rubber, but unlike rubber trees, they''re very adaptable. They''ll grow in all sorts of places, and they don''t need rich soil. So at present there are several projects underway investigating the possibility of using dandelions as a source of rubber.
Another possibility is a desert shrub grown in Mexico and Texas ...', 4)
ON CONFLICT (id) DO UPDATE SET passage_text = EXCLUDED.passage_text, title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(2531, 254, 'text_input', 'Three resources which are essential for industrial civilisation: 31 ...', '[]'::jsonb, 'metal', 1, 31),
(2532, 254, 'text_input', 'The supply is limited because the growth of the tree is 32 ...', '[]'::jsonb, 'slow', 1, 32),
(2533, 254, 'text_input', 'production cannot easily be adjusted because of increasing or decreasing 33 ...', '[]'::jsonb, 'demand', 1, 33),
(2534, 254, 'text_input', 'the tree only grows near the 34 ...', '[]'::jsonb, 'equator', 1, 34),
(2535, 254, 'text_input', 'it is very difficult to 35 ... rubber after production.', '[]'::jsonb, 'recycle', 1, 35),
(2536, 254, 'text_input', 'lack of genetic diversity, leading to danger of disease caused by a 36 ...', '[]'::jsonb, 'fungus', 1, 36),
(2537, 254, 'text_input', 'extreme 37 ... events.', '[]'::jsonb, 'weather', 1, 37),
(2538, 254, 'text_input', 'Synthetic rubber is less 38 ... than natural rubber', '[]'::jsonb, 'strong', 1, 38),
(2539, 254, 'text_input', 'A wild flower (a type of dandelion) has rubber in its 39 ...', '[]'::jsonb, 'roots|root', 1, 39),
(2540, 254, 'text_input', 'It can be grown in many locations and does not require good 40 ...', '[]'::jsonb, 'soil', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;
