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