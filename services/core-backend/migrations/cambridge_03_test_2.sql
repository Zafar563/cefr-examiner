-- Seed Cambridge IELTS 03 Academic Reading Test 2
INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES
(2, 'Cambridge IELTS 03 Academic Reading Test 2', 'Rasmiy Cambridge IELTS 3 to''plamidan olingan to''liq 3 ta qism (Passage 1: A Remarkable Beetle, Passage 2: Environmental Management, Passage 3: Role Theory) va 40 ta savoldan iborat akademik Reading imtihoni.', 'Multi-level (A1-C1)', 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

-- Section 1: Reading Passage 1: A Remarkable Beetle
INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(10, 2, 'reading', 'Reading Passage 1: A Remarkable Beetle', 'You should spend about 20 minutes on Questions 1-13, which are based on Reading Passage 1 below.', NULL, 'You should spend about 20 minutes on Questions 1-13 which are based on Reading Passage 1 below.

A Remarkable Beetle

Some of the most remarkable beetles are the dung beetles, which spend almost their whole lives eating and breeding in dung.

More than 4,000 species of these remarkable creatures have evolved and adapted to the world''s different climates and the dung of its many animals. Australia''s native dung beetles are scrub and woodland dwellers, specialising in coarse marsupial droppings and avoiding the soft cattle dung in which bush flies and buffalo flies breed.

In the early 1960s George Bornemissza, then a scientist at the Australian Government''s premier research organisation, the Commonwealth Scientific and Industrial Research Organisation (CSIRO), suggested that dung beetles should be introduced to Australia to control dung-breeding flies. Between 1968 and 1982, the CSIRO imported insects from about 50 different species of dung beetle, from Asia, Europe and Africa, aiming to match them to different climatic zones in Australia. Of the 26 species that are known to have become successfully integrated into the local environment, only one, an African species released in northern Australia, has reached its natural boundary.

Introducing dung beetles into a pasture is a simple process: approximately 1,500 beetles are released, a handful at a time, into fresh cow pats in the cow pasture. The beetles immediately disappear beneath the pats digging and tunnelling and, if they successfully adapt to their new environment, soon become a permanent, self sustaining part of the local ecology. In time they multiply and within three or four years the benefits to the pasture are obvious.

Dung beetles work from the inside of the pat so they are sheltered from predators such as birds and foxes. Most species burrow into the soil and bury dung in tunnels directly underneath the pats, which are hollowed out from within. Some large species originating from France excavate tunnels to a depth of approximately 30 cm below the dung pat. These beetles make sausage-shaped brood chambers along the tunnels. The shallowest tunnels belong to a much smaller Spanish species that buries dung in chambers that hang like fruit from the branches of a pear tree. South African beetles dig narrow tunnels of approximately 20 cm below the surface of the pat. Some surface-dwelling beetles, including a South African species, cut perfectly-shaped balls from the pat, which are rolled away and attached to the bases of plants.

For maximum dung burial in spring, summer and autumn, farmers require a variety of species with overlapping periods of activity. In the cooler environments of the state of Victoria, the large French species (2.5 cms long) is matched with smaller (half this size), temperate-climate Spanish species. The former are slow to recover from the winter cold and produce only one or two generations of offspring from late spring until autumn. The latter, which multiply rapidly in early spring, produce two to five generations annually. The South African ball-rolling species, being a subtropical beetle, prefers the climate of northern and coastal New South Wales where it commonly works with the South African tunnelling species. In warmer climates, many species are active for longer periods of the year.

Dung beetles were initially introduced in the late 1960s with a view to controlling buffalo flies by removing the dung within a day or two and so preventing flies from breeding. However, other benefits have become evident. Once the beetle larvae have finished pupation, the residue is a first-rate source of fertiliser. The tunnels abandoned by the beetles provide excellent aeration and water channels for root systems. In addition, when the new generation of beetles has left the nest the abandoned burrows are an attractive habitat for soil-enriching earthworms. The digested dung in these burrows is an excellent food supply for the earthworms, which decompose it further to provide essential soil nutrients. If it were not for the dung beetle, chemical fertiliser and dung would be washed by rain into streams and rivers before it could be absorbed into the hard earth, polluting water courses and causing blooms of blue-green algae. Without the beetles to dispose of the dung, cow pats would litter pastures making grass inedible to cattle and depriving the soil of sunlight. Australia''s 30 million cattle each produce 10-12 cow pats a day. This amounts to 1.7 billion tonnes a year, enough to smother about 110,000 sq km of pasture, half the area of Victoria.

Dung beetles have become an integral part of the successful management of dairy farms in Australia over the past few decades. A number of species are available from the CSIRO or through a small number of private breeders, most of whom were entomologists with the CSIRO''s dung beetle unit who have taken their specialised knowledge of the insect and opened small businesses in direct competition with their former employer.

Glossary

1. dung: the droppings or excreta of animals

2. cow pats: droppings of cows', 1)
ON CONFLICT (id) DO UPDATE SET passage_text = EXCLUDED.passage_text, title = EXCLUDED.title;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(101, 10, 'single_choice', 'Bush flies are easier to control than buffalo flies.', '["YES", "NO", "NOT GIVEN"]'::jsonb, 'NOT GIVEN', 1, 1)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(102, 10, 'single_choice', 'Four thousand species of dung beetle were initially brought to Australia by the CSIRO.', '["YES", "NO", "NOT GIVEN"]'::jsonb, 'NO', 1, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(103, 10, 'single_choice', 'Dung beetles were brought to Australia by the CSIRO over a fourteen-year period.', '["YES", "NO", "NOT GIVEN"]'::jsonb, 'YES', 1, 3)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(104, 10, 'single_choice', 'At least twenty-six of the introduced species have become established in Australia.', '["YES", "NO", "NOT GIVEN"]'::jsonb, 'YES', 1, 4)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(105, 10, 'single_choice', 'The dung beetles cause an immediate improvement to the quality of a cow pasture.', '["YES", "NO", "NOT GIVEN"]'::jsonb, 'NO', 1, 5)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(106, 10, 'text_input', 'Question 6: Label the tunnel for species (from Diagram)', '[]'::jsonb, 'South African', 1, 6)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(107, 10, 'text_input', 'Question 7: Label the tunnel for species (from Diagram)', '[]'::jsonb, 'French', 1, 7)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(108, 10, 'text_input', 'Question 8: Label the tunnel for species (from Diagram)', '[]'::jsonb, 'Spanish', 1, 8)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(109, 10, 'text_input', 'Question 9: Complete the table detail', '[]'::jsonb, 'temperate', 1, 9)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(110, 10, 'text_input', 'Question 10: Complete the table detail', '[]'::jsonb, 'early spring', 1, 10)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(111, 10, 'text_input', 'South African ball roller', '[]'::jsonb, '2-5', 1, 11)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(112, 10, 'text_input', 'Question 12: Complete the table detail', '[]'::jsonb, 'sub-tropical', 1, 12)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(113, 10, 'text_input', 'Question 13: Complete the table detail', '[]'::jsonb, 'South African', 1, 13)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

-- Section 2: Reading Passage 2: Environmental Management
INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(11, 2, 'reading', 'Reading Passage 2: Environmental Management', 'You should spend about 20 minutes on Questions 14-28, which are based on Reading Passage 2 below.', NULL, 'You should spend about 20 minutes on Questions 14-28 which are based on Reading Passage 2 on the following pages.

READING PASSAGE 2

Section A

The role of governments in environmental management is difficult but inescapable. Sometimes, the state tries to manage the resources it owns, and does so badly. Often, however, governments act in an even more harmful way. They actually subsidise the exploitation and consumption of natural resources. A whole range of policies, from farm price support to protection for coal-mining, do environmental damage and (often) make no economic sense. Scrapping them offers a two-fold bonus: a cleaner environment and a more efficient economy. Growth and environmentalism can actually go hand in hand, if politicians have the courage to confront the vested interest that subsi-dies create.

Section B

No activity affects more of the earth''s surface than farming. It shapes a third of the planet''s land area, not counting Antarctica, and the proportion Is rising. World food output per head has risen by 4 per cent between the 1970s and 1980s mainly as a result of increases in yields from land already in cultivation, but also because more land has been brought under the plough. Higher yields have been achieved by increased irrigation, better crop breeding, and a doubling in the use of pesticides and chemical fertilisers in the 1970s and 1980s.

Section C

All these activities may have damaging environmental impacts. For example, land clearing for agriculture is the largest single cause of deforestation; chemical fertilisers and pesticides may contaminate water supplies; more intensive farming and the abandonment of fallow periods tend to exacerbate soil erosion; and the spread of mono-Culture and use of high-yielding varieties of crops have been accompanied by the disappearance of old varieties of food plants which might have provided some insurance against pests or diseases in future. Soil erosion threatens the productivity of land In both rich and poor countries. The United States, where the most careful measurements have been done, discovered in 1982 that about one-fifth of its farmland as losing topsoil at a rate likely to diminish the soil''s productivity. The country subse-uently embarked upon a program to convert 11 per cent of its cropped land to meadow or forest. Topsoil in India and China is vanishing much faster than in America.

Section D

Government policies have frequently compounded the environmental damage that farming can cause. In the rich countries, subsidies for growing crops and price supports for farm output drive up the price of land.The annual value of these subsidies is immense: about $250 billion, or more than all World Bank lending in the 1980s.To increase the output of crops per acre, a farmer''s easiest option is to use more of the most readily available inputs: fertilisers and pesticides. Fertiliser use doubled in Denmark in the period 1960-1985 and increased in The Netherlands by 150 per cent. The quantity of pesticides applied has risen too; by 69 per cent In 1975-1984 in Denmark, for example, with a rise of 115 per cent in the frequency of application in the three years from 1981.

In the late 1980s and early 1990s some efforts were made to reduce farm subsidies. The most dramatic example was that of New Zealand, which scrapped most farm support in 1984. A study of the environmental effects, conducted in 1993, found that the end of fertiliser subsidies had been followed by a fall in fertiliser use (a fall compounded by the decline in world commodity prices, which cut farm incomes). The removal of subsidies also stopped land-clearing and over-stocking, which in the past had been the principal causes of erosion. Farms began to diversify. The one kind of subsidy whose removal appeared to have been bad for the environment was the subsidy to manage soil eroslon,

In less enlightened countries, and in the European Union, the trend has been to reduce rather than eliminate subsidies, and to introduce new payments to encourage farmers to treat their land In environmentally friendlier ways, or to leave it follow. It may sound strange but such payments need to be higher than the existing incentives for farmers to grow food crops. Farmers, however, dislike being paid to do nothing. In several countries they have become interested in the possibility of using fuel produced from crop residues either as a replacement for petrol (as ethanol) or as fuel for power stations (as biomass). Such fuels produce far less carbon dioxide than coal or oil, and absorb carbon dioxide as they grow.They are therefore less likely to contribute to the greenhouse effect. But they die rarely competitive with fossil fuels unless subsidised - and growing them does no less environmental harm than other crops.

Section E

In poor countries, governments aggravate other sorts of damage. Subsidies for pesticides and artificial fertilisers encourage farmers to use greater quantities than are needed to get the highest economic crop yield. A study by the International Rice Research Institute Of pesticide use by farmers in South East Asia found that, with pest-resistant varieties of rice, even moderate applications of pesticide frequently cost farmers more than they saved.Such waste puts farmers on a chemical treadmill: bugs and weeds become resis-tant to poisons, so next year''s poisons must be more lethal. One cost is to human health, Every year some 10,000 people die from pesticide poisoning, almost all of them in the developing countries, and another 400,000 become seriously ill. As for artificial fertilisers, their use world-wide increased by 40 per cent per unit of farmed land between the mid 1970s and late 1980s, mostly in the developing countries. Overuse of fertilisers may cause farmers to stop rotating crops or leaving their land fallow. That, In turn, may make soil erosion worse.

Section F

A result of the Uruguay Round of world trade negotiations Is likely to be a reduction of 36 per cent In the average levels of farm subsidies paid by the rich countries in 1986-1990. Some of the world''s food production will move from Western Europe to regions where subsidies are lower or non-existent, such as the former communist countries and parts of the developing world. Some environmentalists worry about this outcome. It wiB undoubtedly mean more pressure to convert natural habitat into farmland. But it will also have many desirable environmental effects. The intensity of farming in the rich world should decline, and the use of chemical inputs will diminish. Crops are more likely to be grown p the environments to which they are naturally suited. And more farmers in poor coun-tries wilt have the money and the incentive to manage their land in ways that are sustainable in the long run. That is important. To feed an increasingly hungry world, farmers need every incentive to use their soil and water effectively and efficiently.', 2)
ON CONFLICT (id) DO UPDATE SET passage_text = EXCLUDED.passage_text, title = EXCLUDED.title;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(114, 11, 'single_choice', 'Section A', '["i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix", "x"]'::jsonb, 'viii', 1, 14)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(115, 11, 'single_choice', 'Section B', '["i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix", "x"]'::jsonb, 'ii', 1, 15)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(116, 11, 'single_choice', 'Section C', '["i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix", "x"]'::jsonb, 'iv', 1, 16)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(117, 11, 'single_choice', 'Section D', '["i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix", "x"]'::jsonb, 'ix', 1, 17)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(118, 11, 'single_choice', 'Section F', '["i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix", "x"]'::jsonb, 'vii', 1, 18)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(119, 11, 'text_input', 'Drop answer here Deforestation', '[]'::jsonb, 'not given', 1, 19)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(120, 11, 'text_input', 'Drop answer here Degraded water supply More intensive farming', '[]'::jsonb, 'the wealthy', 1, 20)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(121, 11, 'single_choice', 'Drop answer here Expansion of monoculture', '["A", "B", "C", "D", "E", "F", "G"]'::jsonb, 'F', 1, 21)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(122, 11, 'single_choice', 'Drop answer here Drag and drop an option to fill in each blank. A. Abandonment of fallow period B. Disappearance of old plant varieties C. Increased use of chemical inputs D. Increased irrigation E. Insurance against pests and diseases F. Soil erosion G. Clearing land for cultivation', '["A", "B", "C", "D", "E", "F", "G"]'::jsonb, 'B', 1, 22)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(123, 11, 'single_choice', 'Research completed in 1982 found that in the United States soil erosion', '["reduced the productivity of farmland by 20 per cent.", "was almost as severe as in India and China.", "was causing significant damage to 20 per cent of farmland.", "could be reduced by converting cultivated land to meadow or forest."]'::jsonb, 'was causing significant damage to 20 per cent of farmland.', 1, 23)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(124, 11, 'single_choice', 'By the mid-1980s, farmers in Denmark', '["used 50 per cent less fertiliser than Dutch farmers.", "used twice as much fertiliser as they had in 1960.", "applied fertiliser much more frequently than in 1960.", "more than doubled the amount of pesticide they used in just 3 years."]'::jsonb, 'used twice as much fertiliser as they had in 1960.', 1, 24)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(125, 11, 'single_choice', 'Which one of the following increased in New Zealand after 1984?', '["farm incomes", "use of fertiliser", "over-stocking", "farm diversification"]'::jsonb, 'farm diversification', 1, 25)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(126, 11, 'single_choice', 'The writer refers to some rich countries as being ''less enlightened'' than New Zealand because', '["they disapprove of paying farmers for not cultivating the land.", "their new fuel crops are as harmful as the ones they have replaced.", "their policies do not recognise the long-term benefit of ending subsidies.", "they have not encouraged their farmers to follow environmentally friendly practices."]'::jsonb, 'their policies do not recognise the long term benefit of ending subsidies', 1, 26)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(127, 11, 'single_choice', 'The writer believes that the Uruguay Round agreements on trade will', '["encourage more sustainable farming practices in the long term.", "do more harm than good to the international environment.", "increase pressure to cultivate land in the rich countries.", "be more beneficial to rich than to poor countries."]'::jsonb, 'encourage more sustainable farming practices in the long term.', 1, 27)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(128, 11, 'single_choice', 'From the list below choose the most suitable title for Reading Passage 2.', '["Environmental management", "Increasing the world&#039;s food supply", "Soil erosion", "Fertilisers and pesticides - the way forward", "Farm subsidies"]'::jsonb, 'Environmental management', 1, 28)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

-- Section 3: Reading Passage 3: The Concept of Role Theory
INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES
(12, 2, 'reading', 'Reading Passage 3: The Concept of Role Theory', 'You should spend about 20 minutes on Questions 29-40, which are based on Reading Passage 3 below.', NULL, 'You should spend about 20 minutes on Questions 29–40 which are based on Reading Passage 3 below.

THE CONCEPT OF ROLE THEORY

Role set

Any individual in any situation occupies a role in relation to other people. The particular individual with whom one is concerned in the analysis of any situation is usually given the name of focal person. He has the focal role and can be regarded as sitting in the middle of a group of people, with whom he interacts in some way in that situation. This group of people is called his role set. For instance, in the family situation, an individual''s role set might be shown as in Figure 6.



The role set should include all those with whom the individual has more than trivial interactions.

Role definition

The definition of any individual''s role in any situation will be a combination of the role expectations that the members of the role set have of the focal role. These expectations are often occupationally denned, sometimes even legally so. The role definitions of lawyers and doctors are fairly clearly defined both in legal and in cultural terms. The role definitions of, say, a film star or bank manager, are also fairly clearly defined in cultural terms, too clearly perhaps.

Individuals often find it hard to escape from the role that cultural traditions have defined for them. Not only with doctors or lawyers is the required role behaviour so constrained that if you are in that role for long it eventually becomes part of you, part of your personality. Hence, there is some likelihood that all accountants will be alike or that all blondes are similar - they are forced that way by the expectations of their role.

It is often important that you make it clear what your particular role is at a given time. The means of doing this are called, rather obviously, role signs. The simplest of role signs is a uniform. The number of stripes on your arm or pips on your shoulder is a very precise role definition which allows you to do certain very prescribed things in certain situations. Imagine yourself questioning a stranger on a dark street at midnight without wearing the role signs of a policeman!

In social circumstances, dress has often been used as a role sign to indicate the nature and degree of formality of any gathering and occasionally the social status of people present. The current trend towards blurring these role signs in dress is probably democratic, but it also makes some people very insecure. Without role signs, who is to know who has what role?

Place is another role sign. Managers often behave very differently outside the office and in it, even to the same person. They use a change of location to indicate a change in role from, say, boss to friend. Indeed, if you wish to change your roles you must find some outward sign that you are doing so or you won''t be permitted to change - the subordinate will continue to hear you as his boss no matter how hard you try to be his friend. In very significant cases of role change, e.g. from a soldier in the ranks to officer, from bachelor to married man, the change of role has to have a very obvious sign, hence rituals. It is interesting to observe, for instance, some decline in the emphasis given to marriage rituals. This could be taken as an indication that there is no longer such a big change in role from single to married person, and therefore no need for a public change in sign.

In organisations, office signs and furniture are often used as role signs. These and other perquisites of status are often frowned upon, but they may serve a purpose as a kind of uniform in a democratic society; roles without signs often lead to confused or differing expectations of the role of the focal person.

Role ambiguity

Role ambiguity results when there is some uncertainty in the minds, either of the focal person or of the members of his role set, as to precisely what his role is at any given time. One of the crucial expectations that shape the role definition isthat of the individual, the focal person himself. If his occupation of the role is unclear, or if it differs from that of the others in the role set, there will be a degree of role ambiguity. Is this bad? Not necessarily, for the ability to shape one''s own role is one of the freedoms that many people desire, but the ambiguity may lead to role stress which will be discussed later on. The virtue of job descriptionsis that they lessen thisrole ambiguity.

Unfortunately, job descriptions are seldom complete role definitions, except at the lower end of the scale. At middle and higher management levels, they are often a list of formal jobs and duties that say little about the more subtle and informal expectations of the role. The result is therefore to give the individual an uncomfortable feeling that there are things left unsaid, i.e. to heighten the sense of role ambiguity.

Looking at role ambiguity from the other side, from the point of view of the members of the role set, lack of clarity in the role of the focal person can cause insecurity, lack of confidence, irritation and even anger among members of his role set. One list of the roles of a manager identified the following: executive, planner, policy maker, expert, controller of rewards and punishments, counsellor, friend, teacher. If it is not clear, through role signs of one sort or another, which role is currently the operational one, the other party may not react in the appropriate way — we may, in fact, hear quite another message if the focal person speaks to us, for example, as a teacher and we hear her as an executive.', 3)
ON CONFLICT (id) DO UPDATE SET passage_text = EXCLUDED.passage_text, title = EXCLUDED.title;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(129, 12, 'single_choice', 'It would be a good idea to specify the role definitions of soldiers more clearly.', '["YES", "NO", "NOT GIVEN"]'::jsonb, 'NOT GIVEN', 1, 29)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(130, 12, 'single_choice', 'Accountants may be similar to one another because they have the same type of job.', '["YES", "NO", "NOT GIVEN"]'::jsonb, 'YES', 1, 30)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(131, 12, 'single_choice', 'It is probably a good idea to keep dress as a role sign even nowadays.', '["YES", "NO", "NOT GIVEN"]'::jsonb, 'YES', 1, 31)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(132, 12, 'single_choice', 'The decline in emphasis on marriage rituals should be reversed.', '["YES", "NO", "NOT GIVEN"]'::jsonb, 'NOT GIVEN', 1, 32)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(133, 12, 'single_choice', 'Today furniture operates as a role sign in the same way as dress has always done.', '["YES", "NO", "NOT GIVEN"]'::jsonb, 'YES', 1, 33)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(134, 12, 'single_choice', 'It is a good idea to remove role ambiguity.', '["YES", "NO", "NOT GIVEN"]'::jsonb, 'NO', 1, 34)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(135, 12, 'single_choice', 'Job descriptions eliminate role ambiguity for managers.', '["YES", "NO", "NOT GIVEN"]'::jsonb, 'NO', 1, 35)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(136, 12, 'text_input', 'The graduation ceremony in many universities is an important', '[]'::jsonb, 'ritual', 1, 36)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(137, 12, 'text_input', 'The wig which judges wear in UK courts is a', '[]'::jsonb, 'role sign', 1, 37)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(138, 12, 'text_input', 'The parents of students in a school are part of the headmaster''s', '[]'::jsonb, 'role signs', 1, 38)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(139, 12, 'text_input', 'Question 39', '[]'::jsonb, 'role set', 1, 39)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES
(140, 12, 'single_choice', 'This text is taken from', '["a guide for new managers in a company.", "a textbook analysis of behaviour in organisations.", "a critical study of the importance of role signs in modern society.", "a newspaper article about role changes."]'::jsonb, 'a textbook analysis of behaviour in organisations.', 1, 40)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;

-- Sync PostgreSQL Sequences
SELECT setval(pg_get_serial_sequence('tests', 'id'), COALESCE((SELECT MAX(id) FROM tests), 1));
SELECT setval(pg_get_serial_sequence('sections', 'id'), COALESCE((SELECT MAX(id) FROM sections), 1));
SELECT setval(pg_get_serial_sequence('questions', 'id'), COALESCE((SELECT MAX(id) FROM questions), 1));