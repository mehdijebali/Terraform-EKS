resource "kubectl_manifest" "certmanager" {
  yaml_body = file("./k8s_manifests/cert-manager.yaml")
  depends_on = [
    aws_eks_cluster.aws_eks,
    aws_eks_node_group.node
  ]
}

resource "kubectl_manifest" "externaldns" {
  yaml_body = file("./k8s_manifests/external-dns.yaml")
  depends_on = [
    aws_eks_cluster.aws_eks,
    aws_eks_node_group.node
  ]
}

resource "kubectl_manifest" "lbc-serviceaccount" {
  yaml_body = <<YAML
  apiVersion: v1
  kind: ServiceAccount
  metadata:
    labels:
      app.kubernetes.io/component: controller
      app.kubernetes.io/name: aws-load-balancer-controller
    name: aws-load-balancer-controller
    namespace: kube-system
    annotations:
      eks.amazonaws.com/role-arn: ${aws_iam_role.AmazonEKSLoadBalancerControllerRole.arn}
  YAML
  depends_on = [
    aws_eks_cluster.aws_eks,
    aws_eks_node_group.node
  ]
}

resource "kubectl_manifest" "efs-service-account" {
  yaml_body = <<YAML
  apiVersion: v1
  kind: ServiceAccount
  metadata:
    labels:
      app.kubernetes.io/name: aws-efs-csi-driver
    name: efs-csi-controller-sa
    namespace: kube-system
    annotations:
      eks.amazonaws.com/role-arn: ${aws_iam_role.AmazonEKS_EFS_CSI_DriverRole.arn}
  YAML
  depends_on = [
    aws_eks_cluster.aws_eks,
    aws_eks_node_group.node
  ]
}

resource "kubectl_manifest" "lbc" {
  yaml_body = file("./k8s_manifests/lb-controller.yaml")
  depends_on = [
    aws_eks_cluster.aws_eks,
    aws_eks_node_group.node,
    kubectl_manifest.certmanager,
    kubectl_manifest.externaldns,
    kubectl_manifest.lbc-serviceaccount
  ]
}
