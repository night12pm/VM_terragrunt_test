terraform {
  source = "../modules//network"  # You can point it to any module you want to use
}

remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "Demo-Infra-RG"
    storage_account_name = "yourstorageaccount"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

inputs = {
  region              = "East US"
  resource_group_name = "Demo-Infra-RG"
  home_public_ip      = "203.0.113.0"
}
