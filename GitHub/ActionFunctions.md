```success()``` - Возращает true после успешного выполнения предыдущего шага

```cancelled()``` - Возвращает true если workflow был отменён

```always()``` - Возвращает true если шаг был успешным или нет

```failure()``` - True при сбое любого предыдущего шага задания

----

```contains( search, item )``` - Возвращает true или false

```fromJson( value )``` - Преобразует строку в число

```toJSON( value )``` - Преобразует в JSON

----

```hashFiles( path )``` - Отдаёт хэш файла

```startsWith( searchString, searchValue )``` - Начинается с ... аналогично с ```ends``` вместо ```starts```

```format('Hello {0} {1} {2}', 'Mona', 'the', 'Octocat')``` - Заменяет значения в string

```join( array, optionalSeparator )``` - Все значения в array объединяются в строку

----

### Фильтр: *

```JSON
{
  "scallions":
  {
    "colors": ["green", "white", "red"],
    "ediblePortions": ["roots", "stalks"],
  },
  "beets":
  {
    "colors": ["purple", "red", "gold", "white", "pink"],
    "ediblePortions": ["roots", "stems", "leaves"],
  },
  "artichokes":
  {
    "colors": ["green", "purple", "red", "black"],
    "ediblePortions": ["hearts", "stems", "leaves"],
  },
}
```

Фильтр vegetables.*.ediblePortions может вычислять:

```JSON
[
  ["roots", "stalks"],
  ["hearts", "stems", "leaves"],
  ["roots", "stems", "leaves"],
]
```






