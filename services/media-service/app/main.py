from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routers import upload
from app.core.config import settings

app = FastAPI(
    title=settings.PROJECT_NAME,
    description="CEFR Platformasi uchun Audio qabul qilish, saqlash va streaming mikroservisi",
    version="1.0.0"
)

# CORS middleware for Next.js frontend and external clients
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routers
app.include_router(upload.router)

@app.get("/health")
async def health_check():
    return {
        "status": "healthy",
        "service": "cefr-media-service",
        "storage_dir": settings.STORAGE_DIR
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("app.main:app", host="0.0.0.0", port=8000, reload=True)
