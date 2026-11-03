resource "yandex_compute_disk" "extra_disks" {
  for_each = toset(var.extra_disk_names)

  name = "disk-${each.key}-${var.env}"
  type = var.extra_disk_type
  size = var.extra_disk_size
  zone = var.default_zone

  labels = {
    env = var.env
  }
}
