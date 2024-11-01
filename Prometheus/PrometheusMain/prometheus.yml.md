[DOCS](https://prometheus.io/docs/prometheus/latest/configuration/configuration)

```yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s
  external_labels:   # Будут добавляться лейблы, когда prometheus будет взаимодействовать с внешним сервисом:
    datacenter: dc1  # федерация, алертменеджер, запись данных во внешнюю систему

rule_files:
  - "alerts.yml"

alerting:
  alertmanagers:
    - static_configs: # Можем также указать file_sd_configs
        - targets: ["localhost:9390"]

scrape_configs:
  - job_name: "pushgateway"
    metrics_path: /metrics
    honor_labels: true # Запрещает prometheus изменять поступающие лейблы job и instance своими собственными
    static_configs:
      - targets: ["localhost:9091"]

  - job_name: "autodiscovery"
    file_sd_configs:
      - file:
          - '/opt/targets/.*json' # Автоматически ищет все файлы в /opt/targets
        refresh_interval: 10s # Перечитывает файлы через 10 секунд
```
