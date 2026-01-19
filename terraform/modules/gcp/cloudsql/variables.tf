# Prefix and unique suffix for naming resources
variable "name_prefix" {
  description = "Prefix for CloudSQL instance"
  type        = string
}

variable "suffix" {
  description = "Unique suffix for the instance"
  type        = string
}

# Region and machine type
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

# Backups and deletion protection
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

# Optional: create a default database
variable "create_default_db" {
  description = "Create a default database"
  type        = bool
  default     = true
}

variable "default_db_name" {
  description = "Name of the default database"
  type        = string
  default     = "appdb"
}

# Optional: create a default DB user
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
  description = "Default DB user password (use Secret Manager in production)"
  type        = string
  default     = "P@ssword123"
  sensitive   = true
}

# Optional: private network attachment
variable "network_id" {
  description = "VPC network ID for private IP"
  type        = string
  default     = ""
}
