output "vm_name" {
  value = google_compute_instance.vm.name
}

output "vm_zone" {
  value = google_compute_instance.vm.zone
}

output "cloudsql_private_ip" {
  value = var.cloudsql_private_ip
}

output "cloudsql_user" {
  value = var.cloudsql_user
}

output "cloudsql_db_name" {
  value = var.cloudsql_db_name
}
