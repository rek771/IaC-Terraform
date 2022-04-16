# IaC-Terraform
+ Создал директорию otus-terraform и сервисный аккаунт terraform в yandex cloud
+ Создал ключ сервисного аккаунта `yc iam key create --service-account-id XXXXXXXXXXXXXXX --output key.json`
+ Подключил провайдер yandex-cloud/yandex и random_password(для генерирования паролей), проинициализирол директорию с проектом `terraform init`
+ Для того, чтобы избежать дублирования кода, создал переменную hosts, в которую заносится информация о создаваемых хостах.
```bash
hosts = {
  "wp-app-1" = {
    zone = "ru-central1-a"
    v4_cidr_blocks = [
      "10.2.0.0/16"
    ]
  },
  "wp-app-2" = {
    zone = "ru-central1-b"
    v4_cidr_blocks = [
      "10.3.0.0/16"
    ]
  },
  "wp-app-3" = {
    zone = "ru-central1-c"
    v4_cidr_blocks = [
      "10.4.0.0/16"
    ]
  },
}
```
+ Создал манифест ресурсов сетей и подсетей
+ Создал манифест ресурсов yandex compute
+ Создал манифест ресурсов балансировщика
+ Создал манифест ресурсов базы данных
+ Вывел информацию о БД и хосте балансировщика в Outputs для дальнейшей работы с ними.

Результат применения манифеста:
```bash
$ terraform apply
...
Outputs:

database_host_fqdn = tolist([
  "rc1a-iuwbb6f02xyz0m8m.mdb.yandexcloud.net",
  "rc1b-fbrhbkozh2ss5i20.mdb.yandexcloud.net",
  "rc1c-9ueatbsog50bj5qw.mdb.yandexcloud.net",
])
database_name_fqdn = "db"
database_password_fqdn = <sensitive>
database_user_fqdn = "user"
load_balancer_public_ip = tolist([
  "51.250.84.88",
])

```