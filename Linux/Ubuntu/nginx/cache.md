```nginx
http {

    proxy_cache_path /data/nginx/cache keys_zone=mycache:10m
                                       max_size=100m # Максимальный размер
                                       loader_threshold=200 # Время для одной итерации загрузки кеша
                                       loader_files=100 # Количество загружаемых элементов
                                       loader_sleeps=50 # Задержка между итерациями
    proxy_cache_min_uses 5; # Минимальное количество запросов, после которых ответ будет кеширован
    proxy_cache_key "$host$request_uri$cookie_user"; # Строка запроса, для управления какие ответы кешируются

    server {

        proxy_cache mycache; # Можно также указать её для location

        location {

        }

    }

}
```
