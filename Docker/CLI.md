```docker run --privileged --rm tonistiigi/binfmt --install all``` - установка эмуляций для разных архитектур

```docker buildx create --name mybuilder --bootstrap --use``` - создание билдера buildx

```docker exec -it <container> <что запустить например /bin/bash>``` - подключиться к контейнеру

```docker tag <source:tag> <target:tag>``` - изменить название образа

```docker run --mount type=bind,source="$(pwd)"/app,target=/app``` - делаем bind volume

```docker logs -f``` - лог файл в лайв режиме
