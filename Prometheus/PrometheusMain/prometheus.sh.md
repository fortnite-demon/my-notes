## Web, address, api, console

```--web.listen-address="0.0.0.0:9090"``` - адрес, который будет слушать встроенный веб-сервер;  

```--web.enable-admin-api``` - включить или отключить административный API через веб-интерфейс;  

```--web.console.templates="consoles"``` - путь к директории с шаблонами html;  

```--web.console.libraries="console_libraries"``` - путь к директории с библиотеками для шаблонов;  

## TSDB

```--storage.tsdb.path="data/"``` - путь для хранения time series database;  

```--storage.tsdb.retention.time``` - время хранения метрик по умолчанию 15 дней, все, что старше, будет удаляться;  

```--storage.tsdb.retention.size``` - размер TSDB, после которого Prometheus начнет удалять самые старые данные;  

```--storage.tsdb.wal-compression``` - включение сжатия wal архивов. По умолчанию включена с версии 2.20.  

```--storage.tsdb.no-lockfile``` - не создавать lockfile в data директории. Позволит запустить второй prometheus на этих же данных. Но консистентность данных гарантировать уже будет нельзя.  

## Query

```--query.max-concurrency``` - максимальное одновременное число запросов к Prometheus через PromQL;  

```--query.timeout=2m``` - максимальное время выполнения одного запроса;  

## Other

```--config.file="prometheus.yml"``` - какой конфигурационный файл использовать;  

```--enable-feature``` - флаг для включения различных функций, описанных здесь; 

```--log.level``` - уровень логирования.  
