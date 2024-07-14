```github.<...>```
- ```sha``` - SHA workflow
- ```repository``` - Название репозитория
- ```repository_owner``` - Владелец репозитория
- ```actor/triggering_actor``` - Кто запустил PR или (```event.sender.login``` а ```event.sender.html_url``` ссылка на него)
- ```base_ref/head_ref``` - Ветви (main/feature)
- ```workspace``` - Рабочий каталог  

```github.event.<...>```
- ```number``` - Номер PR
- ```pull_request.html_url``` - Ссылка на PR
- ```pull_request.merged``` - true/false
- ```pull_request.<base/head>.sha``` - Последний коммит в базовой или head ветке
- ```repository.default_branch``` - Базовая ветвь в репозитории (main)

```github.event.pull_request.<...>```
- ```changed_files``` - Количество изменённых файлов
- ```diff_url``` - Ссылка на изменения
