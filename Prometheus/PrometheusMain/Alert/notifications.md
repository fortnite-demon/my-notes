[DOCS](https://prometheus.io/docs/alerting/latest/configuration/)

```yml
route:
  continue: true/false # Следует ли продолжать сопоставлять с другими маршрутами, по умолч. false
  match_re: [label: 'regex']

templates: # Шаблон для отправки сообщений
  - /path/file
```
