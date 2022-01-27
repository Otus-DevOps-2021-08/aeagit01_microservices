terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.35"
    }
  }
}
#==============================================


data "local_file" "public_user_key" {
    filename = var.public_key_path
}

resource "yandex_kubernetes_node_group" "yc_node_group" {

    depends_on  = [data.local_file.public_user_key]

    cluster_id  = var.kube_group_cluster_id
    name        = var.kube_group_name
    description = var.kube_group_description
    version     = var.kube_version
    labels      = var.labels

/*
node_taints = [
                "key=value:effect"
               ]
*/

    instance_template {

        platform_id = var.platform_id   #"standard-v2"

        network_interface {
            nat        = true
            subnet_ids = var.subnet_ids
        }

        resources {
            memory = var.resources_memory
            cores  = var.resources_cores
        }

        boot_disk {
            type = var.boot_disk_type
            size = var.boot_disk_size
        }
        metadata = {
            ssh-keys = "ubuntu:${file(data.local_file.public_user_key.filename)}"
        }
        placement_policy {
            placement_group_id = var.placement_group_id
        }

        scheduling_policy {
            preemptible = false   #не прерываемая
        }
    }

    scale_policy {
        fixed_scale {
            size = var.scale_policy_size
        }
    }

    allocation_policy {
        location {
            zone = var.zone
        }
    }

    maintenance_policy {

        auto_upgrade = true
        auto_repair  = true

        maintenance_window {
            day        = "monday"
            start_time = "15:00"
            duration   = "3h"
        }
        maintenance_window {
            day        = "friday"
            start_time = "10:00"
            duration   = "4h30m"
        }
    }
}
