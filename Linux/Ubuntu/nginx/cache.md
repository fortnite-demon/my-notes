```nginx
http {

    proxy_cache_path /data/nginx/cache keys_zone=mycache:10m
                                       max_size=100m # Максимальный размер
                                       loader_threshold=200 # Время для одной итерации загрузки кеша
                                       loader_files=100 # Количество загружаемых элементов
                                       loader_sleeps=50 # Задержка между итерациями

    server {

        proxy_cache mycache; # Можно также указать её для location

        location {

        }

    }

}
```
