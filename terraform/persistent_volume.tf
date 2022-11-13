# resource "kubernetes_persistent_volume_claim" "pvc" {
#   metadata {
#     name = "pvc"
#     namespace = "build"
#   }
#   spec {
#     access_modes = ["ReadWriteMany"]
#     resources {
#       requests = {
#         storage = "1Gi"
#       }
#     }
#     volume_name = "${kubernetes_persistent_volume.pv.metadata.0.name}"
#     storage_class_name  = "local"
#   }
# }


# resource "kubernetes_persistent_volume" "pv" {
#   metadata {
#     name = "pv"
#   }
#   spec {
#     capacity = {
#       storage = "1Gi"
#     }
#     access_modes = ["ReadWriteMany"]
#     storage_class_name  = "local"

#     persistent_volume_source {
#       host_path {
#         path  = "/var/hostpath-provisioner"
#         type  = "Directory"
#       }

#     }
#   }
# }

