import os
import re
import html
import json
import subprocess

SCRATCH_DIR = r"C:\Users\User\.gemini\antigravity\brain\85f2d1af-31e7-4fd7-9d76-6f058fa47dd3\scratch"
STORAGE_DIR = r"c:\Users\User\Desktop\cefr-examiner\storage"
MIGRATIONS_DIR = r"c:\Users\User\Desktop\cefr-examiner\services\core-backend\migrations"

os.makedirs(SCRATCH_DIR, exist_ok=True)
os.makedirs(STORAGE_DIR, exist_ok=True)
os.makedirs(MIGRATIONS_DIR, exist_ok=True)

def get_speaking_test_id(book: int, test: int) -> int:
    if book == 21:
        return {1: 31, 2: 32, 3: 35, 4: 36}[test]
    elif book == 20:
        return {1: 33, 2: 34, 3: 37, 4: 38}[test]
    else:
        # Books 13..19: IDs 135..138, 145..148, ..., 195..198
        return book * 10 + 4 + test

def get_speaking_sec_id(test_id: int) -> int:
    if test_id < 100:
        return test_id * 100 + 1
    return test_id * 10 + 1

def get_speaking_q_id(test_id: int, q_num: int) -> int:
    if test_id < 100:
        return test_id * 1000 + q_num
    return test_id * 100 + q_num

def download_speaking_test(book: int, test: int):
    url = f"https://engnovate.com/ielts-speaking-tests/cambridge-ielts-{book}-academic-speaking-test-{test}/"
    raw_path = os.path.join(SCRATCH_DIR, f"c{book}_speaking_t{test}.html")
    if not os.path.exists(raw_path) or os.path.getsize(raw_path) < 1000:
        print(f"Downloading Cambridge {book} Speaking Test {test} from {url}...")
        cmd = ['curl.exe', '-s', '-L', url, '-o', raw_path]
        subprocess.check_call(cmd)
    return raw_path

def parse_speaking_test(raw_html):
    pattern = r'<div id="ielts-speaking-question-(\d+)"[^>]*data-question-type="([^"]+)"[^>]*>.*?<div class="question-text">(.*?)</div>'
    items = re.findall(pattern, raw_html, re.DOTALL)
    
    part1_qs = []
    part2_text = ""
    part3_qs = []
    
    for qnum, qtype, qtext in items:
        paragraphs = re.findall(r'<p[^>]*>(.*?)</p>', qtext, re.DOTALL)
        if not paragraphs:
            paragraphs = [qtext]
            
        clean_paras = []
        for p in paragraphs:
            c = re.sub(r'<[^>]+>', ' ', p)
            c = ' '.join(html.unescape(c).split())
            if c:
                clean_paras.append(c)
                
        if qtype == "part_one":
            full_q = " ".join(clean_paras)
            part1_qs.append(full_q)
        elif qtype == "part_two":
            lines = []
            in_you_should_say = False
            for p in clean_paras:
                p_lower = p.lower()
                if "you should say" in p_lower:
                    lines.append("You should say:")
                    in_you_should_say = True
                elif in_you_should_say:
                    if p_lower.startswith("and explain") or p_lower.startswith("explain "):
                        lines.append(f"And {p[4:].strip() if p_lower.startswith('and ') else p}")
                        in_you_should_say = False
                    else:
                        bullet = p[0].upper() + p[1:] if len(p) > 1 else p
                        lines.append(f"• {bullet}")
                else:
                    lines.append(p)
            part2_text = "\n".join(lines)
        elif qtype == "part_three":
            full_q = " ".join(clean_paras)
            part3_qs.append(full_q)
            
    p1_formatted = "Part 1: Introduction & Everyday Topics (Speak for 1-2 minutes)\n\n" + "\n".join([f"{i+1}. {q}" for i, q in enumerate(part1_qs)])
    p2_formatted = "Part 2: Individual Long Turn / Cue Card (1 minute preparation, 2 minutes speaking)\n\n" + part2_text
    p3_formatted = "Part 3: Two-way Discussion (Speak for 2-3 minutes)\n\n" + "\n".join([f"{i+1}. {q}" for i, q in enumerate(part3_qs)])
    
    return p1_formatted, p2_formatted, p3_formatted, part1_qs, part2_text, part3_qs

