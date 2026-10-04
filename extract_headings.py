import re

with open('test_c19_t1.html', 'r', encoding='utf-8', errors='ignore') as f:
    h = f.read()

for i in [1, 2, 3]:
    m = re.search(rf'id="ielts-reading-transcript-{i}"[^>]*>(.*?)(?=<div id="ielts-reading-transcript|\s*</div>\s*</div>\s*<div class="ielts-reading-resize-handle")', h, re.DOTALL)
    if m:
        sub = m.group(1)
        h2 = re.findall(r'<h[1-4][^>]*>(.*?)</h[1-4]>', sub)
        p1 = re.findall(r'<p[^>]*>(.*?)</p>', sub)
        print(f"Passage {i} headings:", h2[:3])
        if p1:
            print(f"Passage {i} first p:", p1[0][:80])
