resource "kubernetes_deployment" "adam-app" {
  metadata {
    name = "adam-app"
    labels = {
      App = "adam-app"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        App = "adam-app"
      }
    }

    template {
      metadata {
        labels = {
          App = "adam-app"
        }
      }

      spec {
        container {
          image = "sedrikkh/node-web-app:latest"
          name  = "adam-app"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}
