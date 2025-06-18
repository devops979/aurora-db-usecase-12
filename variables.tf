variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "environment" {
  description = "The Name of the environment"
  type        = string
  default     = "Dev"
}

variable "key_name" {
  description = "The key name of the instance"
  type        = string
  default     = "devops-tools"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-084568db4383264d4"
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}

# variable "db_name" {
#   description = "The name of the database"
#   type        = string
#   default     = "mydatabase"
# }

# variable "db_username" {
#   description = "The username for the database"
#   type        = string
#   default     = "admin"
# }

# variable "db_password" {
#   description = "The password for the database"
#   type        = string
#   default     = "mypassword"
# }

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Name = "TerraformProject"
  }
}


variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs for Aurora"
  type        = list(string)
}

variable "allocated_storage" {
  description = "Allocated storage for Aurora DB (in GB)"
  type        = number
}

variable "engine" {
  description = "Aurora database engine (e.g., aurora-mysql)"
  type        = string
}

variable "engine_version" {
  description = "Version of the Aurora database engine"
  type        = string
}

variable "instance_class" {
  description = "Instance class for Aurora DB instances"
  type        = string
}



variable "database_name" {
  description = "Initial database name"
  type        = string
}

variable "db_master_username" {
  description = "Master username for the Aurora cluster"
  type        = string
}

variable "db_instance_type" {
  description = "Instance type for Aurora DB instances"
  type        = string
  default     = "db.t3.medium"
  
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
}


variable "cluster_name" {
  description = "Name of the Aurora DB cluster"
  type        = string
}

variable "secrets_manager_secret_name" {
  description = "Name of the Secrets Manager secret to store credentials"
  type        = string
}


variable "db_engine" {
  description = "Database engine for Aurora"
  type        = string
  default     = "aurora-mysql"
  
}


variable "db_engine_version" {
  type        = string
  description = "The database engine version"
  default     = "8.0.mysql_aurora.3.05.2"
}


variable "aurora_cluster_name" {
  description = "Name of the DB subnet group"
  type        = string
  default     = "aurora-db-cluster"
  
}