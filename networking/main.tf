#VPC
data "aws_availability_zones" "available" {}


resource "aws_vpc" "eks_vpc" {
  cidr_block                       = var.vpc_cidr
  instance_tenancy                 = "default"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  enable_classiclink               = false
  enable_classiclink_dns_support   = false
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "eks_vpc"
  }
}

#internet gateway
resource "aws_internet_gateway" "eks_internet_gateway" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks_igw"
  }
}

# subnets
resource "aws_subnet" "eks_public_subnet01" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.subnet_cidrs["public1"]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "eks_public_a"
    Tier = "Public"
  }
}

resource "aws_subnet" "eks_public_subnet02" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.subnet_cidrs["public2"]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "eks_public_b"
    Tier = "Public"
  }
}