# Домашнее задание к занятию «Управляющие конструкции в коде Terraform»
Код проекта - https://github.com/Maybe-R/-Terraform/tree/master

## Задание 1

Изучите проект.
Инициализируйте проект, выполните код.
Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud .

<img width="1102" height="757" alt="image" src="https://github.com/user-attachments/assets/ea4ce924-f5b9-401f-a7ed-960eb994494a" />

<img width="1570" height="711" alt="image" src="https://github.com/user-attachments/assets/1856e9ae-1106-44c6-a356-1921aca1f0d2" />

<img width="1674" height="1227" alt="image" src="https://github.com/user-attachments/assets/f14d1934-a388-47a8-9358-3f4fa52908ce" />

## Задание 2

Создайте файл count-vm.tf. Опишите в нём создание двух одинаковых ВМ web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент count loop. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )

Создаем файл count-vm

<img width="610" height="625" alt="image" src="https://github.com/user-attachments/assets/d63ef9b6-98e5-4af4-a367-56b2a747ced6" />

Добавляем новые переменные в variables.tf и personal.auto.tfvars

<img width="1162" height="457" alt="image" src="https://github.com/user-attachments/assets/a9681cf0-0acf-408e-8446-0d0d8f6edaf7" />

Запускаем создание двух одинаковых машин

<img width="736" height="412" alt="image" src="https://github.com/user-attachments/assets/e23461e7-4944-4ac7-9311-6c2165c8eeed" />

<img width="2342" height="658" alt="image" src="https://github.com/user-attachments/assets/88accb66-636c-46f2-82f1-8d44701468ea" />

Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ для баз данных с именами "main" и "replica" разных по cpu/ram/disk_volume , используя мета-аргумент for_each loop. Используйте для обеих ВМ одну общую переменную

<img width="1096" height="990" alt="image" src="https://github.com/user-attachments/assets/f3867223-3e45-4b3b-b70f-84b22741c507" />

<img width="2242" height="284" alt="image" src="https://github.com/user-attachments/assets/e61972b5-c9a8-403e-8221-c4ef713ea552" />

Параметр " depends_on = [yandex_compute_instance.web] " в for_each-vm.tf позволяет придержать создание машин из count-vm.tf, пока не создадуться его машины.

Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata,
<img width="1311" height="504" alt="image" src="https://github.com/user-attachments/assets/719f8d26-cb76-4ab9-811b-141d7d0e40ae" />


## Задание 3

Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле disk_vm.tf .
Создайте в том же файле одиночную(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage" . Используйте блок dynamic secondary_disk{..} и мета-аргумент for_each для подключения созданных вами дополнительных дисков.

<img width="1330" height="961" alt="image" src="https://github.com/user-attachments/assets/765147f7-93f6-4a97-ab1d-e1c07b203d41" />

<img width="1706" height="1196" alt="image" src="https://github.com/user-attachments/assets/c0e80fff-d773-4a4c-ae8d-a00d2137bc37" />

<img width="765" height="814" alt="image" src="https://github.com/user-attachments/assets/7115d49b-8eab-4b0b-93a0-16ce1a52097e" />

## Задание 4

Возникли проблемы по подключению провайдеров, как только пришлось добавить локально второго провайдера local.
<img width="1136" height="196" alt="image" src="https://github.com/user-attachments/assets/d5ce13f5-6c6e-4faf-9427-c3f3d4a6da36" />

Не понимаю, что не так.
Провайдер local лежит по пути - /home/flid/ter-homeworks/02/src/.terraform.d/plugins/registry.terraform.io/hashicorp/local/2.6.0/linux_amd64/terraform-provider-local
Прописала явный путь








