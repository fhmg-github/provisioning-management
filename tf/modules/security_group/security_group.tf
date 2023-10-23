resource "aws_security_group" "sg" {
  name   = var.sg_name
  vpc_id = var.vpc_id
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name" = var.sg_name
    "Project" = var.project_name
  }
}
