```systemctl list-units --type service --all``` — просмотреть всех юниты в системе;

```systemctl start name, systemctl stop name, systemctl restart name``` — запустить, остановить и перезапустить сервис;

```systemctl status name``` — посмотреть статус сервиса;

```systemctl reload name``` — перечитать конфигурацию;

```systemctl daemon-reload``` — перезапустить изменения в файлах модулей systemd;

```systemctl try-restart name``` — перезапустить сервис, только если он запущен;

```systemctl enable name и systemctl disable name``` — включить и отключить автозапуск сервиса;

```systemctl list-unit-files --type service``` — посмотреть список установленных юнит-файлов сервисов.
