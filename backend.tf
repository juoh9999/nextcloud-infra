

terraform {
  backend "s3" {
    bucket = "nextcloud-juoh9999"
    key    = "nextcloud/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

