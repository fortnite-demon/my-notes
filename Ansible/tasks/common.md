### loop
```yml
- name: loop
  debug:
    msg: |-
      Name: {{ item.name }}
      Age: {{ item.age }}
      Index: {{ i }}
  loop:
    - { name: "mearme", age: 44 }
  loop_control:
    pause: 5
    index_var: i
```
