
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


resource "azurerm_container_registry" "devtest_enterprise_Container_registry" {
  #provider            = azurerm.azDevTestEnterprise
  name                = "${var.Container_Registry_name}"
  resource_group_name = data.azurerm_resource_group.DevTest_Resource_group.name
  location            = data.azurerm_resource_group.DevTest_Resource_group.location
   tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
  sku = "Basic"
}

resource "azurerm_kubernetes_cluster" "Dev_Test_Kubernetes_cluster" {
 # provider            = azurerm.azDevTestEnterprise
  name                = "${var.Kubernetes_cluster_name}"
  location            = data.azurerm_resource_group.DevTest_Resource_group.location
  resource_group_name = data.azurerm_resource_group.DevTest_Resource_group.name
  dns_prefix          = "${var.cluster_dns_prefix}"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

    tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
}

# resource "azurerm_role_assignment" "example" {
#  # provider                         = azurerm.azDevTestEnterprise
#   principal_id                     = azurerm_kubernetes_cluster.Dev_Test_Kubernetes_cluster.kubelet_identity[0].object_id
#   role_definition_name             = "AcrPull"
#   scope                            = azurerm_container_registry.devtest_enterprise_Container_registry.id
#   skip_service_principal_aad_check = true
# }

output "aks_config_id" {
  value = azurerm_kubernetes_cluster.Dev_Test_Kubernetes_cluster.id
}

output "aks_kube_config_raw" {
  value = azurerm_kubernetes_cluster.Dev_Test_Kubernetes_cluster.kube_config_raw
  sensitive = true
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