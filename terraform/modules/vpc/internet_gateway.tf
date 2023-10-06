resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = output.vpc_id
}
