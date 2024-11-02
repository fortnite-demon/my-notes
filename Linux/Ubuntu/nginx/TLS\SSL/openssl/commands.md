```openssl genrsa -out ca.key 4096``` - Генерация ключа  

```openssl req -new -x509 -days 720 -key ca.key -out ca.crt``` - Генерация сертификата
