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
