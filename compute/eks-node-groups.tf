resource "aws_iam_role" "eks_nodeGroup_iam_role" {
  name               = "eks-nodeGroup-custom"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks_worker_node_policy_general" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

  role = aws_iam_role.eks_nodeGroup_iam_role.name
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy_general" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

  role = aws_iam_role.eks_nodeGroup_iam_role.name
}

resource "aws_iam_role_policy_attachment" "ec2_container_registry_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

  role = aws_iam_role.eks_nodeGroup_iam_role.name
}


resource "aws_eks_node_group" "eks_nodes_general" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "eks-nodes-general"
  node_role_arn   = aws_iam_role.eks_nodeGroup_iam_role.arn

  #subnets must have resource tag: kubernetes.io/cluster/CLUSTER_NAME 
  subnet_ids = [
    var.private_subnet_a,
    var.private_subnet_b
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  ami_type             = "AL2_x86_64"
  capacity_type        = "ON_DEMAND"
  disk_size            = 20
  force_update_version = false

  instance_types = [
    "t3.small"
  ]

  labels = {
    role = "eks-nodes-general"
  }

  version = "1.21"

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy_general,
    aws_iam_role_policy_attachment.eks_cni_policy_general,
    aws_iam_role_policy_attachment.ec2_container_registry_read_only
  ]
}