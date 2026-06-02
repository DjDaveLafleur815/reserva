from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routers import auth, services

app = FastAPI(
    title="Réserva API",
    description="API de réservation de rendez-vous",
    version="1.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(auth.router)
app.include_router(services.router)

@app.get("/")
async def root():
    return {
        "message": "✅ Réserva API is running!",
        "docs": "/docs"
    }
