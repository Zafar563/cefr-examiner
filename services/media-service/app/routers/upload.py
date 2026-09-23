import os
import uuid
import aiofiles
from fastapi import APIRouter, UploadFile, File, HTTPException, status
from fastapi.responses import FileResponse
from app.core.config import settings

router = APIRouter(prefix="/api/v1/media", tags=["Media & Audio"])

MIME_TYPES = {
    "mp3": "audio/mpeg",
    "wav": "audio/wav",
    "ogg": "audio/ogg",
    "webm": "audio/webm",
    "m4a": "audio/mp4",
    "aac": "audio/aac",
}

@router.post("/upload/audio")
async def upload_audio(file: UploadFile = File(...)):
    """
    Qabul qilinadigan audio fayllar: Speaking yozuvlari (webm/wav/mp3)
    yoki Admin yuklagan Listening audio fayllari.
    """
    if not file.filename:
        raise HTTPException(status_code=400, detail="Fayl nomi kiritilmagan")

    # Extension check
    ext = file.filename.split(".")[-1].lower()
    if ext not in settings.ALLOWED_EXTENSIONS:
        # Fallback for WebM recorded by MediaRecorder
        if file.content_type and "webm" in file.content_type:
            ext = "webm"
        elif file.content_type and "wav" in file.content_type:
            ext = "wav"
        else:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Ruxsat berilmagan fayl formati. Qabul qilinadi: {', '.join(settings.ALLOWED_EXTENSIONS)}"
            )

    # Unique file generation
    unique_filename = f"{uuid.uuid4().hex}.{ext}"
    file_path = os.path.join(settings.STORAGE_DIR, unique_filename)

    # Save asynchronously
    file_size = 0
    try:
        async with aiofiles.open(file_path, "wb") as out_file:
            while content := await file.read(1024 * 1024): # 1MB chunks
                file_size += len(content)
                if file_size > settings.MAX_FILE_SIZE_MB * 1024 * 1024:
                    # Clean up
                    await out_file.close()
                    if os.path.exists(file_path):
                        os.remove(file_path)
                    raise HTTPException(
                        status_code=status.HTTP_413_REQUEST_ENTITY_TOO_LARGE,
                        detail=f"Fayl hajmi ruxsat etilgan {settings.MAX_FILE_SIZE_MB}MB dan oshib ketdi."
                    )
                await out_file.write(content)
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Faylni saqlashda xatolik: {str(e)}")

    return {
        "success": True,
        "filename": unique_filename,
        "url": f"/api/v1/media/stream/{unique_filename}",
        "size_bytes": file_size,
        "content_type": MIME_TYPES.get(ext, "application/octet-stream")
    }

@router.get("/stream/{filename}")
async def stream_audio(filename: str):
    """
    Audioni brauzerda tinglash va test davomida qayta eshitish uchun oqim (streaming) qilib beradi.
    """
    # Prevent directory traversal
    clean_filename = os.path.basename(filename)
    file_path = os.path.join(settings.STORAGE_DIR, clean_filename)

    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail="Audio fayl topilmadi")

    ext = clean_filename.split(".")[-1].lower()
    media_type = MIME_TYPES.get(ext, "audio/mpeg")

    return FileResponse(
        path=file_path,
        media_type=media_type,
        filename=clean_filename,
        headers={"Accept-Ranges": "bytes"}
    )

@router.get("/info/{filename}")
async def get_audio_info(filename: str):
    clean_filename = os.path.basename(filename)
    file_path = os.path.join(settings.STORAGE_DIR, clean_filename)
    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail="Fayl topilmadi")
    stat = os.stat(file_path)
    return {
        "filename": clean_filename,
        "size_bytes": stat.st_size,
        "url": f"/api/v1/media/stream/{clean_filename}"
    }
