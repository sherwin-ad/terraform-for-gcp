output "id" {
  value = google_compute_network.test-vpc-network.id
}

output "self_link" {
  value = google_compute_network.test-vpc-network.self_link
}

output "public-ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}