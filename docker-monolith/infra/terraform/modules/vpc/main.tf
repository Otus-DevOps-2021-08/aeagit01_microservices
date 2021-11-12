terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.35"
    }
  }
}
resource "yandex_vpc_network" "app-network" {
  name = "${var.inst_name}-network"
}
resource "yandex_vpc_subnet" "app-subnet" {
  name           = "${var.inst_name}-subnet"
  network_id     = "${yandex_vpc_network.app-network.id}"
  v4_cidr_blocks = [var.subnet-addresses]
}
