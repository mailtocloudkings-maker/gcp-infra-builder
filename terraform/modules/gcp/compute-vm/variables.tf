# Subnet to attach the VM to
variable "subnet_id" {
  description = "ID of the subnet where VM will be deployed"
  type        = string
}

# Prefix for VM name
variable "name_prefix" {
  description = "Prefix for the VM name"
  type        = string
}

# Unique suffix for VM name
variable "suffix" {
  description = "Unique suffix for the VM name"
  type        = string
}

# Tags to attach to the VM (for firewall)
variable "tags" {
  description = "Network tags for the VM"
  type        = list(string)
  default     = []
}

# CloudSQL private IP (to connect VM to DB)
variable "cloudsql_private_ip" {
  description = "Private IP address of the CloudSQL instance"
  type        = string
  default     = ""
}

# CloudSQL username
variable "cloudsql_user" {
  description = "CloudSQL username for VM connection"
  type        = string
  default     = ""
}

# CloudSQL database name
variable "cloudsql_db_name" {
  description = "CloudSQL database name for VM connection"
  type        = string
  default     = ""
}

# CloudSQL password (optional, can use Secret Manager)
variable "cloudsql_password" {
  description = "CloudSQL user password for VM connection"
  type        = string
  default     = ""
  sensitive   = true
}
