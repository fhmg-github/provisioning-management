variable "ami_id" {
  type    = string
  default = "ami-00756a2b7a21e2bd3" # us-west-1 ami-id
}
variable "free_tier" {
  type    = string
  default = "t2.micro"
}

variable "access_key" {
  type    = string
  default = "fhmglearningaws2-us-west-1" # us-west-1 key
}

variable "az" {
  type    = string
  default = "us-west-1a"
}

variable "vpc-0-cidr-block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "env_tags" {
  type = map(object({
    ManagedBy   = string
    Environment = string
    Project     = string
  }))
  default = {
    default_tags = {
      ManagedBy   = "Terraform"
      Environment = "DEV"
      Project     = "0001-pipeline"
    }
  }
}

variable "internal_comm" {
  type = map(object({
    from_port = number
    to_port   = number
    protocol  = string
  }))
  default = {
    ssh = {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
    }
    icmp = {
      from_port = -1
      to_port   = -1
      protocol  = "icmp"
    }
  }
}

variable "external_comm" {
  type = map(object({
    from_port = number
    to_port   = number
    protocol  = string
  }))
  default = {
    ssh = {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
    }
    icmp = {
      from_port = -1
      to_port   = -1
      protocol  = "icmp"
    }
  }
}

variable "es_ports" {
  type = map(object({
    from_port = number
    to_port   = number
    protocol  = string
  }))
  default = {
    es_http_port = {
      from_port = 9200
      to_port   = 9200
      protocol  = "tcp"
    }
  }
}

variable "kibana_ports" {
  type = map(object({
    from_port = number
    to_port   = number
    protocol  = string
  }))
  default = {
    es_http_port = {
      from_port = 5106
      to_port   = 5106
      protocol  = "tcp"
    }
  }
}

variable "allow_outboud_traffic" {
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = number
    cidr_blocks = list(string)
  }))
  default = {
    out_traffic = {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
