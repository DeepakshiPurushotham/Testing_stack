variable "vpn_range" {
  type    = list(string)
  default = ["64.104.44.96/27", "72.163.217.96/27", "72.163.220.0/27", "173.38.220.32/27", "128.107.241.160/27", "173.36.240.160/27", "173.36.224.108/32", "64.104.125.224/27", "72.163.0.0/16"]
}
variable "vpc_cidr_block" {
  type = string
  #default = "10.0.0.0/16"
}
variable "publicSubnets1_cidr_block" {
  type = string
  #default = "10.0.10.0/24"
}
variable "publicSubnets2_cidr_block" {
  type = string
  #default = "10.0.20.0/24"
}
variable "privateSubnets1_cidr_block" {
  type = string
  #default = "10.0.30.0/24"
}
variable "privateSubnets2_cidr_block" {
  type = string
  #default = "10.0.40.0/24"
}
/*variable "EIP_Count" {
    type = number
    default = 1
}*/

variable "environment" {
  type = string
  #default = "testing"
}
locals {
  common_tags = {
    DataTaxonomy        = "Cisco Operations Data"
    Environment         = var.environment
    OwnerName           = ""
    ResourceOwner       = ""
    Security_Compliance = "yes"
    ServiceName         = "Security-stack"
    project_name        = "cml_on_aws"
  }
}
