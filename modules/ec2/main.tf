data "aws_vpc" "vpc" {
    filter {
    name   = "tag:Name"
    values = ["my-vpc"]
  }
  
}

data "aws_subnet" "sb" {
    cidr_block = "20.0.4.0/24"
    
    
}

data "aws_security_group" "sg" {
    filter {
    name   = "tag:Name"
    values = ["test"]

  }
  
}

resource "aws_instance" "foo" {

  ami                         = var.instance_ami
  instance_type               = var.instance_type
  tags                        = var.instance_tag
  key_name                    = var.key_name
  vpc_security_group_ids      = [data.aws_security_group.sg.id]
  subnet_id                   = data.aws_subnet.sb.id
  associate_public_ip_address = true
  # user_data              = file("${path.module}/script.sh")


  # vpc_security_group_ids = ["${var.security_groups}"]
  #security_groups = var.security_groups
  #  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]

}
