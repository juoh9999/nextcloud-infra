resource "aws_db_subnet_group" "main" {
  name       = "nextcloud-db-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "nextcloud-db-subnet-group"
  }
}

resource "aws_db_instance" "main" {
  identifier         = "nextcloud"
  allocated_storage  = 20
  engine             = "mysql"
  engine_version     = "8.0"
  instance_class     = "db.t3.micro"
  db_name            = "nextcloud"
  username           = var.username
  password           = var.password
  port               = 3306
  vpc_security_group_ids = [var.rds_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  skip_final_snapshot    = true
  publicly_accessible    = false

  tags = {
    Name = "nextcloud-rds"
  }
}

