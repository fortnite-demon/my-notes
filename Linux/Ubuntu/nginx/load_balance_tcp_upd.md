```nginx
stream {

    upstream backend {
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
