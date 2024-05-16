##VIRTUAL MACHINE - variables --------------------------------------------

project_name = "DEVOPS-TOOLS"
resource_group_name = "RG-VM"
location            = "brazilsouth"
tags = {
  ENV         = "PRD"
  Application = "DEVOPS TOOLS"
  Terraform   = "SIM"
  Pipeline	  = "TESTE DE PIPELINE"
	}

network_interface_name       = "INTERNAL-NIC-VML"
subnet_id                    = ""
network_security_group_id    = ""

virtual_machine_name         = "VM-PROD-TERRAFORM"
virtual_machine_size         = "standard_d8as_v5"
admin_username               = ""

disk_size_gb                 = "1024"
storage_account_type		 = "Standard_LRS"

os_disk_size_gb				 = "128"
os_disk_caching              = "ReadWrite"
os_disk_storage_account_type = "Standard_LRS"

source_image_publisher       = "Canonical"
source_image_offer           = "0001-com-ubuntu-server-jammy"
source_image_sku             = "22_04-lts-gen2" 
source_image_version         = "latest"

azure_monitor_name           = "LA-MONITOR"
log_analytics_workspace_id   = ""