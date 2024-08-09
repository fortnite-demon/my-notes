```systemd-run -u <group> -p CPUQuota=50% -p MemoryMax=100MB <command>```

```systemd-cgls --all```

```systemd-cgtop```

Постоянная cgroups, так как systemd-run уничтожит первую после завершения процесса

Создать slice в ```/etc/systemd/system/group.slice```

```Bash
[Slice]

CPUQuota=Ограничивает процент процессорного времени, которое группа может использовать.
MemoryMax=Ограничивает максимальное количество оперативной памяти, которое может использовать группа процессов.
MemoryHigh=Указывает порог, при достижении которого система начнёт ограничивать использование памяти.
MemoryLow=Обеспечивает минимально гарантированное количество памяти для группы.
```

```systemd-run -u <group> --slice=group.slice <command>```
