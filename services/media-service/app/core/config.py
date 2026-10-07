import os
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    PROJECT_NAME: str = "CEFR Media & Audio Service"
    STORAGE_DIR: str = os.getenv("STORAGE_DIR", "/app/storage/uploads")
    ALLOWED_EXTENSIONS: set = {"mp3", "wav", "m4a", "ogg", "webm", "aac"}
    MAX_FILE_SIZE_MB: int = 50
    GEMINI_API_KEY: str = os.getenv("GEMINI_API_KEY", "")
    GEMINI_MODEL: str = os.getenv("GEMINI_MODEL", "gemini-3.8-flash")

    class Config:
        env_file = ".env"
        extra = "allow"

settings = Settings()
os.makedirs(settings.STORAGE_DIR, exist_ok=True)
