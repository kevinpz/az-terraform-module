# Output the keyvault ID
output "keyvault_id" {
    value = azurerm_key_vault.kv.id
}