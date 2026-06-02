# Réserva - Application de Prise de Rendez-vous

**Projet 3 - MVP Client Réel** | Portfolio Flutter Freelance

Une application complète permettant aux clients de prendre RDV et aux professionnels de gérer leur agenda.

## ✨ Fonctionnalités

- Authentification (Client / Professionnel)
- Interface Client : Recherche de pros, détail, prise de RDV avec choix de créneau
- Interface Professionnel : Tableau de bord + Ajout de créneaux
- Design moderne et intuitif
- Structure MVC simple

## 🛠 Stack

- **Frontend** : Flutter (structure simple : models / views / services)
- **Backend** : FastAPI (Python)
- **Navigation** : GoRouter

## ▶️ Lancement

**Backend**
```bash
cd api
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000