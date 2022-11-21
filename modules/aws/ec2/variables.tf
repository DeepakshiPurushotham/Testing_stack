variable "subnet_id" {
  type = string
}

variable "instance_type" {
    type = string
    default = ""
}

variable "ami_id" {
    type = string
    default = "ami-017c001a88dd93847"
}

variable "instanceCount" {
    type = number
}

variable "environment" {
    type = string
    #default = "testing"
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