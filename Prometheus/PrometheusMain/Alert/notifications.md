[DOCS](https://prometheus.io/docs/alerting/latest/configuration/)

```yml
global:
  http_config:
  telegram_api_url:

route:
  group_by: [cluster, alertname] # По чему группировать алерты
  group_wait: 30s # Как долго нужно изначально ожидать отправки уведомления для группы
  group_interval: 5m # Интервал между отправкой групп
  repeat_interval: 1h # Через сколько отправлять нотификацию если алерт еще активен
  # Если интервалы не указаны то дочерние маршруты унаследуют от родительского
  continue: true/false # Следует ли продолжать сопоставлять с другими маршрутами, по умолч. false
  match_re: [label: 'regex']
  matchers:
    - label='value'
  receiver: 'web.hook' # Маршрут по умолчанию
  routes:
    - receiver: 'frontend-pager'
      group_by: [product, environment]
      matchers:
      - team="frontend"
      continue: true
      mute_time_intervals: # Список в которое маршрут недоступен
      active_time_intervals: # Список в которое маршрут доступен

receivers:

inhibit_rules: # Указываем source и target и если совпадет в equal то второй алерт не будет отправлен
  - source_matchers: # Также source_matchers_re
      - label='value'
    target_matchers: # Также target_matchers_re
      - label='value'
    equal: ["instance"]
    
templates: # Шаблон для отправки сообщений
  - /path/file
```

## Примеры
```yml
templates:
    - "templates/telegram-template.tmpl"

route:
    group_by: ["severity"]
    group_interval: "5m"
    group_wait: "30s"
    repeat_interval: "30m"
    receiver: "null"
    routes:
      - receiver: "telegram"
        group_by: ["product", "dev"]
        continue: true
        matchers:
          - severity="critical"
        active_time_intervals:
          - offhours
          - holidays

      - receiver: "next"
        matchers:
          - severity="warning"
        mute_time_intervals:
          - offhours
          - holidays

receivers:
  - name: "null"
  - name: "telegram"
    telegram_configs:
    - api_url: https://api.telegram.org
      send_resolved # Default false Стоит ли отправлять уведомление когда проблема была решена
      bot_token: "81432057474:AAHgXJyWa1b-E6K6PsDJhleQgOXtlPRW7X4"
      chat_id: 63489331
      message: '{{ template "telegram_message" .}}'
      http_config: # Default global.http_config
      parse_mode: # Default HTML

inhibit_rules:
    - source_matchers:
        - severity="critical"
      target_matchers:
        - severity="warning"
      equal: ["instance"]

```
