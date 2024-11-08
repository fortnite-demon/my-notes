```docker inspect``` - показать информацию о контейнере в формате Json  

```docker exec -it <container> <что запустить например /bin/bash>``` - подключиться к контейнеру

```docker tag <source:tag> <target:tag>``` - изменить название образа

```docker run --mount type=bind,source="$(pwd)"/app,target=/app``` - делаем bind volume

```docker logs -f``` - лог файл в лайв режиме
