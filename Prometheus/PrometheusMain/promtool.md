```promtool query instant http://localhost:9090 <metric (up, ...) или 'up{job="node"}[Если нужно, можно указать время 1m последняя минута]'>``` - Вывести значение метрики
- Можем также использовать ```!=``` или regex ```=~'..p'```
- Так же по значениям "up == 1"

```curl -X POST -D - -s http://localhost:9090/api/v1/admin/tsdb/snapshot``` - Выполняем снапшот

- ```-D -``` - Выводить все заголовки на стандартный stout -
