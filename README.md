# Réserva - Application de Prise de Rendez-vous

**Projet 3 Portfolio** | Démonstration d'une application client réel

Application complète permettant aux clients de prendre des rendez-vous et aux professionnels de gérer leur agenda.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

## ✨ Fonctionnalités

### Côté Client
- Recherche de professionnels
- Consultation des détails et services
- Prise de rendez-vous avec choix de date et horaire
- Interface fluide et intuitive

### Côté Professionnel
- Tableau de bord personnel
- Visualisation des rendez-vous du jour
- Ajout de créneaux disponibles

### Général
- Authentification (simulation)
- Deux rôles distincts (Client / Professionnel)
- Design moderne (Material 3)

## 🛠 Stack Technique

- **Frontend** : Flutter (structure simple MVC)
- **Backend** : FastAPI (Python)
- **Base de données** : PostgreSQL
- **DevOps** : Docker + Docker Compose

## 📁 Structure du Projet

```bash
reserva/
├── api/                 # Backend FastAPI
├── gui/                 # Application Flutter
├── docker-compose.yml
└── README.md