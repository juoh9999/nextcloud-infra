# ✅ outputs.tf
output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "ec2_instance_ids" {
  value = module.ec2.instance_ids
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "cloudfront_alias_record" {
  value = module.route53.cdn_alias_record
}


output "ecr_url" {
  value = module.ecr.repository_url
}


output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_ca_certificate" {
  value = module.eks.cluster_certificate_authority_data
}


