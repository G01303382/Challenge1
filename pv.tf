resource "kubernetes_persistent_volume_v1" "mediawiki-pv" {
  metadata {
    name = "mediawiki-pv"
  }
  spec {
    capacity = {
      storage = "5Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      vsphere_volume {
        volume_path = "/absolute/path"
      }
    }
  }
}
