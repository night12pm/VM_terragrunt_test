#!/bin/bash

# Update the package index
sudo apt-get update -y

# Install common utilities
sudo apt-get install -y curl wget unzip

# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install Terraform
wget https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_amd64.zip
unzip terraform_1.4.6_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_1.4.6_linux_amd64.zip

# Clean up and verify installations
terraform --version
az --version

echo "Tools installed successfully!"
