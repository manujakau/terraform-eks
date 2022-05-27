resource "aws_route_table" "eks_public_rtb_01" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_internet_gateway.id
  }

  tags = {
    Name = "eks_public_rtb_01"
  }
}


resource "aws_route_table" "eks_private_rtb_01" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.eks_nat_gw_01.id
  }

  tags = {
    Name = "eks_private_rtb_01"
  }
}


resource "aws_route_table" "eks_private_rtb_02" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.eks_nat_gw_02.id
  }

  tags = {
    Name = "eks_private_rtb_02"
  }
}