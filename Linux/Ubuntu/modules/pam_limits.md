*Ограничение на ресуры, защита от DoS*
## /etc/security/limits.conf
```
<домен> <тип> <ресурс> <значение>
*       hard  maxlogin     3
@ssh_users hard nproc      5
@ssh_users soft fsize    24000
```

hard - Нельзя привысить  
soft - можно  

```core``` - Позволяет ограничить размер файла ядра (в килобайтах)  

```cpu``` - Задает максимальное процессорное время (в минутах)   

```data``` - Определяет максимальный размер сегмента данных (в килобайтах)  

```fsize``` - Позволяет указать максимальный размер файла (в килобайтах)  

```maxlogins``` - Определяет максимальное количество параллельных регистраций пользователя. По умолчанию пользователю разрешается 
войти неограниченное количество раз разными способами - по SSH, FTP, с разных консолей и т.д.  

```nofile``` - Задает максимальное число одновременно открытых файлов  

```nproc``` - Определяет число процессов, которые может запустить пользователь  

```priority``` - Задает приоритет, с которым будут выполняться процессы пользователя или группы.  

```stack``` - Максимальный размер стека (в килобайтах) 
