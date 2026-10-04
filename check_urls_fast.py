import subprocess
from concurrent.futures import ThreadPoolExecutor

books = [19, 18, 17, 16, 15, 14, 13]
targets = []
for b in books:
    for t in [1, 2, 3, 4]:
        targets.append((b, t, f"https://engnovate.com/ielts-reading-tests/cambridge-ielts-{b}-academic-reading-test-{t}/"))

def check_url(item):
    b, t, url = item
    try:
        out = subprocess.check_output(['curl.exe', '-s', '-I', url], timeout=10).decode('utf-8', errors='ignore')
        first_line = out.split('\r\n')[0] if out else ''
        status = first_line.split(' ')[1] if ' ' in first_line else first_line
        return (b, t, status, url)
    except Exception as e:
        return (b, t, f"ERR: {e}", url)

print(f"Checking {len(targets)} URLs in parallel...")
with ThreadPoolExecutor(max_workers=8) as executor:
    results = list(executor.map(check_url, targets))

results.sort(key=lambda x: (-x[0], x[1]))
ok_count = 0
for b, t, status, url in results:
    if status == '200':
        ok_count += 1
    print(f"Cambridge {b} Test {t}: Status {status}")

print(f"\nTotal OK: {ok_count} / {len(targets)}")
