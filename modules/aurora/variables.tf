variable "aurora_cluster_name" {
  description = "Name of the Aurora DB cluster"
  type        = string
}

variable "database_name" {
  description = "Name of the initial database to create"
  type        = string
}

variable "db_master_username" {
  description = "Master username for the Aurora DB cluster"
  type        = string
}

variable "db_master_password_length" {
  description = "Length of the generated master password"
  type        = number
  default     = 16
}

variable "db_instance_type" {
  description = "Instance type for Aurora DB instances"
  type        = string
}

variable "db_engine" {
  description = "Database engine for Aurora (e.g., aurora-mysql)"
  type        = string
}

variable "db_engine_version" {
  description = "Engine version for Aurora"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for the Aurora DB cluster"
  type        = string
}

