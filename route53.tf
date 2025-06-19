resource "aws_route53_record" "nextcloud" {
  zone_id = var.route53_zone_id
  name    = "pomeranian99.click"
  type    = "A"

  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }
}

