/*
resource "google_compute_subnetwork" "test-subnet" {
  name          = "test-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.test-vpc-network.id
}
*/

resource "google_compute_firewall" "default" {
  name = "terraform-instance-fw"
  network = google_compute_network.test-vpc-network.name

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_tags = ["terraform-instance"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_network" "test-vpc-network" {
  name = "test-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "test-network-subnet" {
  name          = "private-network"
  ip_cidr_range = var.cidr
  network       = google_compute_network.test-vpc-network.id
}


resource "google_compute_instance" "vm_instance" {
  name = "terraform-instance"
  machine_type = var.machine_type
  allow_stopping_for_update = true

  tags = ["terraform-instance"]

  metadata = {
    ssh-keys = "sherwin:${file("~/.ssh/id_rsa.pub")}"
  }

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2404-noble-amd64-v20240809"
    }
  }

  network_interface {
    network = google_compute_network.test-vpc-network.self_link
    subnetwork = google_compute_subnetwork.test-network-subnet.self_link
    access_config {
    }
  }  
}



