variable "resource_group_name" {
  description = "Nome do grupo de recursos"
  type        = string
}

variable "location" {
  description = "Localização do recurso"
  type        = string
}

variable "storage_account_name" {
  description = "Nome da conta de armazenamento"
  type        = string
}

variable "service_plan_name" {
  description = "Nome do plano de serviço"
  type        = string
}

variable "function_app_name" {
  description = "Nome do aplicativo de função"
  type        = string
}

variable "tags" {
  description = "A map of tags for Azure resources."
  type        = map(string)
}

