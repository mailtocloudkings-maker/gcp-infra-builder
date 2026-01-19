output "vm_names" {
  value       = [for m in module.compute_vm : m.vm_name]
  description = "Names of all created VMs"
}

output "cloudsql_instance" {
  value       = module.cloudsql[*].instance_name
  description = "CloudSQL Postgres instance names"
}

output "firewall_name" {
  value       = module.firewall[*].firewall_name
  description = "Name of the firewall created"
}

output "unique_suffix" {
  value       = local.unique_suffix
  description = "Unique suffix used for all resources"
}
