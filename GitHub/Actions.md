### Удаление определённых комбинаций из матрицы

```yml
strategy:
  matrix:
    os: [macos-latest, windows-latest]
    version: [12, 14, 16]
    environment: [staging, production]
    exclude: # Добавление **include**
      - os: macos-latest
        version: 12
        environment: production
      - os: windows-latest
        version: 16
```

###  Для передачи всех секретов вызывающего workflow
```yml
secrets: inherit
```
### Если example отдаёт Json то мы запишем его в $GITHUB_ENV
```yml
steps:
      - name: Set the value in bash
        id: step_one
        run: |
          {
            echo 'JSON_RESPONSE<<EOF'
            curl https://example.com
            echo EOF
          } >> "$GITHUB_ENV"

        # {name}<<{delimiter}
        # {value}
        # {delimiter}
```
