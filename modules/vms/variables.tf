variable "vm_specification" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    disk_type     = string
    disk_size     = number
    platform_id   = string
    preemptible   = bool
    image_id      = string
    nat           = bool
  }))
    validation {
      condition = alltrue([
        for k, v in var.vm_specification : 
        v.cores == 2 && 
        contains([2, 4], v.memory) && 
        v.disk_size > 1
      ])
      error_message = "Ошибка валидации ВМ: cores должно быть равно 2, memory только 2 или 4, disk_size должен быть строго больше 1."
    }
}

variable "env" {
  type        = string
  description = "Имя окружения (dev или prod)"
}

variable "extra_disks_ids" {
  type        = list(string)
  description = "Список ID дополнительных дисков, полученный от модуля disks"
}

variable "ssh_username" {
  type        = string
  description = "Имя пользователя для создания на VM (например: ubuntu, admin, centos)"
}

variable "ssh_public_key" {
  type        = string
  description = "Публичный SSH ключ для доступа к VM"
}

variable "subnet_id" {
  type        = string
  description = "ID подсети, переданный из модуля network"
}

variable "subnet_zone" {
  type        = string
  description = "Зона доступности, переданная из модуля network"
}
