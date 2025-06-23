# ✅ modules/s3/outputs.tf
output "s3_bucket_arn" {
  value = aws_s3_bucket.this.arn
}
