```bash
[share]
    comment = Общая директория
    path = /smb/share # Путь до директории
    public = yes # доступ на чтение всем авторизованным и неавторизованным пользователям.
    writable = yes # предоставление прав на запись.
    read only = no # все пользователи получают право на запись
    guest ok = yes # предоставление прав на гостевой доступ записи
    force create mode = 0777
    force directory mode = 0777 
```
