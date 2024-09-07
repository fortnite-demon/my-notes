Разрешаем исходящие подключения и запрещаем входящие
```
ufw default deny incoming
ufw default allow outgoing
```
##
Разрешить службы
```
ufw allow http
ufw allow https
ufw allow ftp 
```
### Разрешаем ip адреса
```
ufw allow from 46.229.220.16
# Конкретный порт:
ufw allow from 46.229.220.16 to any port 22
# Диапазон ip адресов:
ufw allow from 111.111.11.1/24 to any port 22
