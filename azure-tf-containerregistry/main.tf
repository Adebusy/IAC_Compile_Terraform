
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.3.0"
    }
  }
}

#provider "azurerm" {
  # alias = "azDevTestEnterprise"
  # subscription_id ="a36e9f4a-97d4-4523-91bf-88d84b9c57ed"
  # tenant_id = "f96ae7b7-2a22-43a5-9357-a82ad6b9cb73"
  # client_id = "b832ac96-13f3-46a3-8eef-725397c3df0f"
  #skip_provider_registration = "true"
  #features {}
#}

 provider "azurerm" {
   features {}
 }

data "azurerm_resource_group" "DevTest_Resource_group" {
  name = var.Resource_group
}

resource "azurerm_container_registry" "devtest_enterprise_Container_registry" {
  #provider            = azurerm.azDevTestEnterprise
  name                = var.Container_Registry_name
  resource_group_name = data.azurerm_resource_group.DevTest_Resource_group.name
  location            = data.azurerm_resource_group.DevTest_Resource_group.location
  #admin_username = var.Dev_Test_Container_Registry_admin_username
  tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
  sku = "Basic"
}

output "acr_admin_name" {
  value = azurerm_container_registry.devtest_enterprise_Container_registry.name
}

output "acr_admin_username" {
  value = azurerm_container_registry.devtest_enterprise_Container_registry.admin_username
}

output "acr_admin_password" {
  value = azurerm_container_registry.devtest_enterprise_Container_registry.admin_password
  sensitive = true
}