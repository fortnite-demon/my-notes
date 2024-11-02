Нужно также изменить права сертификтов на пользователя, из под которого запускается прометеус

```yml
tls_server_config:
  cert_file: /opt/ssl/server.crt
  key_file: /opt/ssl/server.key

http_server_config:
  http2: true

basic_auth_users:
  name: $2a$10$j6bz1OjUBADJ.dx5CxZGA.KVMAsNvAEEmJdrk0W1LHlxQDyqXGte.
```

```
htpasswd -bnBC 10 "" password | tr -d ':\n' | sed 's/$2y/$2a/'
```
