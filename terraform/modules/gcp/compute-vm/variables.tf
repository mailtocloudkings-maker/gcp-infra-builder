variable "subnet_id" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "suffix" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "zone" {
  type = string
}

variable "boot_image" {
  type    = string
  default = "debian-cloud/debian-12"
}

variable "tags" {
  type    = list(string)
  default = []
}

# ---- CloudSQL inputs ----
variable "cloudsql_private_ip" {
  type    = string
  default = ""
}

variable "cloudsql_user" {
  type    = string
  default = ""
}

variable "cloudsql_db_name" {
  type    = string
  default = ""
}

variable "cloudsql_password" {
  type      = string
  default   = ""
  sensitive = true
}
