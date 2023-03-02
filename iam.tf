resource "aws_iam_role" "eks_cluster" {
  name = var.EKS_NODES_ROLE_NAME
  assume_role_policy = "${file("./policies/eks_cluster.json")}"
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = var.AMAZON_EKS_CLUSTER_POLICY_ARN
  role       = aws_iam_role.eks_cluster.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSServicePolicy" {
  policy_arn = var.AMAZONEKS_SERVICE_POLICY_ARN
  role       = aws_iam_role.eks_cluster.name
}

resource "aws_iam_role" "eks_nodes" {
  name = var.EKS_NODES_ROLE_NAME
  assume_role_policy = "${file("./policies/eks_cluster.json")}"
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = var.AMAZONEKS_WORKERNODE_POLICY_ARN
  role       = aws_iam_role.eks_nodes.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = var.AMAZONEKS_CNI_POLICY_ARN
  role       = aws_iam_role.eks_nodes.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = var.AMAZONEC2_CONTAINER_REGISTRY_READONLY_ARN
  role       = aws_iam_role.eks_nodes.name
}
