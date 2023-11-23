terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.96.1"
    }
  }
}

provider "yandex" {
  token     = var.id_user.token
  cloud_id  = var.id_user.cloud_id
  folder_id = var.id_user.folder_id
  zone      = "ru-central1-a"
}
