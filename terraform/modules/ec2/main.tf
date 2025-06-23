# ✅ modules/ec2/main.tf
resource "aws_instance" "web" {
  count         = 2
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = element(var.subnet_ids, count.index)
  vpc_security_group_ids = [var.ec2_sg_id]

  tags = {
    Name = "web-instance-${count.index + 1}"
  }
}
