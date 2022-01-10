terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.35"
    }
  }
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

/*resource "yandex_compute_disk" "inst_disk" {
  count = var.count_of_inst
  name = "inst-disk${count.index}"
  type = "network-ssd"
  zone = var.zone
  size = 40
}*/

resource "yandex_compute_instance" "kube" {
  count = var.count_of_inst
  name = "kube-inst${count.index}"
  #depends_on = [ yandex_compute_disk.inst_disk ]

  labels = {
    tags = "kube-inst"
  }

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
   # disk_id =  yandex_compute_disk.inst_disk["${count.index}"].id       #"inst-disk${count.index}").id
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.os_image_name
      type = "network-ssd"
      size = 40
    }
  }
  network_interface {
    subnet_id = var.subnet_id #yandex_vpc_subnet.app-subnet.id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}

# resource "null_resource" "app" {
#   count = var.puma_deploy ? 1 : 0
#   connection {
#     type  = "ssh"
#     host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
#     user  = "ubuntu"
#     agent = false
#     # путь до приватного ключа
#     private_key = file(var.private_key)
#   }

#   provisioner "file" {
#     source      = "${path.module}/files/puma.service"
#     destination = "/tmp/puma.service"

#   }
#   provisioner "remote-exec" {
#     inline = [
#       "echo 'DATABASE_URL=${var.db_internal_ip}:${var.database_port}'>>/tmp/app.env && sleep 30"
#     ]
#   }
#   provisioner "remote-exec" {
#     script = "${path.module}/files/deploy.sh"
#   }
# }
