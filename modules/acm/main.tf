locals {
  validation_options = tolist(aws_acm_certificate.cert.domain_validation_options)
}

resource "aws_route53_record" "validation" {
  name    = local.validation_options[0].resource_record_name
  type    = local.validation_options[0].resource_record_type
  zone_id = var.route53_zone_id
  records = [local.validation_options[0].resource_record_value]
  ttl     = 60
}
resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}


