# Get the current config
data "azurerm_client_config" "current" {}

# Create a keyvault
resource "azurerm_key_vault" "kv" {
  name                        = "kvkpz${var.project_name}"
  location                    = var.location
  resource_group_name         = var.rg_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enable_rbac_authorization   = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
}

# Give to the user the permissions on the keyvault
resource "azurerm_role_assignment" "ra-kv" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = var.principal_id
}