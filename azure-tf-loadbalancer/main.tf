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

resource "azurerm_public_ip" "DevTest_LB_Public_IP" {
  name                = "${var.PublicIPForLB_name}"
  location            = data.azurerm_resource_group.DevTest_Resource_group.location
  resource_group_name = data.azurerm_resource_group.DevTest_Resource_group.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "DevTest_LoadBalancer" {
  name                = "${var.LoadBalancer_name}"
  location            = data.azurerm_resource_group.DevTest_Resource_group.location
  resource_group_name = data.azurerm_resource_group.DevTest_Resource_group.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.DevTest_LB_Public_IP.id
  }

  tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
}