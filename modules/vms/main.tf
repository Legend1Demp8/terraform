resource "yandex_compute_instance" "vm" {
  for_each = var.vm_specification

  name        = "${each.key}-${var.env}"
  platform_id = each.value.platform_id
  zone        = var.subnet_zone

  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  labels = {
    env  = var.env
  }

  boot_disk {
    initialize_params {
      image_id = each.value.image_id
      type     = each.value.disk_type
      size     = each.value.disk_size
    }
  }

  dynamic "secondary_disk" {
    for_each = each.key == "api" ? var.extra_disks_ids : []
    content {
      disk_id     = secondary_disk.value
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = each.value.nat
  }

  scheduling_policy {
    preemptible = each.value.preemptible
  }

  metadata = {
    ssh-keys = "${var.ssh_username}:${var.ssh_public_key}"
  }
}
