#### Cria resource group ----------------------------------------------------------------------
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

####Cria a interface de rede com IP interno somente (referenciar a subnet desejada)------------
resource "azurerm_network_interface" "internal-nic" {
  name                = var.network_interface_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

#### Associa o grupo de segurança de rede existente à interface de rede da VM------------------
resource "azurerm_network_interface_security_group_association" "nsg" {
  network_interface_id      = azurerm_network_interface.internal-nic.id
  network_security_group_id = var.network_security_group_id
}

#### Gerar chave SSH---------------------------------------------------------------------------

# Gera uma chave privada RSA de 2048 bits
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Extrai a chave privada no formato PEM
resource "local_file" "ssh_private_key" {
  depends_on = [tls_private_key.ssh_key]
  filename   = "~/.ssh/${var.virtual_machine_name}.pem"
  content    = tls_private_key.ssh_key.private_key_pem
}

# Extrai a chave pública no formato PEM
resource "local_file" "ssh_public_key" {
  depends_on = [tls_private_key.ssh_key]
  filename   = "~/.ssh/${var.virtual_machine_name}.pub"
  content    = tls_private_key.ssh_key.public_key_openssh
}


#### Cria a VM -------------------------------------------------------------------------------
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.virtual_machine_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = var.virtual_machine_size
  admin_username      = var.admin_username
  tags                = var.tags
  network_interface_ids = [
    azurerm_network_interface.internal-nic.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = tls_private_key.ssh_key.public_key_openssh
  }

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.os_disk_size
  }

  # Executar comando "az vm image list" em caso de erro de sintaxe ou nome de imagem------------
  source_image_reference {
    publisher = var.source_image_publisher
    offer     = var.source_image_offer
    sku       = var.source_image_sku
    version   = var.source_image_version
  }

	depends_on = [ local_file.ssh_public_key ]

}

#Adicionando disco externo para armazenamento -------------------------------------------------
resource "azurerm_managed_disk" "disco_ext" {
  name                 = "${var.virtual_machine_name}-DISK"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "disco_attach" {
  managed_disk_id    = azurerm_managed_disk.disco_ext.id
  virtual_machine_id = azurerm_linux_virtual_machine.vm.id
  lun                = "10"
  caching            = "ReadWrite"

}

#Adicionar servidor à política do Azure Backup-----------------------------------------------

resource "azurerm_backup_protected_vm" "backup-vm-ubuntu" {
  resource_group_name = var.rg_backup_vault
  recovery_vault_name = var.vault_backup_name
  source_vm_id        = azurerm_linux_virtual_machine.vm.id
  backup_policy_id    = var.backup_policy_id
}