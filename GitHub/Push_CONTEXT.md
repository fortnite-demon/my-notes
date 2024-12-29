| Context | Description | Output |
|---------|-------------|--------|
| ```github.ref_name``` | Куда запушили, имя ветки | main |
| ```github.ref``` | Куда запушили, имя ветки | refs/head/main |
| ```github.event_name``` | Имя триггера, push, pull_request... | push |
| ```github.actor\|\|triggering_actor``` | Кто запушил | fortnite-demon |
| ```github.event.sender.html_url``` | Ссылка на того, кто запушил | https://github.com/fortnite-demon |
| ```github.repository_owner``` | Кто владеет репозиторием | fortnite-demon |
| ```github.repositoryUrl``` | URL на репозиторий | git://github.com/fortnite-demon/actions.git |
| ```github.run_id``` | Уникальный идентификатор workflow | 10238040918 |
| ```github.run_number``` | Порядковый номер запуска workflow | 14 |
| ```github.workflow``` | Имя workflow | My very beautiful workflow with pizza |
| ```github.sha``` | Хеш workflow | b66fd700ad4ed45629ed78e799... |
| ```github.event.head_commit.url``` | URL коммита который запушили | URL |
| ```github.event.after\|\|before``` | SHA after или before коммита | SHA |
| ```github.event.repository.default_branch``` | Дефолтная ветка в репозитории | main |
