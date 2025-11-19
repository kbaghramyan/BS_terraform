variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type = list(string)
}

variable "azs" {
  description = "List of availability zones for public subnets"
  type = list(string)
}

variable "public_route_table_id" {
  description = "Public route table ID"
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Whether to assign a public IP to instances in the subnet"
  type        = bool
  default     = true
}
