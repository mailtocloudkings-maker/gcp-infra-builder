# ===========================
# ✅ Only resources to create
# ===========================

variable "create_firewall" {
  type        = bool
  description = "Create firewall rules"
  default     = false
}

variable "create_dns_internal" {
  type        = bool
  description = "Create internal DNS records"
  default     = false
}

variable "create_compute_vm" {
  type        = bool
  description = "Create a Compute VM"
  default     = false
}

variable "create_compute_mig" {
  type        = bool
  description = "Create a Managed Instance Group"
  default     = false
}

variable "create_ilb" {
  type        = bool
  description = "Create an Internal Load Balancer"
  default     = false
}

variable "create_cloudsql" {
  type        = bool
  description = "Create CloudSQL PostgreSQL instance"
  default     = false
}

variable "create_storage" {
  type        = bool
  description = "Create Storage Bucket"
  default     = false
}

variable "create_monitoring" {
  type        = bool
  description = "Enable Monitoring"
  default     = false
}

variable "create_alerts" {
  type        = bool
  description = "Create Alerts"
  default     = false
}

variable "create_dashboards" {
  type        = bool
  description = "Create Dashboards"
  default     = false
}

# ===========================
# GCP project info
# ===========================

variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type        = string
  description = "GCP Region"
}

variable "zone" {
  type        = string
  description = "GCP Zone"
}
