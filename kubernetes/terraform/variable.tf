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

variable "count_of_inst" {
    description = "Count of instanses"
    default = 1
}

variable "subnet_id" {
    description = "subnet ID"
}



variable "service_account_name" {
    description = "subnet ID"
}
variable "key_id" {
    description = "subnet ID"
}
variable "service_account_id" {
    description = "service account id"
}
variable "node_service_account_id" {
    description = "Node service account id"
}
variable "release_channel" {
    description = "Release chanel"
}
variable "kube_version" {
    description = "Kubernetes version"
}
variable "cluster_description" {
    description = "Cluster description"
}
variable "cluster_name" {
    description = "Cluster name"

}
variable "placement_group_id" {
    description = "Placement group id"
    default     = ""
}
variable "nr_disk_enable" {
  description = "Enable/disable create non replication disk"
  default = false
}

/*
    = "pkuser"
    = ""
    = "ajeafkr1ldjpnth4o6p0"
    = "ajeafkr1ldjpnth4o6p0"
    = "RAPID"
    = "1.19"
    = "New cluster"
    = "aea01-kube-cluster"
*/
#===============================
/*
variable "os_image_name" {
    description = "os image for use of instanses"
    default = "ubuntu-18-04-lts-v20211013"

}
variable "sa_user_id" {
  description = "service user ID"
}




*/
