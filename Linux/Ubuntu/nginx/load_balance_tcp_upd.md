```nginx
stream {

    upstream backend {
        least_conn; или
        hash $remote_addr consistent; или
        random two least_conn;
        server backend:8080 weight=5 max_conns=10;
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
random two
            - least_time=connect – время подключения к вышестоящему серверу ($upstream_connect_time)
            - least_time=first_byte – наименьшее среднее время получения первого байта данных с сервера ($upstream_first_byte_time)
            - least_time=last_byte – наименьшее среднее время получения последнего байта данных с сервера ($upstream_session_time)
```

