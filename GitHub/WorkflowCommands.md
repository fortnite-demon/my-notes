### Установка предупреждающего сообщения

```Bash
echo "::warning file=app.js,line=1,col=5,endColumn=7::Missing semicolon"
```

### Установка сообщения об ошибке
```Bash
echo "::error file=app.js,line=1,col=5,endColumn=7::Missing semicolon"
```

### Маскирует секрет при выводе в консоль
```Bash
echo "::add-mask::$SECRET_VARIABLES"
```
