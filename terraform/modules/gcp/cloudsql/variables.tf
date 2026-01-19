variable "name_prefix" { type = string }
variable "suffix" { type = string }
variable "region" { type = string }
variable "network_id" { type = string }
variable "default_user_password" { type = string, sensitive = true }
variable "create_default_db" { type = bool, default = true }
variable "default_db_name" { type = string, default = "appdb" }
variable "create_default_user" { type = bool, default = true }
variable "default_user_name" { type = string, default = "appuser" }
variable "tier" { type = string, default = "db-f1-micro" }
variable "enable_backups" { type = bool, default = true }
variable "deletion_protection" { type = bool, default = false }
