## Основные цепочки

- ```OUTPUT```: Исходящий трафик
- ```INPUT```: Входящий трафик
- ```FORWARD```: Трафик через хост
- ```PREROUTING```: Перенаправление
- ```POSTROUTING```: После маршрутизации

## Команды

- ```-A```: Добавить в конец цепочки
- ```-I```: Добавить в начало
- ```-D```: Удалить
- ```-R```: Заменить

## Действия

- ```ACCEPT```: Разрешить
- ```REJECT```: Отклонить
- ```DROP```: Отбросить
- ```REDIRECT```: Редирект
- ```MASQUERADE```: Маскировка
- ```DNAT```: Динамический NAT
- ```SNAT```: Статический NAT

## Параметры

- ```-j```: Jump (переход)
- ```-i```: Входной интерфейс
- ```-o```: Исходящий интерфейс
- ```-p```: Протокол (tcp, udp)
- ```--dport```: Порт назначения
- ```--to-port```: Порт перенаправления
- ```-s```: IP-адрес источника

### Дополнительные параметры

- ```-m time```: Устанавливает временные рамки
  - ```--timestart 09:00```: Начало
  - ```--timestop 17:00```: Конец
- ```connlimit```: Ограничение на количество одновременных соединений
  - ```--connlimit-above 10```: Более 10 соединений
- ```limit```: Ограничение на количество пакетов
  - ```--limit 10/s```: 10 пакетов в секунду

## Таблицы

- ```nat```: PREROUTING, POSTROUTING, OUTPUT
- ```filter```: По умолчанию

## Примеры использования

Перенаправляет пакеты, поступающие на интерфейс eth1:

```
iptables -t nat -A PREROUTING -i eth1 --dport 80 -j DNAT --to-destination 192.213.13.1
```

Изменяет адрес источника пакетов, выходящих из eth0:

```
iptables -t nat -A POSTROUTING -o eth0 --sport 80 -j SNAT --to-source 192.12.122.1
```

Разрешить трафик только от определенной подсети и на определенные порты:

```
sudo iptables -A INPUT -s 192.168.1.0/24 -p tcp -m multiport --dports 22,80 -j ACCEPT
```

Разрешить входящие SSH-соединения (порт 22):
```
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

Заблокировать входящие ICMP-пакеты:
```
sudo iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
```

Разрешить весь трафик из подсети 192.168.1.0/24:
```
sudo iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT
```

Запретить доступ к порту 80 (HTTP) для всех:
```
sudo iptables -A INPUT -p tcp --dport 80 -j REJECT
```

Ограничить количество одновременных соединений на порт 80:
```
sudo iptables -A INPUT -p tcp --dport 80 -m connlimit --connlimit-above 10 -j REJECT
```

Перенаправить трафик с порта 80 на порт 8080:
```
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
```

Настроить маскировку для NAT, чтобы скрыть внутренние IP-адреса:
```
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```
  
Разрешить доступ к порту 22 только в рабочие часы (например, с 9 до 17):
```
sudo iptables -A INPUT -p tcp --dport 22 -m time --timestart 09:00 --timestop 17:00 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j REJECT
```

Ограничить количество пакетов, принимаемых за секунду, для защиты от DoS-атак:
```
sudo iptables -A INPUT -p tcp --dport 80 -m limit --limit 10/s -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j DROP
```

ESTABLISHED - пакеты относяться к соединению, RELATED - связанные с соединением
```
sudo iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
```

Логировать входящие пакеты, которые не соответствуют правилам:
```
sudo iptables -A INPUT -j LOG --log-prefix "iptables: " --log-level 4
```
