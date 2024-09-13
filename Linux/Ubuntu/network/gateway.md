```echo 1 > /sys/net/ipv4/ip_forward```
  
```net.ipv4.ip_forward=0 -> /etc/sysctl.conf```

```
network:
  version: 2
    renderer: networkd
    ethernets:
      eno1:
        dhcp4: true
        routes:
          - to: 192.168.44.0/24
            via: 192.168.0.1
```
