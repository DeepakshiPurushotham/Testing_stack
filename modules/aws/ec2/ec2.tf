data "aws_availability_zones" "azs" {
  state = "available"
}

### instance ###
/*data "aws_ami" "amazon" {
  most_recent = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}*/

data "aws_iam_instance_profile" "instance_profile" {
  name = "ssm_instance_profile"
}

data "aws_security_group" "selected" {
  name = "cml-security-group"
}
########################################################
 ########## EIP Association #############
########################################################
resource "aws_eip_association" "eip_assoc" {
  count = var.instanceCount
  instance_id   = aws_instance.web-server[count.index].id
  allocation_id = var.eip_allocation_id
  depends_on = [
    aws_instance.web-server
  ]
}
###################################################
########### Instance Creation ###########
###################################################
resource "aws_instance" "web-server" {
  count = var.instanceCount
  ami           = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = true
  subnet_id = var.subnet_id
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  iam_instance_profile = data.aws_iam_instance_profile.instance_profile.name
  tags = local.common_tags
}


output "instance_id" {
  value = aws_instance.web-server[*].public_ip
}
