# Предисловие
## Я не использовал федеративный аккаунт, а сделал все на своем. Очень сложная схема подключения у вас

# Чеклист само проверки
## Условие 1
### В корне объявлен блок terraform с required_version и required_providers для yandex-cloud/yandex
### Решение
Файл [providers.tf]()

<img width="578" height="253" alt="image" src="https://github.com/user-attachments/assets/07713253-cf0b-41ee-8416-d39df65ce615" />

## Условие 2
### Написан рабочий модуль: terraform init, terraform plan, terraform apply завершаются без ошибок
### Решение
Результат terraform init

Результат terraform plan

Результат terraform apply

## Условие 3
### Блоки ресурсов не содержат жёстко заданных значений (hardcodes): всё описано через variables и/или locals, если они есть
### Решение

## Условие 4
### Модуль разворачивает две VM: web и api, а также список дисков, подключённых к api c помощью блока dynamic обе подключены к подсети default-ru-central1-a через data.yandex_vpc_subnet.default_subnet без публичных IP (nat = false)
### Решение

## Условие 5
### Используются все input-переменные из задания: vm_specification, ssh_public_key, extra_disk_names, extra_disk_type, extra_disk_size
### Решение
В соответствии с типами и значениями по умолчанию из задания.

## Условие 6
### У переменных с ограничениями по допустимым значениям есть блоки validation (как минимум для vm_specification, extra_disk_type, extra_disk_size)
### Решение

## Условие 6
### Минимум два дочерних модуля с вызовом из корня (или из каталогов окружений), и окружения dev и prod с понятной инструкцией запуска в README
### 

## Условие 7
### Вывод модуля соответствует требованиям
### Решение
<details>
  <summary>Пример от Яндекс Практикума</summary>

<img width="584" height="279" alt="image" src="https://github.com/user-attachments/assets/9e9bf1ae-c392-4449-8d95-964dcd2db661" />

</details>
Мой вывод