def process_book_speaking(book: int):
    print(f"\n==========================================")
    print(f"PROCESSING CAMBRIDGE IELTS {book} ACADEMIC SPEAKING")
    print(f"==========================================")
    
    sql_lines = [
        f"-- Migration: cambridge_ielts_{book}_speaking_all.sql",
        f"-- Cambridge IELTS {book} Academic Speaking Tests 1 to 4",
        f"-- Total 4 speaking tests, 12 speaking prompts with official Part 1, 2, 3 tasks\n"
    ]
    
    for t_idx in [1, 2, 3, 4]:
        test_id = get_speaking_test_id(book, t_idx)
        sec_id = get_speaking_sec_id(test_id)
        
        raw_path = download_speaking_test(book, t_idx)
        with open(raw_path, "r", encoding="utf-8", errors="ignore") as f:
            raw_html = f.read()
            
        p1_fmt, p2_fmt, p3_fmt, p1_qs, p2_txt, p3_qs = parse_speaking_test(raw_html)
        print(f"Test {t_idx} (ID {test_id}): P1={len(p1_qs)} Qs, P2={len(p2_txt)} chars, P3={len(p3_qs)} Qs")
        
        title = f"Cambridge IELTS {book} Academic Speaking Test {t_idx}"
        desc = f"Haqiqiy IELTS/CEFR Speaking formati: Rasmiy Cambridge IELTS {book} Test {t_idx} bo‘yicha Part 1 (Kirish va kundalik mavzular), Part 2 (Cue Card taqdimot) va Part 3 (Tahliliy munozara)."
        
        # Build JSON structure
        q1_id = get_speaking_q_id(test_id, 1)
        q2_id = get_speaking_q_id(test_id, 2)
        q3_id = get_speaking_q_id(test_id, 3)
        
        questions = [
            {
                "id": q1_id,
                "question_number": 1,
                "section_part": 1,
                "question_type": "speaking_prompt",
                "question_text": p1_fmt,
                "options": [],
                "correct_answer": "",
                "points": 10
            },
            {
                "id": q2_id,
                "question_number": 2,
                "section_part": 2,
                "question_type": "speaking_prompt",
                "question_text": p2_fmt,
                "options": [],
                "correct_answer": "",
                "points": 15
            },
            {
                "id": q3_id,
                "question_number": 3,
                "section_part": 3,
                "question_type": "speaking_prompt",
                "question_text": p3_fmt,
                "options": [],
                "correct_answer": "",
                "points": 15
            }
        ]
        
        section = {
            "id": sec_id,
            "type": "speaking",
            "title": "Speaking Assessment (Parts 1-3)",
            "instructions": "Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.",
            "audio_url": None,
            "passage_text": None,
            "order_index": 1,
            "questions": questions
        }
        
        test_json = {
            "id": test_id,
            "title": title,
            "description": desc,
            "level": "Multi-level (A1-C1)",
            "duration_minutes": 15,
            "sections": [section]
        }
        
        # Save JSON
        json_file = os.path.join(STORAGE_DIR, f"cambridge_ielts_{book}_academic_speaking_test_{t_idx}.json")
        with open(json_file, "w", encoding="utf-8") as f:
            json.dump(test_json, f, ensure_ascii=False, indent=2)
            
        print(f"Saved {title} (ID {test_id}) to JSON.")
        
        # Build SQL
        t_title_sql = title.replace("'", "''")
        t_desc_sql = desc.replace("'", "''")
        sql_lines.append(f"-- Test {test_id}: {title}")
        sql_lines.append(f"INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES")
        sql_lines.append(f"({test_id}, '{t_title_sql}', '{t_desc_sql}', 'Multi-level (A1-C1)', 15, true)")
        sql_lines.append(f"ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;\n")
        
        sec_title = "Speaking Assessment (Parts 1-3)"
        sec_instr = "Ushbu bo‘lim 3 ta qismdan iborat. Har bir qism topshirig‘i bilan tanishib chiqing, tayyor bo‘lgach mikrofon tugmasini bosib ovozingizni yozing va saqlang.".replace("'", "''")
        sql_lines.append(f"INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES")
        sql_lines.append(f"({sec_id}, {test_id}, 'speaking', '{sec_title}', '{sec_instr}', NULL, NULL, 1)")
        sql_lines.append(f"ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions;\n")
        
        # Format questions with E'...' syntax for proper newlines and bullets
        for q in questions:
            q_id = q["id"]
            q_pts = q["points"]
            q_num = q["question_number"]
            # Escape for E'...' in postgres: escape single quotes and backslashes
            q_text_escaped = q["question_text"].replace("\\", "\\\\").replace("'", "\\'").replace("\n", "\\n")
            
            sql_lines.append(f"INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES")
            sql_lines.append(f"({q_id}, {sec_id}, 'speaking_prompt', E'{q_text_escaped}', '[]'::jsonb, '', {q_pts}, {q_num})")
            sql_lines.append(f"ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, points = EXCLUDED.points;\n")
            
    sql_lines.append("-- Sync Sequences")
    sql_lines.append("SELECT setval(pg_get_serial_sequence('tests', 'id'), COALESCE((SELECT MAX(id) FROM tests), 1));")
    sql_lines.append("SELECT setval(pg_get_serial_sequence('sections', 'id'), COALESCE((SELECT MAX(id) FROM sections), 1));")
    sql_lines.append("SELECT setval(pg_get_serial_sequence('questions', 'id'), COALESCE((SELECT MAX(id) FROM questions), 1));\n")
    
    out_sql = os.path.join(MIGRATIONS_DIR, f"cambridge_ielts_{book}_speaking_all.sql")
    with open(out_sql, "w", encoding="utf-8") as f:
        f.write("\n".join(sql_lines))
        
    print(f"Generated SQL: {out_sql} ({os.path.getsize(out_sql)} bytes)")
    
    # Apply to PostgreSQL
    print(f"Applying migration to PostgreSQL cefr_postgres...")
    cmd = f'Get-Content "{out_sql}" | docker exec -i cefr_postgres psql -U cefr_user -d cefr_db'
    subprocess.check_call(["powershell", "-Command", cmd])
    print(f"Cambridge IELTS {book} Speaking applied successfully to database!\n")

if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1:
        if sys.argv[1].lower() == "all":
            books = [21, 20, 19, 18, 17, 16, 15, 14, 13]
        elif "-" in sys.argv[1]:
            start, end = map(int, sys.argv[1].split("-"))
            books = list(range(start, end - 1, -1)) if start >= end else list(range(start, end + 1))
        else:
            books = [int(x) for x in sys.argv[1:]]
    else:
        books = [21, 20, 19, 18, 17, 16, 15, 14, 13]
        
    for b in books:
        process_book_speaking(b)
