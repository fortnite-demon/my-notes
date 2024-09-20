```nginx
stream {

    upstream backend {
        least_conn; или
        hash $remote_addr consistent;
        server backend:8080;
    }
    upstream dns {
        server dns:53;
    }

    server {
        listen 12345;
        proxy_pass backend;
    }

    server {
        listen 53 udp;
        proxy_pass dns;
    }

}
```

### Nginx Plus

```nginx
least_time
            - connect Время подключения к вышестоящему серверу
            - first_byte Время получения первого байта данных
            - last_byte Время для получения полного ответа от сервера
```

