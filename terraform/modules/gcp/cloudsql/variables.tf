# -----------------------------
# Naming
# -----------------------------
variable "name_prefix" {
  description = "Prefix for CloudSQL instance"
  type        = string
}

variable "suffix" {
  description = "Unique suffix for the CloudSQL instance"
  type        = string
}

# -----------------------------
# Region and machine tier
# -----------------------------
variable "region" {
  description = "Region where CloudSQL instance will be deployed"
  type        = string
}

variable "tier" {
  description = "Machine type tier for CloudSQL instance"
  type        = string
  default     = "db-f1-micro"
}

# -----------------------------
# Networking (REQUIRED)
# -----------------------------
variable "network_id" {
  description = "VPC network ID used for CloudSQL private IP (REQUIRED)"
  type        = string
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
  description = "Prevent accidental deletion of CloudSQL instance"
  type        = bool
  default     = false
}

# -----------------------------
# Optional: Default database
# -----------------------------
variable "create_default_db" {
  description = "Create a default database inside CloudSQL"
  type        = bool
  default     = true
}

variable "default_db_name" {
  description = "Name of the default database"
  type        = string
  default     = "appdb"
}

# -----------------------------
# Optional: Default database user
# -----------------------------
variable "create_default_user" {
  description = "Create a default database user"
  type        = bool
  default     = true
}

variable "default_user_name" {
  description = "Default database username"
  type        = string
  default     = "appuser"
}

variable "default_user_password" {
  description = "Password for the default database user (use Secret Manager in production)"
  type        = string
  sensitive   = true
}
