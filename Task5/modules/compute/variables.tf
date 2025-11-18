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

variable "cpu_target_utilization" {
  description = "Target CPU utilization percentage for scaling policy"
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