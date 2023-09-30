resource "aws_iam_role" "ansible_automation_role" {
  name               = "S3ReadOnly_role"
  assume_role_policy = data.aws_iam_policy_document.ansible_assume_role.json
}
/* output "iam_ansible_ec2_profile" {
  value = aws_iam_role.ansible_automation_role.name
} */