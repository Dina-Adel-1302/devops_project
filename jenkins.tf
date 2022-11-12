resource "kubernetes_deployment" "jenkins" {
  metadata {
    name      = "jenkins"
    namespace = "build"
    labels = {
      app = "jenkins"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "jenkins"
      }
    }

    template {
      metadata {
        labels = {
          app = "jenkins"
        }
      }

      spec {
        container {
          image = "dinaadel1302/jenkins_with_docker:v1.0"
          name  = "jenkins-with-docker"
          port {
            container_port = 8080
          }
          volume_mount {
            mount_path = "/var/run/docker.sock"
            name       = "docker-sock"
          }
          # volume_mount {
          #   mount_path = "/data/jenkins"
          #   name       = "pvc"
          # }
        }

        volume {
          name = "docker-sock"
          host_path {
            path = "/var/run/docker.sock"
          }
        }

        # volume {
        #   name = "pvc"
        #   persistent_volume_claim {
        #     claim_name = "pvc"
        #   }
        # }

      }
    }
  }
}


#==========================================Node Port Service==============================================================
resource "kubernetes_service" "jenkins-nodeport" {
  metadata {
    name = "jenkins-nodeport"
    namespace = "build"

  }
  spec {
    selector = {
      app = "jenkins"
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 8080
      node_port   = 30008
    }

    type = "NodePort"
  }
}
