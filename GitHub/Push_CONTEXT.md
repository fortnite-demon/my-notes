| Context | Description | Output |
|---------|-------------|--------|
| ```github.event_name``` | Имя триггера, push, pull_request... | push |
| ```github.workflow``` | Имя workflow | My very beautiful workflow with pizza |
| ```github.ref``` | Полная ссылка на ветку или тег | refs/heads/main<br>/refs/tags/v1.0.0 |
| ```github.ref_name``` | Куда запушили, имя ветки | main |
| ```github.actor``` | Кто запушил | fortnite-demon |
| ```github.event.sender.html_url``` | Ссылка на того, кто запушил | https://github.com/fortnite-demon |
| ```github.event.head_commit.url``` | URL коммита который запушили | URL |
| ```github.triggering_actor``` | Кто непосредственно запустил при помощи ```workflow_dispatch``` | fortnite-demon |
| ```github.repository_owner``` | Кто владеет репозиторием | fortnite-demon |
| ```github.repositoryUrl``` | URL на репозиторий | git://github.com/fortnite-demon/actions.git |
| ```github.run_id``` | Уникальный идентификатор workflow | 10238040918 |
| ```github.run_number``` | Порядковый номер запуска workflow | 14 |
| ```github.sha``` | Хеш workflow | b66fd700ad4ed45629ed78e799... |
| ```github.event.after\|\|before``` | SHA after (коммита до события) и before (после события) | SHA |
| ```github.event.repository.default_branch``` | Дефолтная ветка в репозитории | main |
