output "network_name" {
  description = "Nom du réseau Docker créé"
  value       = docker_network.app_network.name
}



output "api_url" {
    description = "Url de l'api"
    value = "http://localhost:${var.api_port}"
}

output "adminer_url" {
    description = "Url de l'adminer"
    value = "http://localhost:${var.adminer_port}"
}
