resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.iam_instance_profile_name
  role = var.iam_role_name
}


resource "aws_launch_template" "lt" {
  name_prefix   = "${var.project_name}-lt-"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    security_groups = [var.instance_sg_id]
  }

  user_data = base64encode(var.user_data)

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  tag_specifications {
    resource_type = "instance"
    tags          = { Name = "${var.project_name}-instance" }
  }
}

resource "aws_autoscaling_group" "asg" {
  name                      = "${var.project_name}-asg"
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  desired_capacity          = var.asg_desired_capacity
  vpc_zone_identifier       = var.subnets
  target_group_arns         = [var.target_group_arn]
  health_check_type         = var.asg_health_check_type
  health_check_grace_period = var.asg_health_check_grace_period


  launch_template {
    id      = aws_launch_template.lt.id
    version = var.launch_template_version
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-asg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "cpu" {
  name                   = "${var.project_name}-cpu-policy"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type            = var.asg_policy_type

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.asg_metric_type
    }
    target_value = var.cpu_target_utilization
  }
}

