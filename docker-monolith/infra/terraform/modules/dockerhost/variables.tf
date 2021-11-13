variable "count_of_inst" {
  default = 1
}
variable "inst_name" {
  description = "instance name"
  default = "yc-host"
}
variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "image_id" {
  description = "image ID string"
}
variable "subnet_id" {
  description = "Subnet ID"

}
variable "private_key" {
  description = "path to private key"
}

variable "public_key_path" {
  description = "Public key path declaration"

}
