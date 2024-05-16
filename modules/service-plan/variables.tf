#-------------------RESOURCE GROUP---------------------------------
variable "grupo-recursos" {
  description = "Resource Group aonde o serviço será hospedado"
  type        = string
}

variable "location" {
  description = "Localização do Azure onde os recursos serão criados"
  type        = string
}

#--------------------RESOURCE GROUP---------------------------------

variable "name" {
  description = "Nome do Service Plan"
  type        = string
}

variable "sku_name" {
  description = "Tamanho do service plan"
  type        = string
}

variable "os_type" {
  description = "OS do Service Plan"
  type        = string
}

variable "tags" {
  description = "A map of tags for Azure resources."
  type        = map(string)
}