# ✅ modules/alb/variables.tf
variable "vpc_id" {}
variable "subnet_ids" { type = list(string) }
variable "alb_sg_id" {}
variable "target_instance_ids" { type = list(string) }
