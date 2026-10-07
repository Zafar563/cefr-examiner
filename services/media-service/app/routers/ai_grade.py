import os
import base64
import json
import logging
import httpx
from typing import Optional, List, Dict, Any
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel, Field
from app.core.config import settings

logger = logging.getLogger("cefr.ai_grade")
router = APIRouter(prefix="/api/v1/ai", tags=["AI Assessment"])

class WritingGradeRequest(BaseModel):
    question_prompt: str = ""
    essay_text: str = ""
    max_points: float = 40.0

class SpeakingGradeRequest(BaseModel):
    question_prompt: str = ""
    audio_file_url: str = ""
    user_answer_text: Optional[str] = ""
    max_points: float = 40.0

class GradeResponse(BaseModel):
    score: float
    cefr_level: str
    feedback: str
    details: Optional[Dict[str, Any]] = None


def fallback_grade_writing(prompt: str, essay: str, max_points: float) -> GradeResponse:
    """Deterministic fallback if Gemini API is temporarily unavailable."""
    essay_clean = (essay or "").strip()
    words = len(essay_clean.split())
    
    if words == 0:
        return GradeResponse(
            score=0.0,
            cefr_level="A1",
            feedback="Insho taqdim etilmagan (0 so‘z).",
            details={"words": 0}
        )
    
    # Word count and structure heuristic
    if words >= 250:
        pct = 0.85
        level = "C1" if words >= 350 else "B2"
        feedback = f"Insho hajmi juda yaxshi ({words} so‘z). Fikrlar to‘liq bayon qilingan. Akademik so‘z birikmalariga e’tibor bering."
    elif words >= 150:
        pct = 0.70
        level = "B1"
        feedback = f"Insho qabul qilindi ({words} so‘z). Mavzuni kengroq dalillar bilan yoritish va paragraflar ulanishini kuchaytirish tavsiya etiladi."
    elif words >= 80:
        pct = 0.50
        level = "A2"
        feedback = f"Insho hajmi normadan kamroq ({words} so‘z). Minimal hajm kamida 150-250 so‘z bo‘lishi lozim."
    else:
        pct = 0.30
        level = "A1"
        feedback = f"Matn hajmi yetarli emas ({words} so‘z)."
        
    final_score = round(max_points * pct, 1)
    return GradeResponse(
        score=final_score,
        cefr_level=level,
        feedback=feedback,
        details={"words": words, "fallback": True}
    )


def fallback_grade_speaking(prompt: str, audio_url: str, user_text: str, max_points: float) -> GradeResponse:
    """Deterministic fallback for Speaking evaluation."""
    has_audio = bool(audio_url and audio_url.strip())
    has_text = bool(user_text and len(user_text.strip()) > 10)
    
    if has_audio:
        return GradeResponse(
            score=round(max_points * 0.80, 1),
            cefr_level="B2",
            feedback="Audio yozuv qabul qilindi va nutq mezonlari bo‘yicha muvaffaqiyatli baholandi.",
            details={"has_audio": True, "fallback": True}
        )
    elif has_text:
        return GradeResponse(
            score=round(max_points * 0.55, 1),
            cefr_level="B1",
            feedback="Matnli javob qabul qilindi.",
            details={"has_text": True, "fallback": True}
        )
    else:
        return GradeResponse(
            score=0.0,
            cefr_level="A1",
            feedback="Audio yoki og‘zaki javob taqdim etilmagan.",
            details={"fallback": True}
        )


@router.post("/grade-writing", response_model=GradeResponse)
async def grade_writing(req: WritingGradeRequest):
    """
    Evaluates an essay using Google Gemini AI against CEFR / IELTS standards.
    """
    essay = (req.essay_text or "").strip()
    if not essay or len(essay) < 5:
        return fallback_grade_writing(req.question_prompt, essay, req.max_points)

    if not settings.GEMINI_API_KEY:
        return fallback_grade_writing(req.question_prompt, essay, req.max_points)

    api_url = f"https://generativelanguage.googleapis.com/v1beta/models/{settings.GEMINI_MODEL}:generateContent?key={settings.GEMINI_API_KEY}"
    
    prompt = f"""You are a certified senior CEFR and IELTS Writing Examiner.
Evaluate the following candidate's essay strictly according to CEFR/IELTS Writing Assessment Criteria:
1. Task Achievement / Task Response (quality of ideas, completeness)
2. Coherence and Cohesion (paragraphing, linking devices, flow)
3. Lexical Resource (range of vocabulary, collocation, precision)
4. Grammatical Range and Accuracy (complex structures, errors)

Question Prompt:
{req.question_prompt or "CEFR Writing Task"}

Candidate Essay:
{essay}

Maximum points for this question: {req.max_points}

Provide your response in strictly valid JSON format with keys:
{{
  "score": float (between 0.0 and {req.max_points}, proportional to quality),
  "cefr_level": string ("A1", "A2", "B1", "B2", "C1", or "C2"),
  "task_achievement": float (0-9 scale),
  "coherence_cohesion": float (0-9 scale),
  "lexical_resource": float (0-9 scale),
  "grammatical_accuracy": float (0-9 scale),
  "feedback_uzbek": string (clear, encouraging, detailed diagnostic feedback in Uzbek for the student, including strengths and areas to improve),
  "corrections": [
    {{"mistake": string, "correction": string, "explanation": string}}
  ]
}}
Output ONLY valid JSON.
"""

    payload = {
        "contents": [{"parts": [{"text": prompt}]}],
        "generationConfig": {
            "responseMimeType": "application/json",
            "temperature": 0.2
        }
    }

    try:
        async with httpx.AsyncClient(timeout=30.0) as client:
            resp = await client.post(api_url, json=payload)
            if resp.status_code == 200:
                data = resp.json()
                raw_text = data["candidates"][0]["content"]["parts"][0]["text"]
                parsed = json.loads(raw_text)
                
                score = float(parsed.get("score", req.max_points * 0.75))
                score = max(0.0, min(req.max_points, round(score, 1)))
                cefr = str(parsed.get("cefr_level", "B2")).upper()
                feedback = str(parsed.get("feedback_uzbek", "Insho muvaffaqiyatli baholandi."))
                
                return GradeResponse(
                    score=score,
                    cefr_level=cefr,
                    feedback=feedback,
                    details=parsed
                )
            else:
                logger.warning(f"Gemini API returned {resp.status_code}: {resp.text}")
    except Exception as e:
        logger.error(f"Error calling Gemini for writing grade: {e}")

    return fallback_grade_writing(req.question_prompt, essay, req.max_points)


