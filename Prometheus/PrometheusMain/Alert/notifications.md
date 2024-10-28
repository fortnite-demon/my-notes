[DOCS](https://prometheus.io/docs/alerting/latest/configuration/)

```yml
global:

route:
  continue: true/false # Следует ли продолжать сопоставлять с другими маршрутами, по умолч. false
  match_re: [label: 'regex']

recievers:

inhibit_rules:

templates: # Шаблон для отправки сообщений
  - /path/file
```
