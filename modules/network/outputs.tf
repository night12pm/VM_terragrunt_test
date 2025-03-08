output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet1_id" {
  description = "ID of the first subnet"
  value       = azurerm_subnet.subnet1.id
}

output "subnet2_id" {
  description = "ID of the second subnet"
  value       = azurerm_subnet.subnet2.id
}

output "nsg_id" {
  description = "ID of the network security group"
  value       = azurerm_network_security_group.nsg.id
}
