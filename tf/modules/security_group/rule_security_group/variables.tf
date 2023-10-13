variable "type" {
    type = string
}

variable "port" {
    type = number
}

variable "protocol" {
    type = string
}

variable "security_groups" {
    type = string
    default = null
}

variable "cidr_blocks" {
    type = list(string)
    default = null
}