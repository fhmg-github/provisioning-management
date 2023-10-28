resource "aws_security_group" "demo_pub_sg" {
  name   = "demo_pub_sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from anywhere"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ping from anywhere"
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name"    = "demo_pub_sg"
    "Project" = "demo"
  }
}

/* resource "aws_security_group" "demo_maven_sg" {
  name   = "maven_sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow SSH access from the demo_pub_sg and from windows_sg"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_cidr_block]
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow SSH access from the demo_pub_sg, from windows_sg, and within vpc"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name"    = "demo_maven_sg"
    "Project" = "demo"
  }
} */

resource "aws_security_group" "demo_jenkins_sg" {
  name   = "jenkins_sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow SSH access from the demo_pub_sg, from windows_sg, and anywhere from the internet"
  }

  ingress {
    from_port = -1
    to_port   = -1
    protocol  = "icmp"
    cidr_blocks = [
      var.vpc_cidr_block,
      "0.0.0.0/0"
    ]
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow SSH access from the demo_pub_sg, from windows_sg, and anywhere from the internet"
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow SSH access from the demo_pub_sg, from windows_sg, and anywhere from the internet"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name"    = "demo_jenkins_sg"
    "Project" = "demo"
  }
}

resource "aws_security_group" "demo_windows_sg" {
  name   = "windows_sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow RDP access from anywhere in the internet"
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_cidr_block]
    security_groups = [
      aws_security_group.demo_pub_sg.id
    ]
    description = "Allow ping only from the demo_pub_sg and withing the VPC"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name"    = "demo_windows_sg"
    "Project" = "demo"
  }
}

resource "aws_security_group" "elk_sg" {
  name   = "elk_sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow SSH only from the demo_pub_sg and the windows_sg"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_cidr_block]
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow SSH only from the demo_pub_sg, the windows_sg, and whithin the VPC"
  }

  ingress {
    from_port = 9600
    to_port   = 9600
    protocol  = "tcp"
    security_groups = [
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow access to Kibana only from the demo_windows_sg"
  }

  ingress {
    from_port = 9200
    to_port   = 9200
    protocol  = "tcp"
    security_groups = [
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow access to Kibana only from the demo_windows_sg"
  }

  ingress {
    from_port = 5601
    to_port   = 5601
    protocol  = "tcp"
    security_groups = [
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow access to Kibana only from the demo_windows_sg"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name"    = "elk_sg"
    "Project" = "demo"
  }
}
resource "aws_security_group" "demo_ansible_master_sg" {
  name   = "ansible_master_sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow SSH only from the demo_pub_sg and the windows_sg"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_cidr_block]
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow ping only from the demo_pub_sg, the windows_sg, and whithin the VPC"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name"    = "demo_ansible_master_sg"
    "Project" = "demo"
  }
}

resource "aws_security_group" "demo_http_sg" {
  name   = "http_sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow SSH only from the demo_pub_sg and the windows_sg"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow HTTP access from the demo_pub_sg, windows_sg and anywhere on the internet"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_cidr_block]
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow ping only from the demo_pub_sg, the windows_sg, and whithin the VPC"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name"    = "http_sg"
    "Project" = "demo"
  }
}