```--config.file="prometheus.yml"``` - какой конфигурационный файл использовать;  

```--web.listen-address="0.0.0.0:9090"``` - адрес, который будет слушать встроенный веб-сервер;  

```--web.enable-admin-api``` - включить или отключить административный API через веб-интерфейс;  

```--web.console.templates="consoles"``` - путь к директории с шаблонами html;  

```--web.console.libraries="console_libraries"``` - путь к директории с библиотеками для шаблонов;  

```--storage.tsdb.path="data/"``` - путь для хранения time series database;  

```--storage.tsdb.retention.time``` - время хранения метрик по умолчанию 15 дней, все, что старше, будет удаляться;  

```--storage.tsdb.retention.size``` - размер TSDB, после которого Prometheus начнет удалять самые старые данные;  

```--query.max-concurrency``` - максимальное одновременное число запросов к Prometheus через PromQL;  

```--query.timeout=2m``` - максимальное время выполнения одного запроса;  

```--enable-feature``` - флаг для включения различных функций, описанных здесь; 

```--log.level``` - уровень логирования.  
