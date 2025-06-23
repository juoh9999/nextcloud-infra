# ✅ modules/s3/main.tf
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  force_destroy = true
}
