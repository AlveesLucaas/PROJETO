#------------------RESOURCE GROUP-----------------------

variable "resource_group_name" {
  description = "Nome do grupo de recursos"
  type        = string
}

variable "location" {
  description = "Localização do recurso"
  type        = string
}

#------------------STORAGE ACCOUNT-----------------------

variable "storage_account_name" {
  description = "Nome da conta de armazenamento"
  type        = string
}

variable "account_tier" {
  description = "Nível da Storage Account"
  type = string
}

variable "account_replication_type" {
  description = "Nível da Storage Account"
  type = string
}

#------------------SERVICE PLAN---------------------------

variable "service_plan_name" {
  description = "Nome do plano de serviço"
  type        = string
}

variable "os_type" {
	description = "SO do Service Plan"
	type = string
}

variable "sku_name" {
	description = "SKU do Service Plan"
	type = string
}

#----------------FUNCTION APP-----------------------------

variable "function_app_name" {
  description = "Nome do aplicativo de função"
  type        = string
}