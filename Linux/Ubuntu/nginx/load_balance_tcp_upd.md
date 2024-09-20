```nginx
http {

    stream {

        server {
            listen 12345;
            proxy_pass back;
        }

        server {
            listen 53 udp;
            proxy_pass servers;
        }

    }
}
```
