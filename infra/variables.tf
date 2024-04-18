variable "region" {
  description = "Região que o projeto será criado"
  default     = "us-east1"
  type        = string
}

variable "project_id" {
  description = "ID do projeto"
  default     = ""
  type        = string
}

variable "container_service_name" {
  description = "Nome do serviço que será criado"
  default     = "container"
  type        = string
}

variable "container_image" {
  description = "Imagem usada para criar o container"
  default     = ""
  type        = string
}

variable "roles" {
  description = "Role para associar ao recurso do cloud run"
  default     = "roles/run.invoker"
  type        = string
}

variable "bucket_name" {
  description = "Nome do bucket"
  default     = ""
  type        = string
}
