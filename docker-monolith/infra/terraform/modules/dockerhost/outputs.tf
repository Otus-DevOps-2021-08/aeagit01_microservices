output "external_ip_address_app" {

  #value = yandex_compute_instance.dchost.network_interface.0.nat_ip_address
  value = yandex_compute_instance.dchost.0.network_interface.0.nat_ip_address

}
