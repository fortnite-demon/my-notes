### Блок:
```tf
variable "my_var" {

}
```

### Аргументы:

- Краткое описание, цель переменной и ожидаемый тип значения, также можно указать, обязательно ли её указывать.
  
  ```tf
  variable "sec_group_ids" {
    description = "(Optional) - List of group IDs"
    type        = list(string)                      # Тип значения
    default     = []                                # Делает переменную необязательной
  }
  ```

- ```validation``` блок для проверки значений переменной

  ```tf
  validation {
    condition     = contains(["12", "13", "14"], var.version)
    error_message = "Allowed versions: 12, 13, 14 | NOT ${var.version}"
  }
  ```

- ```sensitive``` заменяет вывод переменной на *(sensetive value)* при использовании *terraform apply* и *plan*

- ```nullable``` контролирует, может ли быть переменной присвоено значение null

  


