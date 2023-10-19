# PUBLIC SECURITY_GROUPS
resource "aws_security_group" "demo_pub_sg" {
  name   = "allow-all-ssh_access"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from outside"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ping from outside"
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
}

resource "aws_security_group" "demo_maven_sg" {
  name   = "maven-sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow SSH access only from the demo_pub_sg"
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
    description = "Allow ping only from the demo_pub_sg"
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
}

resource "aws_security_group" "demo_jenkins_sg" {
  name   = "jenkins-sg"
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
    description = "Allow SSH access only from the demo_pub_sg"
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
    description = "Allow ping only from the demo_pub_sg"
  }

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [aws_security_group.demo_pub_sg.id, aws_security_group.demo_windows_sg.id]
    description     = "Allow Jenkins access only from the demo_pub_sg"
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
}

resource "aws_security_group" "demo_jmeter_sg" {
  name   = "jmeter-sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = [
      aws_security_group.demo_pub_sg.id,
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow SSH access only from the demo_pub_sg"
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
    description = "Allow ping only from the demo_pub_sg"
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
}

/* resource "aws_security_group" "demo_elastic_sg" {
  name   = "elastic-sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.demo_pub_sg.id]
    description     = "Allow SSH access only from the demo_pub_sg"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_cidr_block]
    description = "Allow ping only from the demo_pub_sg"
  }

  ingress {
    from_port       = 9200
    to_port         = 9200
    protocol        = "tcp"
    security_groups = [aws_security_group.demo_pub_sg.id]
    description     = "Allow ES access only from the demo_pub_sg"
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
} */

/* resource "aws_security_group" "demo_kibana_sg" {
  name   = "kibana-sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.demo_pub_sg.id]
    description     = "Allow SSH only from the demo_pub_sg"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_cidr_block]
    description = "Allow ping only from the demo_pub_sg"
  }

  ingress {
    from_port       = 5106
    to_port         = 5106
    protocol        = "tcp"
    security_groups = [aws_security_group.demo_pub_sg.id]
    description     = "Allow access to Kibana only from the demo_pub_sg"
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
} */

/* resource "aws_security_group" "demo_logstash_sg" {
  name   = "logstash-sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.demo_pub_sg.id]
    description     = "Allow SSH only from the demo_pub_sg"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_cidr_block]
    description = "Allow ping only from the demo_pub_sg"
  }

  ingress {
    from_port       = 9600
    to_port         = 9600
    protocol        = "tcp"
    security_groups = [aws_security_group.demo_pub_sg.id]
    description     = "Allow access to Kibana only from the demo_pub_sg"
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
} */

/* resource "aws_security_group" "demo_jfrog_sg" {
  name   = "jfrog-sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.demo_pub_sg.id]
    description     = "Allow SSH only from the demo_pub_sg"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_cidr_block]
    description = "Allow ping only from the demo_pub_sg"
  }

  ingress {
    from_port       = 9600
    to_port         = 9600
    protocol        = "tcp"
    security_groups = [aws_security_group.demo_pub_sg.id]
    description     = "Allow access to Kibana only from the demo_pub_sg"
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
} */

resource "aws_security_group" "demo_windows_sg" {
  name   = "windows-sg"
  vpc_id = module.demo_vpc.vpc_id

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH only from the demo_pub_sg"
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.vpc_cidr_block]
    security_groups = [
      aws_security_group.demo_pub_sg.id
    ]
    description = "Allow ping only from the demo_pub_sg"
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
    description = "Allow SSH only from the demo_pub_sg"
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
    description = "Allow ping only from the demo_pub_sg"
  }

  ingress {
    from_port = 9600
    to_port   = 9600
    protocol  = "tcp"
    security_groups = [
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow access to Kibana only from the demo_pub_sg"
  }

  ingress {
    from_port = 9200
    to_port   = 9200
    protocol  = "tcp"
    security_groups = [
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow access to Kibana only from the demo_pub_sg"
  }

  ingress {
    from_port = 5601
    to_port   = 5601
    protocol  = "tcp"
    security_groups = [
      aws_security_group.demo_windows_sg.id
    ]
    description = "Allow access to Kibana only from the demo_pub_sg"
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
    description = "Allow SSH access only from the demo_pub_sg"
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
    description = "Allow ping only from the demo_pub_sg"
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
}

