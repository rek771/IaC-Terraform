variable "yc_cloud_id" {
  type = string
  description = "Yandex Cloud ID"
}

variable "yc_folder_id" {
  type = string
  description = "Yandex Cloud folder"
}

variable "yc_service_account_key_file" {
  type = string
  description = "Yandex Cloud Service account key file"
}

variable "hosts" {
  type = map(object({
    zone = string
    v4_cidr_blocks = list(string)
  }))
  description = "Список хостов и сетей для создания"
}