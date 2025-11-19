variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "alb_ingress_port" {
  description = "Port ALB listens on"
  type        = number
  default     = 80
}

variable "alb_ingress_protocol" {
  description = "Protocol for ALB ingress"
  type        = string
  default     = "tcp"
}

variable "alb_ingress_cidrs" {
  description = "Allowed CIDRs for ALB"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}


variable "instance_app_port" {
  description = "App port for EC2 (ALB → EC2)"
  type        = number
  default     = 80
}

variable "instance_app_protocol" {
  description = "Protocol for EC2 app port"
  type        = string
  default     = "tcp"
}

variable "instance_ssh_port" {
  description = "SSH port"
  type        = number
  default     = 22
}

variable "instance_ssh_protocol" {
  description = "Protocol for SSH"
  type        = string
  default     = "tcp"
}

variable "instance_ssh_cidrs" {
  description = "Allowed SSH CIDR block"
  type        = string
}

variable "rds_port" {
  description = "Port MySQL listens on"
  type        = number
  default     = 3306
}

variable "rds_protocol" {
  description = "Protocol for RDS"
  type        = string
  default     = "tcp"
}

variable "rds_extra_cidrs" {
  description = "Additional CIDRs allowed to access RDS"
  type        = list(string)
  default     = []
}

variable "sg_egress_from_port" {
  description = "Outbound from_port"
  type        = number
  default     = 0
}

variable "sg_egress_to_port" {
  description = "Outbound to_port"
  type        = number
  default     = 0
}

variable "sg_egress_protocol" {
  description = "Outbound protocol"
  type        = string
  default     = "-1"
}

variable "sg_egress_cidrs" {
  description = "Outbound CIDRs"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
