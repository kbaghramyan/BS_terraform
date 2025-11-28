variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
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

variable "rds_allowed_security_groups" {
  description = "List of security group IDs allowed to access RDS"
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
