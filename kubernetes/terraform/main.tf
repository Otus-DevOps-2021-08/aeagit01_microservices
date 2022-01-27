terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.35"
    }
  }
}
#==============================================

provider "yandex" {
    service_account_key_file = var.service_account_key_file
    cloud_id                 = var.cloud_id
    folder_id                = var.folder_id
    zone                     = var.zone
    #token                    = "key.json"
}

resource "yandex_compute_placement_group" "placement_group" {
  #description = "my description"

  count       = var.placement_group_id=="" ? 1:0
  name        = "placement-group${count.index}"
  folder_id   = var.folder_id

}

module "cluster_network" {
    #depends_on = [ module.db ]

    source            = "./modules/vpc"
    zone              = "ru-central1-a"
    subnet-addresses  = "10.100.0.0/16"
    subnet-name       = "cluster_subnet"
    network-name      = "cluster_network"
}

module "cluster_resourse_group" {
    depends_on = [
      "module.cluster_network",
      "yandex_kubernetes_cluster.yc_kube_cluster",
      "yandex_compute_placement_group.placement_group"
    ]

    source            = "./modules/kube_group"
    kube_group_cluster_id   = "${yandex_kubernetes_cluster.yc_kube_cluster.id}"
    kube_group_name         = "yc-kube-group"
    kube_group_description  = "yc cluster group"
    kube_version            = var.kube_version
    platform_id             = "standard-v2"
    zone                    = var.zone
    subnet_ids              = ["${module.cluster_network.subnet_id}"]
    labels                  = {"labels1" = "first",
                              "labels2" = "second" }
    public_key_path         = var.public_key_path
    resources_memory        = 8
    resources_cores         = 4
    boot_disk_type          = "network-ssd"
    boot_disk_size          = 64
    placement_group_id      = "${yandex_compute_placement_group.placement_group[0].id}"
    scale_policy_size       = 2
}

resource "yandex_kubernetes_cluster" "yc_kube_cluster" {
    #depends_on = ["yandex_resourcemanager_folder_iam_member.this"]

    name        = var.cluster_name
    description = var.cluster_description
    network_id  = "${module.cluster_network.network_id}"

    master {
      version = var.kube_version     #"1.19"
      zonal {
          zone      = var.zone
          subnet_id = "${module.cluster_network.subnet_id}"
      }

      public_ip = true
    }

    service_account_id      = var.service_account_id
    node_service_account_id = var.node_service_account_id
    release_channel = var.release_channel   #"RAPID"

    /*kms_provider {
      key_id = var.key_id       #"<идентификатор ключа шифрования>"
    }*/
}

#==============================================
/*
resource "yandex_iam_service_account" "this" {
    name = var.service_account_name
}
resource "yandex_resourcemanager_folder_iam_member" "this" {

    #folder_id = var.folder_id
    #member = "serviceAccount:${var.service_account_id}"
    #role   = "editor"
    sleep_after = 30
}
*/
