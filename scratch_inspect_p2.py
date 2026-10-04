import re

with open('scratch_listening_c20_t1.html', 'r', encoding='utf-8', errors='ignore') as f:
    text = f.read()

# Let's see the section divs
for m in re.finditer(r'<div[^>]*id="(ielts-listening-question-section-\d+)"[^>]*>', text):
    start = m.start()
    print("Found section header:", m.group(0), "at pos", start)
    snippet = text[start:start+500]
    print("Snippet:", snippet)
    print("="*40)

# Let's see how question numbers are in Part 2
p2_idx = text.find('ielts-listening-question-section-2')
if p2_idx != -1:
    print("Part 2 full chunk (first 1500 chars):")
    print(text[p2_idx:p2_idx+1500])

# Let's see how transcripts are written
tr_idx = text.find('ielts-listening-transcript')
if tr_idx != -1:
    print("Transcript chunk (first 1000 chars):")
    print(text[tr_idx-100:tr_idx+1000])
