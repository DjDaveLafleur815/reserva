from fastapi import APIRouter

router = APIRouter(prefix="/services", tags=["services"])

@router.get("/")
async def get_services():
    return {"services": ["Coupe Homme", "Coloration", "Soin Visage", "Manucure"]}
