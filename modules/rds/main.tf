module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = var.identifier_main_db
  # identifier                          = format("%s-%s", var.identifier_main_db, var.env)
  # identifier                          = "${var.identifier_main_db}.masters.${var.env}"

  allocated_storage                   = var.storage
  engine                              = var.engine
  engine_version                      = var.engine_version
  instance_class                      = var.instance_class
  db_name                             = var.db_name
  username                            = var.username
  port                                = var.port
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  publicly_accessible                 = var.publicly_accessible
  
  vpc_security_group_ids              = [data.aws_security_group.rdssg.id]

  tags = {
    Environment = "${var.db_name}-${var.env}"
  }
  # DB subnet group
  create_db_subnet_group = true
 #!
  subnet_ids             = data.aws_subnets.available_db_subnet.ids

  # DB parameter group
  family                          = var.db_parameter_group
  parameter_group_use_name_prefix = false

  # DB option group
  major_engine_version         = var.db_option_group_major_engine_version
  option_group_use_name_prefix = false


  maintenance_window          = var.maintenance_window
  backup_window               = var.backup_window
  backup_retention_period     = var.backup_retention_period
  skip_final_snapshot         = var.skip_final_snapshot
  deletion_protection         = var.deletion_protection
  multi_az                    = var.multi_az
  create_cloudwatch_log_group = var.create_cloudwatch_log_group

  # Database Deletion Protection
  performance_insights_enabled = var.performance_insights_enabled
  apply_immediately            = var.apply_immediately

}


module "db_replica" {
  source = "terraform-aws-modules/rds/aws"

  identifier             = var.identifier_replica_db
  replicate_source_db    = module.db.db_instance_id
  create_random_password = false

  allocated_storage                   = var.storage
  engine                              = var.engine
  engine_version                      = var.engine_version
  instance_class                      = var.instance_class
  port                                = var.port
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  publicly_accessible                 = var.publicly_accessible
  vpc_security_group_ids              = [data.aws_security_group.rdssg.id]

  tags = {
    Environment = "${var.db_name}-${var.env}-replica"
  }
  

  # DB parameter group
  family = var.db_parameter_group

  # DB option group
  major_engine_version = var.db_option_group_major_engine_version


  maintenance_window          = var.maintenance_window
  backup_window               = var.backup_window
  backup_retention_period     = var.backup_retention_period
  skip_final_snapshot         = var.skip_final_snapshot
  deletion_protection         = var.deletion_protection
  multi_az                    = var.multi_az
  create_cloudwatch_log_group = var.create_cloudwatch_log_group

  # Database Deletion Protection
  performance_insights_enabled = var.performance_insights_enabled
  apply_immediately            = var.apply_immediately

}