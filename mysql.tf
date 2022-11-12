resource "kubernetes_deployment" "mysql" {
  metadata {
    name      = "mysql"
    namespace = "dev"
    labels = {
      app = "mysql"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
        container {
          image = "mysql:8.0"
          name  = "mysql-container"
          #command = ["mysqld", "--default-authentication-plugin=mysql_native_password"]
          port {
            container_port = 3306
          }
          volume_mount {
            mount_path = "/docker-entrypoint-initdb.d/0_init.sql"
            name       = "init-sql"
          }
          volume_mount {
            mount_path = "/var/lib/mysql"
            name       = "database"
          }
          env_from {
            secret_ref {
              name = "db-secret"
            }
          }
        }
        #restart_policy = "OnFailure"

        volume {
          name = "init-sql"
          host_path {
            path = "/dbinit/init.sql"
          }
        }
        volume {
          name = "database"
          host_path {
            path = "/database"
          }
        }
      }
    }
  }
}

#=======================================db secret========================================================================
resource "kubernetes_secret" "db-secret" {
  metadata {
    name      = "db-secret"
    namespace = "dev"
  }
  data = {
    MYSQL_DATABASE      = "cGF0aWVudHNkYg==" #"patientsdb"
    MYSQL_ROOT_PASSWORD = "UEFTU3dvcmRAMTIz" #"PASSword@123"
  }
}

#==========================================Node Port Service==============================================================
resource "kubernetes_service" "mysql-nodeport" {
  metadata {
    name      = "mysql-nodeport"
    namespace = "dev"

  }
  spec {
    selector = {
      app = "mysql"
    }
    session_affinity = "ClientIP"
    port {
      port        = 3306
      target_port = 3306
      node_port   = 30010
    }

    type = "NodePort"
  }
}
