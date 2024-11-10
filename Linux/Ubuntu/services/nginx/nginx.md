# Увеличение очереди на прослушивание
Когда соединение установлено, оно добавляется в очередь,  
при загрузке сервера, может быть большая очередь на прослушивание сокета  
  
sudo sysctl -w net.core.somaxconn=4096

/etc/sysctl.conf
```
net.core.somaxconn = 4096
```

если somaxconn > 512, то нужно указать listen 80 backlog=4096;
#

```nginx
http {

    server {
        types_hash_max_size 2024; # Размер для хэш таблицы с mime типами

        limit_conn_zone $binary_remote_addr zone=addr:1m; # Ограничение соединений с одного IP
        limit_conn addr 10;

        location / {
            limit_except GET { # Ограничение методов
                allow 127.123.123.0; # Разрешить все, кроме GET
                deny all; # Запретить все, разрешить GET
            }
            api write=on; # Разрешить запись по API
            # Можно написать в limit_except, будет применяться ко всем методам кроме указанных
            auth_basic "Restrcted Area"; # Сообщение в диалоговом окне
            auth_basic_user_file /path/file; # Путь до файла с паролями, можно сгенерировать htpasswd
            allow 127.0.0.1;
            deny all;
        }
    }
}
```
