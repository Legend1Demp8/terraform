###cloud vars
#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

variable "env" {
  type        = string
  description = "Окружение: dev или prod"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  description = "Subnet name"
}

variable "extra_disk_names" {
  type        = list(string)
  default     = ["logs", "backup"]
  description = "Список дисков, которые подключаются к ВМ api"
}

variable "extra_disk_type" {
  type        = string
  default     = "network-hdd"
  description = "Тип дисков: network-hdd или network-ssd"
}

variable "extra_disk_size" {
  type        = number
  default     = 20
  description = "Размер дополнительных дисков в ГБ"
}

variable "vms_user" {
  type        = string
  default     = "ubuntu"
  description = "Пользователь в VM"
}

variable "vms_ssh_public_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOnLkzb18Cts13q32BOb6niscQPlQqs9CJ9KfwjX4de9 root@ubuntu"
  description = "Публичный SSH ключ"
}

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
}
