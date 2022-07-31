variable "aws_region" {
  default = "us-east-1"
}

variable "env" {
  type    = string

}

variable "identifier_main_db" {

  description = "Identifier for your master DB"
}

variable "identifier_replica_db" {

  description = "Identifier for your replica DB"
}


variable "storage" {
  description = "Storage size in GB"
}

variable "engine" {
  description = "Engine type, example values mysql, postgres"
}

variable "engine_version" {
  type        = string
  description = "Engine version"
}

variable "instance_class" {
  description = "Instance class"
}

variable "db_name" {
  description = "db name"
}

variable "username" {
  description = "User name"
}

variable "port" {
  description = "Port for Database Connection"
}

variable "iam_database_authentication_enabled" {
  type    = bool
}

variable "publicly_accessible" {
  type    = bool
}

variable "db_parameter_group" {
  type    = string
}

variable "db_option_group_major_engine_version" {
  type    = string
}

variable "maintenance_window" {
  type        = string
  description = "Time is in UTC time-zone"
}

variable "backup_window" {
  type        = string
  description = "Time is in UTC time-zone"
}

variable "backup_retention_period" {
  type    = number
}

variable "skip_final_snapshot" {
  type    = bool
}

variable "deletion_protection" {
  type    = bool
}

variable "multi_az" {
  type    = bool
}

variable "create_cloudwatch_log_group" {
  type    = bool
}

variable "performance_insights_enabled" {
  type    = bool
}

variable "apply_immediately" {
  type    = bool
}


variable "vpc_cidr" {
  type    = string
}


variable "vpc_private_subnets" {
  type    = list(string)

}
variable "vpc_public_subnets" {
  type    = list(string)
}

