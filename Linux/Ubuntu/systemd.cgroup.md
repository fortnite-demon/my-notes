```systemd-run -u <group> -p CPUQuota=50% -p MemoryMax=100MB <command>```

```systemd-cgls --all```

```systemd-cgtop```

Постоянная cgroups, так как systemd-run уничтожит первую после завершения процесса

Создать slice в ```/etc/systemd/system/group.slice```

```Bash
[Slice]

CPUQuota=50%
MemoryMax=100MB
```

```systemd-run -u <group> --slice=group.slice <command>```
