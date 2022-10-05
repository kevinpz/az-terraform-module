# Create a NIC
resource "azurerm_network_interface" "nic" {
  name                = "nic-w-${var.project_name}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create a VM
resource "azurerm_windows_virtual_machine" "vm" {
  name                = "vm-windows-${var.project_name}"
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_D2ds_v4"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]
  admin_password = var.vm_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}