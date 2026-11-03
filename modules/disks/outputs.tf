output "disks_ids" {
  value       = [for d in yandex_compute_disk.extra_disks : d.id]
  description = "Список ID всех сгенерированных дополнительных дисков"
}
