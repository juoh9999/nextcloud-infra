# ✅ modules/rds/variables.tf
variable "vpc_id" {}
variable "subnet_ids" { type = list(string) }
variable "rds_sg_id" {}
variable "rds_identifier" {}
variable "username" {}
variable "password" {}
