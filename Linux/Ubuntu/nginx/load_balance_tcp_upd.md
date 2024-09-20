```nginx
stream {

    server {
        listen 12345;
        proxy_pass backend;
        upstream backend {
            server backend:12345;
        }
    }

    server {
        listen 53 udp;
        proxy_pass dns;
        upstream dns {
            server dns:53;
        }
    }

}
```
