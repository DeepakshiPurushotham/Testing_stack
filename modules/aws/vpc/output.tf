output "subnet_id" {
  value = aws_subnet.pub-sub2.id
}
output "allocation_id" {
  value = aws_eip.eip[*].allocation_id
}