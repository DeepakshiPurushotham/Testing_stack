###########################################
########## IAM Role For SSM ###############
resource "aws_iam_role" "ssm-role" {
  name               = "AWS-SSM-Role"
  assume_role_policy = file("../modules/aws/iam/role.tpl")
  tags               = local.common_tags
}
data "aws_iam_policy" "instance_profile_policy" {
  #name = "AmazonEC2RoleforSSM"
  name = "AmazonSSMFullAccess"
}
resource "aws_iam_policy_attachment" "instance_profile_policyattachment" {
  name       = "instance_profile"
  roles      = [aws_iam_role.ssm-role.name]
  policy_arn = data.aws_iam_policy.instance_profile_policy.arn
}
resource "aws_iam_instance_profile" "test_profile" {
  name = "ssm_instance_profile"
  role = aws_iam_role.ssm-role.name
}

#########################################
##### Export VMDK file #####
## Role for export ##
/*resource "aws_iam_role" "vmdk-role" {
  name = "aws_vmdk_role"
  assume_role_policy = "${file("../modules/aws/iam/trust-policy.tpl")}"

  tags = local.common_tags
}

resource "aws_iam_policy" "vmdk_policy" {
  name = "aws_vmdk_policy"
  policy = "${file("../modules/aws/iam/role-policy.tpl")}"
}

resource "aws_iam_role_policy_attachment" "vmdk-attach" {
  role       = aws_iam_role.vmdk-role.name
  policy_arn = aws_iam_policy.vmdk_policy.arn
}*/