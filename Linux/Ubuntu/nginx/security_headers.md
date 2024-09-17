```nginx
server {

    add_header Content-Security-Policy "default-src 'self'"; # Откуда можно загружать контент
    add_header X-Frame-Options "DENY или SAMEORIGIN (наш сервер)"; # Вставка в Frame сайта
    add_header X-XSS-Protection "1; mode=block"; # Защита от межскриптинга
    add_header X-Content-Type-Options "nosniff"; # Чтобы браузер не определял тип файла по содержимому
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains"; # Использование только защищенного соединения
    add_header Referrer-Policy "no-referrer"; # При переходе на другой сайт, не передаёт информации о предыдущем
    add_header Feature-Policy "geolocation 'self'";

}
```
