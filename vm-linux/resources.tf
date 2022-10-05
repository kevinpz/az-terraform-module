# Create a NIC
resource "azurerm_network_interface" "nic" {
  name                = "nic-${var.project_name}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create a VM
resource "azurerm_linux_virtual_machine" "packer" {
  name                = "vm-linux-${var.project_name}"
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_D2ds_v4"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]
  disable_password_authentication = false
  admin_password = var.vm_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}