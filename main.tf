provider "aws" {
  region = var.aws_region

}

module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = var.vpc_name
  vpc_cidr            = var.vpc_cidr
  vpc_private_subnets = var.vpc_private_subnets
  vpc_public_subnets  = var.vpc_public_subnets

}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
  depends_on = [
    module.vpc
  ]
}

module "ec2" {
  source = "./modules/ec2"
  instance_ami = var.instance_ami
  instance_type = var.instance_type
  instance_tag = "${var.instance_tag}"
  key_name = var.key_name
  # vpc_security_group_ids = ["${var.security_groups}"]
  # subnet_id = var.subnet_id
  
  vpc_name            = var.vpc_name
  depends_on = [
    module.sg
  ]
  
}


module "rds" {
  source = "./modules/rds"
  env = var.env
  identifier_main_db = var.identifier_main_db
  identifier_replica_db = var.identifier_replica_db
  storage = var.storage
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  db_name = var.db_name
  username = var.username
  port = var.port
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  publicly_accessible = var.publicly_accessible
  db_parameter_group = var.db_parameter_group
  db_option_group_major_engine_version = var.db_option_group_major_engine_version
  maintenance_window = var.maintenance_window
  backup_window = var.backup_window
  backup_retention_period = var.backup_retention_period
  skip_final_snapshot = var.skip_final_snapshot
  deletion_protection = var.deletion_protection
  multi_az = var.multi_az
  create_cloudwatch_log_group = var.create_cloudwatch_log_group
  performance_insights_enabled  = var.performance_insights_enabled
  apply_immediately = var.apply_immediately
  vpc_cidr = var.vpc_cidr
  vpc_private_subnets = var.vpc_private_subnets
  vpc_public_subnets  = var.vpc_public_subnets
  # ingress_cidr_blocks = var.ingress_cidr_blocks
  # egress_cidr_blocks = var.egress_cidr_blocks
  # sg_name = var.sg_name
  # ports = var.ports
  depends_on = [
    module.ec2
  ]
}

