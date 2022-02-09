variable "kube_group_description" {
  description   = "yc cluster group description"
  default       = "New cluster group"
}
variable "kube_group_name" {
  description   = "yc cluster group"
}
variable "kube_group_cluster_id" {
  description   = "(Mandatory) set kubernetes cluster id"
}
variable "kube_version" {
  description   = "kubernetes version for node group"
  default       = "1.19"
}
variable "platform_id" {
  description   = "kubernetes version for node group"
  default       = "standard-v2"
}
variable "zone" {
  description   = "kubernetes version for node group"
  default       = "ru-central1-a"
}
variable "subnet_ids" {
  description   = "(Mandatory) list of subnet identificators "
}
variable "labels" {
  description   = "map of subnet resourses "
}
variable "resources_memory" {
  description   = "resourses memory size "
  default       = 8
}
variable "resources_cores" {
  description   = "resourses core count"
  default       = 4
}
variable "boot_disk_type" {
  description   = "boot disk type"
  default       = "network-ssd"
}
variable "boot_disk_size" {
  description   = "boot disk size"
  default       = 64
}
variable "placement_group_id" {
  description   = "replacment policy group id"
}
variable "scale_policy_size" {
  description   = "fixed scale policy size"
  default       = 1
}

variable "public_key_path" {
  description   = "Path to public user key"
}
