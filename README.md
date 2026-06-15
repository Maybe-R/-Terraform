# Основы Terraform

## Домашнее задание к занятию «Основы Terraform. Yandex Cloud»
## Задание 1

1. Установка на машину компонентов Яндекс 

<img width="974" height="222" alt="image" src="https://github.com/user-attachments/assets/ac188662-ef34-4ebf-9c44-e7ec201da715" />
<img width="974" height="399" alt="image" src="https://github.com/user-attachments/assets/51ba0342-5286-4781-bb98-fa722736b4ab" />

2. Создайте сервисный аккаунт и ключ

<img width="974" height="386" alt="image" src="https://github.com/user-attachments/assets/f35620f5-73de-4afb-afd7-4a041287e4b9" />

3. Ошибки были по версии платформы «standart-v4» - согласно документации, версии идут до v3.

<img width="974" height="391" alt="image" src="https://github.com/user-attachments/assets/994cb3d2-25a4-46cc-899a-f59db475b43b" />
<img width="974" height="1002" alt="image" src="https://github.com/user-attachments/assets/50a43b92-1cb7-432f-b244-8fba36527d8b" />
<img width="974" height="788" alt="image" src="https://github.com/user-attachments/assets/fa8d3e5c-042b-4af8-ab9b-1214339e10ea" />
<img width="974" height="891" alt="image" src="https://github.com/user-attachments/assets/384eb3ba-f323-4471-b877-dd4db029751b" />

<img width="974" height="135" alt="image" src="https://github.com/user-attachments/assets/aa69ba98-7701-47a0-b0c7-66cd1fe641fa" />

4. Подключение к машине по ssh

<img width="971" height="945" alt="image" src="https://github.com/user-attachments/assets/12cd3281-8836-467f-bab6-f646acd8c4a0" />

## Задание 2

1. Заменила хард-корд значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные

<img width="1397" height="513" alt="image" src="https://github.com/user-attachments/assets/8f569c1c-1590-44e1-86f1-40d097cfb4f3" />

<img width="1200" height="160" alt="image" src="https://github.com/user-attachments/assets/5fd821b8-14cc-44ac-8dfe-b2a20ff4131d" />

```Bash
root@devopsserver:/home/flid/terraform/src# terraform plan
var.cloud_id
  b1gk34aj8huam4c6qc65

  Enter a value: 

var.folder_id
  b1groq7lioh1rbih3b87

  Enter a value: 


data.yandex_compute_image.ubuntu: Reading...
data.yandex_compute_image.ubuntu: Read complete after 1s [id=fd835npr436ep5g144gq]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.platform will be created
  + resource "yandex_compute_instance" "platform" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "serial-port-enable" = "1"
          + "ssh-keys"           = "ubuntu:<your_ssh_ed25519_key>"
        }
      + name                      = "netology-develop-platform-web"
      + network_acceleration_type = "standard"
      + platform_id               = "standart-v3"
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd835npr436ep5g144gq"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + metadata_options (known after apply)

      + network_interface {
          + index          = (known after apply)
          + ip_address     = (known after apply)
          + ipv4           = true
          + ipv6           = (known after apply)
          + ipv6_address   = (known after apply)
          + mac_address    = (known after apply)
          + nat            = true
          + nat_ip_address = (known after apply)
          + nat_ip_version = (known after apply)
          + subnet_id      = (known after apply)
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 2
          + cores         = 2
          + memory        = 4
        }

      + scheduling_policy {
          + preemptible = true
        }
    }

  # yandex_vpc_network.develop will be created
  + resource "yandex_vpc_network" "develop" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "develop"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.develop will be created
  + resource "yandex_vpc_subnet" "develop" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "develop"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.128.0.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "default-ru-central1-a"
    }

Plan: 0 to add, 0 to change, 0 to destroy.

```
## Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ(в файле main.tf): **"netology-develop-platform-db"** ,  cores  = 2, memory = 2, core_fraction = 20. Объявите ее переменные с префиксом **vm_db_** в том же файле('vms_platform.tf').
3. Примените изменения.

