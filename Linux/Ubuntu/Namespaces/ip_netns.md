**Настройка двух виртуальных клиентов:**

*HOST:*
```
sudo ip netns add client1
sudo ip netns add client2

sudo ip link set c1-eth0 netns client1
sudo ip link set c2-eth0 netns client2

sudo ip addr add dev r-veth1 192.168.0.1/24
sudo ip link set dev r-veth1 up

sudo ip addr add dev r-veth2 172.16.0.1/24
sudo ip link set dev r-veth2 up
```

*CLIENT1:*
```
sudo ip addr add dev c1-eth0 192.168.0.3/24
sudo ip link set dev c1-eth0 up
sudo ip route add default via 192.168.0.1
```

*CLIENT2:*
```
sudo ip addr add dev c2-eth0 172.16.0.3/24
sudo ip link set dev c2-eth0 up
sudo ip route add default via 172.16.0.1
```

