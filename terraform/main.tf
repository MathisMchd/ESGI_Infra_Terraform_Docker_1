provider "docker" {}

# Réseau Docker
resource "docker_network" "app_network" {
  name = lower(replace(var.project_name, " ", "-"))
}

# Images Docker
resource "docker_image" "postgres" {
  name = "postgres:16-alpine"
}

resource "docker_image" "adminer" {
  name = "adminer:latest"
}

resource "docker_image" "api" {
  name = "infra-devops-api:latest"

  build {
    context = "../app"
    dockerfile = "Dockerfile"
  }
}

# Conteneurs
resource "docker_container" "postgres" {
  name  = "postgres"
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_USER=${var.db_user}",
    "POSTGRES_PASSWORD=${var.db_password}",
    "POSTGRES_DB=${var.db_name}"
  ]

  networks_advanced {
    name = docker_network.app_network.name
  }
}

resource "docker_container" "api" {
  name  = "api"
  image = docker_image.api.image_id

  env = [
    "APP_ENV=${var.app_env}",
    "PORT=3000",
    "DATABASE_URL=postgresql://${var.db_user}:${var.db_password}@postgres:5432/${var.db_name}"
  ]

  ports {
    internal = 3000
    external = var.api_port
  }

  networks_advanced {
    name = docker_network.app_network.name
  }

  restart = "unless-stopped"

  depends_on = [docker_container.postgres]
}

resource "docker_container" "adminer" {
  name  = "adminer"
  image = docker_image.adminer.image_id

  ports {
    internal = 8080
    external = var.adminer_port
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}
