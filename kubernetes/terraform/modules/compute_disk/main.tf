terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.35"
    }
  }
}
#==============================================

resource "yandex_compute_disk" "nr_disk" {

  name = var.disk_name          #"non-replicated-disk"
  size = var.size               #93 // NB size must be divisible by 93
  type = var.type               #"network-ssd-nonreplicated"
  zone = var.zone               #"ru-central1-b"

#   disk_placement_policy {
#     disk_placement_group_id = yandex_compute_disk_placement_group.this.id
#   }
}

# resource "yandex_compute_disk_placement_group" "this" {
#   zone = "ru-central1-b"
# }
