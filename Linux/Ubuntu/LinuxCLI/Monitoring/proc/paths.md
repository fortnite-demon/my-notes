## Общая информация

```/proc/cpuinfo``` - выводит информацию о процессоре 

```/proc/meminfo``` - отображает информацию о памяти  

```/proc/interrupts``` - отображает информацию по прерывациям  

```/proc/swaps``` - выводит информацию о файлах подкачки  

```/proc/mounts``` - показывает точки монтирования  

```/proc/version``` - похожа на uname, выводит версию ядра  

## PROCESSES

```/proc/<PID>/maps``` - информация о сегментах памяти

```/proc/<PID>/smaps``` - более детальный вывод о сегментах

```/proc/<PID>/stack``` - стек вызовов

```/proc/<PID>/limits``` - лимиты процесса

```/proc/<PID>/status``` - подробная информация о процесса

## MONITORING

```/proc/pressure/memory,cpu,io``` - информация о давлении

## NETWORK

```/proc/net/dev``` - выводит сетевые интерфейсы и статистику по ним  
