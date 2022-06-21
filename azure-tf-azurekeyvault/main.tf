terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.7.0"
    }
  }
}
data "azurerm_client_config" "current" {
  
}

provider "azurerm" {
  alias = "Dev_Test_Provider"
  subscription_id ="a36e9f4a-97d4-4523-91bf-88d84b9c57ed"
  tenant_id = "f96ae7b7-2a22-43a5-9357-a82ad6b9cb73"
  client_id = "b832ac96-13f3-46a3-8eef-725397c3df0f"
  features {}
 }

data "azurerm_resource_group" "dev_Test_RG" {
  name = "${var.az_resource_group_name}"
}


provider "azurerm" {
  features {}
}

#resource_group_name         = lookup(var.az_Dev_Test_resource_group, "AzureBackup")
# tenant_id = "f96ae7b7-2a22-43a5-9357-a82ad6b9cb73"
resource "azurerm_key_vault" "devtest_key_vault" {
  #provider = azurerm.Dev_Test_Provider
  name                        = "${var.test_Key_Vault_name}"
  location                    = data.azurerm_resource_group.dev_Test_RG.location
  resource_group_name         = "${var.az_resource_group_name}"
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  tenant_id = data.azurerm_client_config.current.client_id #"f96ae7b7-2a22-43a5-9357-a82ad6b9cb73"#data.azurerm_client_config.current.client_id 

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.client_id#"f96ae7b7-2a22-43a5-9357-a82ad6b9cb73"#data.azurerm_client_config.current.client_id#"f96ae7b7-2a22-43a5-9357-a82ad6b9cb73"
    object_id = data.azurerm_client_config.current.object_id//data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
 tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
  
  }

output "name" {
  value = azurerm_key_vault.devtest_key_vault.name
}