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