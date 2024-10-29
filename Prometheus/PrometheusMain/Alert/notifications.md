[DOCS](https://prometheus.io/docs/alerting/latest/configuration/)

```yml
global:

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
  reciever: 'web.hook' # Маршрут по умолчанию
  rules:
    - receiver: 'frontend-pager'
      group_by: [product, environment]
      matchers:
      - team="frontend"
      continue: true
      mute_time_intervals: # Список в которое маршрут недоступен
      active_time_intervals: # Список в которое маршрут доступен

recievers:

inhibit_rules: # Указываем source и target и если совпадет в equal то второй алерт не будет отправлен
  - source_matchers: # Также source_matchers_re
      - label='value'
    target_matchers: # Также target_matchers_re
      - label='value'
    
templates: # Шаблон для отправки сообщений
  - /path/file
```

## Примеры
```yml
route:
  group_by: [cluster, alertname]
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 30m
  reciever: 'web.hook'
  rules:
    - name: 'telegram'
      matchers:
        - severity='critical'
      continue: true
      mute_time_intervals:
        - offhours
        - holidays

    - name: 'slack'
      group_by: [product]
      group_wait: 10s
      matchers:
        - severity='warning'
      active_time_intervals:
        - offhours
        - holidays

recievers:
  - name: 'web.hook'
    webhook_configs:
    

inhibit_rule:
  - source_match:
      - severity='critical'
    target_match:
      - severity='warning'
    equal: ['instance']
```
