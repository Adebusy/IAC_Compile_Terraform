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
   skip_provider_registration = "true"
   features {}
 }

data "azurerm_resource_group" "azDevTestEnterpriseRG" {
  name = "${var.az_DevTest_resource_group_name}"
}

#Shared / Consumption Plan)
resource "azurerm_service_plan" "DevTest_App_Service_Plane" {
  #provider = azurerm.azDevTestEnterprise
  name                = "${var.az_DevTest_App_Service_Plan_Name}"
  location            = data.azurerm_resource_group.azDevTestEnterpriseRG.location
  resource_group_name = data.azurerm_resource_group.azDevTestEnterpriseRG.name
  os_type = "${var.os_type}"
  sku_name = "B1"

  tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
}

output "DevTest_Appservice_name" {
  value = azurerm_service_plan.DevTest_App_Service_Plane.name
}

