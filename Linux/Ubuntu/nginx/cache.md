```nginx
http {

    proxy_cache_path /data/nginx/cache keys_zone=mycache:10m
                                       max_size=100m # Максимальный размер
                                       loader_threshold=200 # Время для одной итерации загрузки кеша
                                       loader_files=100 # Количество загружаемых элементов
                                       loader_sleeps=50 # Задержка между итерациями

    proxy_cache_valid 202 404 10m; # Время действия кеша по кодам состояния или any
    proxy_cache_min_uses 5; # Минимальное количество запросов, после которых ответ будет кеширован

    proxy_no_cache $http_authorization; # Условия при которых ответ не будет кеширован
    proxy_cache_bypass $cookie_nocache; # Условия при которых кеш не будет отправлен, а будет сделан запрос к серверу

    map $request_method $purge_method {
        default 0;
        PURGE 1;
    }

    proxy_cache_key "$host$request_uri$cookie_user"; # Строка запроса, для управления какие ответы кешируются
    proxy_cache_methods GET HEAD POST; # Кеширование методов отличных от GET и HEAD по умолчанию

    server {

        proxy_cache mycache; # Можно также указать её для location

        location {

            proxy_cache_purge $purge_method; # Удаление кэше на основании map

        }

    }

}
```
