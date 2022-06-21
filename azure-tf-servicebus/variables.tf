variable "Resource_group" {
  type    = string
  default = "rg-uw-devops-sandbox"
  description = "Enter the existing resource group name here"
}


variable "Service_Bus_namespace" {
  type    = string
  default = "sb-uw-appdev-general-prods"
  description = "Kindly follow the naming convention sb-region-type-workload-environment sb-uw-appdev-general-prod"
}

variable "servicebus_queue" {
  type    = string
  default = "sbq-uw-appdev-general-prods"
  description = "Kindly follow the naming convention sbq-region-type-workload-environment sbq-uw-appdev-general-prod"
}

variable "servicebus_queue_authorization_rule" {
  type    = string
  default = "queueauth"
  description = "Enter the admin username's here"
}

variable "iothub_endpoint_name" {
  type    = string
  default = "iothubendpoint"
  description = "Enter the  iothub endpoint's here"
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

