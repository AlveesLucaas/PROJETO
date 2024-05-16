variable "location" {
  description = "Localização do Azure onde os recursos serão criados"
  type        = string
  default = "East US"
}

variable "grupo-recursos" {
  description = "Grupo de rcursos aonde os recursos serão criados"
  type        = string
}

variable "web_apps" {
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
  description = "Definir versão do Node JS"
  type        = string
}

variable "https-only" {
  description = "Define se a conexão será feita somente por HTTPS"
  type        = bool
  default = true
}

variable "acesso-publico" {
  description = "O Web App com acesso público?"
  type        = bool
  default = true
}

variable "subnet_id" {
  description = "Definir subnet"
  type      = string
}

variable "ip_restriction_default_action"{
  description = "Nome da regra do azure frontdoor"
  type = string
  default = "Deny"
}

variable "scm_ip_restriction_default_action"{
  description = "Nome da regra do azure frontdoor"
  type = string
  default = "Allow"
}

variable "frontdoor-regra"{
  description = "Nome da regra do azure frontdoor"
  type = string
  default = "frontdoor-inbound"
}

variable "frontdoor-action"{
  description = "Ação de Allow ou deny"
  type = string
  default = "Allow"
}

variable "frontdoor-priority"{
  description = "Priroidade que a regra deverá ser executada"
  type = string
  default = 10
}

variable "frontdoor-service-tag"{
  description = "Service tag do frontdoor"
  type = string
  default = "AzureFrontDoor.Backend"
}
