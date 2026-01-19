# ✅ Only resources that we actually create
variable "create_firewall" {
  type = bool
  description = "Create firewall rules"
}

variable "create_dns_internal" {
  type = bool
  description = "Create internal DNS records"
}

variable "create_compute_vm" {
  type = bool
  description = "Create a Compute VM"
}

variable "create_compute_mig" {
  type = bool
  description = "Create a Managed Instance Group"
}

variable "create_ilb" {
  type = bool
  description = "Create an Internal Load Balancer"
}

variable "create_cloudsql" {
  type = bool
  description = "Create CloudSQL PostgreSQL instance"
}

variable "create_storage" {
  type = bool
  description = "Create Storage Bucket"
}

variable "create_monitoring" {
  type = bool
  description = "Enable Monitoring"
}

variable "create_alerts" {
  type = bool
  description = "Create Alerts"
}

variable "create_dashboards" {
  type = bool
  description = "Create Dashboards"
}

# GCP project info
variable "project_id" {
  type = string
  description = "GCP Project ID"
}

variable "region" {
  type = string
  description = "GCP Region"
}

variable "zone" {
  type = string
  description = "GCP Zone"
}
