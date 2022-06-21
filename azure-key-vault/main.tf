resource "azurerm_resource_group" "key_vault_rg" {
  count    = var.resource_group_create ? 1 : 0
  name     = var.resource_group_name
  location = data.azurerm_resource_group.get_ressource_group.location
}
data "azurerm_resource_group" "get_ressource_group" {
  name = var.resource_group_name
}

provider "azurerm" {
  features {}
}
data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "key_vault" {
  name                            = var.name
  location                        = data.azurerm_resource_group.get_ressource_group.location
  tenant_id                       = var.tenant_id
  sku_name                        = var.sku_name
  resource_group_name             = data.azurerm_resource_group.get_ressource_group.name
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = true
  tags = {
    "APPLICATION" = "${var.tag_application}"
    "COSTCENTER"  = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }

  #   dynamic "access_policy" {
  #     for_each = var.access_policies
  #     content {
  #       tenant_id               = access_policy.value.tenant_id
  #       object_id               = access_policy.value.object_id
  #       certificate_permissions = access_policy.value.certificate_permissions
  #       key_permissions         = access_policy.value.key_permissions
  #       secret_permissions      = access_policy.value.secret_permissions
  #       storage_permissions     = access_policy.value.storage_permissions
  #     }
  #   }
  #   depends_on = [
  #     azurerm_resource_group.key_vault_rg,
  #   ]
  # }


  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get", "List", "Set",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

# resource "azurerm_monitor_diagnostic_setting" "key_vault" {
#   name                       = azurerm_key_vault.key_vault.name
#   target_resource_id         = azurerm_key_vault.key_vault.id
#   log_analytics_workspace_id = var.log_analytics_workspace_id

#   dynamic "log" {
#     for_each = var.diagnostics_settings.log
#     content {
#       category = log.value[0]
#       enabled  = log.value[1]
#       retention_policy {
#         enabled = log.value[2]
#         days    = log.value[3]
#       }
#     }
#   }
#   dynamic "metric" {
#     for_each = var.diagnostics_settings.metric
#     content {
#       category = metric.value[0]
#       enabled  = metric.value[1]
#       retention_policy {
#         enabled = metric.value[2]
#         days    = metric.value[3]
#       }
#     }
#   }
#}
