Проверка контейнера на работоспособность
```yml
healthcheck:
  test: Команда для теста, например curl -f ... || exit 1
  timeout: Сколько ждать ответа (10s)
  retries: Попытки (3)
  start_period: Через сколько после запуска контейнера запускать проверки (30s)
  interval: Через сколько делать попытки (15s)
```

Создание сетей
```yml
network:
  default:
    net:
      driver: bridge
      name: my-net
```
