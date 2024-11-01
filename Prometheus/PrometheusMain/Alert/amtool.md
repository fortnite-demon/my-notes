## Silence
```amtool silence add --duration=2h --comment="Your comment" --author="me" label="value" alertname=ExampleAlert``` - Заглушить маршрут  

```amtool silence expire <silence_id>``` - Удаление заглушенного маршрута  

```amtool silence query``` - Текущие заглушенные маршруты или можем еще добавить <silence_id> для детального вывода

## Alert
```amtool alert add --expires=10m instance="localhost:9100" severity="critical" alertname="myalert"```

## Проверки конфига, маршруты

```amtool check-config "/path/to/config``` - Проверка конфига  

```amtool config routes --config.file "/path/to/config``` - Проверка маршрутов

```amtool config routes test severity="warning" --config.file "path"``` - Проверка по какому маршруту пойдет алерт
