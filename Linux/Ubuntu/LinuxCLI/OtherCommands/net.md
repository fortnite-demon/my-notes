## ```curl``` - URL
  *Ключи:*
  - ```-X```: метод запроса
  - ```-s```: тихий режим
  - ```-k```: игнорировать ошибки сертификации
  - ```-v```: расширенный вывод, включая tls этапы
  - ```-L```: следовать перенаправлению
  - ```--head```: показать заголовки
  - ```--connect-timeout```: сколько ждать ответ от сервера
## ```ip``` - управление интерфейсами
  *Ключи:*
  - ```ip neigh```: управление arp таблицей
      - ```flush```: очистить

## ```dig``` - DNS
  *Ключи:*
  - ```-x <ip>```: узнать домен по ip
  - ```+short```: короткий вывод, только ip
  - ```+noall```: уберет весь вывод
  - ```+answer```: dns записи
  - ```+trace```: трассировка, кто ответил

## ```nmcli``` - NetworkManager

## ```networkctl``` - systemd-networkd
  - ```networkctl status --all```: вывести все интерфейсы
