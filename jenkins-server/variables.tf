variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnets" {
  description = "Public subnets CIDR"
  type        = list(string)
}

variable "instance_type" {
  description = "Instance_type"
  type        = string
}