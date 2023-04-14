provider "google"{
    project     = "terraform-project-atserge1"

}

resource "google_artifact_registry_repository" "ots-project-repo" {
  location      = "us-central1"
  repository_id = "ots-project-repo"
  description   = "example docker repository"
  format        = "DOCKER"
}

terraform {
  backend "gcs" {
    bucket  = "terraform-project-atserge1"
    prefix  = "terraform/state/ots"
  }
}


