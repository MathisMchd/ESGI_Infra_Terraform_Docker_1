# API Node.js - Infra DevOps

API Node.js simple respectant les spécifications DevOps.

## Installation

```bash
npm install
```

## Configuration

Créer un fichier `.env` à la racine du projet en copiant `.env.example` :

```bash
cp .env.example .env
```

Variables disponibles :
- `PORT` : Port d'écoute (défaut: 3000)
- `APP_ENV` : Environnement de l'application
- `DATABASE_URL` : URL de connexion à la base de données

## Utilisation

Démarrer le serveur :

```bash
npm start
```

## Endpoints

- `GET /health` → `200 OK` avec `{"status":"ok"}`
- `GET /` → Informations sur l'application avec l'environnement actuel
