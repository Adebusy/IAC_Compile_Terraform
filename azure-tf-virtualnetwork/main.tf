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

data "azurerm_resource_group" "azDevTestEnterpriseRG" {
  name = "${var.Resource_group}"
}

resource "azurerm_network_security_group" "azDevTestEnterpriseNSG" {
  #provider = azurerm.azDevTestEnterprise
  name                = "${var.NSG_Name}"
  location            = data.azurerm_resource_group.azDevTestEnterpriseRG.location
  resource_group_name = data.azurerm_resource_group.azDevTestEnterpriseRG.name
}

resource "azurerm_virtual_network" "azDevTestEnterpriseVNet" {
  #provider = azurerm.azDevTestEnterprise
  name                = "${var.VNet_Name}"
  location            = data.azurerm_resource_group.azDevTestEnterpriseRG.location
  resource_group_name = data.azurerm_resource_group.azDevTestEnterpriseRG.name
  address_space       = [ "${var.VNet_address_space}"]
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "${var.Subnet1}"
    security_group = azurerm_network_security_group.azDevTestEnterpriseNSG.id
  }

  subnet {
    name           = "subnet2"
    address_prefix = "${var.Subnet2}"
    security_group = azurerm_network_security_group.azDevTestEnterpriseNSG.id
  }

  tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
}
