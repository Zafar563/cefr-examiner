import os
import uuid
import aiofiles
from fastapi import APIRouter, UploadFile, File, HTTPException, status
from fastapi.responses import FileResponse
from app.core.config import settings

router = APIRouter(prefix="/api/v1/media", tags=["Media & Audio"])

MIME_TYPES = {
    # Audio
    "mp3": "audio/mpeg",
    "wav": "audio/wav",
    "ogg": "audio/ogg",
    "webm": "audio/webm",
    "m4a": "audio/mp4",
    "aac": "audio/aac",
    # Images
    "png": "image/png",
    "jpg": "image/jpeg",
    "jpeg": "image/jpeg",
    "webp": "image/webp",
    "svg": "image/svg+xml",
    "gif": "image/gif",
    # Video
    "mp4": "video/mp4",
    "mov": "video/quicktime",
    "mkv": "video/x-matroska",
}

@router.post("/upload/audio")
async def upload_audio(file: UploadFile = File(...)):
    """
    Qabul qilinadigan audio fayllar: Speaking yozuvlari, Listening audio yoki tushuntirish audiolari.
    """
    if not file.filename:
        raise HTTPException(status_code=400, detail="Fayl nomi kiritilmagan")

    ext = file.filename.split(".")[-1].lower()
    if ext not in settings.ALLOWED_AUDIO_EXTENSIONS:
        if file.content_type and "webm" in file.content_type:
            ext = "webm"
        elif file.content_type and "wav" in file.content_type:
            ext = "wav"
        elif file.content_type and "mpeg" in file.content_type:
            ext = "mp3"
        else:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Ruxsat berilmagan audio formati. Qabul qilinadi: {', '.join(settings.ALLOWED_AUDIO_EXTENSIONS)}"
            )

    unique_filename = f"{uuid.uuid4().hex}.{ext}"
    file_path = os.path.join(settings.STORAGE_DIR, unique_filename)

    file_size = 0
    try:
        async with aiofiles.open(file_path, "wb") as out_file:
            while content := await file.read(1024 * 1024):
                file_size += len(content)
                if file_size > settings.MAX_FILE_SIZE_MB * 1024 * 1024:
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
        "content_type": MIME_TYPES.get(ext, "audio/mpeg")
    }

@router.post("/upload/image")
async def upload_image(file: UploadFile = File(...)):
    """
    Qabul qilinadigan rasm fayllar: Diagrammalar, skrinshotlar yoki tushuntirish rasmlari (png, jpg, webp, svg).
    """
    if not file.filename:
        raise HTTPException(status_code=400, detail="Fayl nomi kiritilmagan")

    ext = file.filename.split(".")[-1].lower()
    if ext not in settings.ALLOWED_IMAGE_EXTENSIONS:
        if file.content_type and "jpeg" in file.content_type:
            ext = "jpg"
        elif file.content_type and "png" in file.content_type:
            ext = "png"
        elif file.content_type and "webp" in file.content_type:
            ext = "webp"
        else:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Ruxsat berilmagan rasm formati. Qabul qilinadi: {', '.join(settings.ALLOWED_IMAGE_EXTENSIONS)}"
            )

    unique_filename = f"{uuid.uuid4().hex}.{ext}"
    file_path = os.path.join(settings.STORAGE_DIR, unique_filename)

    file_size = 0
    try:
        async with aiofiles.open(file_path, "wb") as out_file:
            while content := await file.read(1024 * 1024):
                file_size += len(content)
                if file_size > settings.MAX_IMAGE_SIZE_MB * 1024 * 1024:
                    await out_file.close()
                    if os.path.exists(file_path):
                        os.remove(file_path)
                    raise HTTPException(
                        status_code=status.HTTP_413_REQUEST_ENTITY_TOO_LARGE,
                        detail=f"Rasm hajmi ruxsat etilgan {settings.MAX_IMAGE_SIZE_MB}MB dan oshib ketdi."
                    )
                await out_file.write(content)
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Rasmni saqlashda xatolik: {str(e)}")

    return {
        "success": True,
        "filename": unique_filename,
        "url": f"/api/v1/media/stream/{unique_filename}",
        "size_bytes": file_size,
        "content_type": MIME_TYPES.get(ext, "image/jpeg")
    }

@router.post("/upload/video")
async def upload_video(file: UploadFile = File(...)):
    """
    Qabul qilinadigan video fayllar: Savol tushuntirish videolari (mp4, webm, mov).
    """
    if not file.filename:
        raise HTTPException(status_code=400, detail="Fayl nomi kiritilmagan")

    ext = file.filename.split(".")[-1].lower()
    if ext not in settings.ALLOWED_VIDEO_EXTENSIONS:
        if file.content_type and "mp4" in file.content_type:
            ext = "mp4"
        elif file.content_type and "webm" in file.content_type:
            ext = "webm"
        else:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Ruxsat berilmagan video formati. Qabul qilinadi: {', '.join(settings.ALLOWED_VIDEO_EXTENSIONS)}"
            )

    unique_filename = f"{uuid.uuid4().hex}.{ext}"
    file_path = os.path.join(settings.STORAGE_DIR, unique_filename)

    file_size = 0
    try:
        async with aiofiles.open(file_path, "wb") as out_file:
            while content := await file.read(1024 * 1024):
                file_size += len(content)
                if file_size > settings.MAX_FILE_SIZE_MB * 1024 * 1024:
                    await out_file.close()
                    if os.path.exists(file_path):
                        os.remove(file_path)
                    raise HTTPException(
                        status_code=status.HTTP_413_REQUEST_ENTITY_TOO_LARGE,
                        detail=f"Video hajmi ruxsat etilgan {settings.MAX_FILE_SIZE_MB}MB dan oshib ketdi."
                    )
                await out_file.write(content)
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Videoni saqlashda xatolik: {str(e)}")

    return {
        "success": True,
        "filename": unique_filename,
        "url": f"/api/v1/media/stream/{unique_filename}",
        "size_bytes": file_size,
        "content_type": MIME_TYPES.get(ext, "video/mp4")
    }

@router.get("/stream/{filename}")
async def stream_media(filename: str):
    """
    Audio va video fayllarni brauzerda oqimli tinglash/ko'rish (Range streaming), shuningdek rasmlarni ko'rsatish.
    """
    clean_filename = os.path.basename(filename)
    file_path = os.path.join(settings.STORAGE_DIR, clean_filename)

    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail="Media fayl topilmadi")

    ext = clean_filename.split(".")[-1].lower()
    media_type = MIME_TYPES.get(ext, "application/octet-stream")

    return FileResponse(
        path=file_path,
        media_type=media_type,
        filename=clean_filename,
        headers={"Accept-Ranges": "bytes"}
    )

@router.get("/info/{filename}")
async def get_media_info(filename: str):
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
