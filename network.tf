resource "yandex_vpc_network" "wp-network" {
  name = "wp-network"
  description = "Сеть для тестирования Terraform"
}

resource "yandex_vpc_subnet" "wp-subnet" {
  for_each = var.hosts

  name = "wp-subnet-${each.value.zone}"
  description = "Подсеть для тестирования ${each.key}"
  v4_cidr_blocks = each.value.v4_cidr_blocks
  zone = each.value.zone
  network_id = yandex_vpc_network.wp-network.id
}