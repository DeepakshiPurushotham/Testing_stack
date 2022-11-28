### EIP ###
resource "aws_eip" "eip" {
  #count = var.EIP_Count
  count = 4
  vpc   = true
  tags = {
    Name = "cml_eip-${count.index}"
  }
}

