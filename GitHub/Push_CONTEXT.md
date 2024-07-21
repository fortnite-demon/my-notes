```github.<...>```  
- ```event_name``` - Имя ивента push, pull_request ...
- ```ref_name``` - Куда запушили или ```ref```
- ```actor/triggering_actor``` - Кто запушил (```event.sender.html_url``` - ссылка на него)
- ```repository``` - Репозиторий
- ```repository_owner``` - Владелец репозитория
- ```sha``` - SHA workflow

```github.event.<...>```
- ```repository.default_branch``` - Дефолтная ветка (main)
- ```after``` и ```before``` - SHA коммитов
- ```head_commit.url``` - URL к коммиту который запушили
