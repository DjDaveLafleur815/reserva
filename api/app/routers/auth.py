from fastapi import APIRouter

router = APIRouter(prefix="/auth", tags=["auth"])

@router.post("/register")
async def register():
    return {"message": "Inscription OK (à développer)"}

@router.post("/login")
async def login():
    return {"access_token": "fake_token_123", "token_type": "bearer"}
