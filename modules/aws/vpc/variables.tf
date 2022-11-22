variable "vpn_range" {
  type = list(string)
  default = [ "64.104.44.96/27", "72.163.217.96/27", "72.163.220.0/27","173.38.220.32/27","128.107.241.160/27", "173.36.240.160/27", "173.36.224.108/32","64.104.125.224/27","72.163.0.0/16"]
}
variable "vpc_cidr_block" {
    type = string
}
variable "publicSubnets1_cidr_block" {
    type = string
}
variable "publicSubnets2_cidr_block" {
    type = string
}
variable "privateSubnets1_cidr_block" {
    type = string
}
variable "privateSubnets2_cidr_block" {
    type = string
}
variable "environment" {
    type = string
}
locals {
    common_tags = {
        DataTaxonomy = "Cisco Operatoins Data"
        Environment = var.environment
        OwnerName = ""
        ResourceOwner = ""
        Security_Compliance = "yes"
        ServiceName        = "Security-stack"
        project_name = "cml_on_aws"
    }
}
