resource "aws_eip" "eks_eip_01" {
  vpc = true
  depends_on = [
    aws_internet_gateway.eks_internet_gateway
  ]

  tags = {
    Name = "eks_eip_01"
  }
}

resource "aws_eip" "eks_eip_02" {
  vpc = true
  depends_on = [
    aws_internet_gateway.eks_internet_gateway
  ]

  tags = {
    Name = "eks_eip_02"
  }
}