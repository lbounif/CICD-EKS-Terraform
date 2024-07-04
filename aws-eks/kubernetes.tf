provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster
  token =  data.aws_eks_cluster_auth.cluster
  cluster_ca_certificate = base64decode(data.aws_eks_cluster_auth.cluster)
}
  
resource "kubernetes_namespace" "test" {
    metadata {
      name = "nginx"
    }
}

resource "kubernetes_deployment" "test" {
  metadata {
    name = "nginx"
    namespace = kubernetes_namespace.test.metadata.0.name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "MyTestApp"
      }
    }

    template {
      metadata {
        labels = {
          app = "MyTestApp"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "example"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}



