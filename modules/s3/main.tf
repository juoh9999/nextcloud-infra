resource "aws_s3_bucket" "nextcloud" {
  bucket = var.bucket_name

  tags = {
    Name = "nextcloud-s3"
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.nextcloud.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

