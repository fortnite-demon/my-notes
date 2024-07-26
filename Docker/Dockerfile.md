```Dockerfile
ARG PLATFORM=linux | ARG объявлен до FROM, чтобы использовать его после FROM нужно объявить его без параметра,
                     мы также можем использовать ARG как обычно, с указанием значений.
```
```Dockerfile 
FROM --platform=${PLATFORM}/amd64 [image:tag] AS name

ARG PLATFORM
```
```Dockerfile
RUN
    --mount=type=cache,target=/root/.cache/pip \                         | cache для кеша
    --mount=type=bind,source=requirements.txt,target=requirements.txt \  | bind read-only, можно изменить на rw
    --mount=type=bind, from=name ...  
    --mount=type=secret,id=aws,target=/root/.aws/credentials             | secrets Разрешите контейнеру сборки получать доступ к защищенным файлам,
                                                                                   таким как закрытые ключи, не записывая их в образ.
    --network=host, none, default                                        | В какой сети выполняется команда                                              
    pip install -r requirements.txt                                      | Эти параметры будут выполняться для команды, тут для pip install                                                   
```
```Dockerfile
COPY <src> <dst> 
     --from=[image|stage|context] --from=nginx:latest или --from=name
     --chown=<user>:<group> --chmod=<perms> ... <src> ... <dest>
     --parents=false|true сохраняет родительские каталоги
     --exclude=*.txt исключает файлы
```
```Dockerfile
ENV <key>=<value>
```
```Dockerfile
CMD ["nginx", "-g", "daemon off;"]

ENTRYPOINT ["file.sh"]
```
```Dockerfile
USER <user>:<group>
```
```Dockerfile
WORKDIR /workdir
```
```Dockerfile
VOLUME ["/volume"] | нужно будет указать host-dir при запуске контейнера
```
```Dockerfile
HEALTHCHECK --interval=5m --timeout=3s retries=5 start-period=5s\
CMD curl -f http://localhost/ || exit 1
```
```Dockerfile
SHELL ["cmd", "/S", "/C"] | При использовании команды shell например в RUN command param будет выполнена в формате cmd /S /C command param
```
```Dockerfile
LABEL <key>=<value> <key>=<value> <key>=<value> ...
```
```Dockerfile
EXPOSE 80/tcp
```
```Dockerfile
ADD <src> <dst>
```
