module "vm-ubuntu" {
  source                       = "../../../modules/vm-ubuntu"
  project_name                 = var.project_name
  rg_name                      = var.resource_group_name
  location                     = var.location
  tags                         = var.tags
  network_interface_name       = var.network_interface_name
  subnet_id                    = var.subnet_id
  network_security_group_id    = var.network_security_group_id
  virtual_machine_name         = var.virtual_machine_name
  virtual_machine_size         = var.virtual_machine_size
  admin_username               = var.admin_username
  os_disk_size                 = var.os_disk_size_gb
  os_disk_caching              = var.os_disk_caching
  os_disk_storage_account_type = var.os_disk_storage_account_type
  disk_size_gb                 = var.disk_size_gb
  storage_account_type         = var.storage_account_type
  source_image_publisher       = var.source_image_publisher
  source_image_offer           = var.source_image_offer
  source_image_sku             = var.source_image_sku
  source_image_version         = var.source_image_version
  azure_monitor_name           = var.azure_monitor_name
  log_analytics_workspace_id   = var.log_analytics_workspace_id
}

