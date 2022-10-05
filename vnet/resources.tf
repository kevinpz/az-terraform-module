# Create the VNET
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.project_name}"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.rg_name
}

# Create the subnet
resource "azurerm_subnet" "snet_data" {
  name                 = "data"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}