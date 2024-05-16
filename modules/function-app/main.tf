provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "grupo-recurso" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.grupo-recurso.name
  location                 = azurerm_resource_group.grupo-recurso.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_service_plan" "service-plan" {
  name                = var.service_plan_name
  location            = azurerm_resource_group.grupo-recurso.location
  resource_group_name = azurerm_resource_group.grupo-recurso.name
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_linux_function_app" "function_app" {
  name                       = var.function_app_name
  location                   = azurerm_resource_group.grupo-recurso.location
  resource_group_name        = azurerm_resource_group.grupo-recurso.name
  service_plan_id            = azurerm_service_plan.service-plan.id
  storage_account_name       = azurerm_storage_account.storage.name
  storage_account_access_key = azurerm_storage_account.storage.primary_access_key

  site_config {}
}