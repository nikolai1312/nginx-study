variable "region" {
  description = "Região que o projeto será criado"
  default     = "us-east1"
}

variable "project_id" {
  description = "ID do projeto"
  default     = ""
}

variable "container_service_name" {
  description = "Nome do serviço que será criado"
  default     = "container"
}

variable "container_image" {
  description = "Imagem usada para criar o container"
  default     = ""
}

variable "roles" {
  description = "Role para associar ao recurso do cloud run"
  default     = "roles/run.invoker"
}

