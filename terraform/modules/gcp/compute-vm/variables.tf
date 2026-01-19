variable "name_prefix" { type = string }
variable "suffix" { type = string }
variable "subnet_id" { type = string }
variable "zone" { type = string }
variable "machine_type" { type = string }
variable "image" { type = string }
variable "tags" { type = list(string), default = [] }

variable "cloudsql_private_ip" { type = string, default = "" }
variable "cloudsql_user" { type = string, default = "" }
variable "cloudsql_db_name" { type = string, default = "" }
