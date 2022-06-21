# Terraform Azure Key Vault Module

This module will create an Azure Key Vault and creates the access policies dynamically, which will be configured in the `locals.tf` of the child module.

## Example usage

Fill in the values with your required variables.

There is a conditional set on the resource group creation. Set `resource_group_create` to **true** if you want to create a new RG for the key vault or set to **false** if you want to use an existing key vault. If you choose to use existing RG, make sure the name of the resource group is correct or Terraform will fail.

```
module "key-vault" {
  source                          = "./pathtomodule/azure-keyvault"
  name                            = "key-vault-name"
  location                        = "location"
  tenant_id                       = "tenant_id
  resource_group_name             = "resource_group_name"
  resource_group_create           = true
  sku_name                        = "standard or premium"
  enabled_for_disk_encryption     = true
  enabled_for_deployment          = false
  enabled_for_template_deployment = false
  enable_rbac_authorization       = false
  soft_delete_retention_days      = 90
  purge_protection_enabled        = true
  access_policies                 = local.access_policies_keyvault_name_1
  tags                            = local.tags
  log_analytics_workspace_id      = azurerm_log_analytics_workspace.shared_operations.id
  diagnostics_settings            = local.key_vault_config.diagnostics
}
```
Set `enable_rbac_authorization` to `false`, as this feature is currently in preview.

## Locals

The access policies inside the locals can be duplicated depending on how many key vaults you are creating and how many different policies you need.
If you don't require a certain permission, you can just add `null` as the value and it will ignore that permission.

Tags are to allow multiple tags as a map.

```
# KEYVAULT ACCESS POLICIES AND TAGS
locals {
  access_policies_keyvault_name_1 = {
    access_policy1 = {
      object_id               = "object_id"
      tenant_id               = "tenant_id"
      key_permissions         = ["get", "list"]
      secret_permissions      = null
      certificate_permissions = ["get", "create", "list"]
      storage_permissions     = null
    },
    access_policy2 = {
      object_id               = "object_id"
      tenant_id               = "tenant_id"
      key_permissions         = ["get", "list"]
      secret_permissions      = ["get", "list"]
      certificate_permissions = ["get", "import", "list"]
      storage_permissions     = ["backup", "get", "list", "recover"]
    }
  }

  access_policies_keyvault_name_2 = {
    access_policy1 = {
      object_id               = "object_id"
      tenant_id               = "tenant_id"
      key_permissions         = ["get", "list"]
      secret_permissions      = null
      certificate_permissions = ["get", "create", "list"]
      storage_permissions     = null
    },
    access_policy2 = {
      object_id               = "object_id"
      tenant_id               = "tenant_id"
      key_permissions         = ["get", "list"]
      secret_permissions      = ["get", "list"]
      certificate_permissions = ["get", "import", "list"]
      storage_permissions     = null
    }
  }

  tags = {
    "tag1" = "value",
    "tag2" = "value"
  }


# KEYVAULT DIAGNOSTIC SETTINGS
key_vault_config = {
  diagnostics = {
    log = [
       ["KeyVaultAuditlogs", true, true, 30],
        ]
      }
    }
  }  
```

## Outputs

Three outputs have been defined, the key vault **id**, **name** and **uri**.


## Required input variables

**name**

Name of key vaults

**location**

Location of key vault

**tenant_id**

Tenant id to be used

**resource_group_name**

Name of resource group to be deployed to

**sku_name**

Name of the SKU used for this key vault

**enabled_for_disk_encryption**

Enable disk encryption

**enabled_for_deployment**

Enabled for deployment

**enabled_for_template_deployment**

Enabled for template deployment

**enable_rbac_authorization**

Default is false - enable RBAC

**soft_delete_retention_days**

Default is 90 - how many soft delete retention days

**purge_protection_enabled**

Default is true - enable purge protection

**access_policies**

Access policies defined for key vault permissions, should be defined in a locals.tf (see example above)

**tags**

Mapping of tags to be tagged to the key vault, should be defined in a locals.tf (see example above)
