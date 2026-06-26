output "vm_ips" {
  value = {
    db = {
      private = yandex_compute_instance.db.network_interface.0.ip_address
      public  = yandex_compute_instance.db.network_interface.0.nat_ip_address
    }
    web = {
      private = yandex_compute_instance.web.network_interface.0.ip_address
      public  = yandex_compute_instance.web.network_interface.0.nat_ip_address
    }
  }
}
