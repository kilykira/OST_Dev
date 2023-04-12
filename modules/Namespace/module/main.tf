resource "kubernetes_namespace" "OTS" {
  metadata {
    name = var.name
  }
}

resource "kubernetes_resource_quota" "ots-ns-quota" {
  metadata {
    name = "ots-pod-limit"
    namespace = kubernetes_namespace.OTS.id
  }
  spec {
    hard = {
      pods = 10
    }
    scopes = ["BestEffort"]
  }
}