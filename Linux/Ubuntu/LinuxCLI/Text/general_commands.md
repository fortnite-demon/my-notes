## ```stat``` - выводит информацию о файле из inode

## ```grep``` - обработка текста
  - ```-B -C```: Вывести n строчек до, а C после

## ```tail -n``` ```head -n``` - вывод с конца и начала

## ```cut``` - удаление из файла чего-то

## ```nl``` - пронумеровать строки
  - ```-w```: ширина отступа
  - ```-b <a|t|pREGEX>```: стиль нумерации, все, не пустые, регулярное выражение
  - ```-v```: начинать с n
  - ```-i```: увеличение нумерации на n

## ```uniq``` - уникальные элементы

## ```sort``` - сортировка
  - ```-k```: по указанному стоблцу или ```-k 1.6,1.7``` по символам с 6 по 7, можем добавить рядом n ```-k 2n``` (numeric sort)

## ```split``` - разделяет один файл на несколько
  - ```-b100m```: по размеру
  - ```-10```: по строкам

## ```expand``` - заменяет символы табуляции на пробелы,
  - ```-t 4```: замена табуляции на 4 пробела

## ```column``` - cделать таблицу

## ```ls``` - вывести содержимое каталога
  - ```-S```: сортировка по размеру
  - ```-t```: по дате изменения
