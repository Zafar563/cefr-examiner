import os
import re
import html
import json
import subprocess
import sys
import time

RAW_DIR = r"c:\Users\User\Desktop\cefr-examiner\storage\raw_listening"
STORAGE_DIR = r"c:\Users\User\Desktop\cefr-examiner\storage"
MIGRATIONS_DIR = r"c:\Users\User\Desktop\cefr-examiner\services\core-backend\migrations"

os.makedirs(RAW_DIR, exist_ok=True)
os.makedirs(STORAGE_DIR, exist_ok=True)
os.makedirs(MIGRATIONS_DIR, exist_ok=True)

def download_html(book: int, test: int):
    raw_path = os.path.join(RAW_DIR, f"c{book}_t{test}_raw.html")
    if os.path.exists(raw_path) and os.path.getsize(raw_path) > 10000:
        with open(raw_path, 'r', encoding='utf-8', errors='ignore') as f:
            return f.read(), f"https://engnovate.com/ielts-listening-tests/cambridge-ielts-{book}-academic-listening-test-{test}/"

    urls_to_try = [
        f"https://engnovate.com/ielts-listening-tests/cambridge-ielts-{book}-academic-listening-test-{test}/",
        f"https://engnovate.com/ielts-listening-tests/cambridge-ielts-{book}-listening-test-{test}/",
        f"https://engnovate.com/cambridge-ielts-{book}-academic-listening-test-{test}/",
        f"https://engnovate.com/cambridge-ielts-{book}-listening-test-{test}/"
    ]

    for url in urls_to_try:
        try:
            print(f"Downloading Cambridge {book} Test {test} from {url}...")
            cmd = ['curl.exe', '-s', '-L', url, '-o', raw_path]
            subprocess.check_call(cmd, timeout=30)
            if os.path.exists(raw_path) and os.path.getsize(raw_path) > 10000:
                with open(raw_path, 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
                    if 'ielts-listening' in content or 'ielts_listening_test_nonce' in content:
                        return content, url
        except Exception as e:
            print(f"Failed to fetch {url}: {e}")

    raise ValueError(f"Could not download valid listening test HTML for Cambridge {book} Test {test}")

def fetch_answer_key(book: int, test: int, raw_html: str, page_url: str):
    ak_path = os.path.join(RAW_DIR, f"c{book}_t{test}_ak.json")
    if os.path.exists(ak_path) and os.path.getsize(ak_path) > 100:
        try:
            with open(ak_path, "r", encoding="utf-8") as f:
                data = json.load(f)
                if data.get("success") and len(data.get("data", {}).get("answer_key", [])) == 40:
                    return data
        except Exception:
            pass

    nonce_m = re.search(r'name="ielts_listening_test_nonce"\s+value="([^"]+)"', raw_html)
    post_id_m = re.search(r'name="post_id"\s+value="([^"]+)"', raw_html)
    if not nonce_m or not post_id_m:
        print(f"Cambridge {book} Test {test}: nonce or post_id not found!")
        return None

    nonce = nonce_m.group(1)
    post_id = post_id_m.group(1)

    for action in ["get_ielts_listening_test_answer_key", "process_ielts_listening_test"]:
        cmd = [
            'curl.exe', '-s', '-X', 'POST', 'https://engnovate.com/wp-admin/admin-ajax.php',
            '-H', 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8',
            '-H', 'X-Requested-With: XMLHttpRequest',
            '-H', f'Referer: {page_url}',
            '-d', f'action={action}&ielts_listening_test_nonce={nonce}&post_id={post_id}&time_taken_seconds=300&save_learner_progress=0'
        ]
        try:
            res_bytes = subprocess.check_output(cmd, timeout=30)
            res = json.loads(res_bytes.decode('utf-8', errors='ignore'))
            if res.get('success'):
                if "results" in res.get("data", {}):
                    ak = []
                    for i, r in enumerate(res["data"]["results"]):
                        ak.append({
                            "number": i + 1,
                            "answer": r.get("correct_answer", ""),
                            "explanation": r.get("explanation", "") or r.get("detailed_explanation", "")
                        })
                    res["data"]["answer_key"] = ak
                if len(res.get("data", {}).get("answer_key", [])) == 40:
                    with open(ak_path, "w", encoding="utf-8") as f:
                        json.dump(res, f, ensure_ascii=False, indent=2)
                    return res
        except Exception as e:
            print(f"Error {action} for C{book} T{test}: {e}")

    return None

def extract_audios(raw_html):
    audio_urls = {}
    for m in re.finditer(r'<audio[^>]*id\s*=\s*"ielts-listening-test-audio-(\d+)"[^>]*>(.*?)</audio>', raw_html, re.DOTALL):
        part_num = int(m.group(1))
        sources = re.findall(r'src="([^"]+)"', m.group(2))
        if sources:
            cdn = [s for s in sources if 'engnovatemedia' in s]
            audio_urls[part_num] = cdn[0] if cdn else sources[0]
    return audio_urls

def extract_transcripts(raw_html):
    transcripts = {}
    for m in re.finditer(r'<div[^>]*id\s*=\s*"ielts-listening-transcript-(\d+)"[^>]*>(.*?)</div>\s*(?=<div[^>]*id\s*=\s*"ielts-listening-transcript-|\s*</div>\s*</div>|$|</div>\s*<div class="ielts-listening-test-transcripts)', raw_html, re.DOTALL):
        part_num = int(m.group(1))
        raw_t = m.group(2)
        clean_t = re.sub(r'</p>\s*<p[^>]*>', '\n\n', raw_t)
        clean_t = re.sub(r'<br\s*/?>', '\n', clean_t)
        clean_t = re.sub(r'<[^>]+>', ' ', clean_t)
        clean_t = html.unescape(clean_t).strip()
        lines = [' '.join(l.split()) for l in clean_t.split('\n')]
        transcripts[part_num] = '\n'.join([l for l in lines if l])
    return transcripts

def clean_part_html(raw_html, part_num):
    sec_pattern = rf'<div[^>]*id\s*=\s*"ielts-listening-question-section-{part_num}"[^>]*>(.*?)(?=<div[^>]*id\s*=\s*"ielts-listening-question-section-|\s*<div class="ielts-listening-bottom-panel"|\s*</form>)'
    sec_m = re.search(sec_pattern, raw_html, re.DOTALL)
    if not sec_m:
        return "", f"Listening Part {part_num}", {}
    chunk = sec_m.group(1)

    # Title extraction
    title = f"Listening Part {part_num}"
    title_m = re.search(r'<p class="ielts-listening-transcript-subhead">.*?<strong>(?:<span[^>]*>)?(.*?)(?:</span>)?</strong>', chunk, re.DOTALL)
    if title_m:
        cand = re.sub(r'<[^>]+>', '', title_m.group(1)).strip()
        if len(cand) > 2 and not cand.lower().startswith('question'):
            title = f"Listening Part {part_num}: {cand}"
    else:
        h_m = re.search(r'<h3[^>]*>(.*?)</h3>', chunk, re.DOTALL)
        if h_m:
            cand = re.sub(r'<[^>]+>', '', h_m.group(1)).strip()
            if len(cand) > 2 and not cand.lower().startswith('question'):
                title = f"Listening Part {part_num}: {cand}"

    # Remove buttons
    chunk = re.sub(r'<a class="ielts-listening-practice-section-button[^"]*"[^>]*>.*?</a>', '', chunk, flags=re.DOTALL)
    chunk = re.sub(r'<button type="button" class="ielts-listening-section-start-time-button"[^>]*>.*?</button>', '', chunk, flags=re.DOTALL)
    chunk = html.unescape(chunk)

    # 1. Transform DND panels if any
    dnd_panels = re.findall(r'<div class="options-dnd-panel[^"]*"[^>]*data-dnd-group="([^"]+)"[^>]*>(.*?)</div>\s*</div>', chunk, re.DOTALL)
    dnd_options_by_group = {}
    for grp_id, p_content in dnd_panels:
        cards = re.findall(r'<div class="dnd-card"[^>]*data-value="([^"]+)"[^>]*>.*?<span class="dnd-text">(.*?)</span>', p_content, re.DOTALL)
        if cards:
            dnd_options_by_group[grp_id] = [f"{c[0]}. {c[1].strip()}" for c in cards]

    def replace_dnd_drop(match):
        grp = match.group(1)
        qnum = match.group(2)
        opts = dnd_options_by_group.get(grp, [])
        options_html = f'<option value="">[ {qnum} ] Tanlang...</option>'
        for opt in opts:
            options_html += f'<option value="{opt}">{opt}</option>'
        return f'<span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">{qnum}</strong><select data-qnum="{qnum}" name="question_{qnum}" class="ielts-inline-select">{options_html}</select></span>'

    chunk = re.sub(
        r'<span class="options-drop-zone dnd-zone" data-dnd-group="([^"]+)"><strong id\s*=\s*"ielts-listening-question-number-(\d+)"[^>]*>\d+</strong>.*?<input type="hidden"[^>]*></span>',
        replace_dnd_drop,
        chunk,
        flags=re.DOTALL
    )

    # 2. Transform inline text inputs (all variants)
    chunk = re.sub(
        r'<span class="ielts-listening-question-item">\s*<strong id\s*=\s*"ielts-listening-question-number-(\d+)"[^>]*>\d+</strong>\s*<input[^>]*type="text"[^>]*>\s*</span>',
        r'<span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">\1</strong><input type="text" data-qnum="\1" name="question_\1" class="ielts-inline-input" placeholder="[\1] javob..." autocomplete="off" spellcheck="false"></span></span>',
        chunk,
        flags=re.DOTALL
    )
    chunk = re.sub(
        r'<span class="ielts-listening-question-item">\s*<strong id\s*=\s*"ielts-listening-question-number-(\d+)"[^>]*>\d+</strong>\s*<input[^>]*>\s*</span>',
        r'<span class="ielts-reading-question-item"><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">\1</strong><input type="text" data-qnum="\1" name="question_\1" class="ielts-inline-input" placeholder="[\1] javob..." autocomplete="off" spellcheck="false"></span></span>',
        chunk,
        flags=re.DOTALL
    )
    chunk = re.sub(
        r'<strong id\s*=\s*"ielts-listening-question-number-(\d+)"[^>]*>\d+</strong>\s*<input[^>]*type="text"[^>]*>',
        r'<span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">\1</strong><input type="text" data-qnum="\1" name="question_\1" class="ielts-inline-input" placeholder="[\1] javob..." autocomplete="off" spellcheck="false"></span>',
        chunk,
        flags=re.DOTALL
    )
    chunk = re.sub(
        r'<td[^>]*>\s*<strong id\s*=\s*"ielts-listening-question-number-(\d+)"[^>]*>\d+</strong>\s*<input[^>]*>\s*</td>',
        r'<td><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">\1</strong><input type="text" data-qnum="\1" name="question_\1" class="ielts-inline-input" placeholder="[\1] javob..." autocomplete="off" spellcheck="false"></span></td>',
        chunk,
        flags=re.DOTALL
    )

    # 3. Transform standalone question items (single / multiple choice)
    def normalize_question_item(match):
        item_content = match.group(1)
        qnums = re.findall(r'id\s*=\s*"ielts-listening-question-number-(\d+)"', item_content)
        if not qnums:
            return match.group(0)

        # Extract prompt
        prompt_m = re.search(r'<span>(.*?)</span>', item_content, re.DOTALL)
        if prompt_m:
            prompt_text = re.sub(r'<strong[^>]*>.*?</strong>', '', prompt_m.group(1)).strip()
        else:
            opt_idx = item_content.find('class="ielts-listening-option"')
            if opt_idx != -1:
                prompt_text = re.sub(r'<[^>]+>', ' ', item_content[:opt_idx]).strip()
            else:
                prompt_text = ""

        options = re.findall(r'<div class\s*=\s*"ielts-listening-option"[^>]*>.*?value="([^"]+)".*?<span>(.*?)</span>', item_content, re.DOTALL)
        if not options:
            return match.group(0)

        badges = " ".join([f'<strong class="ielts-q-badge">{qn}</strong>' for qn in qnums])

        if len(qnums) > 1:
            qnums_str = ",".join(qnums)
            options_html = '<div class="ielts-checkbox-group">'
            for val, label in options:
                label_clean = label.strip()
                options_html += f'<label class="ielts-checkbox-btn"><input type="checkbox" data-multi-qnums="{qnums_str}" data-limit="{len(qnums)}" value="{val}"><span class="ielts-radio-text"><strong>{val}</strong> {label_clean if label_clean != val else ""}</span></label>'
            options_html += '</div>'
            return f'<div class="ielts-standalone-q ielts-multi-q" data-multi-qnums="{qnums_str}"><div class="ielts-q-header">{badges}<span class="ielts-q-title">{prompt_text}</span></div>{options_html}</div>'
        else:
            qnum = qnums[0]
            options_html = '<div class="ielts-radio-group">'
            for val, label in options:
                label_clean = label.strip()
                options_html += f'<label class="ielts-radio-btn"><input type="radio" data-qnum="{qnum}" name="question_{qnum}" value="{val}"><span class="ielts-radio-text"><strong>{val}</strong> {label_clean if label_clean != val else ""}</span></label>'
            options_html += '</div>'
            return f'<div class="ielts-standalone-q" data-qnum="{qnum}"><div class="ielts-q-header">{badges}<span class="ielts-q-title">{prompt_text}</span></div>{options_html}</div>'

    chunk = re.sub(
        r'<div class\s*=\s*"ielts-listening-question-item">(.*?)</div>\s*(?=<div class\s*=\s*"ielts-listening-question-item"|\s*</div>\s*<h2|\s*</div>\s*</div>\s*<h2|\s*</div>\s*</div>\s*</div>|$)',
        normalize_question_item,
        chunk,
        flags=re.DOTALL
    )

    # 4. Convert classes
    chunk = re.sub(r'class\s*=\s*"[^"]*ielts-listening-question-number[^"]*"', 'class="ielts-q-badge"', chunk)
    chunk = re.sub(r'class\s*=\s*"ielts-listening-question-section-heading"', 'class="ielts-reading-question-section-heading"', chunk)
    chunk = re.sub(r'class\s*=\s*"ielts-listening-question-section-content"', 'class="ielts-reading-question-section-content"', chunk)
    chunk = re.sub(r'class\s*=\s*"ielts-listening-questions"', 'class="ielts-reading-questions"', chunk)

    final_html = f'<div class="ielts-reading-container">\n{chunk.strip()}\n</div>'
    return final_html, title

def parse_questions_for_part(part_num, answers_dict, raw_html):
    q_start = (part_num - 1) * 10 + 1
    q_end = part_num * 10
    questions = []

    sec_m = re.search(rf'<div[^>]*id\s*=\s*"ielts-listening-question-section-{part_num}"[^>]*>(.*?)(?=<div[^>]*id\s*=\s*"ielts-listening-question-section-|\s*<div class="ielts-listening-bottom-panel"|\s*</form>)', raw_html, re.DOTALL)
    sec_chunk = sec_m.group(1) if sec_m else raw_html

    for q in range(q_start, q_end + 1):
        ans_info = answers_dict.get(q, {})
        correct_ans = ans_info.get("answer", "")
        
        is_choice_answer = bool(re.match(r'^[A-I](?:\s*[/,]\s*[A-I])*$', correct_ans.strip()))

        q_type = "text_input"
        options = []
        q_text = f"Question {q}"

        m_q = re.search(rf'id\s*=\s*"ielts-listening-question-number-{q}"', sec_chunk)
        if m_q:
            pos = m_q.start()
            context_before = sec_chunk[max(0, pos-400):pos]

            if not is_choice_answer:
                q_type = "text_input"
                options = []
                # text prompt
                line = re.sub(r'<[^>]+>', ' ', context_before).strip().split('.')[-1].strip()
                if line and len(line) > 3 and not line.lower().startswith('question'):
                    q_text = line
            else:
                item_start = sec_chunk.rfind('<div class="ielts-listening-question-item"', 0, pos)
                if item_start == -1:
                    item_start = sec_chunk.rfind('class="ielts-listening-question-item"', 0, pos)
                if item_start != -1:
                    item_end = sec_chunk.find('class="ielts-listening-question-item"', pos)
                    if item_end == -1:
                        item_end = sec_chunk.find('</div></div>', pos)
                    item_chunk = sec_chunk[item_start:item_end if item_end != -1 else pos+1200]
                else:
                    item_chunk = sec_chunk[pos:pos+1200]

                opt_letters = re.findall(r'value="([A-I])"', item_chunk)
                unique_opts = []
                for o in opt_letters:
                    if o not in unique_opts:
                        unique_opts.append(o)
                options = unique_opts if unique_opts else ["A", "B", "C"]

                if '/' in correct_ans or ',' in correct_ans or 'type="checkbox"' in item_chunk or 'data-limit=' in item_chunk:
                    q_type = "multiple_choice"
                else:
                    q_type = "single_choice"

                pm = re.search(rf'ielts-listening-question-number-{q}.*?</span>\s*<span>(.*?)</span>', item_chunk, re.DOTALL)
                if pm:
                    q_text = re.sub(r'<[^>]+>', ' ', pm.group(1)).strip()
                else:
                    pm2 = re.search(rf'ielts-listening-question-number-{q}[^>]*>\d+</strong>\s*<span>(.*?)</span>', item_chunk, re.DOTALL)
                    if pm2:
                        q_text = re.sub(r'<[^>]+>', ' ', pm2.group(1)).strip()

        questions.append({
            "order_index": q,
            "type": q_type,
            "text": q_text,
            "options": options,
            "answer": correct_ans
        })

    return questions

def sql_escape(s: str) -> str:
    if s is None:
        return ""
    return str(s).replace("'", "''")

def get_test_id(book: int, test_num: int) -> int:
    if book == 21 and test_num == 1:
        return 25
    return book * 100 + test_num

def process_test(book: int, test_num: int):
    test_id = get_test_id(book, test_num)
    test_title = f"Cambridge IELTS {book} Academic Listening Test {test_num}"
    print(f"\n=======================================================")
    print(f"Processing {test_title} (ID {test_id})...")
    print(f"=======================================================")

    try:
        raw_html, page_url = download_html(book, test_num)
    except Exception as e:
        print(f"FAILED to download C{book} T{test_num}: {e}")
        return False

    ak_data = fetch_answer_key(book, test_num, raw_html, page_url)
    if not ak_data or len(ak_data.get("data", {}).get("answer_key", [])) != 40:
        print(f"FAILED to get 40 answer keys for Cambridge {book} Test {test_num}!")
        return False

    ans_dict = {item["number"]: item for item in ak_data["data"]["answer_key"]}
    audios = extract_audios(raw_html)
    transcripts = extract_transcripts(raw_html)

    sections = []
    all_questions = []

    for p in [1, 2, 3, 4]:
        sec_id = test_id * 10 + p
        clean_html, part_title = clean_part_html(raw_html, p)
        audio_url = audios.get(p, "")
        passage_text = transcripts.get(p, "")
        p_questions = parse_questions_for_part(p, ans_dict, raw_html)

        q_records = []
        for q in p_questions:
            q_id = test_id * 100 + q["order_index"]
            q_rec = {
                "id": q_id,
                "section_id": sec_id,
                "question_type": q["type"],
                "question_text": q["text"],
                "options": q["options"],
                "correct_answer": q["answer"],
                "points": 1,
                "order_index": q["order_index"]
            }
            q_records.append(q_rec)
            all_questions.append(q_rec)

        sections.append({
            "id": sec_id,
            "test_id": test_id,
            "type": "listening",
            "title": part_title,
            "instructions": clean_html,
            "audio_url": audio_url,
            "passage_text": passage_text,
            "order_index": p,
            "questions": q_records
        })

    test_obj = {
        "id": test_id,
        "title": test_title,
        "description": f"Rasmiy Cambridge IELTS {book} to'plamidan olingan to'liq 4 ta qism va 40 ta savoldan iborat akademik Listening imtihoni.",
        "level": "Multi-level (A1-C1)",
        "duration_minutes": 30,
        "is_active": True,
        "sections": sections
    }

    # Save JSON
    json_path = os.path.join(STORAGE_DIR, f"cambridge_ielts_{book}_academic_listening_test_{test_num}.json")
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(test_obj, f, ensure_ascii=False, indent=2)

    # Generate SQL
    sql_lines = [
        f"-- Cambridge IELTS {book} Academic Listening Test {test_num}",
        f"INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES",
        f"({test_id}, '{sql_escape(test_title)}', '{sql_escape(test_obj['description'])}', 'Multi-level (A1-C1)', 30, true)",
        f"ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;\n"
    ]

    for sec in sections:
        sql_lines.append(
            f"INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES\n"
            f"({sec['id']}, {test_id}, 'listening', '{sql_escape(sec['title'])}', '{sql_escape(sec['instructions'])}', '{sql_escape(sec['audio_url'])}', '{sql_escape(sec['passage_text'])}', {sec['order_index']})\n"
            f"ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, instructions = EXCLUDED.instructions, audio_url = EXCLUDED.audio_url, passage_text = EXCLUDED.passage_text;\n"
        )
        
        q_values = []
        for q in sec["questions"]:
            opts_json = json.dumps(q["options"])
            q_values.append(
                f"({q['id']}, {sec['id']}, '{q['question_type']}', '{sql_escape(q['question_text'])}', '{opts_json}'::jsonb, '{sql_escape(q['correct_answer'])}', 1, {q['order_index']})"
            )
        
        if q_values:
            sql_lines.append(
                f"INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES\n" +
                ",\n".join(q_values) + "\n" +
                f"ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, options = EXCLUDED.options, correct_answer = EXCLUDED.correct_answer, points = EXCLUDED.points;\n"
            )

    sql_path = os.path.join(MIGRATIONS_DIR, f"cambridge_ielts_{book}_listening_test_{test_num}.sql")
    with open(sql_path, "w", encoding="utf-8") as f:
        f.write("\n".join(sql_lines))

    # Apply to PostgreSQL
    cmd = ['docker', 'exec', '-i', 'cefr_postgres', 'psql', '-U', 'cefr_user', '-d', 'cefr_db']
    proc = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = proc.communicate(input="\n".join(sql_lines).encode('utf-8'))
    if proc.returncode != 0:
        print(f"SQL Error for C{book} T{test_num}:", stderr.decode('utf-8', errors='ignore'))
        return False
    else:
        print(f"SUCCESS: Cambridge {book} Test {test_num} saved & migrated into PostgreSQL! (ID: {test_id}, 40 questions)")
        return True

def process_all():
    books = [13, 14, 15, 16, 17, 18, 19, 20, 21]
    results = {}
    
    for b in books:
        for t in [1, 2, 3, 4]:
            if b == 21 and t == 1:
                # Cambridge 21 Test 1 already migrated as ID 25
                results[(b, t)] = True
                continue
            success = process_test(b, t)
            results[(b, t)] = success
            time.sleep(1) # courteous delay
            
    print("\n" + "="*50)
    print("ALL LISTENING TESTS PROCESSING COMPLETED!")
    print("="*50)
    success_count = sum(1 for v in results.values() if v)
    print(f"Successfully processed {success_count} / {len(results)} tests.")
    for (b, t), s in sorted(results.items()):
        status_str = "OK" if s else "FAILED"
        print(f"Cambridge {b} Test {t}: {status_str}")

if __name__ == "__main__":
    if len(sys.argv) >= 2 and sys.argv[1] == 'all':
        process_all()
    elif len(sys.argv) >= 3:
        b = int(sys.argv[1])
        t = int(sys.argv[2])
        process_test(b, t)
    elif len(sys.argv) == 2:
        b = int(sys.argv[1])
        for t in [1, 2, 3, 4]:
            if b == 21 and t == 1:
                continue
            process_test(b, t)
    else:
        print("Usage: python process_listening.py [all | <book> | <book> <test>]")
