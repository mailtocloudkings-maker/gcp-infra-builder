variable "name_prefix" {
  description = "Prefix for CloudSQL instance"
  type        = string
}

variable "suffix" {
  description = "Unique suffix for the instance"
  type        = string
}

variable "region" {
  description = "Region for CloudSQL"
  type        = string
  default     = "us-central1"
}

variable "tier" {
  description = "Machine type tier for CloudSQL"
  type        = string
  default     = "db-f1-micro"
}

variable "enable_backups" {
  description = "Enable automated backups"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Prevent accidental deletion"
  type        = bool
  default     = false
}

# Optional database creation
variable "create_default_db" {
  description = "Create default database"
  type        = bool
  default     = true
}

variable "default_db_name" {
  description = "Name of the default database"
  type        = string
  default     = "appdb"
}

# Optional user creation
variable "create_default_user" {
  description = "Create default DB user"
  type        = bool
  default     = true
}

variable "default_user_name" {
  description = "Default DB username"
  type        = string
  default     = "appuser"
}

variable "default_user_password" {
  description = "Default DB user password (use Secret Manager in prod)"
  type        = string
  default     = "P@ssword123"
  sensitive   = true
}
