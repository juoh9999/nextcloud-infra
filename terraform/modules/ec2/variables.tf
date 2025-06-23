# ✅ modules/ec2/variables.tf
variable "vpc_id" {}
variable "subnet_ids" { type = list(string) }
variable "ec2_sg_id" {}
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}

