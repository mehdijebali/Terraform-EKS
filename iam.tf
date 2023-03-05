resource "aws_iam_role" "eks_cluster" {
  name               = var.EKS_NODES_ROLE_NAME
  assume_role_policy = file("./policies/eks_cluster.json")
}

resource "aws_iam_role" "AmazonEKSLoadBalancerControllerRole" {
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
              "Federated": "arn:aws:iam::${var.AWS_ACCOUNT_ID}:oidc-provider/oidc.eks.${var.AWS_REGION}.amazonaws.com/id/*"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "oidc.eks.${var.AWS_ACCOUNT_ID}.amazonaws.com/id/*:aud": "sts.amazonaws.com",
                    "oidc.eks.${var.AWS_ACCOUNT_ID}.amazonaws.com/id/*:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
                }
            }
        }
    ]
}
  EOF
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
  name               = var.EKS_NODES_ROLE_NAME
  assume_role_policy = file("./policies/eks_cluster.json")
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

resource "aws_iam_policy" "AWSLoadBalancerControllerIAMPolicy" {
  policy = file("./policies/lbc_iam_policy.json")
}
