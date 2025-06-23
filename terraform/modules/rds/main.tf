# ✅ modules/rds/main.tf
resource "aws_db_instance" "this" {
  identifier        = var.rds_identifier
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  username          = var.username
  password          = var.password
  db_subnet_group_name = aws_db_subnet_group.this.name
  vpc_security_group_ids = [var.rds_sg_id]
  skip_final_snapshot = true
  publicly_accessible = false
}

resource "aws_db_subnet_group" "this" {
  name       = "nextcloud-rds-subnet-group"
  subnet_ids = var.subnet_ids
}
