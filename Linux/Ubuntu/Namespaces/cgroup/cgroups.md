Путь: ```/sys/fs/cgroup/<group>```

---
Контроллеры: ```cpu```, ```memory```, ```pids``` (ограничевает количество процессов в группе)

---
Создать группу: ```cgcreate -g cpu,memory:/mygroup``` или ```mkdir /sys/fs/cgroup/mygroup```

Запустить команду в группе: ```cgexec -g cpu:mygroup <command>```  

Переместить процесс в группу: ```cgclassify -g cpu:group <PID>``` или ```echo "PID" >> /sys/fs/cgroup/<group>/cgroup.procs```  

---
```cgset -r memory.max="100MB" <group>``` или ```echo "100MB" >> /sys/...```
* memory:  
  ```memory.max``` - максимальное количество памяти например "100MB"
