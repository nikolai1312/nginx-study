terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.23.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_v2_service" "container_run" {
  name     = var.container_service_name
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = var.container_image
      ports {
        container_port = 8080
      }

      resources {
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
        cpu_idle          = true
        startup_cpu_boost = false
      }
    }

    max_instance_request_concurrency = 5

    scaling {
      min_instance_count = 0
      max_instance_count = 2
    }
  }
}
