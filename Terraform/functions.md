[DOCS](https://developer.hashicorp.com/terraform/language/functions)


### Collections
| Функция | Назначение | Пример | Результат |
|---------|------------|--------|-----------|
| ```flatten()``` | Возвращает плоский список из списков. | flatten([[["a"]],[[], ["b", "c"]]]) | ["a", "b", "c"] |
| ```value()``` | Возвращает значения. | value(local.networks) | ["192.168.0.0/24"] |


### Strings
| Функция | Назначение | Пример | Результат |
|---------|------------|--------|-----------|
| ```format()``` | Форматирует строку, аналогично *printf* | format("Hello, %s!", var.world) | "Hello world!" |
| ```join()``` | Объединяет набор строк по указаному разделителю | join(", ", ["foo", "bar"]) | "foo, bar" |
| ```replace(string, substring, replacement)``` | Заменяет подстроку, на указанную строку. Поддерживает regex. | replace("Hello world!", "/w.*d/", "Hello") | "Hello Hello" |
| ```split(separator, string)``` | Создает список на основе разделителя | split(",", "foo,bar") | ["foo", "bar"] |
| ```substr(string, offset, length)``` | Позволяет вырезать подстроку | substr("Hello world!", 0, 5) | "Hello" |
| ```trim(string, str_character_set)``` | Удаляет указанные символы с начала и конца | trim("foobar", "far") | "oob" |
| ```trim(prefix мли suffix)()``` | Удаляет символы с начала или конца строки | trimpreffix("helloworld", "hello")<br>trimsuffix("helloworld", "world") | "world"<br>"hello" |

### Files
| Функция | Назначение | Пример | Результат |
|---------|------------|--------|-----------|
| ```abspath()``` | Возвращает абсолютный путь, то есть если путь не абсолютен, то строка будет соединена с текущим каталогом | abspath("file.txt") | /home/user/tf/file.txt |
| ```dirname()``` | Возвращает путь к директории файла. | dirname("/path/to/file.txt") | /path/to |
| ```basename()``` | Возвращает имя файла из пути. | basename("/path/to/file.txt") | file.txt |
| ```fileexists()``` | Проверяет наличие файла. | fileexists("/path/to/file.txt") | true | 
| ```fileset()``` | Возвращает список файлов исходя из шаблона | fileset(path.module, **.txt ) | files/file1.txt<br>files/file2.txt |
| ```templatefile()``` | Создает файл на основе шаблона. | templatefile("template.tftpl", {<br>url = http://api.api.com<br>user = im<br>}) | Шаблон:<br>urlPath = "${url}"<br>userId = "${user}"<br><br>Результат:<br>urlPath = http://api.api.com<br>userId = im |

### Code, encode
| Функция | Назначение | Пример | Результат |
|---------|------------|--------|-----------|
| ```base64encode()```<br>```base64decode()``` | Кодирование в формат base64<br>Декодирование base64 | base64encode("Hello World")<br>base64decode("SGVsbG8gV29ybGQ=") | SGVsbG8gV29ybGQ=<br>Hello world |

### Datetime
| Функция | Назначение | Пример | Результат |
|---------|------------|--------|-----------|
| ```timestamp()``` | Позволяет вывести временную метку UTC в формате RFC 3339 | timestamp() | 2024-12-24T13:28:17Z |
| ```formatdate()``` | Позволяет отформатировать дату | formatdate("EEE, DD:MM:YYYY/hh:mm:ss", timestamp()) | Tue, 24:12:2024/13:31:32 |
| ```timeadd()``` | Позволяет добавить или вычесть (- в начале) определённое количество времени. | timeadd(timestamp(), 1h) |  2024-12-24T14:37:54Z |
| ```timecmp(t_a, t_b)``` | Позволяет сравнить временные метки:<br>```0``` - t_a равны t_b<br>```-1``` - t_a перед t_b<br>```1``` t_a после t_b | timecmp(2024-12-24T10:00:00Z, 2024-12-24T00:00:00Z) | -1 |

### Numbers
| Функция | Назначение | Пример | Результат |
|---------|------------|--------|-----------|
| ```min()``` | Наименьшее число из набора | min(1, 2, 3) | 1 |
| ```max()``` | Наибольшее число из набора | max(1, 2, 3) | 3 |
| ```pow()``` | Возводит число в степень   | pow(3, 2)    | 3 |
| ```floor()``` | Возвращает ближайшее целое число, которое меньше или равно заданного значения | floor(4.9)<br>floor(5) | 4<br>5 |
| ```ceil()``` | Возвращает ближайщее цилое число, которое больше или равно заданного значения | ceil(4.1)<br>ceil(5) | 5<br>5 |
