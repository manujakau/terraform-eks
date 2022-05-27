resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster-custom"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role = aws_iam_role.eks_cluster.name
}

resource "aws_eks_cluster" "eks" {
  name = "eks"
  role_arn = aws_iam_role.eks_cluster.arn
  version = "1.21"

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access = true

    subnet_ids = [
        var.public_subnet_a,
        var.public_subnet_b,
        var.private_subnet_a,
        var.private_subnet_b
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}