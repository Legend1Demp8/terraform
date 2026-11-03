variable "vpc_name" {
  type        = string
  description = "Имя создаваемой виртуальной сети (VPC)"
}

variable "default_zone" {
  type        = string
  description = "Зона доступности для подсети (например, ru-central1-a)"
}

variable "default_cidr" {
  type        = list(string)
  description = "Подсеть"
}
