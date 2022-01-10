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
variable "service_account_key_file" {
  description = "key .json"
}
variable "private_key" {
  description = "path to private key"
}
variable "sa_user_id" {
  description = "service user ID"
}
variable "count_of_inst" {
    description = "Count of instanses"
    default = 1
}
variable "os_image_name" {
    description = "os image for use of instanses"
    default = "ubuntu-18-04-lts-v20211013"

}
variable "subnet_id" {
    description = "subnet ID"
}
