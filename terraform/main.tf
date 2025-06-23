# ✅ main.tf
module "vpc" {
  source = "./modules/vpc"
  cidr_block           = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source           = "./modules/ec2"
  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.vpc.public_subnets
  ec2_sg_id        = module.sg.ec2_sg_id
  ami              = var.ami
  instance_type    = var.instance_type
  key_name         = var.key_name
}

module "alb" {
  source               = "./modules/alb"
  vpc_id               = module.vpc.vpc_id
  subnet_ids           = module.vpc.public_subnets
  alb_sg_id            = module.sg.alb_sg_id
  target_instance_ids  = module.ec2.instance_ids
}

module "rds" {
  source              = "./modules/rds"
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = module.vpc.private_subnets
  rds_sg_id           = module.sg.rds_sg_id
  rds_identifier      = var.rds_identifier
  username            = var.rds_username
  password            = var.rds_password
}


module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.30.2"

  cluster_name    = var.eks_cluster_name
  cluster_version = "1.28"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
  enable_irsa     = true

  eks_managed_node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.medium"]
      key_name         = var.key_name
    }
  }

  tags = {
    Environment = "production"
    Project     = "nextcloud"
  }
}


module "route53" {
  source                  = "./modules/route53"
  domain_name             = var.domain_name
  hosted_zone_id          = var.hosted_zone_id
  cloudfront_domain_name  = var.cloudfront_domain_name
  cloudfront_zone_id      = var.cloudfront_zone_id
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
  ec2_instance_ids = module.ec2.instance_ids
  rds_instance_id  = module.rds.rds_instance_id
  s3_bucket_name   = var.s3_bucket_name
}

module "s3" {
  source = "./modules/s3"
  bucket_name = var.s3_bucket_name
}

module "ecr" {
  source = "./modules/ecr"
}

