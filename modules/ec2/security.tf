resource "aws_security_group" "default_ec2_sg" {
  count = var.allow_ssh_access_from_outside ? 1 : 0

  name   = "default-allow-ssh-and-egress"
  vpc_id = var.vpc_id

  ingress {
    to_port     = 22
    from_port = 22
    protocol    = "tcp"
    description = "Allow SSH access from outside"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "default_ec2_sg"
  }
}
