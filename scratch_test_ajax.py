import subprocess
import json

nonce = "e047e2166c"
post_id = "1680226"
page_url = "https://engnovate.com/ielts-listening-tests/cambridge-ielts-20-academic-listening-test-1/"

for action in ["process_ielts_listening_test", "get_ielts_listening_test_answer_key"]:
    cmd = [
        'curl.exe', '-s', '-X', 'POST', 'https://engnovate.com/wp-admin/admin-ajax.php',
        '-H', 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8',
        '-H', 'X-Requested-With: XMLHttpRequest',
        '-H', f'Referer: {page_url}',
        '-d', f'action={action}&ielts_listening_test_nonce={nonce}&post_id={post_id}&time_taken_seconds=300&save_learner_progress=0'
    ]
    try:
        res = subprocess.check_output(cmd).decode('utf-8', errors='ignore')
        print(f"Action {action} returned length:", len(res))
        data = json.loads(res)
        print("Success:", data.get("success"))
        if data.get("data"):
            print("Data keys:", list(data["data"].keys()))
            if "results" in data["data"]:
                print("Results count:", len(data["data"]["results"]))
                print("Sample result:", data["data"]["results"][0])
            if "answer_key" in data["data"]:
                print("Answer key count:", len(data["data"]["answer_key"]))
                print("Sample answer:", data["data"]["answer_key"][0])
    except Exception as e:
        print(f"Error {action}:", e)
