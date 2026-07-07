
 resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/ansible_inventory.tftpl", {
    webservers = yandex_compute_instance.web
    prodservers = yandex_compute_instance.prod
    storage    = [yandex_compute_instance.storage]
  })
  filename = "${path.module}/ansible_inventory.cfg"
 }

