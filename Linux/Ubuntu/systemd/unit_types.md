```service``` — отвечает за запуск сервисов (демонов) и поддерживает вызов интерпретаторов для исполнения пользовательских скриптов;

```target``` — группирует сервисы в группы, аналог runlevel;

```mount``` — монтирует файловые системы;

```automount``` — ответственен за автомонтирование файловых систем, используется при обращении к точке монтирования;

```swap``` — отвечает за подключение файла подкачки;

```timer``` — запускает модули по расписанию, аналог cron;

```socket``` — запускает модуль при подключении к сокету;

```slice``` — группирует другие модули в контейнер (дерево) cgroups;

```device``` — использует реакцию на подключение какого-либо устройства;

```path``` — запускает модуль по конкретному пути в файловой системе по событию доступа.