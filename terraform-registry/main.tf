provider "google"{
    project     = "terraform-project-kilyk"

}

resource "google_artifact_registry_repository" "ots-project-repo" {
  location      = "us-central1"
  repository_id = "ots-project-repo"
  description   = "example docker repository"
  format        = "DOCKER"
}

terraform {
  backend "gcs" {
    bucket  = "terraform-project-kilyk"
    prefix  = "terraform/state/ots"
  }
}

