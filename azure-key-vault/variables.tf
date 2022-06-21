variable "name" {
  description = "Name of the key vault"
  type        = string
  default     = "kv2254hhhaa"
}

variable "resource_group_name" {
  description = "Name of the resource group in which to create the Key Vault"
  type        = string
  default     = "testrg"
}

variable "resource_group_create" {
  description = "Create a new RG for keyvault set to true, use existing RG set to false"
  type        = bool
  default     = false
}

variable "tenant_id" {
  description = "The Azure AD Tenant ID for authentication purposes"
  type        = string
  default     = "7ba95453-9d81-4457-a874-6f3802688322"
}

variable "key_permissions" {
  type    = list(string)
  default = ["Get", ]
}

variable "secret_permissions" {
  type    = list(string)
  default = ["Get", ]
}

variable "storage_permissions" {
  type    = list(string)
  default = ["Get", "List", "Set", ]
}

variable "certificate_permissions" {
  type    = list(string)
  default = ["Get", "List", "Set", ]
}

variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault"
  type        = string
  default     = "standard"
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted"
  type        = number
  default     = 90
}

variable "enabled_for_disk_encryption" {
  description = "Specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys"
  type        = bool
  default     = false
}

variable "enabled_for_deployment" {
  description = "Specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
  type        = bool
  default     = true
}

variable "enabled_for_template_deployment" {
  description = "Specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault"
  type        = bool
  default     = true
}

variable "enable_rbac_authorization" {
  description = "Specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions"
  type        = bool
  default     = false
}

variable "purge_protection_enabled" {
  description = "Should Purge Protection be enabled?"
  type        = string
  default     = true
}

# variable "access_policies" {
#   description = "Access policies for key vault"
#   type = map(object({
#     tenant_id               = string
#     object_id               = string
#     certificate_permissions = list(string)
#     key_permissions         = list(string)
#     secret_permissions      = list(string)
#     storage_permissions     = list(string)
#   }))
# }

# variable "log_analytics_workspace_id" {
#   description = "ID of Log Analytics data for the AzFW diagnostics"
#   type        = string
# }

# variable "diagnostics_settings" {
#   description = "Map with the diagnostics settings for AzFW deployment"
#   type        = map(any)
# }


variable "tag_cost_center" {
  type        = string
  description = "Enter the tag cost center here"
  default     = "901105"
}

variable "tag_environment" {
  type        = string
  description = "Enter the tage environment here"
  default     = "NONPRODUCTION"
}

variable "tag_application" {
  type        = string
  description = "Enter the tag application here"
  default     = "DEVOPS-SANDBOX"
}
