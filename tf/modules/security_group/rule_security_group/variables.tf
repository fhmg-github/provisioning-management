variable "type" {
    type = string
}

variable "port" {
    type = number
}

variable "protocol" {
    type = string
}

variable "security_groups_id" {
    type = string
    nullable = true
}

variable "cidr_blocks" {
    type = list(string)
    default = null
}

variable "description" {
    type = string
    default = "Security Group Rule Description"
}
