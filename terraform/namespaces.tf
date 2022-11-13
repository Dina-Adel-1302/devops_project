resource "kubernetes_namespace" "build" {
  metadata {

    labels = {
      label = "build"
    }

    name = "build"
  }
}


resource "kubernetes_namespace" "dev" {
  metadata {

    labels = {
      label = "dev"
    }

    name = "dev"
  }
}



resource "kubernetes_namespace" "test" {
  metadata {

    labels = {
      label = "test"
    }

    name = "test"
  }
}
