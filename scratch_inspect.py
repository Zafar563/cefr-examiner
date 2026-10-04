import re
import json

with open('scratch_listening_c20_t1.html', 'r', encoding='utf-8', errors='ignore') as f:
    text = f.read()

print('Length:', len(text))
nonces = re.findall(r'name="([^"]*nonce[^"]*)"\s+value="([^"]+)"', text)
print('Nonces:', nonces)
post_ids = re.findall(r'name="post_id"\s+value="([^"]+)"', text)
print('Post IDs:', post_ids)

mp3s = re.findall(r'https?://[^\s"\'<>]+\.mp3', text)
print('MP3s:', list(set(mp3s)))

audios = re.findall(r'<audio[^>]*>.*?</audio>', text, re.DOTALL)
print(f'Audio tags ({len(audios)}):', audios[:3])

# Check for parts
sections = re.findall(r'<div[^>]*class="[^"]*ielts-listening-[^"]*"[^>]*>', text)
print('Ielts listening classes:', list(set(sections))[:5])
