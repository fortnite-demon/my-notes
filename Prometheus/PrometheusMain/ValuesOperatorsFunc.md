## Функции (работают с различными типами метрик)

- COUNTER
  - ```rate()``` - Функция rate принимает на вход range vector - берет разность последнего и первого значения и делит их на количество секунд в интервале например [1m] 60s - таким образом вы получаете скорость роста счетчика. Только с типом данных counter.
  - ```irate()``` - Всё тоже самое, но берётся значение последнего и предпоследнего.
  
- GAUGE
  - ```delta()``` - Разность первого и последнего значения в range vector.
  - ```predict_linear()``` - Предсказывает значение метрики на заданное количество секунд вперед.
  
- HISTOGRAM
  - ```histogram_quantile()``` - Персентиль

## Операторы агрегирования

- ```sum``` - суммирование
- ```min``` - взять минимальное значение
- ```max``` - взять максимальное значение
- ```avg``` - взять среднее значение
- ```count``` - подсчитать количество элементов в векторе
- 
#### Примеры
*Суммируем значения по instance и вычисляем среднее кол. во запросов в секунду за последние 2 минуты*
```
sum by (instance) (rate(prometheus_http_requests_total{}[2m]))
```
*Предсказываем на 120 секунд*
```
predict_linear(prometheus_tsdb_blocks_loaded[120m], 120)
```
*80% персентиль на время ответа prometheus по http*
```
histogram_quantile(0.8, prometheus_http_request_duration_seconds_bucket)
```

*Суммарная нагрузка на CPU для всех инстансов*

```
sum(rate(node_cpu_seconds_total[5m])) by (instance)
```

*Процент использования памяти*

```
100 * (node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes) / node_memory_MemTotal_bytes
```

*Запрос для получения максимальной задержки HTTP-запросов*

```
max(http_request_duration_seconds{status="200"}) by (instance)
```

*Количество HTTP-запросов по состоянию за последние 10 минут*

```
sum(increase(http_requests_total[10m])) by (status)
```

*Запрос для получения средних значений по метрике за последние 30 минут*

```
avg(rate(node_network_receive_bytes_total[30m])) by (instance)
```

*Запрос для вычисления общего объема переданных данных по сети*

```
sum(rate(node_network_transmit_bytes_total[1m])) by (instance)
```

*Запрос для получения количества ошибок 5xx за последние 5 минут*

```
sum(increase(http_requests_total{status=~"5.."}[5m])) by (instance)
```

*Запрос для вычисления средней загрузки за последние 15 минут*

```
avg(rate(node_load1[15m])) by (instance)
```



## Типы данных в promql
- Instant Vector - несколько time series метрик, которые отражают одно значение за определенное время, например:

  ```
  user@desktop:~$ promtool query instant http://localhost:9090 "up[1m]"
  up{instance="localhost:8000", job="job"} => 1 @[1729933682.296]
  ```

- Range Vector - несколько time series метрик, которые отражают несколько значений за определенный интервал времени, например:

  ```
  user@desktop:~$ promtool query instant http://localhost:9090 "up[1m]"
  up{instance="localhost:8000", job="myjb"} =>
  0 @[1729933700.096]
  0 @[1729933715.093]
  0 @[1729933730.097]
  0 @[1729933745.093]
  ```

- Scalar - простые числа с плавающей запятой. Можно использовать их, например, прибавляя к метрикам или умножая на них.

