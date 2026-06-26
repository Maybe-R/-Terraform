###cloud vars


 variable "cloud_id" {
  type        = string
  description = "b1gk34aj8huam4c6qc65"
 }

 variable "folder_id" {
  type        = string
  description = "b1groq7lioh1rbih3b87"
 }

variable "default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.129.0.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_platform" {
  type        = string
  default     = "standard-v3"
  description = "Назначение платформы"
}

variable "vm_resources" {
  description = "Ресурсы ВМ"
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 50
  }
}

variable "storage_cpu" {
  type    = number
  default = 2
}

variable "storage_ram" {
  type    = number
  default = 2
}

variable "db_vms" {
  type = map(object({
    cpu         = number
    ram         = number
    disk_volume = number
  }))
}

variable "security_group_ids" {
  description = "enpo86oipua6acenr4kt"
  type        = list(string)
}

variable "subnet_id" {
  description = "e2lpcru79blhq6cajnd3"
  type        = string
}

variable "storage_disk_size" {
    type        = number
    default     = 10
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "./.ssh/id_rsa.pub"
  description = "ssh-keygen -t ed25519"
}
