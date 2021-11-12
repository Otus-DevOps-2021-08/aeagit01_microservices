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
    cloud_id           = var.cloud_id
    folder_id          = var.folder_id
    zone               = var.zone
}

module "vpc"{
    source            = "./modules/vpc"
    inst_name         = "yc-dc-host"
    subnet-addresses  = "192.168.55.0/24"
}
module "ycimg" {
    source          = "./modules/ycimg"
    source_image_family   = var.source_image_family
}

module "dockerhost" {
    source                = "./modules/dockerhost"
    count                 = var.count_of_inst
    inst_name             = "dchost${count.index}"
    public_key_path       = var.public_key_path
    subnet_id             = "${module.vpc.yc_subnet_id}"
    image_id              = module.ycimg.id
    private_key           = var.private_key


#   cloud_id              = var.cloud_id
#   folder_id             = var.folder_id

#   service_account_key_file = var.service_account_key_file
#   db_internal_ip  = module.db.internal_ip_address_db
    #db_internal_ip  = module.db.internal_ip_address_db
}
