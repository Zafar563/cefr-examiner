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

def download_test(book: int, test: int):
    url = f"https://engnovate.com/ielts-reading-tests/cambridge-ielts-{book}-academic-reading-test-{test}/"
    raw_path = os.path.join(SCRATCH_DIR, f"c{book}_t{test}_raw.html")
    if not os.path.exists(raw_path) or os.path.getsize(raw_path) < 1000:
        print(f"Downloading Cambridge {book} Test {test} from {url}...")
        cmd = ['curl.exe', '-s', '-L', url, '-o', raw_path]
        subprocess.check_call(cmd)
    return raw_path

def fetch_answer_key(book: int, test: int, raw_html: str):
    ak_path = os.path.join(SCRATCH_DIR, f"c{book}_t{test}_answer_key.json")
    if os.path.exists(ak_path) and os.path.getsize(ak_path) > 100:
        try:
            with open(ak_path, "r", encoding="utf-8") as f:
                data = json.load(f)
                if data.get("success") and len(data.get("data", {}).get("answer_key", [])) == 40:
                    return data
        except Exception:
            pass

    nonce_m = re.search(r'name="ielts_reading_test_nonce"\s+value="([^"]+)"', raw_html)
    post_id_m = re.search(r'name="post_id"\s+value="([^"]+)"', raw_html)
    if not nonce_m or not post_id_m:
        print(f"Cambridge {book} Test {test}: nonce or post_id not found!")
        return None

    nonce = nonce_m.group(1)
    post_id = post_id_m.group(1)
    page_url = f"https://engnovate.com/ielts-reading-tests/cambridge-ielts-{book}-academic-reading-test-{test}/"
    
    # Use action=process_ielts_reading_test which reliably returns all 40 answers
    cmd = [
        'curl.exe', '-s', '-X', 'POST', 'https://engnovate.com/wp-admin/admin-ajax.php',
        '-H', 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8',
        '-H', 'X-Requested-With: XMLHttpRequest',
        '-H', f'Referer: {page_url}',
        '-d', f'action=process_ielts_reading_test&ielts_reading_test_nonce={nonce}&post_id={post_id}&time_taken_seconds=300&save_learner_progress=0'
    ]
    
    try:
        res_bytes = subprocess.check_output(cmd)
        res = json.loads(res_bytes.decode('utf-8', errors='ignore'))
        if res.get('success'):
            results = res.get('data', {}).get('results', [])
            if len(results) == 40:
                answer_key = []
                for i, r in enumerate(results):
                    answer_key.append({
                        "number": i + 1,
                        "answer": r.get("correct_answer", ""),
                        "explanation": r.get("explanation", "") or r.get("detailed_explanation", "")
                    })
                formatted_data = {
                    "success": True,
                    "data": {
                        "answer_key": answer_key
                    }
                }
                with open(ak_path, "w", encoding="utf-8") as f:
                    json.dump(formatted_data, f, ensure_ascii=False, indent=2)
                return formatted_data
    except Exception as e:
        print(f"Error calling process_ielts_reading_test for C{book} T{test}: {e}")

    # Fallback to action=get_ielts_reading_test_answer_key if needed
    cmd_fallback = [
        'curl.exe', '-s', '-X', 'POST', 'https://engnovate.com/wp-admin/admin-ajax.php',
        '-H', 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8',
        '-H', 'X-Requested-With: XMLHttpRequest',
        '-H', f'Referer: {page_url}',
        '-d', f'action=get_ielts_reading_test_answer_key&ielts_reading_test_nonce={nonce}&post_id={post_id}&is_section_test=&src_test='
    ]
    try:
        res_bytes = subprocess.check_output(cmd_fallback)
        res = json.loads(res_bytes.decode('utf-8', errors='ignore'))
        if res.get('success'):
            with open(ak_path, "w", encoding="utf-8") as f:
                json.dump(res, f, ensure_ascii=False, indent=2)
            return res
    except Exception as e:
        print(f"Fallback error for C{book} T{test}: {e}")

    return None

