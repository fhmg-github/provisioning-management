data "aws_iam_policy_document" "ansible_assume_role" {
  /* "Version": "2012-10-17", */
  statement {

    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type = "Service"
      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}