output "Server" {

    value = yandex_kubernetes_cluster.yc_kube_cluster.master[0].external_v4_endpoint

}

output "certificate-authority-data" {

    value = "${base64encode(yandex_kubernetes_cluster.yc_kube_cluster.master[0].cluster_ca_certificate)}"

}

output "Subnet-id" {

    value = module.cluster_network.subnet_id

}

output "Network-id" {

    value = module.cluster_network.network_id

}

output "placement-group-id" {

    value = yandex_compute_placement_group.placement_group[0].id

}
