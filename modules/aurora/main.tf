resource "aws_db_subnet_group" "aurora" {
  name       = "${var.aurora_cluster_name}-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    Name = "${var.aurora_cluster_name}-subnet-group"
  }
}

resource "aws_rds_cluster" "aurora" {
  cluster_identifier              = var.aurora_cluster_name
  engine                          = var.db_engine                       # e.g., "aurora-mysql"
  engine_version                  = var.db_engine_version              # e.g., "8.0.mysql_aurora.3.05.2"
  database_name                   = var.database_name
  master_username                 = var.db_master_username             # Required even if AWS manages the password
  manage_master_user_password     = true                               # 🔑 Let AWS manage the password
  vpc_security_group_ids          = [var.security_group_id]
  db_subnet_group_name            = aws_db_subnet_group.aurora.name
  skip_final_snapshot             = true
}

resource "aws_rds_cluster_instance" "writer" {
  identifier         = "${var.aurora_cluster_name}-writer"
  cluster_identifier = aws_rds_cluster.aurora.id
  instance_class     = var.db_instance_type
  engine             = var.db_engine
  engine_version     = var.db_engine_version
}

resource "aws_rds_cluster_instance" "reader" {
  identifier         = "${var.aurora_cluster_name}-reader"
  cluster_identifier = aws_rds_cluster.aurora.id
  instance_class     = var.db_instance_type
  engine             = var.db_engine
  engine_version     = var.db_engine_version
}


