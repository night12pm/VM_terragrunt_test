variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "network_security_group_name" {
  description = "Name of the Network Security Group (NSG)"
  type        = string
}

variable "allowed_ssh_ip" {
  description = "Public IP address allowed for SSH access"
  type        = string
}
