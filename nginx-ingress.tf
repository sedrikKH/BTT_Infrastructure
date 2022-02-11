resource "kubernetes_service" "alb" {
  metadata {
    name = "adam-alb"
  }
  spec {
    selector = {
      App = kubernetes_deployment.adam-app.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 3000
      protocol    = "TCP"
    }

    type = "LoadBalancer"
  }
}
