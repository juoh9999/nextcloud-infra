resource "aws_lb" "main" {
  name               = "nextcloud-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.public_subnets

  tags = {
    Name = "nextcloud-alb"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "nextcloud-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "nextcloud-tg"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_target_group_attachment" "ec2" {
  count            = length(var.ec2_instance_ids)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.ec2_instance_ids[count.index]
  port             = 80
}

