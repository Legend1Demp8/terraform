# Обязательная переменная 
variable "extra_disk_names" {
  type        = list(string)
  description = "Список имен для дополнительных дисков (например, ['logs', 'backup'])"
}

# Обязательная переменная требуемая заданием принимает только два значения
variable "extra_disk_type" {
  type        = string
  description = "Тип дисков: network-hdd или network-ssd"

  validation {
    condition     = contains(["network-hdd", "network-ssd"], var.extra_disk_type)
    error_message = "Значение extra_disk_type должно быть только network-hdd или network-ssd."
  }
}

# Обязательная переменная требуемая заданием
variable "extra_disk_size" {
  type        = number
  description = "Размер дополнительных дисков в ГБ"
}

variable "default_zone" {
  type        = string
  description = "Зона доступности"
}

variable "env" {
  type        = string
  description = "Имя окружения (dev/prod)"
}
