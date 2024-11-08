```docker inspect``` - Показать информацию о контейнере в формате Json  

```docker exec -it <container> <что запустить например /bin/bash>``` - Подключиться к контейнеру

```docker tag <source:tag> <target:tag>``` - Изменить название образа

```docker run --mount type=bind,source="$(pwd)"/app,target=/app``` - делаем bind volume
