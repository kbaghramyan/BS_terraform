resource "aws_security_group" "alb_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.alb_ingress_port
    to_port     = var.alb_ingress_port
    protocol    = var.alb_ingress_protocol
    cidr_blocks = var.alb_ingress_cidrs
  }

  egress {
    from_port   = var.sg_egress_from_port
    to_port     = var.sg_egress_to_port
    protocol    = var.sg_egress_protocol
    cidr_blocks = var.sg_egress_cidrs
  }

  tags = { Name = "${var.project_name}-alb-sg" }
}

resource "aws_security_group" "instance_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port       = var.instance_app_port
    to_port         = var.instance_app_port
    protocol        = var.instance_app_protocol
    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    from_port   = var.instance_ssh_port
    to_port     = var.instance_ssh_port
    protocol    = var.instance_ssh_protocol
    cidr_blocks = [var.instance_ssh_cidrs]
  }

  egress {
    from_port   = var.sg_egress_from_port
    to_port     = var.sg_egress_to_port
    protocol    = var.sg_egress_protocol
    cidr_blocks = var.sg_egress_cidrs
  }

  tags = { Name = "${var.project_name}-instance-sg" }
}

resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port       = var.rds_port
    to_port         = var.rds_port
    protocol        = var.rds_protocol
    security_groups = [aws_security_group.instance_sg.id]
  }

  ingress {
    from_port   = var.rds_port
    to_port     = var.rds_port
    protocol    = var.rds_protocol
    cidr_blocks = var.rds_extra_cidrs
  }

  egress {
    from_port   = var.sg_egress_from_port
    to_port     = var.sg_egress_to_port
    protocol    = var.sg_egress_protocol
    cidr_blocks = var.sg_egress_cidrs
  }
  tags = { Name = "${var.project_name}-rds-sg" }
}

