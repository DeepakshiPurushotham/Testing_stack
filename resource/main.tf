#################################################################
######## VPC Creation #############
#################################################################
module "vpc" {
  source = "../modules/aws/vpc"
  #instanceCount = var.instanceCount
  vpc_cidr_block = var.vpc_cidr_block
  publicSubnets1_cidr_block = var.publicSubnets1_cidr_block
  publicSubnets2_cidr_block = var.publicSubnets2_cidr_block
  privateSubnets1_cidr_block = var.privateSubnets1_cidr_block
  privateSubnets2_cidr_block = var.privateSubnets2_cidr_block
  environment = var.environment
}
output "instance_ip" {
  value = module.stack_1.instance_id
}

#################################################################
########### S3 Creation ###############
#################################################################
module "s3" {
  source = "../modules/aws/s3"
  bucket_name = var.bucket_name
  environment = var.environment
  depends_on = [
    module.vpc
  ]
}

#################################################################
########## iam Creation ##########
#################################################################
module "iam" {
  source = "../modules/aws/iam"
  environment = var.environment
  depends_on = [
    module.vpc
  ]
}

#################################################################
########## EC2 Creation ##########
#################################################################
module "stack_1" {
  source = "../modules/aws/ec2"
  instance_type = var.instance_type
  instanceCount = var.instanceCount ## no of instance
  subnet_id = module.vpc.subnet_id
  environment = var.environment
  eip_allocation_id = module.vpc.allocation_id[0]
  depends_on    = [module.vpc, module.iam]
}

module "stack_2" {
  source = "../modules/aws/ec2"
  instance_type = var.instance_type
  instanceCount = var.instanceCount ## no of instance
  subnet_id = module.vpc.subnet_id
  environment = var.environment
  eip_allocation_id = module.vpc.allocation_id[1]
  depends_on    = [module.vpc, module.iam]
}

module "stack_3" {
  source = "../modules/aws/ec2"
  instance_type = var.instance_type
  instanceCount = var.instanceCount ## no of instance
  subnet_id = module.vpc.subnet_id 
  environment = var.environment
  eip_allocation_id = module.vpc.allocation_id[2]
  depends_on    = [module.vpc, module.iam]
}

module "stack_4" {
  source = "../modules/aws/ec2"
  instance_type = var.instance_type
  instanceCount = var.instanceCount ## no of instance
  subnet_id = module.vpc.subnet_id
  environment = var.environment
  eip_allocation_id = module.vpc.allocation_id[3]
  depends_on    = [module.vpc, module.iam]
  
}
