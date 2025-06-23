# ✅ EC2 관련
variable "ami" {
  description = "AMI ID for EC2 instances (CloudWatch Agent 포함)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name for EC2 and EKS access"
  type        = string
}

# ✅ 네트워크 관련
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "Availability Zones for subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDRs for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDRs for private subnets"
  type        = list(string)
}

# ✅ Route53 & CloudFront 관련
variable "domain_name" {
  description = "Main domain name (e.g., pomeranian99.click)"
  type        = string
}

variable "hosted_zone_id" {
  description = "Route53 Hosted Zone ID"
  type        = string
}

variable "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  type        = string
}

variable "cloudfront_zone_id" {
  description = "CloudFront hosted zone ID (typically Z2FDTNDATAQYW2)"
  type        = string
}

# ✅ EKS 관련
variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

# ※ 사용되지 않는 경우 삭제 가능
# variable "eks_node_group_name" {
#   description = "Name of the EKS node group"
#   type        = string
# }

# ✅ RDS 관련
variable "rds_identifier" {
  description = "Unique identifier for the RDS instance"
  type        = string
}

variable "rds_username" {
  description = "Master username for RDS"
  type        = string
}

variable "rds_password" {
  description = "Master password for RDS"
  type        = string
  sensitive   = true
}

# ✅ S3 관련
variable "s3_bucket_name" {
  description = "S3 bucket used for Nextcloud storage and CloudWatch monitoring"
  type        = string
}

# ✅ Provider 공통
variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
}

