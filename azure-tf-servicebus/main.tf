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

 data "azurerm_resource_group" "Resource_group" {
  name = "${var.Resource_group}"
}


resource "azurerm_servicebus_namespace" "ServiceBus_namespace" {
  name                = "${var.Service_Bus_namespace}"
  location            = data.azurerm_resource_group.Resource_group.location
  resource_group_name = data.azurerm_resource_group.Resource_group.name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "servicebus_queue" {
  name         = "${var.Servicebus_queue}"
  namespace_id = azurerm_servicebus_namespace.ServiceBus_namespace.id

  enable_partitioning = true
}

resource "azurerm_servicebus_queue_authorization_rule" "servicebus_queue_rule" {
  name     = "${var.Servicebus_queue_authorization_rule}"
  queue_id = azurerm_servicebus_queue.servicebus_queue.id

  listen = false
  send   = true
  manage = false
}

resource "azurerm_iothub" "iothub" {
  name                = "${var.iothub_endpoint_name}"
  resource_group_name = data.azurerm_resource_group.Resource_group.name
  location            = data.azurerm_resource_group.Resource_group.location

  sku {
    name     = "B1"
    capacity = "1"
  }

  tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }

}

resource "azurerm_iothub_endpoint_servicebus_queue" "iothub_endpoint" {
  resource_group_name = data.azurerm_resource_group.Resource_group.name
  iothub_id           = azurerm_iothub.iothub.id
  name                = "${var.iothub_endpoint_name}"
  connection_string = azurerm_servicebus_queue_authorization_rule.servicebus_queue_rule.primary_connection_string
}