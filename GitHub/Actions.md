### Установка дефолтных значений для steps

```yaml
runs-on: ...
defaults:
  run:
    shell: ...
    env: ...
    timeout-minutes: ...
```


### Установка environment для отдельных steps

```yaml
- name: step-name
  run: ...
  env:
    MY_PARAM: 12
```
