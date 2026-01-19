variable "project_id" {
  type = string
}

variable "create_vpc" {
  type    = bool
  default = false
}

variable "create_firewall" {
  type    = bool
  default = true
}

variable "create_dns_internal" {
  type    = bool
  default = false
}

variable "create_compute_vm" {
  type    = bool
  default = false
}

variable "create_cloudsql_postgres" {
  type    = bool
  default = false
}

variable "create_storage" {
  type    = bool
  default = false
}

variable "create_monitoring" {
  type    = bool
  default = false
}
