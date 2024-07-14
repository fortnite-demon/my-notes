```github.<...>```
- ```sha``` - SHA workflow
- ```repository``` - Название репозитория
- ```repository_owner``` - Владелец репозитория
- ```actor/triggering_actor``` - Кто запустил PR или (```event.sender.login``` а ```event.sender.html_url``` ссылка на него)
- ```base_ref/head_ref``` - Ветви (main/feature)
- ```workspace``` - Рабочий каталог  

```github.event.<...>```
- ```number``` - Номер PR
- ```repository.default_branch``` - Базовая ветвь в репозитории (main)
- ```sender.html_url/login``` - Кто отправил PR или имя

```github.event.pull_request.<...>```
- ```base.repo.default_branch``` - Базовая ветка в base, также c head
- ```head.repo.html_url``` - Ссылка на форк репозитория
- ```head.repo.full_name``` - Имя форк репозитория
- ```head.repo.owner.html_url/login``` - Ссылка или имя владельца форк репозитория
- ```changed_files``` - Количество изменённых файлов
- ```html_url``` - Ссылка на PR
- ```diff_url``` - Ссылка на изменения
- ```merged``` - true/false
- ```body``` - Description PR
- ```<base/head>.sha``` - Последний коммит в базовой или head ветке
