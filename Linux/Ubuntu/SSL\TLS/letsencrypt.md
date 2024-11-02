```letsencrypt certonly --webroot -e /opt/www -d <domain>``` - Создание сертификата

```nginx

server {
  listen 80;
  server_name my.server.com;

  location /.well-known {   # Подтверждение владения доменом
    root /opt/www;
  }
  location / {
    return 301 https://my.server.com$request_uri;
  }
}
server {
  listen 443 ssl;

  ssl_sertificate /etc/letsencrypt/live/my.server.com/fullchain.pem;
  ssl_sertificate /etc/letsencrypt/live/my.server.com/privkey.pem;

  location / {
    proxy_pass ...
  }
}
```
