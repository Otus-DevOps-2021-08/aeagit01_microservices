variable "count_of_inst" {
  default = 1
}
variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable "source_image_family" {
  description = "Source image family name"
  default = "ubuntu-1604-lst"
}
variable "service_account_key_file" {
  description = "key .json"
}
variable "private_key" {
  description = "path to private key"
}

variable "db_internal_ip" {
  default     = "127.0.0.1"
  description = "internal IP of Database server"

}

variable "inst_name" {
  description = "main instatces name text"
  default = "dc-host"
}
