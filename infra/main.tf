terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.23.0"
    }
  }

  backend "gcs" {
    bucket = "terraform-ghactions-1105965"
    prefix = "terraform"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "terraform" {
  name          = "terraform-ghactions-1105965"
  location      = var.region
  force_destroy = false

  project = var.project_id

  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  public_access_prevention = "enforced"
}

resource "google_cloud_run_v2_service_iam_member" "roles" {
  project  = google_cloud_run_v2_service.container_run.project
  location = google_cloud_run_v2_service.container_run.location
  name     = google_cloud_run_v2_service.container_run.name
  role     = var.roles
  member   = "allUsers"
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

    max_instance_request_concurrency = 3

    scaling {
      min_instance_count = 0
      max_instance_count = 2
    }
  }
}
