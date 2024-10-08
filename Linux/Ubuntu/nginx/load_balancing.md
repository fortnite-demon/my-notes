## Методы балансировки
```nginx
least_conn; # Наименьшее количество подключений
ip_hash; # Сервер определяется по IP адресу клиента
hash $request_uri consistent; # На основе хеширования $request_uri, а consistent - минимизация изменения хеша для похожих URL
zone backend 32k; # Сохранение конфигурации в общей памяти
```
```nginx
least_conn;
server 127.0.0.1:80;
```
##

```nginx
down - Чтобы временно удалить сервер из ротации балансировки нагрузки  
backup - Не принимает запросы, толькое если другие не недоступны  
weight - Вес сервера, по умолчанию 1, 6 запросов = вес 5 ему 5 запросов

server ... max_conns - Ограничение количества подключений
```
```nginx
server 127.0.0.1:80 down;
```

## Nginx Plus

```nginx
least_time (...) # Наименьшая средняя задержка и наименьшее кол-во подключений на основе выбранного:
            header - Время получения первого байта от сервера
            last_byte - Время для получения полного ответа от сервера
            last_byte inflight - Время получения полного ответа от сервера с учетом незавершенных запросов
two (...) # Выбирает два случайных и уже из них на основе параметров
    least_conn;
    least_time=header или last_byte;
```
##
```nginx
slow_start - Время, в течении которого сервер будет увеличивать свой вес до номинального
queue 100 timeout=75; # Если max_conns достигнут, то запрос помещается в очередь, если не будет выбран сервер в течении timeout, то соединение отбросится
```
## Сохранение сеанса
```nginx
sticky srv_id expires=1h domain=.example.com path=/; # Сохранение сеанся по id srv_id на 1 час для домена
                                                     # и путь для файла cookie /. expires, domain, path - необязательны
```
```nginx
sticky route $route_cookie $route_uri; # Назначается маршрут, информация берётся из cookie или из URL запроса
```
```nginx
sticky learn
    create=$upstream_cookie_examplecookie # Как создаётся новый сеанс, здесь из файла cookie example... отправленного вышестоящим сервером
    lookup=$cookie_examplecookie # Способ поиска сеансов, здесь в файле cookie examplecookie
    zone=client_sessions:1m # Зона общей памяти где хранится информация о сеансах
    timeout=1h;
    sync; # Sync между несколькими процессами

```





