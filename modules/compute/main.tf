resource "azurerm_public_ip" "public_ip" {
  count               = var.vm_count
  name                = "${var.prefix}-VM${count.index + 1}-PublicIP"
  location            = var.region
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.prefix}-VM${count.index + 1}-NIC"
  location            = var.region
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = count.index == 0 ? var.subnet1_id : var.subnet2_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[count.index].id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "${var.prefix}-VM${count.index + 1}"
  location            = var.region
  resource_group_name = var.resource_group_name
  size                = "Standard_B2s"
  admin_username      = "ubuntu"

  admin_ssh_key {
    username   = "ubuntu"
    public_key = var.ssh_public_key
  }

  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22.04-LTS"
    version   = "latest"
  }

  custom_data = file("${path.module}/../scripts/install_tools.sh")
}
