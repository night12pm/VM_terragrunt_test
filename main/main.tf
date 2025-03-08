module "network" {
  source              = "../modules/network"
  vnet_name           = "Demo-VNet"
  region              = var.region
  resource_group_name = var.resource_group_name
  subnet1_cidr        = "10.1.1.0/24"
  subnet2_cidr        = "10.1.2.0/24"
  allowed_ssh_ip      = var.home_public_ip
}

module "compute" {
  source              = "../modules/compute"
  vm_count            = 2
  prefix              = "Demo"
  region              = var.region
  resource_group_name = var.resource_group_name
  subnet1_id          = module.network.subnet1_id
  subnet2_id          = module.network.subnet2_id
  ssh_public_key      = file("~/.ssh/id_rsa.pub")
}

module "security" {
  source                     = "../modules/security"
  resource_group_name        = var.resource_group_name
  network_security_group_name = "Demo-NSG"
  allowed_ssh_ip             = var.home_public_ip
}
