/*
resource "google_compute_subnetwork" "test-subnet" {
  name          = "test-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.test-vpc-network.id
}
*/

resource "google_compute_network" "test-vpc-network" {
  name = "test-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "test-network-subnet" {
  for_each=var.subnet
  name          = each.key
  ip_cidr_range = each.value.cidr_block
  region        = each.value.region
  network       = google_compute_network.test-vpc-network.id
}


