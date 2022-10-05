# Output the VNET ID
output "vnet_id" {
    value = azurerm_virtual_network.vnet.id
}

# Output the subnet ID
output "subnet_data_id" {
    value = azurerm_subnet.snet_data.id
}