
variable "Resource_group" {
  type    = string
  default = "rg-uw-devops-sandbox"
  description = "Kindly follow the naming convention rg-region-type-workload-environment rg-uw-devops-sandbox"
}

variable "Container_Registry_name" {
  type    = string
  default = "cruwdemononprodraaa"
  description = "Kindly follow the naming convention kv-region-type-workload-environment without dashes crregiontypeworkloadenvironment"
}

variable "Kubernetes_cluster_name" {
  type    = string
  default = "aks-wu-service-devtestent"
  description = "Kindly follow the naming convention aks-region-type-workload-environment"
}

variable "cluster_dns_prefix" {
  type    = string
  default = "devtestaks1"
  description = "Kindly follow the naming convention aks-region-type-workload-environment without dashes"
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