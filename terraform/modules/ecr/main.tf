# ✅ modules/ecr/main.tf
resource "aws_ecr_repository" "this" {
  name = "nextcloud-app"
}
