# Используем официальный образ Golang как базовый
FROM golang:1.21

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем Go модули
COPY go.mod ./
COPY go.sum ./

# Скачиваем все зависимости. Если зависимости не изменились, то слой кэшируется.
RUN go mod download

# Копируем исходный код в контейнер
COPY . .

# Собираем приложение
RUN go build -o main .

# Экспонируем порт для внешнего мира
EXPOSE 8080

# Запускаем приложение
CMD ["./main"]