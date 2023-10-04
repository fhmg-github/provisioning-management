resource "aws_iam_role" "ansible-automation-role" {
  name               = "S3ReadOnly-role"
  assume_role_policy = data.aws_iam_policy_document.ansible-assume-role.json
}
output "iam_ansible_ec2_profile" {
  value = aws_iam_role.ansible-automation-role.name
}