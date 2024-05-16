provider "azurerm" {
  features {}
}

module "function-app" {
  source               = "../../../modules/function-app"
  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  service_plan_name    = var.service_plan_name
  function_app_name    = var.function_app_name
}
