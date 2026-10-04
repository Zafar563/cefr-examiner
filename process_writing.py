import os
import re
import html
import json
import time
import urllib.request
import subprocess

RAW_DIR = "storage/raw_writing"
STORAGE_DIR = "storage"
MIGRATIONS_DIR = "services/core-backend/migrations"
IMAGES_DIR = "frontend/public/images/writing"

os.makedirs(RAW_DIR, exist_ok=True)
os.makedirs(STORAGE_DIR, exist_ok=True)
os.makedirs(MIGRATIONS_DIR, exist_ok=True)
os.makedirs(IMAGES_DIR, exist_ok=True)

HEADERS = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'}

def fetch_url(url, cache_path=None):
    if cache_path and os.path.exists(cache_path) and os.path.getsize(cache_path) > 1000:
        with open(cache_path, "r", encoding="utf-8") as f:
            return f.read()

    content = ""
    try:
        req = urllib.request.Request(url, headers=HEADERS)
        with urllib.request.urlopen(req, timeout=20) as resp:
            content = resp.read().decode('utf-8', errors='ignore')
    except Exception as e:
        # Fallback to curl.exe
        proc = subprocess.run(["curl.exe", "-s", "-L", url], capture_output=True)
        if proc.returncode == 0 and len(proc.stdout) > 1000:
            content = proc.stdout.decode('utf-8', errors='ignore')
        else:
            raise e

    if cache_path and len(content) > 1000:
        with open(cache_path, "w", encoding="utf-8") as f:
            f.write(content)
    return content

def clean_html_text(text):
    text = re.sub(r'<p[^>]*>', '', text)
    text = text.replace('</p>', '\n\n')
    text = text.replace('<br>', '\n').replace('<br/>', '\n').replace('<br />', '\n')
    text = re.sub(r'<[^>]+>', '', text)
    text = html.unescape(text)
    # Normalize unicode quotes and dashes
    text = text.replace('\u2018', "'").replace('\u2019', "'")
    text = text.replace('\u201c', '"').replace('\u201d', '"')
    text = text.replace('\u2013', '-').replace('\u2014', '--')
    lines = [line.strip() for line in text.split('\n')]
    return '\n'.join([line for line in lines if line])

def format_task1_prompt(prompt):
    prompt = re.sub(r'(?i)you\s+should\s+spend\s+about\s+20\s+minutes\s+on\s+this\s+task\.?', '', prompt)
    prompt = re.sub(r'(?i)write\s+at\s+least\s+150\s+words\.?', '', prompt)
    prompt = re.sub(r'(?i)summarise\s+the\s+information\s+by\s+selecting\s+and\s+reporting\s+the\s+main\s+features\s*,?\s*and\s+make\s+comparisons?\s+where\s+relevant\.?', '', prompt)
    prompt = prompt.strip()

    return (
        "WRITING TASK 1\n\n"
        "You should spend about 20 minutes on this task.\n\n"
        f"{prompt}\n\n"
        "Summarise the information by selecting and reporting the main features, and make comparisons where relevant.\n\n"
        "Write at least 150 words."
    )

def format_task2_prompt(prompt):
    prompt = re.sub(r'(?i)you\s+should\s+spend\s+about\s+40\s+minutes\s+on\s+this\s+task\.?', '', prompt)
    prompt = re.sub(r'(?i)write\s+about\s+the\s+following\s+topic:?', '', prompt)
    prompt = re.sub(r'(?i)write\s+at\s+least\s+250\s+words\.?', '', prompt)
    prompt = re.sub(r'(?i)give\s+reasons\s+for\s+your\s+answer\s+and\s+include\s+any\s+relevant\s+examples\s+from\s+your\s+own\s+knowledge\s+or\s+experience\.?', '', prompt)
    prompt = prompt.strip()

    return (
        "WRITING TASK 2\n\n"
        "You should spend about 40 minutes on this task.\n\n"
        "Write about the following topic:\n\n"
        f"{prompt}\n\n"
        "Give reasons for your answer and include any relevant examples from your own knowledge or experience.\n\n"
        "Write at least 250 words."
    )

def download_image(img_url, local_dest):
    if not img_url:
        return False
    if os.path.exists(local_dest) and os.path.getsize(local_dest) > 1000:
        return True
    try:
        req = urllib.request.Request(img_url, headers=HEADERS)
        with urllib.request.urlopen(req, timeout=15) as resp:
            data = resp.read()
            with open(local_dest, 'wb') as f:
                f.write(data)
        return True
    except Exception as e:
        # Fallback curl
        proc = subprocess.run(["curl.exe", "-s", "-L", "-o", local_dest, img_url])
        return proc.returncode == 0 and os.path.exists(local_dest) and os.path.getsize(local_dest) > 1000

