
variable "eventhub_namespace" {
  default = "rg-uw-devops-sandbox"
  type = string
  description = "Kindly follow the naming convention evh-ns-region-type-workload-environment with dashes evh-ns-uw-devops-sandbox"
}


variable "eventhub_name" {
  default = "rg-uw-devops-sandbox"
  type = string
  description = "Kindly follow the naming convention evh-region-type-workload-environment with dashes evh-uw-devops-sandbox"
}

variable "resource_group_name" {
  default = "rg-uw-devops-sandbox"
  type = string
  description = "Kindly follow the naming convention rg-region-type-workload-environment with dashes rg-uw-devops-sandbox"
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