module "network" {
  source       = "./modules/network"

  vpc_name     = var.vpc_name
  default_zone = var.default_zone
  default_cidr = var.default_cidr

  providers = {
    yandex = yandex
  }
}

module "disks" {
  source = "./modules/disks"

  extra_disk_names = var.extra_disk_names
  extra_disk_type  = var.extra_disk_type
  extra_disk_size  = var.extra_disk_size
  default_zone = module.network.zone

  env = var.env

  providers = {
    yandex = yandex
  }
}

module "vms" {
  source = "./modules/vms"

  subnet_id   = module.network.subnet_id
  subnet_zone = module.network.zone

  env = var.env

  extra_disks_ids = module.disks.disks_ids
  vm_specification = var.vm_specification

  ssh_username   = var.vms_user
  ssh_public_key = var.vms_ssh_public_key

  providers = {
    yandex = yandex
  }
}
