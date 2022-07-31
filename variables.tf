variable "aws_region" {
  default     = "us-east-1"
  description = "aws region where our resources going to create choose"
  #replace the region as suits for your requirement
}

variable "vpc_name" {
  type    = string
  default = "my-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "20.0.0.0/16"
}

variable "vpc_private_subnets" {
  type    = list(string)
  default = ["20.0.1.0/24", "20.0.2.0/24"]

}
variable "vpc_public_subnets" {
  type    = list(string)
  default = ["20.0.4.0/24", "20.0.5.0/24"]
}


variable "instance_tag" {

    type = map(any) 
    default = {
      "Name" = "Prod-Server"
    }
}

variable "instance_ami" {
    type = string
    default = "ami-08d4ac5b634553e16"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}



variable "key_name" {
  type = string
  default = "www"
  
}




variable "env" {
  type    = string
  default = "Stage"
}

variable "identifier_main_db" {
  default     = "mydatabase"
  description = "Identifier for your master DB"
}

variable "identifier_replica_db" {
  default     = "mydatabasr-replica"
  description = "Identifier for your replica DB"
}


variable "storage" {
  default     = "5"
  description = "Storage size in GB"
}

variable "engine" {
  default     = "mysql"
  description = "Engine type, example values mysql, postgres"
}

variable "engine_version" {
  type        = string
  description = "Engine version"
  default     = "8.0.27"
}

variable "instance_class" {
  default     = "db.t3.micro"
  description = "Instance class"
}

variable "db_name" {
  default     = "db-stage"
  description = "db name"
}

variable "username" {
  default     = "admin"
  description = "User name"
}

variable "port" {
  default     = 3306
  description = "Port for Database Connection"
}

variable "iam_database_authentication_enabled" {
  type    = bool
  default = true
}

variable "publicly_accessible" {
  type    = bool
  default = false
}

variable "db_parameter_group" {
  type    = string
  default = "mysql8.0"
}

variable "db_option_group_major_engine_version" {
  type    = string
  default = "8.0"
}

variable "maintenance_window" {
  type        = string
  default     = "Mon:00:00-Mon:03:00"
  description = "Time is in UTC time-zone"
}

variable "backup_window" {
  type        = string
  default     = "03:00-06:00"
  description = "Time is in UTC time-zone"
}

variable "backup_retention_period" {
  type    = number
  default = 7
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "multi_az" {
  type    = bool
  default = true
}

variable "create_cloudwatch_log_group" {
  type    = bool
  default = false
}

variable "performance_insights_enabled" {
  type    = bool
  default = false
}

variable "apply_immediately" {
  type    = bool
  default = true
}



variable "ingress_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "CIDR for ingress"
}

variable "egress_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "CIDR for egress"
}

variable "sg_name" {
  default     = "rds_sg"
  description = "Tag Name for sg"
}

variable "ports" {
  type    = list(number)
  default = [22, 80, 443, 3306]
}



