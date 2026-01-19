variable "create_vpc" { type = bool }
variable "create_firewall" { type = bool }
variable "create_dns" { type = bool }
variable "create_compute_vm" { type = bool }
variable "create_compute_mig" { type = bool }
variable "create_ilb" { type = bool }
variable "create_cloudsql" { type = bool }
variable "create_storage" { type = bool }
variable "create_monitoring" { type = bool }
variable "create_alerts" { type = bool }
variable "create_dashboards" { type = bool }

variable "tf_state_bucket" { type = string }
variable "tf_state_prefix" { type = string }

variable "project_id" { type = string }
variable "region" { type = string }
variable "zone" { type = string }
