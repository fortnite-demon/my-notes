```
ddns-update-style interim;

# Расположение базы данных с арендой IР-адресов
lease-file-name "/var/lib/dhcpd/dhcpd.leases";

# Данный сервер является официальным DНСР-сервером для локальной сети
authoritative;

# Доменное имя и имена DNS-cepвepoв
option domain-name "company"com";
option domain-name-servers nsl.company.com ns2.company.com

# Время аренды
default-lease-time 86400; # 24 часа
max-lease-time 172800; # 48 часов

subnet 192.168.1.0 netmask 255.255.255.0 {

    option routers 192.168.1.1;  
    option subnet-mask 255.255.255.0;  
    range 192.168.1.101 192.168.1.200;

    host server {  
        option host-name "server";  
        option routers 192.168.1.1;  
        hardware ethernet 00:FF:FB:69:DC:E5;  
        fixed-address 192.168.1.99;  
    }

    # Список маршрутизаторов (через пробел)
    option routers 192.168.0.1;

    # Маска подсети
    option subnet-mask 255.255.255.0;

    # Широковещательный адрес
    option broadcast-address 192.168.0.255;

    # Доменное имя
    option domain-name "company.com"

    # IР-адрес/имя DNS-cepвepa, если не задано в глобальных параметрах
    option domain-name-servers 192.168.0.1;

    # Сервер времени (NTP)
    option ntp-servers 192.168.0.1;

    # IР-адрес сервера NetBIOS и его тип узла (если нужно)
    option netbios-name-servers 192.168.0.1;
    option netbios-node-type 8;

    # Диапазон IР-адресов, выделяемый клиентам сети
    range 192.168.0.101 192.168.0.200; 
}
```

Сложная сеть:
```
shared-network rny_bignet {

    # Доменное имя и имена DNS-cepвepoв
    option domain-name "company.com";
    option domain-name-servers nsl.cornpany.corn ns2.cornpany.corn

    # Шлюз по умолчанию
    option routers 192.168.0.1;

    # Подсети 192.168.1.0 и 192.168.2.0

    subnet 192.168.0.0 netrnask 255.255.252.0 {
        range 192.168.0.101 192.168.0.200;
    }
    subnet 192.168.1.0 netrnask 255.255.252.0 {
        range 192.168.1.101 192.168.1.200;
    }
}
```
В /etc/network/interfaces
```
auto ethO
iface ethO inet dhcp 
```
А в /etc/netplan/01...yml
```
renderer: networkd
ethernets:
    ens0:
        dhcp4: true
