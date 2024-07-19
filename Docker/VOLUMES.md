```/var/lib/docker/<hash>/_data``` - Анонимный volume: ```-v /data``` (анонимный volume не сохранится после остановки контейнера)  

```/var/lib/docker/<name>/_data``` - Volume с именем: ```-v name:/data```  

Также можно в конце volume поставить разрешения на действия в контейнере:
- ```/opt/data:/container_dir:ro``` - read-only
  
И так далее