def extract_passage(raw_html, s_idx):
    pattern = rf'id\s*=\s*"ielts-reading-transcript-{s_idx}"[^>]*>(.*?)(?=<div id="ielts-reading-transcript|\s*</div>\s*</div>\s*<div class="ielts-reading-resize-handle"|\s*<div class="ielts-reading-column")'
    m = re.search(pattern, raw_html, re.DOTALL)
    if not m:
        pattern = rf'id\s*=\s*"ielts-reading-transcript-{s_idx}"[^>]*>(.*?)</div>\s*</div>'
        m = re.search(pattern, raw_html, re.DOTALL)
    if not m:
        return "", f"Reading Passage {s_idx}"
    raw_p = m.group(1)
    
    # Extract title
    title = ""
    h_m = re.search(r'<h[1-4][^>]*>(.*?)</h[1-4]>', raw_p)
    if h_m:
        t_cand = re.sub(r'<[^>]+>', '', h_m.group(1)).strip()
        if len(t_cand) > 3 and not t_cand.lower().startswith('reading passage'):
            title = t_cand
    if not title:
        p_m = re.search(r'<p[^>]*>\s*<strong>(.*?)</strong>\s*</p>', raw_p)
        if p_m:
            t_cand = re.sub(r'<[^>]+>', '', p_m.group(1)).strip()
            if len(t_cand) > 3 and not t_cand.lower().startswith('reading passage'):
                title = t_cand
    if not title:
        s_m = re.search(r'<strong>(.*?)</strong>', raw_p)
        if s_m:
            t_cand = re.sub(r'<[^>]+>', '', s_m.group(1)).strip()
            if len(t_cand) > 3 and not t_cand.lower().startswith('reading passage'):
                title = t_cand
    if not title:
        title = f"Reading Passage {s_idx}"
    else:
        title = f"Reading Passage {s_idx}: {title}"

    # Clean text (strip question items / dropzones injected into transcript)
    clean_p = re.sub(r'<div class="ielts-reading-question-item">.*?</div>', '', raw_p, flags=re.DOTALL)
    clean_p = re.sub(r'<div class="heading-drop-zone.*?</div>', '', clean_p, flags=re.DOTALL)
    p_text = re.sub(r'</p>\s*<p[^>]*>', '\n\n', clean_p)
    p_text = re.sub(r'<br\s*/?>', '\n', p_text)
    p_text = re.sub(r'<[^>]+>', ' ', p_text)
    p_text = html.unescape(p_text).strip()
    lines = [' '.join(l.split()) for l in p_text.split('\n')]
    final_text = '\n'.join([l for l in lines if l])
    return final_text, title

def handle_headings_in_section(chunk, raw_html):
    # Find heading dnd panel
    hp_m = re.search(r'<div class="heading-dnd-panel[^"]*"[^>]*data-dnd-group="([^"]+)"[^>]*>(.*?)</div>\s*</div>', chunk, re.DOTALL)
    if not hp_m:
        hp_m = re.search(r'<div class="heading-dnd-panel[^"]*"[^>]*>(.*?)</div>\s*</div>', chunk, re.DOTALL)
    if not hp_m:
        return chunk, {}

    panel_content = hp_m.group(0)
    
    # Extract cards
    cards = re.findall(r'<div class="dnd-card"[^>]*data-value="([^"]+)"[^>]*>(?:.*?<span class="dnd-text">(.*?)</span>|([^<]+))', panel_content, re.DOTALL)
    if not cards:
        cards_raw = re.findall(r'<div class="dnd-card"[^>]*data-value="([^"]+)"[^>]*data-text="([^"]+)"', panel_content)
        cards = [(c[0], c[1], "") for c in cards_raw]
        
    if not cards:
        return chunk, {}
        
    heading_cards = []
    heading_opts = '<option value="">Tanlang...</option>'
    list_items = ""
    for c in cards:
        c_val = c[0].strip()
        c_txt = (c[1] or c[2] or "").strip()
        clean_txt = c_txt.split(". ", 1)[-1] if ". " in c_txt else c_txt
        heading_cards.append((c_val, clean_txt))
        heading_opts += f'<option value="{c_val}">{c_val}. {clean_txt}</option>'
        list_items += f'<div class="text-xs text-slate-700"><strong>{c_val}.</strong> {clean_txt}</div>'

    # Find the question range from the heading: e.g. Questions 14-19 or 14–20
    q_range_m = re.search(r'Questions\s+(\d+)[\s–-]+(\d+)', chunk, re.IGNORECASE)
    if not q_range_m:
        q_range_m = re.search(r'heading-drop-zone.*?id="ielts-reading-question-number-(\d+)".*?id="ielts-reading-question-number-(\d+)"', raw_html, re.DOTALL)
        
    heading_info = {}
    if q_range_m:
        start_q = int(q_range_m.group(1))
        end_q = int(q_range_m.group(2))
        
        rows_html = ""
        for i, q in enumerate(range(start_q, end_q + 1)):
            p_letter = chr(65 + i)
            p_label = f"Paragraph {p_letter}"
            heading_info[q] = {
                "label": p_label,
                "options": [f"{v}. {t}" for v, t in heading_cards]
            }
            rows_html += f'<div class="flex items-center gap-3 p-2.5 rounded-xl border border-slate-200 bg-white hover:border-emerald-400 transition-all"><strong class="ielts-q-badge">{q}</strong><span class="text-sm font-semibold text-slate-800 w-28">{p_label}:</span><select data-qnum="{q}" name="question_{q}" class="ielts-inline-select flex-1">{heading_opts}</select></div>\n'
            
        replacement_html = f'''<div class="ielts-headings-group mb-6">
  <div class="bg-slate-50 border border-slate-200 rounded-xl p-3 mb-4 space-y-1">
    <div class="text-xs font-bold text-slate-700 uppercase tracking-wider mb-2">List of Headings:</div>
    {list_items}
  </div>
  <div class="space-y-3">
    {rows_html}
  </div>
</div>'''
        chunk = chunk.replace(panel_content, replacement_html)
    return chunk, heading_info

