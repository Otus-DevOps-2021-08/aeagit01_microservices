variable "count_of_inst" {
  default = 1
}
variable "inst_name" {
  description = "main instatces name text"
  default = "yc-host"
}
variable "subnet-addresses" {
  description = "subnet address pool"
  default = "192.168.55.0/24"
}
