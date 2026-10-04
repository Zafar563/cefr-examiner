import subprocess

books = [19, 18, 17, 16, 15, 14, 13]
results = {}

for book in books:
    for test in [1, 2, 3, 4]:
        url = f"https://engnovate.com/ielts-reading-tests/cambridge-ielts-{book}-academic-reading-test-{test}/"
        cmd = ['curl.exe', '-s', '-I', url]
        try:
            out = subprocess.check_output(cmd, timeout=10).decode('utf-8', errors='ignore')
            first_line = out.split('\r\n')[0] if out else ''
            print(f"Cambridge {book} Test {test}: {first_line}")
        except Exception as e:
            print(f"Cambridge {book} Test {test}: Error {e}")
