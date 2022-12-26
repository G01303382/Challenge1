resource "kubernetes_persistent_volume_claim_v1" "mediawiki-pvc" {
  metadata {
    name = "mediawiki-pvc"
    namespace = "terraform"
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "5Gi"
      }
    }
    volume_name = "${kubernetes_persistent_volume_v1.mediawiki-pv.metadata.0.name}"
  }
}

