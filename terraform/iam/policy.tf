resource "aws_iam_policy" "S3ReadOnly-policy" {
  name        = "automation-S3ReadOnly"
  description = "Policy to read specific S3 buckets and files for automation purpose"
  policy      = data.aws_iam_policy_document.automation-S3ReadOnly.json
}