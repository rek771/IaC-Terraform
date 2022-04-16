resource "yandex_compute_instance" "wp-app" {
  for_each = var.hosts

  name = each.key
  zone = each.value.zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80viupr3qjr5g6g9du"
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = yandex_vpc_subnet.wp-subnet[each.key].id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("./keys.pub")}"
  }
}