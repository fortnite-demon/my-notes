```
promtool test rules AlertTest.yml
```

```yml
# Путь к файлу с алертами
rule_files:
    - alerts.yml

# Как часто будут выполняться запросы из тестовых правил
evaluation_interval: 10s

tests:
    - interval: 15s # Как часто собираются данные по нашей метрике
      input_series: # Тестовая метрика
          - series: 'up{job="prometheus", instance="localhost:9090"}' # Название и теги тестовой метрики
            values: '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0' # Значения тестовой метрики - каждое значение будет с
                                                    # обираться каждые interval секунд. То есть в нашем примере
                                                    # interval 15 sec, значит при тестах первое значение - ноль
                                                    # - будет собрано в самом начале, когда прошло 0 секунд, 
                                                    # второе значение - ноль - будет собрано в 15 секунд, 
                                                    # третье значение - ноль - появится в 30 секунд и так 
                                                    # далее.
      # Тестовые правила
      alert_rule_test:
          - eval_time: 5m # Время прошедшее с момента запуска теста - за это 
                          # время тесты соберут все значения метрики
                          # (раз в 15 секунд, а так же будут раз в 10 секунд
                          # выполнять наши правила алертинга)
            alertname: InstanceDown # Названия алерта, которое тестируем
            exp_alerts: # что ожидаем получить на выходе
                - exp_labels: # Какие лейблы должны быть у алерта
                      severity: critical
                      instance: localhost:9090
                      job: prometheus
                  exp_annotations: # Какие аннотации должны быть у алерта
                      summary: "Instance localhost:9090 down"
                      description: "localhost:9090 of job prometheus has been down for 1 minute."
```
