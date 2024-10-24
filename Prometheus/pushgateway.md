```--web.config.file=""``` Экспериментальная опция, позволяющая указать путь к конфигурации для включения TLS при обработке запросов.  

```--web.enable-lifecycle``` - разрешает выключать pushgateway через запрос API.  

```--web.enable-admin-api``` - включает административный API, с помощью которого на данный момент можно только удалить все метрики.  

```--persistence.file=""``` - файл, в котором pushgateway будет сохранять полученные метрики. По умолчанию они хранятся в памяти и теряются при рестарте.  

```--persistence.interval=5m``` - как часто следует сохранять метрики в файл.

##

```echo "metric_name 123" | curl --data-binary @- http://localhost:9091/metrics/job/cron_app``` - Отправляем данные на pushgateway  

- ```--data-binary``` - Никак не изменять данные из stdin, а просто передавать в POST запросе
- ```job``` - Label, а ```cron_app``` его значение

Указание типа передаваемых данных в комментариях
```Bash
cat <<EOF | curl --data-binary @- http://localhost:9091/metrics/job/cron_app
# TYPE cron_app_payed_sum gauge
cron_app_payed_sum 15487
# TYPE cron_app_processed_users gauge
# HELP cron_app_processed_users Processed Users Counter.
cron_app_processed_users 238
EOF
```

##

```push_failure_time_seconds``` - timestamp, когда запись метрик в группу (job=cron_app) провалилась.

```push_time_seconds``` - временная метка, когда была произведена последняя успешная запись в данную группу.
  
