variable "name_prefix" {
  type = string
}

variable "suffix" {
  type = string
}

variable "notification_channels" {
  type    = list(string)
  default = []
}
