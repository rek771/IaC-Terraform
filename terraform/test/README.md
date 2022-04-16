# IaC-Terraform-Tests
+ Создал тесты для проверки корректности созданной терраформом инфраструктуры
+ Написал тест наличия IP Load balancer-а в state-е терраформа
+ Написал тест возможность подключиться по ssh к одной из виртуальных машин
+ Написал тест возможность подключения к базе данных (это задание “со звездочкой”)

Перед запуском:
```bash
wget {{ссылка на пакет с go с сайта https://go.dev/doc/install}}
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
cd test
go mod vendor
```

Запуск
```bash
go test -v ./ -timeout 30m -folder '{{folder_id}}' -ssh-key-pass './key' -ssh-key-passphrase '{{passphrase}}'
```
