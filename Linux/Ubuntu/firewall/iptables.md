OUTPUT, INPUT, FORWARD, PREROUTING (Исходящий, входящий, через хост трафик, перенаправление)
```
-A - Добавить в конец цепочки
-I - В начало
-D - Удалить
-R - Заменить
```
ACCEPT, REJECT, DROP, REDIRECT, MASQUERADE (Разрешить, отклонить и отбросить, редирект)
```
-j  
```

```
-i lo - Интерфейс  
-o - На какой интерфейс
-p - Протокол (tcp,udp) для порта --dport на какой порт --to-ports  
-s - IP
```
Таблицы nat, filter, mangle, raw    
- nat - PREROUTING, POSTROUTING, OUTPUT  
- filter - default  
```
-t
```


