# ✅ modules/rds/outputs.tf
output "rds_instance_id" {
  value = aws_db_instance.this.id
}
