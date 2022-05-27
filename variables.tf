variable "profile" {}

variable "aws_region" {}

#networking variables

variable "vpc_cidr" {}

variable "subnet_cidrs" {
  type = map(string)
}