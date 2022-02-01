provider "helm" {
  kubernetes {
    config_path = var.config_path
  }
}

resource "helm_release" "kubernetes-dashboard" {

  name = var.resourse_name

  repository = "https://kubernetes.github.io/dashboard/"
  chart      = "kubernetes-dashboard"
  namespace  = "default"

  set {
    name  = "service.type"
    value = var.service_type
  }

  set {
    name  = "protocolHttp"
    value = "true"
  }

  set {
    name  = "service.externalPort"
    value = var.service_external_port
  }

  set {
    name  = "replicaCount"
    value = var.replica_count
  }

  set {
    name  = "rbac.clusterReadOnlyRole"
    value = var.cluster_readOnly_role
  }
}
