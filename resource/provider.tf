terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.36.1"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.0"
    }
  }
  backend "local" {
    path = "../state_file/terraform.tfstate"
  }
}

provider "aws" {
  region = var.region
  profile = var.profile
}