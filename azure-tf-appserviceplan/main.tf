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
#   subscription_id ="**********"
#   tenant_id = "*****************"
#   client_id = "b832ac96-13f3-46a3-8eef-725397c3df0f"
#   skip_provider_registration = "true"
#   features {}
# }

  backend "azurerm" {
    resource_group_name = "rg-uw-devops-sandbox"
    storage_account_name = "sauwvmnetcsr01nonprod"
    container_name       = "logicappcontainer"
    key                  = "test.terraform.tfstate"
    #use_azuread_auth     = true
  }

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

