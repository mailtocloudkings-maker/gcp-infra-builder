output "vpc_id" {
  value = google_compute_network.this.id
}

output "subnet_id" {
  value = google_compute_subnetwork.this.id
}

output "vpc_name" {
  value = google_compute_network.this.name
}
