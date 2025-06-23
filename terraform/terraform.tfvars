# ✅ terraform.tfvars
ami                      = "ami-0d291351cbb4bcfb4"
instance_type            = "t3.micro"
key_name                 = "0618"
vpc_cidr                 = "10.0.0.0/16"
azs                      = ["ap-northeast-2a", "ap-northeast-2c"]
public_subnet_cidrs      = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs     = ["10.0.101.0/24", "10.0.102.0/24"]
domain_name              = "pomeranian99.click"
hosted_zone_id           = "Z05081623RS0Y14LJ701X"
cloudfront_domain_name   = "d3n7n1y9myuf89.cloudfront.net"
cloudfront_zone_id       = "E11P25K8YOBZBH"
eks_cluster_name         = "nextcloud-eks"
s3_bucket_name           = "nextcloud9999"
region = "ap-northeast-2"  # 서울 리전
# ✅ terraform.tfvars (추가 포함)
rds_identifier = "nextcloud"
rds_username   = "nextcloudadmin"
rds_password   = "test1357"