def clean_section_html(raw_html, section_idx):
    pattern = rf'<div id\s*=\s*"ielts-reading-question-section-{section_idx}"[^>]*>(.*?)(?=<div id\s*=\s*"ielts-reading-question-section-|\s*<div class="ielts-reading-footer"|\s*</form>)'
    m = re.search(pattern, raw_html, re.DOTALL)
    if not m:
        return "", {}
    chunk = m.group(1)
    
    # Remove practice button links
    chunk = re.sub(r'<a class="ielts-reading-practice-section-button[^"]*"[^>]*>.*?</a>', '', chunk, flags=re.DOTALL)
    chunk = html.unescape(chunk)
    
    # Handle heading DND panels if present
    chunk, heading_info = handle_headings_in_section(chunk, raw_html)
    
    # 1. Parse DND cards (options-dnd-panel)
    dnd_panels = re.findall(r'<div class="options-dnd-panel[^"]*"[^>]*data-dnd-group="([^"]+)"[^>]*>(.*?)</div>\s*</div>', chunk, re.DOTALL)
    dnd_options_by_group = {}
    for grp_id, p_content in dnd_panels:
        cards = re.findall(r'<div class="dnd-card"[^>]*data-value="([^"]+)"[^>]*>.*?<span class="dnd-text">(.*?)</span>', p_content, re.DOTALL)
        if cards:
            dnd_options_by_group[grp_id] = [f"{c[0]}. {c[1].strip()}" for c in cards]

    # 2. Transform DND drop zones into inline select
    def replace_dnd_drop(match):
        grp = match.group(1)
        qnum = match.group(2)
        opts = dnd_options_by_group.get(grp, [])
        options_html = f'<option value="">[ {qnum} ] Tanlang...</option>'
        for opt in opts:
            options_html += f'<option value="{opt}">{opt}</option>'
        return f'<span class="ielts-inline-select-wrap"><strong class="ielts-q-badge">{qnum}</strong><select data-qnum="{qnum}" name="question_{qnum}" class="ielts-inline-select">{options_html}</select></span>'

    chunk = re.sub(
        r'<span class="options-drop-zone dnd-zone" data-dnd-group="([^"]+)"><strong id="ielts-reading-question-number-(\d+)"[^>]*>\d+</strong>.*?<input type="hidden"[^>]*></span>',
        replace_dnd_drop,
        chunk,
        flags=re.DOTALL
    )

    # 3. Transform inline text inputs
    chunk = re.sub(
        r'<strong id\s*=\s*"ielts-reading-question-number-(\d+)"[^>]*>\d+</strong>\s*<input[^>]*type="text"[^>]*>',
        r'<span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">\1</strong><input type="text" data-qnum="\1" name="question_\1" class="ielts-inline-input" placeholder="[\1] javob..." autocomplete="off" spellcheck="false"></span>',
        chunk,
        flags=re.DOTALL
    )
    
    # Table cell text inputs
    chunk = re.sub(
        r'<td[^>]*>\s*<strong id\s*=\s*"ielts-reading-question-number-(\d+)"[^>]*>\d+</strong>\s*<input[^>]*>\s*</td>',
        r'<td><span class="ielts-inline-input-wrap"><strong class="ielts-q-badge">\1</strong><input type="text" data-qnum="\1" name="question_\1" class="ielts-inline-input" placeholder="[\1] javob..." autocomplete="off" spellcheck="false"></span></td>',
        chunk,
        flags=re.DOTALL
    )

    # 4. Transform matching tables
    def fix_matching_table(table_match):
        table_html = table_match.group(0)
        def fix_row(row_match):
            row_html = row_match.group(0)
            qnum_m = re.search(r'id\s*=\s*"ielts-reading-question-number-(\d+)"', row_html)
            if not qnum_m:
                return row_html
            qnum = qnum_m.group(1)
            row_html = re.sub(
                r'<input type="radio"[^>]*value="([^"]+)"[^>]*>',
                rf'<input type="radio" data-qnum="{qnum}" name="question_{qnum}" value="\1">',
                row_html
            )
            return row_html
        return re.sub(r'<tr class="ielts-reading-question-item">.*?</tr>', fix_row, table_html, flags=re.DOTALL)

    chunk = re.sub(r'<table class="ielts-reading-matching-table">.*?</table>', fix_matching_table, chunk, flags=re.DOTALL)

    # 5. Normalize standalone questions (radio or checkbox)
    def normalize_question_item(match):
        item_content = match.group(1)
        qnums = re.findall(r'id\s*=\s*"ielts-reading-question-number-(\d+)"', item_content)
        if not qnums:
            return match.group(0)
        
        prompt_m = re.search(r'<span>(.*?)</span>', item_content, re.DOTALL)
        if prompt_m:
            prompt_text = re.sub(r'<strong[^>]*>.*?</strong>', '', prompt_m.group(1)).strip()
        else:
            opt_idx = item_content.find('class="ielts-reading-option"')
            if opt_idx != -1:
                prompt_text = re.sub(r'<[^>]+>', ' ', item_content[:opt_idx]).strip()
            else:
                prompt_text = ""
                
        options = re.findall(r'<div class\s*=\s*"ielts-reading-option"[^>]*>.*?value="([^"]+)".*?<span>(.*?)</span>', item_content, re.DOTALL)
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
        r'<div class\s*=\s*"ielts-reading-question-item">(.*?)</div>\s*(?=<div class\s*=\s*"ielts-reading-question-item"|\s*</div>\s*<h2|\s*</div>\s*</div>\s*<h2|\s*</div>\s*</div>\s*</div>|$)',
        normalize_question_item,
        chunk,
        flags=re.DOTALL
    )

    chunk = re.sub(r'class\s*=\s*"[^"]*ielts-reading-question-number[^"]*"', 'class="ielts-q-badge"', chunk)
    return f'<div class="ielts-reading-container">{chunk.strip()}</div>', heading_info

