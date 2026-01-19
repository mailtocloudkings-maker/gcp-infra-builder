# -----------------------------
# Subnet to attach the VM to
# -----------------------------
variable "subnet_id" {
  description = "ID of the subnet where the VM will be deployed"
  type        = string
}

# -----------------------------
# VM Name Prefix and Suffix
# -----------------------------
variable "name_prefix" {
  description = "Prefix for the VM name"
  type        = string
}

variable "suffix" {
  description = "Unique suffix for the VM name"
  type        = string
}

# -----------------------------
# VM Network Tags (for firewall)
# -----------------------------
variable "tags" {
  description = "Network tags to assign to the VM"
  type        = list(string)
  default     = []
}

# -----------------------------
# CloudSQL Connection Info
# -----------------------------
variable "cloudsql_private_ip" {
  description = "Private IP address of the CloudSQL instance to connect from the VM"
  type        = string
  default     = ""
}

variable "cloudsql_user" {
  description = "CloudSQL username for VM connection"
  type        = string
  default     = ""
}

variable "cloudsql_db_name" {
  description = "CloudSQL database name for VM connection"
  type        = string
  default     = ""
}

variable "cloudsql_password" {
  description = "CloudSQL user password for VM connection (sensitive)"
  type        = string
  default     = ""
  sensitive   = true
}

# -----------------------------
# Optional: VM Boot Config
# -----------------------------
variable "machine_type" {
  description = "GCP machine type for the VM"
  type        = string
  default     = "e2-micro"
}

variable "boot_image" {
  description = "Boot image for the VM"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "zone" {
  description = "GCP zone for the VM"
  type        = string
}
