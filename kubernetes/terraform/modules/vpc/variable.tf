
variable "zone" {
  description = "one variable for resource block"
  default = "ru-central1-a"
}

variable "subnet-name" {
  description = "Subnet name"
  default = "app-subnet"
}

variable "network-name" {
  description = "Network name"
  default = "app-network"
}

variable "subnet-addresses" {
  description = "Network name"
  default = "10.100.0.0/16"
}

variable "count_of_inst" {
  default = 1
}
