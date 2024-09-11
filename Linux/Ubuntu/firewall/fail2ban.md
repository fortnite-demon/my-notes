/etc/jail.d/my.conf

```Bash
[ssh]

enabled = true
findtime = 10 # Время в течении которого учитывается maxretry
maxretry = 4
bantime = 440 # Время бана в минутах
action = # Что выполнится по истечению retry
port = ssh
filter = sshd
ignoreip = 127.123.12.0/24 # Игнорировать с ...
```
