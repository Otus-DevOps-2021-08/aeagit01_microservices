terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.35"
    }
  }
}
#==============================================

resource "yandex_vpc_network" "yc_network" {
  name = var.network-name
}

resource "yandex_vpc_subnet" "yc_subnet" {
  name           = var.subnet-name
  zone           = var.zone
  network_id     = yandex_vpc_network.yc_network.id
  v4_cidr_blocks = [var.subnet-addresses]
}
