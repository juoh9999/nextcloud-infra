variable "alb_dns_name" {
  description = "DNS name of the ALB"
  type        = string
}

variable "cert_arn" {
  description = "ACM certificate ARN"
  type        = string
}

variable "domain" {
  description = "Domain name for the CloudFront distribution"
  type        = string
}

variable "route53_zone_id" {
  description = "Route53 hosted zone ID"
  type        = string
}