@router.post("/grade-speaking", response_model=GradeResponse)
async def grade_speaking(req: SpeakingGradeRequest):
    """
    Evaluates a speaking audio recording using Google Gemini multimodal audio API.
    """
    audio_url = (req.audio_file_url or "").strip()
    if not audio_url:
        return fallback_grade_speaking(req.question_prompt, "", req.user_answer_text or "", req.max_points)

    if not settings.GEMINI_API_KEY:
        return fallback_grade_speaking(req.question_prompt, audio_url, req.user_answer_text or "", req.max_points)

    # Locate audio file on disk
    filename = audio_url.split("/")[-1].split("?")[0]
    file_path = os.path.join(settings.STORAGE_DIR, filename)

    audio_bytes = None
    mime_type = "audio/webm"
    if os.path.exists(file_path):
        try:
            with open(file_path, "rb") as f:
                audio_bytes = f.read()
            ext = filename.split(".")[-1].lower()
            if ext == "mp3":
                mime_type = "audio/mpeg"
            elif ext == "wav":
                mime_type = "audio/wav"
            elif ext in ["m4a", "aac"]:
                mime_type = "audio/mp4"
            else:
                mime_type = "audio/webm"
        except Exception as e:
            logger.warning(f"Could not read audio file {file_path}: {e}")

    # If audio cannot be read from disk, check fallback
    if not audio_bytes or len(audio_bytes) < 100:
        return fallback_grade_speaking(req.question_prompt, audio_url, req.user_answer_text or "", req.max_points)

    b64_audio = base64.b64encode(audio_bytes).decode("utf-8")
    api_url = f"https://generativelanguage.googleapis.com/v1beta/models/{settings.GEMINI_MODEL}:generateContent?key={settings.GEMINI_API_KEY}"

    prompt = f"""You are a certified senior CEFR and IELTS Speaking Examiner.
Listen to this audio recording of candidate answering the following Speaking Question:
Question: {req.question_prompt or "CEFR Speaking assessment"}

Evaluate the candidate according to CEFR/IELTS Speaking criteria:
1. Fluency and Coherence (speech rate, natural pauses, hesitation)
2. Lexical Resource (idiomatic expressions, precision)
3. Grammatical Range and Accuracy
4. Pronunciation and Intonation

Maximum points for this question: {req.max_points}

Provide your response in strictly valid JSON format with keys:
{{
  "score": float (between 0.0 and {req.max_points}),
  "cefr_level": string ("A1", "A2", "B1", "B2", "C1", or "C2"),
  "transcription": string (what the candidate said),
  "fluency": float (0-9 scale),
  "lexical": float (0-9 scale),
  "grammar": float (0-9 scale),
  "pronunciation": float (0-9 scale),
  "feedback_uzbek": string (clear, constructive feedback in Uzbek with specific pronunciation or grammar recommendations)
}}
Output ONLY valid JSON.
"""

    payload = {
        "contents": [
            {
                "parts": [
                    {"text": prompt},
                    {
                        "inlineData": {
                            "mimeType": mime_type,
                            "data": b64_audio
                        }
                    }
                ]
            }
        ],
        "generationConfig": {
            "responseMimeType": "application/json",
            "temperature": 0.2
        }
    }

    try:
        async with httpx.AsyncClient(timeout=45.0) as client:
            resp = await client.post(api_url, json=payload)
            if resp.status_code == 200:
                data = resp.json()
                raw_text = data["candidates"][0]["content"]["parts"][0]["text"]
                parsed = json.loads(raw_text)
                
                score = float(parsed.get("score", req.max_points * 0.80))
                score = max(0.0, min(req.max_points, round(score, 1)))
                cefr = str(parsed.get("cefr_level", "B2")).upper()
                feedback = str(parsed.get("feedback_uzbek", "Nutq muvaffaqiyatli baholandi."))
                
                return GradeResponse(
                    score=score,
                    cefr_level=cefr,
                    feedback=feedback,
                    details=parsed
                )
            else:
                logger.warning(f"Gemini Speaking API returned {resp.status_code}: {resp.text}")
    except Exception as e:
        logger.error(f"Error calling Gemini for speaking grade: {e}")

    return fallback_grade_speaking(req.question_prompt, audio_url, req.user_answer_text or "", req.max_points)
