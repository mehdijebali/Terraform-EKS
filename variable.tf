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

variable "VPC_PRIVATE_SUBNETS" {
  type = list
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "VPC_PUBLIC_SUBNETS" {
  type = list
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}