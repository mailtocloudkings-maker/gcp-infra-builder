output "vpc_name" {
  value = var.create_vpc ? module.vpc[0].vpc_name : null
}

output "cloudsql_private_ip" {
  value = var.create_cloudsql_postgres ? module.cloudsql_postgres[0].private_ip : null
}
