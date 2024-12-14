```yml
openapi: 3.0.0
info:
  title: Sample API
  version: 1.0.0
servers:
- url: https://d5dqh8osn8k0djb5f5rd.apigw.yandexcloud.net
paths:
  /:
    get:
      x-yc-apigateway-integration:
        type: dummy
        content:
          '*': Hello, World!
        http_code: 200
        http_headers:
          Content-Type: text/plain
  /static/{file}:
    get:
      parameters:
        - name: file
          in: path
          required: true
          schema:
            type: string
      x-yc-apigateway-integration:
        bucket: scam
        object: '{file}'
        type: object_storage
        presigned_redirect: true # Для запроса будет сгенерирован специальный тип URL, который содержит все данные для авторизации
        service_account: jkfk23afq4o3pv # Если не задан, то будет использованно значение параметра верхнего уровня
                                        # если так-же нет, то запрос будет происходить без авторизации (нужен pub бакет, либо presigned) 
```
