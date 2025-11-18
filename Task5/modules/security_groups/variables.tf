variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}



variable "allowed_ssh_cidr" {
  description = "Allowed SSH CIDR block"
  type        = string
}