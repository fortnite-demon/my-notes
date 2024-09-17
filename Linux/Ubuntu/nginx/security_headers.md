```nginx
server {

    add_header Content-Security-Policy "default-src 'self'"; # Откуда можно загружать контент
                                        - script-src: источники скриптов.
                                        - style-src: источники стилей.
                                        - img-src: источники изображений.
                                        - frame-src: источники фреймов.
                                        - connect-src: источники для AJAX-запросов.

    add_header X-Frame-Options "DENY или SAMEORIGIN (наш сервер)"; # Вставка в Frame сайта

    add_header X-XSS-Protection "(1 вкл. защиту 0 выкл.); mode=block"; # Защита от межскриптинга

    add_header X-Content-Type-Options "nosniff"; # Чтобы браузер не определял тип файла по содержимому

    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains"; # Застваляет браузер использовать только https

    add_header Referrer-Policy "no-referrer"; # При переходе на другой сайт, не передаёт информации о предыдущем
                               - no-referrer-when-downgrade: отправляет реферер только при переходе на HTTPS.
                               - origin: отправляет только источник, без пути и параметров.

    add_header Feature-Policy "geolocation 'self'"; # Какие функции браузера доступны для сайта
                               - camera: доступ к камере.
                               - microphone: доступ к микрофону.
                               - geolocation: доступ к геолокации.

}
```
