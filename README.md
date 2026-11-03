# Предисловие
### Я не использовал федеративный аккаунт, а сделал все на своем. Очень сложная схема подключения у вас
### Прошу не обращать внимание на размер и тип дисков, потому что лимит их строго ограничен и пришлось подбирать размер чтоб создалось
<br>

# Гит проекта
[Git](https://github.com/Legend1Demp8/terraform)
<br>
<br>

# Описание проекта
Данный проект создает два окружения dev и prod, каждое окружение использует свои параметры и их можно переопределить:
1) Переменные для dev задаются в файле [terraform.tfvars.dev](https://github.com/Legend1Demp8/terraform/blob/main/terraform.tfvars.dev)
2) Переменные для prod задаются в файле [terraform.tfvars.prod](https://github.com/Legend1Demp8/terraform/blob/main/terraform.tfvars.prod)

Запуск Terraform проекта выполняется следующими командами:
1) Для Dev окружения ``` terraform apply -var-file="terraform.tfvars.dev" -state="terraform.tfstate.dev" ```
2) Для Prod окружения ``` terraform apply -var-file="terraform.tfvars.prod" -state="terraform.tfstate.prod" ```

Проект использует модульный подход, внутри модулей есть проверки для некоторых переменных, прошу ознакомиться с проверками напрямую в файлах variables.tf модулей

Не забудьте в конце экспериментов освободить ресурсы командами:
1) Для Dev окружения ``` terraform destroy -var-file="terraform.tfvars.dev" -state="terraform.tfstate.dev" ```
2) Для Prod окружения ``` terraform destroy -var-file="terraform.tfvars.prod" -state="terraform.tfstate.prod" ```

# Пример инициализированого проекта
<img width="1558" height="375" alt="image" src="https://github.com/user-attachments/assets/9fddffbf-a1cb-47e0-a537-b229b20d02cb" />
Как мы видим метки дополнительно показывают на каком стенде развернуты виртуальные машины

# Обязательные условия выполнения
## Условие 1
### Несколько модулей. 
### Решение
<img width="419" height="190" alt="image" src="https://github.com/user-attachments/assets/4e76dbe9-ece9-4194-92a6-81536dfdd845" /> 

Модулей три: 
- network (Создание сети)
- disks (Создание дисков)
- vms (Создание ВМ)

## Условие 2
### Несколько окружений. Подготовьте два окружения
### Решение
По заданию я сделал два окружения dev и prod и описал как их использовать

## Условие 3 
### Версии Terraform и провайдера
### Решение
<img width="578" height="253" alt="image" src="https://github.com/user-attachments/assets/07713253-cf0b-41ee-8416-d39df65ce615" />

<br>
<br>
<br>
<br>

# Чеклист само проверки
## Условие 1
### В корне объявлен блок terraform с required_version и required_providers для yandex-cloud/yandex
### Решение
<img width="578" height="253" alt="image" src="https://github.com/user-attachments/assets/07713253-cf0b-41ee-8416-d39df65ce615" />

## Условие 2
### Написан рабочий модуль: terraform init, terraform plan, terraform apply завершаются без ошибок
### Решение
Работает без ошибок

## Условие 3
### Блоки ресурсов не содержат жёстко заданных значений (hardcodes): всё описано через variables и/или locals, если они есть
### Решение
Всё без хардкода через variables

## Условие 4
### Модуль разворачивает две VM: web и api, а также список дисков, подключённых к api c помощью блока dynamic обе подключены к подсети default-ru-central1-a через data.yandex_vpc_subnet.default_subnet без публичных IP (nat = false)
### Решение
Зона A капризничает на кол-во дисков, я ушел в D не вижу тут проблем \
Две VM (Публичный IP пропуск потому что nat = false)
<img width="1623" height="261" alt="image" src="https://github.com/user-attachments/assets/de7cf2cd-643a-44d0-9093-972c88fa29fe" />
Диски только к машине API
<img width="1628" height="396" alt="image" src="https://github.com/user-attachments/assets/530f3f31-4269-4067-bd56-979b01e21135" />

## Условие 5
### Используются все input-переменные из задания: vm_specification, ssh_public_key, extra_disk_names, extra_disk_type, extra_disk_size
### Решение
В соответствии с типами и значениями по умолчанию из задания.

## Условие 6
### У переменных с ограничениями по допустимым значениям есть блоки validation (как минимум для vm_specification, extra_disk_type, extra_disk_size)
### Решение
Внутри модулей проверки есть

## Условие 6
### Минимум два дочерних модуля с вызовом из корня (или из каталогов окружений), и окружения dev и prod с понятной инструкцией запуска в README
### Решение
<img width="419" height="190" alt="image" src="https://github.com/user-attachments/assets/4e76dbe9-ece9-4194-92a6-81536dfdd845" />

Модулей три: 
- network (Создание сети)
- disks (Создание дисков)
- vms (Создание ВМ)

## Условие 7
### Вывод модуля соответствует требованиям
### Решение
Внутри модулей output есть

