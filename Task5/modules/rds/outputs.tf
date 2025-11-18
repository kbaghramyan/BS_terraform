output "rds_endpoint" {
  value = aws_db_instance.mysql.address
}

output "rds_username" {
  value = var.db_username
}

output "rds_password" {
  value = var.db_password
}