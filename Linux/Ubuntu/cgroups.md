Путь: ```/sys/fs/cgroup/<group>```

Контроллеры: ```cpu```, ```memory```, ```pids``` (ограничевает количество процессов в группе)

Команды:

```cgcreate -g cpu,memory:/mygroup```

```cgexec -g cpu:mygroup <command>```
