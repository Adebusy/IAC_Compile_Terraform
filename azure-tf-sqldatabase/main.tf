terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.4.0"
    }
  }
}

provider "azurerm" {
  alias = "azDevTestEnterprise"
  subscription_id ="a36e9f4a-97d4-4523-91bf-88d84b9c57ed"
  tenant_id = "f96ae7b7-2a22-43a5-9357-a82ad6b9cb73"
  client_id = "b832ac96-13f3-46a3-8eef-725397c3df0f"
  skip_provider_registration = "true"
  features {}
}

 provider "azurerm" {
   features {}
 }

data "azurerm_resource_group" "DevTest_Resource_group" {
  name = var.Dev_Test_Resource_group
}

# resource "azurerm_storage_account" "devTest_Storage_account" {
#   provider = azurerm.azDevTestEnterprise
#   name                     = "sasql${var.DevTest_azurerm_mssql_server_name}"
#   resource_group_name      = data.azurerm_resource_group.DevTest_Resource_group.name
#   location                 = data.azurerm_resource_group.DevTest_Resource_group.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

resource "azurerm_mssql_server" "devTest_mssql_server" {
  provider = azurerm.azDevTestEnterprise
  name                         = var.DevTest_azurerm_mssql_server_name
  resource_group_name          = data.azurerm_resource_group.DevTest_Resource_group.name
  location                     = data.azurerm_resource_group.DevTest_Resource_group.location
  version                      = "12.0"
  administrator_login          = var.DevTest_mssql_server_admin_login
  administrator_login_password = var.DevTest_mssql_server_admin_password

  tags = {
      "APPLICATION" = "DEVOPS-SANDBOX"  
    "COSTCENTER" = "901105"
    "ENVIRONMENT" = "NONPRODUCTION"
  }
}

resource "azurerm_mssql_database" "devTest_mssql_database" {
  provider = azurerm.azDevTestEnterprise
  name           = var.DevTest_azurerm_mssql_databse_name
  server_id      = azurerm_mssql_server.devTest_mssql_server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 250
  sku_name       = "S0"
  zone_redundant = false
  

 tags = {
      "APPLICATION" = "DEVOPS-SANDBOX"  
    "COSTCENTER" = "901105"
    "ENVIRONMENT" = "NONPRODUCTION"
  }

}

output "APIM_Name" {
  value ="APIM name is ${azurerm_api_management.DevTest_APIM.name}"
}

output "APIM_API_Name" {
  value ="APIM name is ${azurerm_api_management_api.DevTest_API.name}"
}