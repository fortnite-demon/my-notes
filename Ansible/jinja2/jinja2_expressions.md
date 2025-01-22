### Проверка длины ports
```bash
ports|length == 10
```

### Фильтры
* ```default()``` - если переменна неопределена, то на её место будет подставлено значение ```default```

* Можем проверить result на ключ changed:
  ```yml
  - name: list files
    command:
      cmd: ls
    register: result
  
  - debug:
      msg: Fail!
    failed_when: result|changed
  ```
