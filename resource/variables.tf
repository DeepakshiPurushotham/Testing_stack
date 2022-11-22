
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "instanceCount" {
    type = number
    default = 1
}
variable "environment" {
    type = string
    default = ""
}
variable "bucket_name" {
  type = string
  default = "cml-stack-bucket"
}

variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/16"
}
variable "publicSubnets1_cidr_block" {
    type = string
    default = "10.0.10.0/24"
}
variable "publicSubnets2_cidr_block" {
    type = string
    default = "10.0.20.0/24"
}
variable "privateSubnets1_cidr_block" {
    type = string
    default = "10.0.30.0/24"
}
variable "privateSubnets2_cidr_block" {
    type = string
    default = "10.0.40.0/24"
}