def parse_questions_from_html(raw_html, section_idx, answers_dict, heading_info=None):
    if heading_info is None:
        heading_info = {}
        
    q_range = {
        1: range(1, 14),
        2: range(14, 27),
        3: range(27, 41)
    }[section_idx]

    questions = []
    for q_num in q_range:
        correct_ans = str(answers_dict.get(q_num, ""))
        
        # Check if this question is part of headings
        if q_num in heading_info:
            h_data = heading_info[q_num]
            questions.append({
                "question_number": q_num,
                "section_part": 1 if q_num <= (q_range.start + 6) else 2,
                "question_type": "single_choice",
                "question_text": f"Choose the correct heading for {h_data['label']}",
                "options": h_data["options"],
                "correct_answer": correct_ans,
                "points": 1
            })
            continue

        q_pattern = rf'<strong id\s*=\s*"ielts-reading-question-number-{q_num}"[^>]*>.*?</strong>(.*?)(?=<strong id\s*=\s*"ielts-reading-question-number-|\s*<h2 class="ielts-reading-question-section-heading"|\s*</form>)'
        m = re.search(q_pattern, raw_html, re.DOTALL)
        
        q_text = ""
        opts = []
        q_type = "text_input"
        
        if m:
            block = m.group(1)
            radios = re.findall(r'<div class\s*=\s*"ielts-reading-option"[^>]*>.*?value="([^"]+)".*?<span>(.*?)</span>', block, re.DOTALL)
            text_clean = re.sub(r'<div class\s*=\s*"ielts-reading-option".*?</div>', '', block, flags=re.DOTALL)
            text_clean = re.sub(r'<input[^>]*>', '', text_clean)
            text_clean = re.sub(r'<[^>]+>', ' ', text_clean)
            text_clean = ' '.join(html.unescape(text_clean).split()).strip()
            text_clean = text_clean.replace("Drop answer here", "_______")
            q_text = text_clean
            
            if radios:
                opts = [html.unescape(r[1]).strip() for r in radios]
                q_type = "single_choice"
            else:
                parent_table_m = re.search(rf'<tr class="ielts-reading-question-item">.*?id\s*=\s*"ielts-reading-question-number-{q_num}".*?</tr>', raw_html, re.DOTALL)
                if parent_table_m:
                    q_type = "single_choice"
                    tr_block = parent_table_m.group(0)
                    tr_opts = re.findall(r'value="([^"]+)"', tr_block)
                    if tr_opts:
                        opts = sorted(list(set(tr_opts)))
                else:
                    dz_m = re.search(rf'<span class="options-drop-zone dnd-zone"[^>]*data-dnd-group="([^"]+)"><strong id="ielts-reading-question-number-{q_num}"', raw_html)
                    if dz_m:
                        q_type = "single_choice"
                        grp_id = dz_m.group(1)
                        p_m = re.search(rf'data-dnd-group="{grp_id}"[^>]*>(.*?)</div>\s*</div>', raw_html, re.DOTALL)
                        if p_m:
                            cards = re.findall(r'<div class="dnd-card"[^>]*data-value="([^"]+)"[^>]*>.*?<span class="dnd-text">(.*?)</span>', p_m.group(1), re.DOTALL)
                            opts = [f"{c[0]}. {c[1].strip()}" for c in cards]

        if not q_text:
            surround_m = re.search(rf'([^<>\n]{{1,100}})<strong id\s*=\s*"ielts-reading-question-number-{q_num}"[^>]*>[^<]*</strong>([^<>\n]{{1,100}})', raw_html)
            if surround_m:
                q_text = html.unescape((surround_m.group(1) + " ___ " + surround_m.group(2)).strip())
            else:
                q_text = f"Question {q_num}"

        questions.append({
            "question_number": q_num,
            "section_part": 1 if q_num <= (q_range.start + 6) else 2,
            "question_type": q_type,
            "question_text": q_text,
            "options": opts,
            "correct_answer": correct_ans,
            "points": 1
        })
    return questions

