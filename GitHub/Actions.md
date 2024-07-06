### Установка дефолтных значений для steps

```yaml
runs-on: ...
defaults:
  run:
    shell: ...
    working_directory: ...
```


### Установка environment для отдельных steps

```yaml
- name: step-name
  run: ...
  env:
    MY_PARAM: 12
```

### Установка env для всех

```yaml
on: ...

env:
  MY_ENV: ...
```

### Не позволит отменить задания матрицы при одной неудачи

```yaml
strategy:
  matrix:
    fail-fast: false
```
