variable "name_prefix" {
  description = "Prefix for VM names"
  type        = string
}

variable "suffix" {
  description = "Unique suffix for VM names"
  type        = string
}

variable "subnet_id" {
  description = "Subnetwork ID for the VM"
  type        = string
}

variable "zone" {
  description = "Zone where VM will be created"
  type        = string
}

variable "machine_type" {
  description = "GCE machine type"
  type        = string
  default     = "e2-micro"
}

variable "image" {
  description = "VM boot image"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "tags" {
  description = "Network tags for the VM"
  type        = list(string)
  default     = []
}

variable "cloudsql_private_ip" {
  description = "CloudSQL private IP to connect from VM"
  type        = string
  default     = ""
}

variable "cloudsql_user" {
  description = "CloudSQL default user for VM metadata"
  type        = string
  default     = ""
}

variable "cloudsql_db_name" {
  description = "CloudSQL default DB name for VM metadata"
  type        = string
  default     = ""
}
