variable "project_name" {
  description = "Project name"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "ALB security group IDr"
  type        = string
}