[Справочник ресурсов](https://terraform-provider.yandexcloud.net/)

```tf
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}
 
provider "yandex" {
  token     = "<OAuth-токен>"
  cloud_id  = "<идентификатор_облака>"
  folder_id = "<идентификатор_каталога>"
  zone      = "<зона_доступности_по_умолчанию>"
} 
```
