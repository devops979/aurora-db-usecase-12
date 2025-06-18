output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnets_id
}

output "private_subnet_ids" {
  value = module.network.private_subnets_id
}

output "aurora_endpoint" {
  value = module.aurora_db.aurora_cluster_endpoint
}

output "secrets_manager_secret_arn" {
  value = module.aurora_db.secrets_manager_arn
}



output "security_group_id" {
  value = module.security_groups.db_sg_id
}
