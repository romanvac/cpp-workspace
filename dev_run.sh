#!/bin/bash

# Директория на хосте, которую монтируем
HOST_DIR="$HOME/school21/cpp"
CONTAINER_DIR="/workspace"
CONTAINER_NAME="cpp_dev_container"

# Создаём директорию, если её нет
mkdir -p "$HOST_DIR"

# Проверяем, запущен ли контейнер
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Контейнер $CONTAINER_NAME уже запущен. Подключаемся..."
    docker exec -it \
        --user cppuser \
        --workdir "$CONTAINER_DIR" \
        "$CONTAINER_NAME" \
        /bin/bash
else
    echo "Запускаем новый контейнер $CONTAINER_NAME..."
    docker run -it \
        --rm \
        --name "$CONTAINER_NAME" \
        --user cppuser \
        --workdir "$CONTAINER_DIR" \
        -v "$HOST_DIR:$CONTAINER_DIR" \
        cpp_dev \
        /bin/bash
fi
