resource "aws_nat_gateway" "eks_nat_gw_01" {
  allocation_id = aws_eip.eks_eip_01.id
  subnet_id     = aws_subnet.eks_public_subnet_a.id

  tags = {
    Name = "eks_nat_gw_01"
  }
}

resource "aws_nat_gateway" "eks_nat_gw_02" {
  allocation_id = aws_eip.eks_eip_02.id
  subnet_id     = aws_subnet.eks_public_subnet_b.id

  tags = {
    Name = "eks_nat_gw_02"
  }
}