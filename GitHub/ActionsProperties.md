### pull_request_review
```github.event.review.state == 'APPROVED'``` - Проверка на аппрув

---
### workflow_run
```github.event.workflow_run.conclusion``` - Возрващает результат workflow указанного в workflow: ... (succes, failure)

---
### actions/cache
```steps.<step id>.outputs.cache-hit != 'true'``` - Позволяет проверить на успешное сохранение кеша

---
### schedule
```github.event.schedule != '30 5 * * 1,3'``` - Проверка на определённое время

---
### issue_comment
```github.event.issue.pull_request``` - Можно проверить для чего пришел комментарий для pr или issue

---
### status
```github.event.state == 'error'``` - Позволяет проверить статус коммита (error, failure, success, pending)
