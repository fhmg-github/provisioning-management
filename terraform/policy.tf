resource "aws_iam_policy" "S3ReadOnly_policy" {
  name        = "automation_S3ReadOnly"
  description = "Policy to read specific S3 buckets and files for automation purpose"
  policy      = data.aws_iam_policy_document.automation_S3ReadOnly.json
}