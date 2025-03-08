variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "subnet1_name" {
  description = "Name of the first subnet"
  type        = string
  default     = "Demo-Subnet1"
}

variable "subnet2_name" {
  description = "Name of the second subnet"
  type        = string
  default     = "Demo-Subnet2"
}

variable "subnet1_cidr" {
  description = "CIDR block for the first subnet"
  type        = string
}

variable "subnet2_cidr" {
  description = "CIDR block for the second subnet"
  type        = string
}

variable "region" {
  description = "Azure region to deploy the resources in"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "environment" {
  description = "Tag to specify the environment"
  type        = string
  default     = "dev"
}

variable "allowed_ssh_ip" {
  description = "Public IP address allowed for SSH access"
  type        = string
}
