# resource "kubernetes_deployment" "node" {
#   metadata {
#     name      = "node"
#     namespace = "dev"
#     labels = {
#       app = "node"
#     }
#   }

#   spec {
#     replicas = 1

#     selector {
#       match_labels = {
#         app = "node"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "node"
#         }
#       }

#       spec {
#         container {
#           image = "dinaadel1302/nodeapp-mahmoud:v1.0"
#           name  = "node-container"
#           #command = ["npm", "install", "express"]
#           port {
#             container_port = 3000
#           }
#           volume_mount {
#             mount_path = "/nodeapp"
#             name       = "nodeapp"
#           }
#           env_from {
#             secret_ref {
#               name = "node-secret"
#             }
#           }
#         }
#         volume {
#           name = "nodeapp"
#           host_path {
#             path = "/nodeapp"
#           }
#         }
#       }
#     }
#   }
# }


# #=======================================node secret========================================================================
# resource "kubernetes_secret" "node-secret" {
#   metadata {
#     name      = "node-secret"
#     namespace = "dev"
#   }
#   data = {
#     HOST     = "localhost"       #"http://192.168.49.2:30010"          
#     USERNAME = "cm9vdA=="             #"root"
#     PASSWORD = "UEFTU3dvcmRAMTIz"     #"PASSword@123"
#     DATABASE = "cGF0aWVudHNkYg=="     #"patientsdb"
#   }
# }

# #==========================================Node Port Service==============================================================
# resource "kubernetes_service" "node-nodeport" {
#   metadata {
#     name      = "node-nodeport"
#     namespace = "dev"

#   }
#   spec {
#     selector = {
#       app = "node"
#     }
#     session_affinity = "ClientIP"
#     port {
#       port        = 3000
#       target_port = 3000
#       node_port   = 30012
#     }

#     type = "NodePort"
#   }
# }
