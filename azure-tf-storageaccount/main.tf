terraform {
  required_providers{
      azurerm = {
          source = "hashicorp/azurerm"
          version = "3.3.0"
      }
  }
}

provider "azurerm" {
#   alias = "devtest"
#   subscription_id ="a36e9f4a-97d4-4523-91bf-88d84b9c57ed"
#   tenant_id = "f96ae7b7-2a22-43a5-9357-a82ad6b9cb73"
#   client_id = "b832ac96-13f3-46a3-8eef-725397c3df0f".
   features {}
}
data "azurerm_resource_group" "az_Dev_Test_resource_group" {
  name = "${var.Resource_group}"
}

resource "azurerm_storage_account" "Dev_Test_storage_account" {
  name                     =  "${var.Storage_Account_Name}"
  resource_group_name = data.azurerm_resource_group.az_Dev_Test_resource_group.name
  //resource_group_name      = lookup(var.az_Dev_Test_resource_group, "AzureBackup")
  location                 = data.azurerm_resource_group.az_Dev_Test_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

   tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
}
