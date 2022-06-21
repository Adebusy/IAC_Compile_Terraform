terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.4.0"
    }
  }
}

# provider "azurerm" {
#   alias = "azDevTestEnterprise"
#   subscription_id ="a36e9f4a-97d4-4523-91bf-88d84b9c57ed"
#   tenant_id = "f96ae7b7-2a22-43a5-9357-a82ad6b9cb73"
#   client_id = "b832ac96-13f3-46a3-8eef-725397c3df0f"
#   skip_provider_registration = "true"
#   features {}
# }

 provider "azurerm" {
   features {}
 }

data "azurerm_resource_group" "DevTest_Resource_group" {
  name = "${var.Resource_group}"
}

 resource "azurerm_databricks_workspace" "devTest_databrick_workspace" {
  #provider = azurerm.azDevTestEnterprise   
  name                = "${var.databrick_workspace_name}"
  resource_group_name = data.azurerm_resource_group.DevTest_Resource_group.name
  location            = data.azurerm_resource_group.DevTest_Resource_group.location
  sku                 = "standard"

tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
 }

 output "APIM_Name" {
  value ="Databrick workspace name is ${azurerm_databricks_workspace.devTest_databrick_workspace.name}"
}