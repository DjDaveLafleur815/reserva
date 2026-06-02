from sqlalchemy import Column, Integer, String, Float, ForeignKey
from app.core.database import Base

class Service(Base):
    __tablename__ = "services"

    id = Column(Integer, primary_key=True, index=True)
    professional_id = Column(Integer, ForeignKey("users.id"))
    name = Column(String, nullable=False)          # Ex: "Coupe Homme"
    description = Column(String)
    duration = Column(Integer)                     # en minutes
    price = Column(Float, nullable=False)
