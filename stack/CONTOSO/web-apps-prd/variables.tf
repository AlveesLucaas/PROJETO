
variable "grupo-recursos" {
  description = "Grupo de rcursos aonde os recursos serão criados"
  type        = string
}

variable "wa_names" {
  description = "Lista de nomes dos Web Apps a serem criados"
  type        = list(string)
}

variable "service_plan_id" {
  description = "ID do plano de serviço do Azure App Service existente"
  type        = string
}

variable "tags" {
  description = "A map of tags for Azure resources."
  type        = map(string)
}

variable "startup_command" {
  description = "Comando de inicialização do Web App"
  type        = string
}

variable "node_version" {
  description = "Definir versão do node"
  type        = string
}

variable "subnet_id" {
  description = "Definir subnet"
  type      = string
}