[DOCS](https://prometheus.io/docs/prometheus/latest/configuration/configuration)

```yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s
  external_labels:   # Будут добавляться лейблы, когда prometheus будет взаимодействовать с внешним сервисом:
    datacenter: dc1  # федерация, алертменеджер, запись данных во внешнюю систему

rule_files:
  - "alerts.yml" # Правила алертинга
  - "rules.yml" # Правило создания новых метрик

alerting:
  alertmanagers:
    - static_configs: # Можем также указать file_sd_configs
        - targets: ["localhost:9390"]

scrape_configs:
  - job_name: "pushgateway"
    metrics_path: /metrics
    honor_labels: true # Заставляет prometheus сохранять исходные теги instance и job, которые ему отдаст экспортер 
    static_configs:
      - targets: ["localhost:9091"]

  - job_name: "autodiscovery"
    file_sd_configs:
      - file:
          - '/opt/targets/.*json' # Автоматически ищет все файлы в /opt/targets
        refresh_interval: 10s # Перечитывает файлы через 10 секунд

  - job_name: federation # Настройка для центрального сервера, который будет забирать метрики
    honor_labels: true
    metrics_path: /federate
    params:
      match[]:
        - '{__name__=~"^job:.*"}' # Будет собирать метрики по этим условиям, если хотим собрать метрики
        - '{job="app"}'           # в которых будут эти два лейбла, то нужно объединить их в одно
    static_configs:
      - targets:
        - 167.172.104.138:9090

  - job_name: "tls connection"
    scheme: https
    tls_config:
      ca_file: /path/to/ca.crt
      server_name: node_exporter.fornite.com
    basic_auth:
      username: user
      password: pass
    static_configs:
      - targets: ["158.23.2.12:9100"]

remote_write: # Для записи в базу данных, например через kafka
  - url: http://localhost:port/receive
```
