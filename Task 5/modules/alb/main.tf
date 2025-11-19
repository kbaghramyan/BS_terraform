resource "aws_lb" "alb" {
  name               = "${var.project_name}-alb"
  internal           = var.alb_is_internal
  load_balancer_type = var.alb_type
  security_groups    = [var.alb_sg_id]
  subnets            = var.subnets

  tags = {
    Name = "${var.project_name}-alb"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "${var.project_name}-tg"
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = aws_lb.alb.vpc_id

  health_check {
    path                = var.hc_path
    interval            = var.hc_interval
    timeout             = var.hc_timeout
    healthy_threshold   = var.hc_healthy_threshold
    unhealthy_threshold = var.hc_unhealthy_threshold
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

