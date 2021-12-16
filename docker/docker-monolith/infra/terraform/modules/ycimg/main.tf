terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.35"
    }
  }
}

resource "yandex_compute_image" "src-image" {
  #name       = "my-custom-image"
  #source_url = "https://storage.yandexcloud.net/lucky-images/kube-it.img"
  source_family = var.source_image_family
}
