variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "Availability Zones for the subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDRs for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDRs for the private subnets"
  type        = list(string)
}

