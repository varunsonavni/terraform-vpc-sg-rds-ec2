
variable "instance_tag" {

    type = map(any) 

}

variable "instance_ami" {
    type = string
    default = "ami-023d39cbc16614424"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

# variable "security_groups"{
#     type = string
# }

# variable "subnet_id"{
#     type = string
# }
variable "key_name" {
  type = string
  
}
variable "vpc_name" {
  type    = string
}