def make_sql_safe(s):
    if s is None:
        return "NULL"
    return s.replace("'", "''")

def process_one_writing_test(book, test_num):
    url = f"https://engnovate.com/ielts-writing-tests/cambridge-ielts-{book}-academic-writing-test-{test_num}/"
    raw_cache = os.path.join(RAW_DIR, f"cambridge_ielts_{book}_academic_writing_test_{test_num}.html")
    
    print(f"\nProcessing Cambridge {book} Writing Test {test_num}...")
    try:
        raw_html = fetch_url(url, raw_cache)
    except Exception as e:
        print(f"  Error fetching {url}: {e}")
        return False

    # Extract Task 1 section
    t1_sec_m = re.search(r'<div[^>]*id\s*=\s*["\']ielts-writing-question-section-1["\'][^>]*>(.*?)(?=<div[^>]*id\s*=\s*["\']ielts-writing-question-section-2["\']|\s*<div\s+class="ielts-writing-resize-handle"|\s*<div\s+class="test-content ielts-writing-answer-container")', raw_html, re.DOTALL)
    t1_sec = t1_sec_m.group(1) if t1_sec_m else ""

    t1_q_m = re.search(r'<div[^>]*class\s*=\s*["\']ielts-writing-question["\'][^>]*>(.*?)</div>', t1_sec, re.DOTALL)
    t1_raw_text = t1_q_m.group(1) if t1_q_m else ""
    t1_clean_prompt = clean_html_text(t1_raw_text)
    t1_formatted = format_task1_prompt(t1_clean_prompt)

    # Task 1 image
    t1_img_m = re.search(r'<img[^>]+src=["\']([^"\']+)["\'][^>]*class=["\']ielts-writing-image["\']', t1_sec)
    if not t1_img_m:
        t1_img_m = re.search(r'<img[^>]+class=["\']ielts-writing-image["\'][^>]*src=["\']([^"\']+)["\']', t1_sec)
    if not t1_img_m:
        t1_img_m = re.search(r'<img[^>]+src=["\']([^"\']+)["\']', t1_sec)
    t1_img = t1_img_m.group(1) if t1_img_m else ""

    # Determine image extension
    ext = ".jpg"
    if t1_img:
        lower_img = t1_img.lower().split('?')[0]
        if lower_img.endswith('.png'):
            ext = ".png"
        elif lower_img.endswith('.webp'):
            ext = ".webp"
        elif lower_img.endswith('.jpeg') or lower_img.endswith('.jpg'):
            ext = ".jpg"

    local_img_filename = f"cambridge_{book}_writing_t{test_num}{ext}"
    local_img_path = os.path.join(IMAGES_DIR, local_img_filename)
    public_img_path = f"/images/writing/{local_img_filename}"

    download_success = download_image(t1_img, local_img_path)
    
    t1_options = []
    if t1_img:
        t1_options = [public_img_path, t1_img]

    # Extract Task 2 section
    t2_sec_m = re.search(r'<div[^>]*id\s*=\s*["\']ielts-writing-question-section-2["\'][^>]*>(.*?)(?=\s*<div\s+class="ielts-writing-resize-handle"|\s*<div\s+class="test-content ielts-writing-answer-container"|\s*</div>\s*</div>\s*</div>)', raw_html, re.DOTALL)
    t2_sec = t2_sec_m.group(1) if t2_sec_m else ""

    t2_q_m = re.search(r'<div[^>]*class\s*=\s*["\']ielts-writing-question["\'][^>]*>(.*?)</div>', t2_sec, re.DOTALL)
    t2_raw_text = t2_q_m.group(1) if t2_q_m else ""
    t2_clean_prompt = clean_html_text(t2_raw_text)
    t2_formatted = format_task2_prompt(t2_clean_prompt)

    # Short summaries for Uzbek description
    t1_first_line = t1_clean_prompt.split('\n')[0][:80]
    t2_first_line = t2_clean_prompt.split('\n')[0][:80]

    desc_uz = f"Haqiqiy IELTS/CEFR Academic Writing formati: Task 1 ({t1_first_line} - min 150 so‘z) va Task 2 ({t2_first_line} - min 250 so‘z)."

    # IDs
    test_id = book * 100 + 40 + test_num
    section_id = test_id * 10 + 1
    q1_id = test_id * 100 + 1
    q2_id = test_id * 100 + 2

    test_title = f"Cambridge IELTS {book} Academic Writing Test {test_num}"
    instructions_text = "Ushbu imtihon 2 ta topshiriqdan iborat. Topshiriq 1 uchun tavsiya etilgan vaqt: 20 daqiqa (kamida 150 so‘z). Topshiriq 2 uchun tavsiya etilgan vaqt: 40 daqiqa (kamida 250 so‘z). Insho matningizni pastdagi javob maydoniga kiriting."

    # Build SQL
    t1_opt_json = json.dumps(t1_options).replace("'", "''")
    t2_opt_json = "[]"

    sql = f"""-- Migration: cambridge_ielts_{book}_writing_test_{test_num}.sql
-- {test_title}

INSERT INTO tests (id, title, description, level, duration_minutes, is_active)
VALUES ({test_id}, '{make_sql_safe(test_title)}', '{make_sql_safe(desc_uz)}', 'Multi-level (A1-C1)', 60, true)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index)
VALUES ({section_id}, {test_id}, 'writing', 'Writing Assessment (Task 1 & Task 2)', '{make_sql_safe(instructions_text)}', NULL, NULL, 1)
ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;

INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index)
VALUES
({q1_id}, {section_id}, 'essay', '{make_sql_safe(t1_formatted)}', '{t1_opt_json}'::jsonb, '', 15, 1),
({q2_id}, {section_id}, 'essay', '{make_sql_safe(t2_formatted)}', '{t2_opt_json}'::jsonb, '', 25, 2)
ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, points = EXCLUDED.points;
"""

    migration_file = os.path.join(MIGRATIONS_DIR, f"cambridge_ielts_{book}_writing_test_{test_num}.sql")
    with open(migration_file, "w", encoding="utf-8") as f:
        f.write(sql)

    # Save JSON backup
    data_backup = {
        'id': test_id,
        'title': test_title,
        'description': desc_uz,
        'duration_minutes': 60,
        'sections': [
            {
                'id': section_id,
                'test_id': test_id,
                'type': 'writing',
                'title': 'Writing Assessment (Task 1 & Task 2)',
                'instructions': instructions_text,
                'order_index': 1,
                'questions': [
                    {
                        'id': q1_id,
                        'section_id': section_id,
                        'question_type': 'essay',
                        'question_text': t1_formatted,
                        'options': t1_options,
                        'correct_answer': '',
                        'points': 15,
                        'order_index': 1
                    },
                    {
                        'id': q2_id,
                        'section_id': section_id,
                        'question_type': 'essay',
                        'question_text': t2_formatted,
                        'options': [],
                        'correct_answer': '',
                        'points': 25,
                        'order_index': 2
                    }
                ]
            }
        ]
    }

    json_path = os.path.join(STORAGE_DIR, f"cambridge_ielts_{book}_academic_writing_test_{test_num}.json")
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(data_backup, f, indent=2, ensure_ascii=False)

    # Execute SQL into Postgres
    try:
        proc = subprocess.run(
            ["docker", "exec", "-i", "cefr_postgres", "psql", "-U", "cefr_user", "-d", "cefr_db"],
            input=sql.encode('utf-8'),
            capture_output=True,
            check=True
        )
        print(f"  -> DB Inserted Test ID {test_id}: {test_title}")
    except subprocess.CalledProcessError as e:
        print(f"  -> DB Error: {e.stderr.decode('utf-8', errors='ignore')}")
        return False

    return True

def main():
    print("Starting Cambridge IELTS 13 to 20 Academic Writing pipeline...")
    success = 0
    total = 8 * 4 # 32 tests

    for book in range(13, 21):
        for test_num in range(1, 5):
            res = process_one_writing_test(book, test_num)
            if res:
                success += 1
            time.sleep(0.5)

    print(f"\nCompleted {success} / {total} writing tests successfully!")

    # Synchronize sequences
    sync_sql = """
    SELECT setval(pg_get_serial_sequence('tests', 'id'), COALESCE((SELECT MAX(id) FROM tests), 1));
    SELECT setval(pg_get_serial_sequence('sections', 'id'), COALESCE((SELECT MAX(id) FROM sections), 1));
    SELECT setval(pg_get_serial_sequence('questions', 'id'), COALESCE((SELECT MAX(id) FROM questions), 1));
    """
    subprocess.run(
        ["docker", "exec", "-i", "cefr_postgres", "psql", "-U", "cefr_user", "-d", "cefr_db"],
        input=sync_sql.encode('utf-8'),
        capture_output=True,
        check=True
    )
    print("Postgres sequences synchronized.")

if __name__ == "__main__":
    main()
