```systemctl list-units --type service --all``` — просмотреть всех юниты в системе;

```systemctl reload name``` — перечитать конфигурацию;

```systemctl daemon-reload``` — перезапустить изменения в файлах модулей systemd;

```systemctl try-restart name``` — перезапустить сервис, только если он запущен;