**Ответ:**
<img width="1350" height="653" alt="image" src="https://github.com/user-attachments/assets/5d9f660d-36fc-4e44-9953-7abd668dce98" />

```Bash
root@devopsserver:/home/flid/terraform/src# terraform apply
var.cloud_id
  b1gk34aj8huam4c6qc65

  Enter a value: 

var.folder_id
  b1groq7lioh1rbih3b87

  Enter a value: 

data.yandex_compute_image.ubuntu: Reading...
data.yandex_compute_image.ubuntu: Read complete after 0s [id=fd835npr436ep5g144gq]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.platform will be created
  + resource "yandex_compute_instance" "platform" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "serial-port-enable" = "1"
          + "ssh-keys"           = "ubuntu:<your_ssh_ed25519_key>"
        }
      + name                      = "netology-develop-platform-web"
      + network_acceleration_type = "standard"
      + platform_id               = "standart-v3"
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd835npr436ep5g144gq"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + metadata_options (known after apply)

      + network_interface {
          + index          = (known after apply)
          + ip_address     = (known after apply)
          + ipv4           = true
          + ipv6           = (known after apply)
          + ipv6_address   = (known after apply)
          + mac_address    = (known after apply)
          + nat            = true
          + nat_ip_address = (known after apply)
          + nat_ip_version = (known after apply)
          + subnet_id      = (known after apply)
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 2
          + cores         = 2
          + memory        = 4
        }

      + scheduling_policy {
          + preemptible = true
        }
    }

  # yandex_compute_instance.platformdb will be created
  + resource "yandex_compute_instance" "platformdb" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + metadata                  = {
          + "serial-port-enable" = "1"
          + "ssh-keys"           = "ubuntu:<your_ssh_ed25519_key>"
        }
      + name                      = "netology-develop-platform-db"
      + network_acceleration_type = "standard"
      + platform_id               = "standart-v3"
      + status                    = (known after apply)
      + zone                      = (known after apply)

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd835npr436ep5g144gq"
              + name        = (known after apply)
              + size        = (known after apply)
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + metadata_options (known after apply)

      + network_interface {
          + index          = (known after apply)
          + ip_address     = (known after apply)
          + ipv4           = true
          + ipv6           = (known after apply)
          + ipv6_address   = (known after apply)
          + mac_address    = (known after apply)
          + nat            = true
          + nat_ip_address = (known after apply)
          + nat_ip_version = (known after apply)
          + subnet_id      = (known after apply)
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 20
          + cores         = 2
          + memory        = 4
        }

      + scheduling_policy {
          + preemptible = true
        }
    }

  # yandex_vpc_network.develop will be created
  + resource "yandex_vpc_network" "develop" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "develop"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_network.developdb will be created
  + resource "yandex_vpc_network" "developdb" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "developdb"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.develop will be created
  + resource "yandex_vpc_subnet" "develop" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "develop"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.128.0.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "default-ru-central1-a"
    }

  # yandex_vpc_subnet.developdb will be created
  + resource "yandex_vpc_subnet" "developdb" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "developdb"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.128.0.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "default-ru-central1-b"
    }

Plan: 6 to add, 0 to change, 0 to destroy.
```
## Задание 4

Объявите в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.
Примените изменения.

