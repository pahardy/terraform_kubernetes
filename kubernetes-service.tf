resource "kubernetes_service_v1" "terraform-service" {
  metadata {
    name = "terraform-service"
  }
  spec {
    selector = {
      app = "nginx"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
