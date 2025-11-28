variable "project_name" {
  description = "Project name"
  type        = string
}

variable "azs" {
  description = "List of availability zones for public subnets"
  type = list(string)
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
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

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Whether to assign a public IP to instances in the subnet"
  type        = bool
  default     = true
}