```nginx
http {

    proxy_cache_path /data/nginx/cache keys_zone=mycache:10m;

    server {

        proxy_cache mycache; # Можно также указать её для location

        location {

        }

    }

}
```
