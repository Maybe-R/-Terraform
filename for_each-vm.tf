resource "yandex_compute_instance" "prod" {
  depends_on = [yandex_compute_instance.web]
    for_each = var.db_vms
  name        = "each-netology-${each.key}"
  platform_id = var.vm_platform

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.boot.id
      size     = each.value.disk_volume
    }
  }

  network_interface {
    subnet_id = var.subnet_id 
    security_group_ids = var.security_group_ids
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }
}
