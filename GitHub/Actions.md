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
