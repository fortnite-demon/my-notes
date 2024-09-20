```nginx
stream {

    server {
        listen 12345;
        upstream backend {
            server backend;
        }
    }
    server {
        listen 53 udp;
        upstream dns {
            server dns;
        }
    }

}
```
