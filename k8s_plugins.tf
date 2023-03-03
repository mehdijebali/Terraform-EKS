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
