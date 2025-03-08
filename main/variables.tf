variable "region" {
  description = "Azure region for resource deployment"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Resource group to deploy resources"
  type        = string
  default     = "Demo-Infra-RG"
}

variable "home_public_ip" {
  description = "Public IP address allowed for SSH access"
  type        = string
}
