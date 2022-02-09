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


# --------------- Sedrik 2022-02-08 20:10
# resource "kubernetes_service" "example" {
#   metadata {
#     name = "ingress-service"
#   }
#   spec {
#     port {
#       port        = 80
#       target_port = 3000
#       protocol    = "TCP"
#     }
#     type = "NodePort"
#   }
# }
#
# resource "kubernetes_ingress" "example" {
#   wait_for_load_balancer = true
#   metadata {
#     name = "example"
#     annotations = {
#       "kubernetes.io/ingress.class" = "nginx"
#     }
#   }
#   spec {
#     rule {
#       http {
#         path {
#           path = "/*"
#           backend {
#             service_name = kubernetes_service.example.metadata.0.name
#             service_port = 80
#           }
#         }
#       }
#     }
#   }
# }