```Bash
root@devopsserver:/home/flid/terraform/src# terraform apply
var.cloud_id
  b1gk34aj8huam4c6qc65

  Enter a value: 

var.folder_id
  b1groq7lioh1rbih3b87

  Enter a value: 
data.yandex_compute_image.ubuntu-vm-db: Reading...
data.yandex_compute_image.ubuntu: Reading...
data.yandex_compute_image.ubuntu-vm-db: Read complete after 0s [id=fd826honb8s0i1jtt6cg]
data.yandex_compute_image.ubuntu: Read complete after 0s [id=fd826honb8s0i1jtt6cg]
yandex_compute_instance.platform-db: Refreshing state... [id=fhme41k6m9bel5p5pags]
yandex_compute_instance.platform: Refreshing state... [id=fhm2n8pvvof7sb860dcf]

Changes to Outputs:
  + vm_ips = {
      + netology-develop-platform-db  = "10.128.48.115"
      + netology-develop-platform-web = "10.128.48.29"
    }

You can apply this plan to save these new output values to the Terraform state, without changing any real infrastructure.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes


Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

vm_ips = {
  "netology-develop-platform-db" = "10.128.48.115"
  "netology-develop-platform-web" = "10.128.48.29"
}


```

## Задание 5

В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
Замените переменные с именами ВМ из файла variables.tf на созданные вами local-переменные.
Примените изменения.

Описываем все в одном блоке
<img width="1234" height="251" alt="image" src="https://github.com/user-attachments/assets/91c4f249-02cd-46d9-85cb-2a5421f9360f" />

Заменяем переменные
<img width="1253" height="602" alt="image" src="https://github.com/user-attachments/assets/e6674e1c-5a7f-4899-b729-35d91f236f03" />

Изменяем main.tf
<img width="777" height="219" alt="image" src="https://github.com/user-attachments/assets/43b2bade-a670-4b93-8947-18cc238f7872" />
<img width="720" height="168" alt="image" src="https://github.com/user-attachments/assets/8478a619-5e46-4991-86d7-95ab03912efc" />

## Заданние 6

Вместо использования трёх переменных ".._cores",".._memory",".._core_fraction" в блоке resources {...}, объедините их в единую map-переменную vms_resources и внутри неё конфиги обеих ВМ в виде вложенного map(object).
Создайте и используйте отдельную map(object) переменную для блока metadata, она должна быть общая для всех ваших ВМ.
Найдите и закоментируйте все, более не используемые переменные проекта.
Проверьте terraform plan. Изменений быть не должно.

<img width="1246" height="962" alt="image" src="https://github.com/user-attachments/assets/51861fd0-2c68-4fcb-b07c-dfcae8787e4a" />

В файле main.tf вносим изменения:

<img width="1110" height="479" alt="image" src="https://github.com/user-attachments/assets/e8c72dbd-3d13-4c85-af46-c1b2c86785e8" />

Получаем вывод:

```Bash
root@devopsserver:/home/flid/terraform/src# terraform plan

var.cloud_id
  b1gk34aj8huam4c6qc65

  Enter a value: b1gk34aj8huam4c6qc65

var.folder_id
  b1groq7lioh1rbih3b87

  Enter a value: b1groq7lioh1rbih3b87

data.yandex_compute_image.ubuntu: Reading...
data.yandex_compute_image.ubuntu-vm-db: Reading...
data.yandex_compute_image.ubuntu: Read complete after 0s [id=fd826honb8s0i1jtt6cg]
data.yandex_compute_image.ubuntu-vm-db: Read complete after 0s [id=fd826honb8s0i1jtt6cg]
yandex_vpc_network.develop: Refreshing state... [id=enp7e8q3s9m8abcde]
yandex_vpc_subnet.develop: Refreshing state... [id=e2l5k9q2m8abcde]
yandex_compute_instance.platform: Refreshing state... [id=fhm2n8pvvof7sb860dcf]
yandex_compute_instance.platform-db: Refreshing state... [id=fhme41k6m9bel5p5pags]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found
no differences, so no changes are needed.

Changes to Outputs:
  (none)

─────────────────────────────────────────────────────────────────────────────────

Plan: 0 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last
"terraform apply" which may have affected this plan:

  ~ yandex_compute_instance.platform: metadata["user-data"] has been changed

─────────────────────────────────────────────────────────────────────────────────

This plan does nothing. Terraform has determined that no changes are needed.
```


