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



#route table associations

resource "aws_route_table_association" "eks_public_association_a" {
  subnet_id      = aws_subnet.eks_public_subnet_a.id
  route_table_id = aws_route_table.eks_public_rtb_01.id
}

resource "aws_route_table_association" "eks_private_association_a" {
  subnet_id      = aws_subnet.eks_private_subnet_a.id
  route_table_id = aws_route_table.eks_private_rtb_01.id
}

resource "aws_route_table_association" "eks_private_association_b" {
  subnet_id      = aws_subnet.eks_private_subnet_b.id
  route_table_id = aws_route_table.eks_private_rtb_02.id
}