variable "bucket_name" {
  type = string
}
variable "environment" {
  #default = "testing"
}
locals {
  common_tags = {
    DataTaxonomy        = "Cisco Operatoins Data"
    Environment         = var.environment
    OwnerName           = ""
    ResourceOwner       = ""
    Security_Compliance = "yes"
    ServiceName         = "Security-stack"
    project_name        = "cml_on_aws"
  }
}