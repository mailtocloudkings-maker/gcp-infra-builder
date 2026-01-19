output "vpc_id" {
  value = module.vpc[0].vpc_id
  description = "VPC ID"
  condition = var.create_vpc
}

output "subnet_id" {
  value = module.vpc[0].subnet_id
  description = "Subnet ID"
  condition = var.create_vpc
}

output "cloudsql_instance" {
  value = module.cloudsql[0].instance_name
  description = "CloudSQL Postgres Instance Name"
  condition = var.create_cloudsql
}

output "internal_lb" {
  value = module.ilb[0].lb_name
  description = "Internal Load Balancer Name"
  condition = var.create_ilb
}
