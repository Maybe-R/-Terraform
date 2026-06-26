resource "yandex_compute_disk" "storage" {
  count = 3

  name = "storage-disk-${count.index + 1}"
  size = 1
  type = "network-hdd"
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = var.vm_platform

  resources {
    cores  = var.storage_cpu
    memory = var.storage_ram
  }

  boot_disk {
    initialize_params {
      image_id = "fd827b91d99psvq5fjit"
      size     = var.storage_disk_size
      
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    security_group_ids = var.security_group_ids
    nat                = true
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage
    content {
      disk_id = secondary_disk.value.id
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }
}