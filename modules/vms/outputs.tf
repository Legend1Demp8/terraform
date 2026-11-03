output "vm_internal_ips" {
  value       = { for k, v in yandex_compute_instance.vm : k => v.network_interface[0].ip_address }
  description = "Карта вида {'web': '10.x.x.x', 'api': '10.x.x.x'} с внутренними IP-адресами машин"
}

output "vm_ids" {
  value       = { for k, v in yandex_compute_instance.vm : k => v.id }
  description = "ID созданных виртуальных машин для возможной привязки к target-группам"
}
