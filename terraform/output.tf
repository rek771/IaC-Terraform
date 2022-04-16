output "load_balancer_public_ip" {
  description = "Public IP address of load balancer"
  value = tolist(tolist(yandex_lb_network_load_balancer.wp_lb.listener).0.external_address_spec).0.address
}

output "vm_linux_public_ip_address" {
  description = "Virtual machine IP"
  value = yandex_compute_instance.wp-app[keys(yandex_compute_instance.wp-app)[0]].network_interface[0].nat_ip_address
}


output "vm_linux_2_public_ip_address" {
  description = "Virtual machine IP"
  value = yandex_compute_instance.wp-app[keys(yandex_compute_instance.wp-app)[1]].network_interface[0].nat_ip_address
}

output "database_host_fqdn" {
  description = "DB hostname"
  value = local.dbhost
}

output "database_name_fqdn" {
  description = "DB name"
  value = local.dbname
}
output "database_user_fqdn" {
  description = "DB user"
  value = local.dbuser
}

output "database_password_fqdn" {
  description = "DB password"
  value = local.dbpassword
  sensitive = true
}