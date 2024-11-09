## Общие рекомендации

**Сортируйте слои сборки**  
  - Поместите часто изменяемые слои сборки «вниз», а редко изменяемые — «вверх».
  
**Уменьшайте размер слоёв сборки:**  
  - копируйте только нужные файлы  
  - устанавливайте только необходимые зависимости  
  - минимизируйте количество слоев  
  - используйте Alpine и Slim образы  
  - используйте multi-stage builds
  
**Общие рекомендации:**  
  - создавайте stateless контейнеры  
  - разделяйте приложения по контейнерам  
  - указывайте версию базового образа  
  - правильно используйте CMD и ENTRYPOINT (например у postgres entrypoint)
  - прописывайте свои сервисы в $PATH  
  - правильно используйте ADD и COPY  
  - при возможности используйте официальные базовые образы  
  - не храните чувствительную информацию в образах  

## Примеры

**После apt update и pip install остаётся кеш, чтобы сделать сборку легче:**
```Dockerfile
...
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc \
    && rm -rf /var/lib/apt/lists/*
...
RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir -r requirements.txt
```
**Использование Alpine**
```Dockerfile
FROM python:3.12.1-alpine AS builder

# Установка системных зависимостей (в т.ч. для зависимостей python)
RUN apk update \
    && apk add --no-cache gcc musl-dev postgresql-dev

# Установка зависмостей python в диррекиторию /app/wheels
RUN --mount=type=bind,source=requirements.txt,target=/app/requirements.txt \
  pip wheel --no-cache-dir --no-deps -r /app/requirements.txt --wheel-dir /app/wheels

FROM python:3.12.1-alpine

# Копирование собранных файлов python из образа builder
COPY --from=builder /app/wheels /wheels

# Установка зависимостей, которые нужны для работы приложения
RUN apk add --no-cache libpq
# Устанавливаем зависимости python не пересобирая их
RUN pip install --no-cache --no-cache-dir /wheels/*

# Копирование кода приложения
COPY app.py /app/

WORKDIR /app

CMD ["uvicorn", "app:app", "--host", "0.0.0.0"]
```
