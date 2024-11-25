Файл ```startup.sh``` это первоначальные настройки вм (обновление пакетов, установка веб-сервера...)

```Bash
yc compute instance create \
  --name demo-1 \
  --metadata-from-file user-data=startup.sh \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-2404-lts-oslogin \
  --zone ru-central1-a \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4
```
