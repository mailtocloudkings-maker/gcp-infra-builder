output "vm_name" {
  value = var.create_vm && length(google_compute_instance.vm) > 0 ? google_compute_instance.vm[0].name : ""
}

output "vm_self_link" {
  value = var.create_vm && length(google_compute_instance.vm) > 0 ? google_compute_instance.vm[0].self_link : ""
}

output "vm_zone" {
  value = var.create_vm && length(google_compute_instance.vm) > 0 ? google_compute_instance.vm[0].zone : ""
}

output "cloudsql_private_ip" {
  value = var.create_vm && length(google_compute_instance.vm) > 0 ? google_compute_instance.vm[0].metadata["cloudsql_private_ip"] : ""
}

output "cloudsql_user" {
  value = var.create_vm && length(google_compute_instance.vm) > 0 ? google_compute_instance.vm[0].metadata["cloudsql_user"] : ""
}

output "cloudsql_db_name" {
  value = var.create_vm && length(google_compute_instance.vm) > 0 ? google_compute_instance.vm[0].metadata["cloudsql_db_name"] : ""
}
