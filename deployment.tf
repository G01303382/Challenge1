resource "kubernetes_deployment" "mediawikiapp" {
  metadata {
    name = "mediawikiapp"
    namespace = "terraform"
    labels = {
      app = "mediawikiapp"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mediawikiapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "mediawikiapp"
        }
      }

      spec {
        container {
          image = "docker.io/mediawiki:latest"
          name  = "mediawiki"

          resources {
            limits = {
              cpu    = "1"
              memory = "512Mi"
            }
            requests = {
              cpu    = "500m"
              memory = "50Mi"
            }
          }
          
	  port {
	    container_port = 80
	  }

          volume_mount {
	    mount_path = "/data/mediawiki"
              name = "mediawiki-mount"
	  }
        }
	volume {
	  name = "mediawiki-mount"
            persistent_volume_claim {
	      claim_name = "mediawiki-pvc"
            }
        }
      }
    }
  }
}
