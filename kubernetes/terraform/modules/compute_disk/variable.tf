variable "zone" {
  description = "one variable for resource block"
  default = "ru-central1-a"
}

variable "size" {
  description = "disk size"
  default = 4
}

variable "type" {
  description = "Non replica disk type"
  default = "network-ssd-nonreplicated"
}

variable "disk_name" {
  description = "Non replica disk name"
  default = "k8s"
}

variable "disk_enable" {
  description = "Enable/disable create disk"
  default = "false"
}
