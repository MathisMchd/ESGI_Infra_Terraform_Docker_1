# Infra DevOps - API Node.js

Infrastructure complète avec API Node.js, PostgreSQL et Adminer, orchestrée par Terraform et Docker.

## Architecture

- **API** : Node.js + Express (port 3000)
- **Base de données** : PostgreSQL 16 Alpine
- **Admin DB** : Adminer (port 4000)
- **Infrastructure** : Terraform avec provider Docker
- **Réseau** : Docker network dédié

## Prérequis

- Docker & Docker Compose
- Terraform >= 1.0
- Node.js 18+ (dev local)
- npm

## Démarrage rapide

### Avec Terraform

```bash
cd terraform
terraform init
terraform apply
```

Cela déploie automatiquement PostgreSQL, l'API et Adminer.

### Tests endpoints

```bash
# Health check
curl http://localhost:3000/health

# Infos API
curl http://localhost:3000/

# Adminer 
curl http://localhost:4000/
```



## Configuration

Variables d'environnement (`.env`)


## Structure du projet

```
.
├── app/                    # Application Node.js
│   ├── server.js
│   ├── package.json
│   ├── Dockerfile
│   └── node_modules/
├── terraform/              # Infrastructure IaC
│   ├── main.tf            # Ressources Docker
│   ├── variables.tf       # Variables
│   ├── outputs.tf         # Outputs
│   └── versions.tf        # Requirements
└── .env.example           # Template variables
```

## Déploiement Docker

### Build image API

```bash
docker build -t infra-devops-api:latest ./app
```

### Avec docker-compose

```bash
docker-compose up
```

## Terraform

### Ressources créées

- Réseau Docker : `infra-devops`
- Conteneur PostgreSQL : `postgres`
- Conteneur API : `api`
- Conteneur Adminer : `adminer`

### Commandes

```bash
cd terraform
terraform plan      # Aperçu changements
terraform apply     # Déploiement
terraform destroy   # Suppression
terraform output    # Afficher outputs
```

