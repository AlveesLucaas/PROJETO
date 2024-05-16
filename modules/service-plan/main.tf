resource "azurerm_service_plan" "service-plan" {
  location            = var.location
  name                = var.name
  resource_group_name = var.grupo-recursos
  sku_name            = var.sku_name
  os_type             = var.os_type
  tags                = var.tags
}

