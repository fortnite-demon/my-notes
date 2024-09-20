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
                allow all;
                deny 127.0.0.1;
            }
        }
    }
}
```
