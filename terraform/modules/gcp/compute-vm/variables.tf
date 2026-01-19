variable "name_prefix" {
  description = "Prefix for VM instance names"
  type        = string
}

variable "suffix" {
  description = "Unique suffix for VM instance names"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the VM"
  type        = string
}

variable "zone" {
  description = "GCP zone for the VM"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the VM"
  type        = string
  default     = "e2-micro"
}

variable "image" {
  description = "Compute image for the VM"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "tags" {
  description = "List of tags to assign to VM"
  type        = list(string)
  default     = []
}

variable "cloudsql_private_ip" {
  description = "Private IP of CloudSQL to connect from VM"
  type        = string
  default     = ""
}

variable "cloudsql_user" {
  description = "CloudSQL username to connect from VM"
  type        = string
  default     = ""
}

variable "cloudsql_db_name" {
  description = "CloudSQL database name to connect from VM"
  type        = string
  default     = ""
}
