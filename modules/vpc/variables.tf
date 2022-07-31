
variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "20.0.0.0/16"
}

variable "vpc_private_subnets" {
  type    = list(string)
  default = ["20.0.1.0/24", "20.0.2.0/24", "20.0.3.0/24"]

}
variable "vpc_public_subnets" {
  type    = list(string)
  default = ["20.0.4.0/24", "20.0.5.0/24", "20.0.6.0/24"]
}
