terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.38.0"
    }
  }
}

provider "google" {
}

resource "google_project" "my_project" {
  name       = "Busybee Project"
  project_id = "busybee-project-01"
  org_id     = "952768673789"
}

