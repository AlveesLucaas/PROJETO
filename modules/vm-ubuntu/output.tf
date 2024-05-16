output "instance_name" {
  description = "Nome da máquina virtual"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "resource_group_name" {
  description = "Nome do grupo de recursos onde a máquina virtual foi criada"
  value       = azurerm_resource_group.rg.name
}

output "location" {
  description = "Localização onde a máquina virtual foi implantada"
  value       = azurerm_linux_virtual_machine.vm.location
}

output "public_ip_address" {
  description = "Endereço IP público atribuído à máquina virtual"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "private_ip_address" {
  description = "Endereço IP privado atribuído à máquina virtual"
  value       = azurerm_linux_virtual_machine.vm.private_ip_address
}

output "ssh_connection" {
  description = "Informações para conexão SSH com a máquina virtual"
  value = {
    username = var.admin_username
    host     = azurerm_linux_virtual_machine.vm.private_ip_address
  }
}
