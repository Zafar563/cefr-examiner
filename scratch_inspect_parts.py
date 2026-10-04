import re

with open('scratch_listening_c20_t1.html', 'r', encoding='utf-8', errors='ignore') as f:
    text = f.read()

# Find audio tags
audio_matches = re.findall(r'<audio[^>]*id="([^"]+)"[^>]*>.*?</audio>', text, re.DOTALL)
print("Audio IDs found:", len(audio_matches))
for m in re.finditer(r'<audio[^>]*id="([^"]+)"[^>]*>(.*?)</audio>', text, re.DOTALL):
    aid = m.group(1)
    content = m.group(2)
    sources = re.findall(r'src="([^"]+)"', content)
    print(f"Audio {aid}: {sources}")

# Find question sections
sections = re.findall(r'<div[^>]*id="(ielts-listening-question-section-\d+)"[^>]*data-part-number="(\d+)"', text)
print("Sections found:", sections)

# Check for transcripts or explanations in ajax or HTML
for m in re.finditer(r'<div[^>]*class="([^"]*transcript[^"]*)"[^>]*>(.*?)</div>', text, re.DOTALL | re.I):
    print(f"Transcript class: {m.group(1)}, len: {len(m.group(2))}")
    print("Snippet:", m.group(2)[:150].strip())

# Check for script data
matches = re.findall(r'var\s+([a-zA-Z0-9_]+)\s*=\s*({.*?});', text, re.DOTALL)
for var_name, json_str in matches:
    if 'listening' in var_name.lower():
        print(f"JS Variable: {var_name}, length {len(json_str)}")
