variable "Dev_Test_Resource_group" {
  type    = string
  default = "rg-uw-devops-sandbox"
  description = "Kindly follow the naming convention rg-region-type-workload-environment rg-uw-devops-sandbox"
}

variable "Dev_Test_Container_Registry_name" {
  type    = string
  default = "cruwdemononprodraaa"
  description = "Kindly follow the naming convention kv-region-type-workload-environment without dashes crregiontypeworkloadenvironment"
}