variable "vm_count" {
  description = "Number of virtual machines to create"
  type        = number
  default     = 2
}

variable "region" {
  description = "Azure region to deploy the resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "Demo"
}

variable "ssh_public_key" {
  description = "Public key for SSH access"
  type        = string
}

variable "subnet1_id" {
  description = "ID of the first subnet"
  type        = string
}

variable "subnet2_id" {
  description = "ID of the second subnet"
  type        = string
}
