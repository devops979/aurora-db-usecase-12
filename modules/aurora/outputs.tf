output "aurora_cluster_endpoint" {
  description = "Endpoint of the Aurora DB cluster"
  value       = aws_rds_cluster.aurora.endpoint
}

output "aurora_reader_endpoint" {
  description = "Reader endpoint of the Aurora DB cluster"
  value       = aws_rds_cluster.aurora.reader_endpoint
}

#output "aurora_secret_arn" {
#  description = "ARN of the Secrets Manager secret"
#  value       = aws_secretsmanager_secret.aurora_credentials.arn
#}

# Output to get the ARN of the secret where AWS stores the master password
output "aurora_master_secret_arn" {
  value = try(aws_rds_cluster.aurora.master_user_secret[0].secret_arn, null)
  description = "ARN of the secret storing the Aurora master password"
}
