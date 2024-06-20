

/*provider "kubernetes" {
  host                   = data.terraform_remote_state.eks.outputs.kubeconfig
  cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_ca_certificate)
  token                  = data.aws_eks_cluster_auth.example.token
}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.eks.outputs.kubeconfig
    cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_ca_certificate)
    token                  = data.aws_eks_cluster_auth.argocd.token
  }
}*/



resource "helm_release" "argocd" {
  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "3.35.4"

  values = [file("C:/Users/srima/Terraform/ArgoCD/values/argocd.yaml")]
}