def process_book(book: int):
    print(f"\n==========================================")
    print(f"PROCESSING CAMBRIDGE IELTS {book} ACADEMIC READING")
    print(f"==========================================")
    
    sql_lines = [
        f"-- Migration: cambridge_ielts_{book}_all.sql",
        f"-- Cambridge IELTS {book} Academic Reading Tests 1 to 4",
        f"-- Total 4 full tests, 12 passages, 160 questions with verified answer keys\n"
    ]
    
    for t_idx in [1, 2, 3, 4]:
        test_id = book * 10 + t_idx
        raw_path = download_test(book, t_idx)
        with open(raw_path, "r", encoding="utf-8", errors="ignore") as f:
            raw_html = f.read()
            
        ak_data = fetch_answer_key(book, t_idx, raw_html)
        answers_list = ak_data.get("data", {}).get("answer_key", []) if ak_data else []
        answers_dict = {item["number"]: item["answer"] for item in answers_list}
        print(f"Test {t_idx}: {len(answers_dict)} answer keys available.")
        
        sections = []
        p_titles = []
        for s_idx in [1, 2, 3]:
            p_text, p_title = extract_passage(raw_html, s_idx)
            clean_html, heading_info = clean_section_html(raw_html, s_idx)
            sec_questions = parse_questions_from_html(raw_html, s_idx, answers_dict, heading_info)
            p_titles.append(p_title.split(": ", 1)[-1] if ": " in p_title else p_title)
            
            sections.append({
                "type": "reading",
                "title": p_title,
                "instructions": clean_html,
                "passage_text": p_text,
                "order_index": s_idx,
                "questions": sec_questions
            })
            
        desc = f"Rasmiy Cambridge IELTS {book} to‘plamidan olingan to‘liq 3 ta qism ({', '.join(p_titles)}) va 40 ta savoldan iborat akademik Reading imtihoni."
        title = f"Cambridge IELTS {book} Academic Reading Test {t_idx}"
        
        test_json = {
            "id": test_id,
            "title": title,
            "description": desc,
            "level": "Multi-level (A1-C1)",
            "duration_minutes": 60,
            "sections": sections
        }
        
        # Save JSON
        json_file = os.path.join(STORAGE_DIR, f"cambridge_ielts_{book}_academic_test_{t_idx}.json")
        with open(json_file, "w", encoding="utf-8") as f:
            json.dump(test_json, f, ensure_ascii=False, indent=2)
            
        total_qs = sum(len(s["questions"]) for s in sections)
        print(f"Saved {title} (ID {test_id}) to JSON: {len(sections)} sections, {total_qs} questions.")
        
        # Build SQL
        t_title_sql = title.replace("'", "''")
        t_desc_sql = desc.replace("'", "''")
        sql_lines.append(f"-- Test {test_id}: {title}")
        sql_lines.append(f"INSERT INTO tests (id, title, description, level, duration_minutes, is_active) VALUES")
        sql_lines.append(f"({test_id}, '{t_title_sql}', '{t_desc_sql}', 'Multi-level (A1-C1)', 60, true)")
        sql_lines.append(f"ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description, is_active = true;\n")
        
        for s_idx, sec in enumerate(sections):
            sec_id = test_id * 10 + (s_idx + 1)
            sec_title = sec["title"].replace("'", "''")
            sec_instr = sec["instructions"].replace("'", "''")
            sec_pass = sec["passage_text"].replace("'", "''")
            
            sql_lines.append(f"-- Section {sec_id}: {sec['title']}")
            sql_lines.append(f"INSERT INTO sections (id, test_id, type, title, instructions, audio_url, passage_text, order_index) VALUES")
            sql_lines.append(f"({sec_id}, {test_id}, 'reading', '{sec_title}', '{sec_instr}', NULL, '{sec_pass}', {s_idx + 1})")
            sql_lines.append(f"ON CONFLICT (id) DO UPDATE SET passage_text = EXCLUDED.passage_text, title = EXCLUDED.title, instructions = EXCLUDED.instructions;\n")
            
            for q in sec["questions"]:
                q_num = q["question_number"]
                q_id = test_id * 100 + q_num
                q_type = q["question_type"]
                q_text = q["question_text"].replace("'", "''")
                correct = q["correct_answer"].replace("'", "''")
                opts_json = json.dumps(q.get("options", []), ensure_ascii=False).replace("'", "''")
                
                sql_lines.append(f"INSERT INTO questions (id, section_id, question_type, question_text, options, correct_answer, points, order_index) VALUES")
                sql_lines.append(f"({q_id}, {sec_id}, '{q_type}', '{q_text}', '{opts_json}'::jsonb, '{correct}', 1, {q_num})")
                sql_lines.append(f"ON CONFLICT (id) DO UPDATE SET question_text = EXCLUDED.question_text, correct_answer = EXCLUDED.correct_answer, options = EXCLUDED.options;\n")
                
    sql_lines.append("-- Sync Sequences")
    sql_lines.append("SELECT setval(pg_get_serial_sequence('tests', 'id'), COALESCE((SELECT MAX(id) FROM tests), 1));")
    sql_lines.append("SELECT setval(pg_get_serial_sequence('sections', 'id'), COALESCE((SELECT MAX(id) FROM sections), 1));")
    sql_lines.append("SELECT setval(pg_get_serial_sequence('questions', 'id'), COALESCE((SELECT MAX(id) FROM questions), 1));\n")
    
    out_sql = os.path.join(MIGRATIONS_DIR, f"cambridge_ielts_{book}_all.sql")
    with open(out_sql, "w", encoding="utf-8") as f:
        f.write("\n".join(sql_lines))
        
    print(f"Generated SQL: {out_sql} ({os.path.getsize(out_sql)} bytes)")
    
    # Apply to PostgreSQL
    print(f"Applying migration to PostgreSQL cefr_postgres...")
    cmd = f'Get-Content "{out_sql}" | docker exec -i cefr_postgres psql -U cefr_user -d cefr_db'
    subprocess.check_call(["powershell", "-Command", cmd])
    print(f"Cambridge IELTS {book} applied successfully to database!\n")

if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1:
        if sys.argv[1].lower() == "all":
            books = [19, 18, 17, 16, 15, 14, 13]
        elif "-" in sys.argv[1]:
            start, end = map(int, sys.argv[1].split("-"))
            books = list(range(start, end - 1, -1)) if start >= end else list(range(start, end + 1))
        else:
            books = [int(x) for x in sys.argv[1:]]
    else:
        books = [19]
        
    for b in books:
        process_book(b)
