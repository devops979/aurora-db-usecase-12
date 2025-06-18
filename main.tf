provider "aws" {
  region = var.region
}


module "network" {
  source             = "./modules/network"
  vpc_cidr           = var.cidr_block
  vpc_name           = "demo-auroradb-vpc"
  environment        = var.environment
  public_cidr_block  = var.public_subnet_cidrs
  private_cidr_block = var.private_subnet_cidrs
  azs                = var.availability_zones
  owner              = "demo-aurora-db"
}

module "nat" {
  source           = "./modules/nat"
  public_subnet_id = module.network.public_subnets_id[0]
  private_rt_ids   = module.network.private_route_table_ids
  vpc_name         = module.network.vpc_name
}



module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.network.vpc_id
  tags   = var.tags
}



module "aurora_db" {
  source                 = "./modules/aurora"
  aurora_cluster_name         = var.aurora_cluster_name
  subnet_ids             = module.network.private_subnets_id
  db_engine                 = var.db_engine
  db_engine_version         = var.db_engine_version
   db_instance_type               = var.db_instance_type
  database_name               = var.database_name
  db_master_username               = var.db_master_username
  security_group_id = module.security_groups.db_sg_id
}
