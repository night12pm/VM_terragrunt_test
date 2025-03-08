output "vm_public_ips" {
  description = "Public IP addresses of the VMs"
  value       = [for ip in azurerm_public_ip.public_ip : ip.ip_address]
}

output "vm_private_ips" {
  description = "Private IP addresses of the VMs"
  value       = [for nic in azurerm_network_interface.nic : nic.private_ip_address]
}
