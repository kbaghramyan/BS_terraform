output "repository_url" {
  description = "Complete URL of the ECR repository"
  value       = aws_ecr_repository.this.repository_url
}

output "repository_arn" {
  description = "ARN of the ECR repository"
  value       = aws_ecr_repository.this.arn
}

output "registry_id" {
  description = "AWS account ID that owns the repository"
  value       = aws_ecr_repository.this.registry_id
}
