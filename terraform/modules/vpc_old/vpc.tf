
# VPC
resource "aws_vpc" "vpc" {
  count                = var.perm_resource ? 1 : 0
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = merge(
    var.tags
  )
}
