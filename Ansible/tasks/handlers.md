#### Для запуска обработчика сразу:
```yml
handlers:
  - name: Restart nginx
    service:
      name: nginx
      state: restarted

tasks:
  - name: restart nginx
    meta: flush_handlers
```
