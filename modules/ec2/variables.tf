variable "ami" {
  description = "AMI ID to use for EC2 instances"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for EC2 instances"
  type        = list(string)
}

variable "ec2_sg_id" {
  description = "Security group ID for EC2 instances"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for EC2 instance placement"
  type        = string
}

