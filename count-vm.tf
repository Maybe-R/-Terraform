resource "yandex_compute_instance" "web" {
  count = 2
  name        = "netology-develop-${count.index + 1}"
  platform_id = var.vm_platform
  zone = var.default_zone
  
    resources {
    cores         = var.vm_resources.cores
    memory        = var.vm_resources.memory
    core_fraction = var.vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.boot.id 
      size     = 10
    }
  }

  network_interface {
    subnet_id = var.subnet_id 
    security_group_ids = var.security_group_ids
  }
}
