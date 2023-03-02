variable "CLUSTER-NAME" {
  default = "tf-eks"
  type    = string
}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "NODE_GROUP_NAME" {
  default = "eks_node"
}

variable "VPC_NAME" {
  default = "vpc-eks"
}

variable "VPC_CIDR_BLOCK" {
  default = "10.0.0.0/16"
}
variable "VPC_PRIVATE_SUBNETS" {
  type    = list(any)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "VPC_PUBLIC_SUBNETS" {
  type    = list(any)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "AMAZON_EKS_CLUSTER_POLICY_ARN" {
  default = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

variable "AMAZONEKS_SERVICE_POLICY_ARN" {
  default = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

variable "AMAZONEKS_WORKERNODE_POLICY_ARN" {
  default = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

variable "AMAZONEKS_CNI_POLICY_ARN" {
  default = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

variable "AMAZONEC2_CONTAINER_REGISTRY_READONLY_ARN" {
  default = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

variable "WORKER_NODE_DESIRED_SIZE" {
  default = 1
}

variable "WORKER_NODE_MAX_SIZE" {
  default = 1
}

variable "EKS_CLUSTER_ROLE_NAME" {
  default = "eks-cluster"
}

variable "EKS_NODES_ROLE_NAME" {
  default = "eks-node-group"
}