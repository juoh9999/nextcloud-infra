# ✅ modules/route53/outputs.tf
output "cdn_alias_record" {
  value = aws_route53_record.cdn_alias.fqdn
}
