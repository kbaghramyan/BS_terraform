variable "project_name" {
  description = "Project name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "my_ip" {
  description = "Your public IP address"
  type        = string
  default     = "0.0.0.0/32"
}


variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones for public subnets"
  type        = list(string)
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "iam_instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
}

variable "iam_role_name" {
  description = "IAM role name attached to the EC2 instance profile"
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

variable "db_username" {
  description = "Master username for RDS"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Master password for RDS"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_publicly_accessible" {
  description = "Is DB publicly accessible"
  default     = false
}
