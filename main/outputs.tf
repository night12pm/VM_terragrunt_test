output "vm_public_ips" {
  description = "Public IPs of the virtual machines"
  value       = module.compute.vm_public_ips
}

output "vm_private_ips" {
  description = "Private IPs of the virtual machines"
  value       = module.compute.vm_private_ips
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.network.vnet_id
}

output "subnet1_id" {
  description = "ID of the first subnet"
  value       = module.network.subnet1_id
}

output "subnet2_id" {
  description = "ID of the second subnet"
  value       = module.network.subnet2_id
}
