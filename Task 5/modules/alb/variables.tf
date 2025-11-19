variable "project_name" {
  description = "Project name"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "ALB security group ID"
  type        = string
}
variable "alb_is_internal" {
  description = "Whether the ALB is internal (true) or internet-facing (false)"
  type        = bool
  default     = false
}

variable "alb_type" {
  description = "The type of load balancer to create (application, network, gateway)"
  type        = string
  default     = "application"
}

variable "tg_port" {
  description = "Port on which the target group listens"
  type        = number
  default     = 80
}

variable "tg_protocol" {
  description = "Protocol used by the target group (HTTP, HTTPS)"
  type        = string
  default     = "HTTP"
}

variable "listener_port" {
  description = "Port for the ALB listener"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "Protocol for the ALB listener (HTTP, HTTPS)"
  type        = string
  default     = "HTTP"
}

variable "hc_path" {
  description = "Path for ALB health checks"
  type        = string
  default     = "/"
}

variable "hc_interval" {
  description = "Time interval (in seconds) between health checks"
  type        = number
  default     = 30
}

variable "hc_timeout" {
  description = "Time (in seconds) before a health check times out"
  type        = number
  default     = 5
}

variable "hc_healthy_threshold" {
  description = "Number of consecutive successful checks before marking target healthy"
  type        = number
  default     = 2
}

variable "hc_unhealthy_threshold" {
  description = "Number of consecutive failed checks before marking target unhealthy"
  type        = number
  default     = 2
}
