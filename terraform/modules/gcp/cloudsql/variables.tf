# -----------------------------
# Naming
# -----------------------------
variable "name_prefix" {
  description = "Prefix for CloudSQL instance"
  type        = string
}

variable "suffix" {
  description = "Unique suffix for the instance"
  type        = string
}

# -----------------------------
# Region and machine type
# -----------------------------
variable "region" {
  description = "Region where CloudSQL instance will be deployed"
  type        = string
  default     = "us-central1"
}

variable "tier" {
  description = "Machine type tier for CloudSQL instance"
  type        = string
  default     = "db-f1-micro"
}

# -----------------------------
# Backups and deletion protection
# -----------------------------
variable "enable_backups" {
  description = "Enable automated backups for CloudSQL"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Enable deletion protection to prevent accidental deletion"
  type        = bool
  default     = false
}

# -----------------------------
# Optional default database
# -----------------------------
variable "create_default_db" {
  description = "Create a default database inside the CloudSQL instance"
  type        = bool
  default     = true
}

variable "default_db_name" {
  description = "Name of the default database"
  type        = string
  default     = "appdb"
}

# -----------------------------
# Optional default database user
# -----------------------------
variable "create_default_user" {
  description = "Create a default database user"
  type        = bool
  default     = true
}

variable "default_user_name" {
  description = "Default DB username"
  type        = string
  default     = "appuser"
}

variable "default_user_password" {
  description = "Password for the default DB user (use Secret Manager in production)"
  type        = string
  default     = "P@ssword123"
  sensitive   = true
}

# -----------------------------
# Optional private network
# -----------------------------
variable "network_id" {
  description = "VPC network ID for private IP attachment (leave empty for default network)"
  type        = string
  default     = ""
}
