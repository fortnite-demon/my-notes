## ```ps``` - список процессов
 - ```-x``` - все процессы без привязки к терминалу
 - ```-u``` - определённый пользователь
 - ```-o sid,pgid,ppid,pid,tty,cmd``` - указываем колонки
 - ```-U ${USER} -o pid,command,state``` - пользовательские процессы со статусом (R,Z,D)

## ```fuser``` - rакая служба какой порт открыла
  - ```-va 80/tcp```
    
## ```pmap``` - покажет использование памяти процессом и где она находится

## ```pgrep``` - поиск процесса
 - ```-x```: точное соответствие имени

## ```nice``` ```renice``` - изменение приоритета процесса -20 (max) > 19 (min)
  - ```nice -n <priority> <command>```
  - ```renice -n <priority> <pid>```

## ```kill```
 - ```-l``` - все сигналы
 - ```-s``` - сигнал

## ```strace``` - системные вызовы процесса

## ```pstack``` - cтек вызовов для заданного процесса

## ```pstree``` - дерево процессов на хосте

## ```fg``` ```bg``` - dернуть процессы в интерактивный режим, отправить в фоновый режим
 - ```fg %<номер процесса>```

## ```jobs``` - cписок групп процессов в сессии
