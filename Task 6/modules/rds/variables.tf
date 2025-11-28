variable "project_name" {
  description = "Project name"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "rds_sg_id" {
  description = "Security group ID"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage (GB) for the RDS instance"
  type        = number
  default     = 20
}

variable "db_username" {
  description = "Master username for RDS"
  type        = string
}

variable "db_password" {
  description = "Master password for RDS"
  type        = string
  sensitive   = true
}

variable "db_engine" {
  description = "Database engine type"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
  default     = "8.0"
}

variable "db_instance_type" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}


variable "db_skip_final_snapshot" {
  description = "Whether to skip the final snapshot on deletion"
  type        = bool
  default     = true
}

variable "db_publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
  default     = false
}

variable "db_deletion_protection" {
  description = "Enable or disable deletion protection on the RDS instance"
  type        = bool
  default     = false
}
