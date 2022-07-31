data "aws_vpc" "vpc" {
    filter {
    name   = "tag:Name"
    values = ["my-vpc"]
  }
  
}
data "aws_security_group" "rdssg" {
    filter {
    name   = "tag:Name"
    values = ["test"]

  }  
}



data "aws_subnets" "available_db_subnet" {

  filter {
    name   = "tag:Name"
    values = ["my-vpc-private*"]
  }
}

