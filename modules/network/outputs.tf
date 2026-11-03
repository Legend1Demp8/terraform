output "subnet_id" {
  value       = yandex_vpc_subnet.develop.id
  description = "ID созданной подсети"
}

output "zone" {
  value       = yandex_vpc_subnet.develop.zone
  description = "Зона доступности, в которой создана подсеть"
}
