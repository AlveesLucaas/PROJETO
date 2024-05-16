variable "project_name" {
  description = "Nome do projeto"
  type        = string
}


variable "resource_group_name" {
  description = "The name of the resource group where Azure resources will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed."
  type        = string
}

variable "tags" {
  description = "A map of tags for Azure resources."
  type        = map(string)
}

variable "network_interface_name" {
  description = "The name of the network interface."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the network interface will be attached."
  type        = string
}

variable "network_security_group_id" {
  description = "The ID of the network security group to associate with the network interface."
  type        = string
}

variable "virtual_machine_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "virtual_machine_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "The username for the administrator account of the virtual machine."
  type        = string
}

variable "storage_account_type" {
  description = "Tipo de disco"
  type        = string
}

variable "disk_size_gb" {
  description = "Tamanho do disco de storage"
  type        = string

}

variable "os_disk_size_gb" {
  description = "Tamanho do disco do SO"
  type        = string
}

variable "os_disk_caching" {
  description = "The caching type for the OS disk."
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk."
  type        = string
}

variable "source_image_publisher" {
  description = "The publisher of the source image for the virtual machine."
  type        = string
}

variable "source_image_offer" {
  description = "The offer of the source image for the virtual machine."
  type        = string
}

variable "source_image_sku" {
  description = "The SKU of the source image for the virtual machine."
  type        = string
}

variable "source_image_version" {
  description = "The version of the source image for the virtual machine."
  type        = string
}

variable "azure_monitor_name" {
  description = "The name of the Azure Monitor diagnostic setting."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace for Azure Monitor."
  type        = string
}