```nginx
location / {
    index index.html index.htm;

    rewrite ^/users/(.*)$ /show?user=$1 break; # Переписывает URL адрес, $1 - в скобках, можно использовать и в server
                                               # break - Прекращает всех rewrite и не ищет новый URL
                                               # last - Прекращает всех rewrite и возвращается к началу location

    return <code>; # Можно также указать ресурс http://recourse

    error_page 404 =301 /new/path; # Обработка ошибок если файл не найден {ошибка} {код который возвращаем}

    sub_filter 'word' 'word'; # Изменяет записи в теле сообшения
    sub_filter_once on; # On обрабатывает 1 запись, off все
    sub_filter_types application/json; # Типы текста

    autoindex on; # Позволяет автоматически генерировать списки каталогов, когда индексный файл не найден в каталоге

    try_files $uri $uri/ $uri.html =404; # Если файл не будет найден, поочерёдно будет проверять $uri

    sendfile           on; # Не копировать данные в буфер, а сразу отсылать клиенту, улучшение производительности
    sendfile_max_chunk 1m; # Размер отсылаемых блоков
}
```
