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
/*data "aws_eip" "eip" {
  count = 4
   tags = {
    Name = "cml_eip-${count.index}"
  }
 }*/
########################################################
 ########## EIP Association #############
########################################################
resource "aws_eip_association" "eip_assoc" {
  count = var.instanceCount
  instance_id   = aws_instance.web-server[count.index].id
  allocation_id = var.eip_assoc_id
  depends_on = [
    aws_instance.web-server
  ]
}
/*resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits = 4096
}*/

resource "aws_key_pair" "ssh" {
  key_name = "demo"
  #public_key = tls_private_key.ssh-key.public_key_openssh
  #public_key = "${file("../tmp/.ssh/id_rsa.pub")}"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/s9jmYx7uH/USh193HbJ7FE3UjwnTHdYCIM+zYUEDngv1uTy8jziUFFPDlDIRrpLtyFBlxms+Q8RFCL91NmU2xEQGArIJ8Tf/6Y1CWbUUwOINazhWtVs8GNRkid714XwArVYXZFucfw1FOjRozSV5COhpdXnJfY19v35g/6lnC6T7RdQbAsrF6RZffJcLBsNlyP8bKKgPImTvf/Pgi7Waab99PZ7mI8epmejPoGc+tPuV4ovQultzIpOdTCBv7e8UQskDbAcqwGEEK+xEVoRzDGUp0ucWt7tctDTE7RqOoYzLJ0hzMLFyNk9QL3/skKgS3BinwPS+3CRIgRE4TMuuuT2s3X3iJ9rcfbbhA77Cf8IoZWxJpUe3hrDRbS0c753hogEsOqxg2uJMrJzmYJAfwSwK44hRAm1TEQygAexAHzd/08bmARxPBb5Sn9jcwcVUkmkalbtBiNlK1pyE09hQngsdhd8rbZf5LYjlLU7PfvWzO/OWIgEufHcJGoJUgJNuoVeSfZo8zKcRPUa4cpiBpbP+fmgJiHFcQmPdd5lp3rv3xh8eX6XzUrfPjG0oFOD2eSxILApdR1HdcFQWqYPl1h/OMB8fVtNANnTIyPP5P8CrWClDUIDYfimmfr4M1SAzq2Rutj7EkNl29LQpuQ+R8s/QzGy4Y+wJLCLUYR5B4w== cml-on-aws
"
}
###################################################
########### Instance Creation ###########
###################################################
resource "aws_instance" "web-server" {
  count = var.instanceCount
  ami           = var.ami_id
  key_name = aws_key_pair.ssh.key_name
  instance_type = var.instance_type
  associate_public_ip_address = true
  subnet_id = var.subnet_id
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  iam_instance_profile = data.aws_iam_instance_profile.instance_profile.name
  ebs_block_device {
    device_name = "/dev/xvda"   # for additional volume on root device
    #device_name = "/dev/sda1"  # for additional ebs volume
    volume_size = var.ebs_volume_size
  }
  tags = local.common_tags
}


output "instance_id" {
  value = aws_instance.web-server[*].public_ip
}

