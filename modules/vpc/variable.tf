variable "env" {
  type = string
  description = "what env we are creating (dev, qa, prod)"
}

variable "vpc_cidr" {
  type = string
  description = "vpc_cidr"
}

variable "subnet_cidr" {
  type = string
  description = "subnet_cidr"
}

variable "subnet_avaliability_zone" {
  type = string
  description = "subnet_cidr"
}