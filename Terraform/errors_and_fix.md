## Изменения в файле backend.tf требуют повторной инициализации
Решение: используйте команду terraform init -reconfigure.
## В момент применения конфигурации пропала связь с бэкендом
Решение: исправьте командой terraform force-unlock LOCK_ID. 
Пример LOCK_ID: yandex_vpc_network.net
