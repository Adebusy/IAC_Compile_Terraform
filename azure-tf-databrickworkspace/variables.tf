
variable "Resource_group" {
  type    = string
  default = "rg-uw-devops-sandbox"
  description = "Enter the existing resource group name here"
}

variable "databrick_workspace_name" {
  type    = string
  default = "P@55w0rd123"
  description = "Enter the databrick workspace name here"
}

variable "tag_cost_center" {
  type = string
  description = "Enter the tag cost center here"
  default = "901105"
}

variable "tag_environment" {
  type = string
  description = "Enter the tage environment here"
  default = "NONPRODUCTION"
}

variable "tag_application" {
  type = string
  description = "Enter the tag application here"
  default = "DEVOPS-SANDBOX"
}
