resource "random_password" "db_master_password" {
  length           = var.db_master_password_length
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "aurora_credentials" {
  name        = var.secrets_manager_secret_name
  description = "Base64-encoded credentials for Aurora DB cluster"
}

resource "aws_secretsmanager_secret_version" "aurora_credentials_version" {
  secret_id     = aws_secretsmanager_secret.aurora_credentials.id
  secret_string = base64encode(jsonencode({
    username = var.db_master_username
    password = random_password.db_master_password.result
  }))
}

resource "aws_db_subnet_group" "aurora" {
  name       = "${var.aurora_cluster_name}-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    Name = "${var.aurora_cluster_name}-subnet-group"
  }
}

resource "aws_rds_cluster" "aurora" {
  cluster_identifier      = var.aurora_cluster_name
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  database_name           = var.database_name
  master_username         = var.db_master_username
  master_password         = random_password.db_master_password.result
  vpc_security_group_ids  = [var.security_group_id]
  db_subnet_group_name    = aws_db_subnet_group.aurora.name
  skip_final_snapshot     = true
}

resource "aws_rds_cluster_instance" "writer" {
  identifier              = "${var.aurora_cluster_name}-writer"
  cluster_identifier      = aws_rds_cluster.aurora.id
  instance_class          = var.db_instance_type
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
}

resource "aws_rds_cluster_instance" "reader" {
  identifier              = "${var.aurora_cluster_name}-reader"
  cluster_identifier      = aws_rds_cluster.aurora.id
  instance_class          = var.db_instance_type
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
}