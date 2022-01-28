variable "service_external_port" {
    description = "Service external port"
    default = 8080
}
variable "replica_count" {
    description = "Count of replicas"
    default = 1
}
variable "cluster_readOnly_role" {
    description = "Read only role switch"
    default = "true"
}
variable "service_type" {
    description = "Type of service"
    default = "LoadBalancer"
}
variable "resourse_name" {
    description = "Name of created resourse"
    default = "aea01-kube-dashboard"
}
variable "config_path" {
    description = "Path to config file"
    default = "~/.kube/config"
}
