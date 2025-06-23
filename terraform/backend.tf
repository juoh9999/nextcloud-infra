# ✅ backend.tf 
terraform {
  backend "s3" {
    bucket = "nextcloud-juoh9999"
    key    = "terraform/state/nextcloud.tfstate"
    region = "ap-northeast-2"
  }
}
