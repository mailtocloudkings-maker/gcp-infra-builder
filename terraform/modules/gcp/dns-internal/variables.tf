# The name prefix for DNS zone names
variable "name_prefix" {
  description = "Prefix for DNS zone names"
  type        = string
}

# Unique suffix for resource names
variable "suffix" {
  description = "Unique suffix for DNS zone names"
  type        = string
}

# The VPC network ID where the DNS zone will be attached
variable "network_id" {
  description = "VPC network ID for internal DNS"
  type        = string
}

# Domain name for internal DNS zone (e.g., internal.example.com)
variable "domain_name" {
  description = "Domain name for the internal DNS zone"
  type        = string
  default     = "internal.local"
}
variable "records" {
  description = "DNS records to create"
  type = list(object({
    name     = string
    type     = string
    ttl      = number
    rrdatas  = list(string)
  }))
}

