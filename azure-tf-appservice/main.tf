terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.4.0"
    }
  }
}

 provider "azurerm" {
   features {}
 }

data "azurerm_resource_group" "azDevTestEnterpriseRG" {
  name = "${var.az_DevTest_Enterprise_resource_group}"
}

data "azurerm_service_plan" "azDevTestEnterprise_App_Service_Plan" {
  name = "${var.az_DevTest_Enterprise_App_Service_Plan_Name}"
  resource_group_name = "${var.az_DevTest_Enterprise_resource_group}"
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = "${data.azurerm_resource_group.azDevTestEnterpriseRG.name}"
  }
  byte_length = 2
}
resource "azurerm_windows_web_app" "azDevTestEnterprise_App_Service" {
  #provider = azurerm.azDevTestEnterprise
  name                = "${var.az_DevTest_Enterprise_App_Service_Name}"
  location            = data.azurerm_resource_group.azDevTestEnterpriseRG.location
  resource_group_name = data.azurerm_resource_group.azDevTestEnterpriseRG.name
  service_plan_id = data.azurerm_service_plan.azDevTestEnterprise_App_Service_Plan.id
  
  site_config {
    
  }
  tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
  # connection_string {
  #   name  = "Database"
  #   type  = "SQLServer"
  #   value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  # }
}