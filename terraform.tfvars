region = "ap-northeast-2"
ami    = "ami-02f5ff2899495de4c"

vpc_cidr             = "10.0.0.0/16"
azs                  = ["ap-northeast-2a", "ap-northeast-2c", "ap-northeast-2d"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

s3_bucket_name = "nextcloud9999"
rds_username   = "nextcloudadmin"
rds_password   = "test1357"

eks_cluster_name    = "nextcloud-eks"
eks_node_group_name = "nextcloud-ng"

route53_zone_id = "Z05492753RLEPVR59K1SM" # pomeranian99.click 호스팅 영역 ID

