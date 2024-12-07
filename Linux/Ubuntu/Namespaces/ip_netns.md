Так мы создадим новое сетевое пространство имён **ns** и привяжем интерфейс veth1 к этому сетевому пространству. А также поднимаем внутри этого пространства
```
ip netns add ns

ip link add veth0 type veth peer name veth1

ip link set veth0 netns ns

ip netns exec ns ip link set dev veth1 up
```
