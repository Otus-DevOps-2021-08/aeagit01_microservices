terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.35"
    }
  }
}

resource "yandex_compute_instance" "dchost" {

  count = var.count_of_inst
  name = var.inst_name
  zone = var.zone
  labels = {
    tags = "dchost"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании

      image_id = var.image_id
      size = 5
    }
  }

  network_interface {
    subnet_id = var.subnet_id                 #yandex_vpc_subnet.app-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = var.private_key
  }
}
