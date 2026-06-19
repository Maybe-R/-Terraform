variable "vm_web_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "ubuntu version"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "platform ID"
}

variable "vm_db_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "ubuntu version"
}

variable "vms_resources" {
  description = "Resources for all vms"
  type        = map(map(number))
  default     = {
    vm_web_resources = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    vm_db_resources = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "common_metadata" {
  description = "metadata for all vms"
  type        = map(string)
  default     = {
    default     = "~/.ssh/id_ed25519.pub"
    description = "Путь до public SSH key"
  }
}


variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform ID"
}
