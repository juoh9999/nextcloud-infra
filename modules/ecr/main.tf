resource "aws_ecr_repository" "nextcloud" {
  name                 = "nextcloud-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}

