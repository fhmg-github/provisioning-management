resource "aws_security_group" "ingress_sg" {
  name   = var.ingress_sg_name
  vpc_id = var.vpc_id
  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_block
    security_groups = var.ingress_security_groups
  }
  lifecycle {
    create_before_destroy = true
  }
    tags = {
    "Name" = var.ingress_sg_name
    "Project" = var.project_name
  }
}
