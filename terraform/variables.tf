variable "project_name" {
  description = "Nom du projet"
  type        = string
  default     = "Infra DevOps"
}

variable "app_env" {
  description = "Environnement de déploiement"
  type        = string
  default     = "production"
}

variable "api_port" {
  description = "Port de l'API"
  type        = number
  default     = 3000
}

variable "adminer_port" {
  description = "Port Adminer"
  type        = number
  default     = 4000
}

variable "db_user" {
  description = "Utilisateur de la bd"
  type        = string
  default     = "user"
}

variable "db_password" {
  description = "Mot de passe de la base"
  type        = string
  sensitive   = true
  default     = "password"
}

variable "db_name" {
  description = "Nom de la base"
  type        = string
  default     = "database"
}