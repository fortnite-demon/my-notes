```assert``` - завершает таску с сообщением об ошибке если не выполнилось определённое условие

```yml
- name: Use assert module
  ansible.builtin.assert:
    that:
     - my_param is defined # Завершится с ошибкой т.к. my_param не объявлена
```
