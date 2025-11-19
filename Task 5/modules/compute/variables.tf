variable "project_name" {
  description = "Project name"
  type        = string
}

variable "image_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 Key pair name"
  type        = string
}

variable "user_data" {
  description = "User data script to bootstrap the instance"
  type        = string
}
variable "iam_instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
}

variable "iam_role_name" {
  description = "IAM role name attached to the EC2 instance profile"
  type        = string
}

variable "instance_sg_id" {
  description = "Security group ID for instances"
  type        = string
}

variable "asg_min_size" {
  description = "Minimum number of instances in ASG"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances in ASG"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in ASG"
  type        = number
}

variable "subnets" {
  description = "List of subnet IDs for instances"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN of target group for ALB"
  type        = string
}
variable "asg_health_check_type" {
  description = "ASG health-check type (ELB or EC2)"
  type        = string
  default     = "ELB"
}

variable "asg_health_check_grace_period" {
  description = "Health check grace period in seconds"
  type        = number
  default     = 300
}

variable "launch_template_version" {
  description = "Version of the launch template"
  type        = string
  default     = "$Latest"
}

variable "asg_policy_type" {
  description = "Autoscaling policy type"
  type        = string
  default     = "TargetTrackingScaling"
}

variable "asg_metric_type" {
  description = "Metric type for autoscaling"
  type        = string
  default     = "ASGAverageCPUUtilization"
}

variable "cpu_target_utilization" {
  description = "CPU target utilization percentage"
  type        = number
  default     = 50
}
