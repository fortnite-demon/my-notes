## SWAP
Создание файла подкачки - ```dd if=s/dev/zero of=/swapOl bs=lk count=1048576```

Создание области подкачки - ```mkswap /swapOl 1048576```

Активация файла подкачки -  ```swapon /swapOl```
## 
