output "vpcid" {
  value = aws_vpc.eks_vpc.id
}

output "public_subnet_a" {
  value = aws_subnet.eks_public_subnet_a.id
}

output "public_subnet_b" {
  value = aws_subnet.eks_public_subnet_b.id
}

output "private_subnet_a" {
  value = aws_subnet.eks_private_subnet_a.id
}

output "private_subnet_b" {
  value = aws_subnet.eks_private_subnet_b.id
}