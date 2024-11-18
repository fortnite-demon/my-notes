### PID Namespace — изоляция процессов.
```
sudo unshare --pid --fork
```
### Mount namespace — изоляция файловой системы.
```
sudo unshare --mount --fork
mount --make-rslave /
mount --rbind /tmp /mnt
```
### Network namespace — изоляция сетевых ресурсов.
```
sudo ip netns add ns
sudo ip netns exec ns ip link set lo up
sudo ip netns exec ns ip link
```
### IPC Namespace — изоляция межпроцессного взаимодействия.
```
sudo unshare --ipc --fork
ipcs
```
### UTS Namespace — изоляция параметров системы.
```
sudo unshare --uts --mount --pid --fork
echo "newhostname" > /proc/sys/kernel/hostname
```
### User namespace (изоляция идентификаторов пользователей)
```
sudo unshare --user --map-root-user --mount --pid --fork 
```
