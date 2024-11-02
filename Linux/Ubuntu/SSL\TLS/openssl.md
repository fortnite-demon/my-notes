## Генерация корневого ключа и сертификата

```openssl genrsa -out ca.key 4096``` - Генерация ключа  

```openssl req -new -x509 -days 720 -key ca.key -out ca.crt``` - Генерация сертификата  

\# Указываем сервер как CA так как центр сертификации


## Генерация серверного ключа и сертификата

```openssl genrsa -out server.key 4096``` - Генерация ключа  

```openssl req -new -key server.key -out server.csr``` - Генерация сертификата

\# Указываем домен и т.д.

```openssl x509 -req -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 1 -out server.crt``` - Подписываем сертификат
