#!/bin/bash

# Директория на хосте, которую монтируем
HOST_DIR=$(pwd)
CONTAINER_DIR="/workspace"
CONTAINER_NAME="cpp_dev_container"

# Получение UID и GID текущего пользователя хоста
CURRENT_UID=$(id -u)
CURRENT_GID=$(id -g)

# Проверяем, запущен ли контейнер
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Контейнер $CONTAINER_NAME уже запущен. Подключаемся..."
    docker exec -it \
        --user $CURRENT_UID:$CURRENT_GID \
        --workdir "$CONTAINER_DIR" \
        "$CONTAINER_NAME" \
        /bin/bash
else
    echo "Запускаем новый контейнер $CONTAINER_NAME..."
    docker run -it \
        --rm \
        --name "$CONTAINER_NAME" \
        --user $CURRENT_UID:$CURRENT_GID \
        --workdir "$CONTAINER_DIR" \
        -v "$HOST_DIR:$CONTAINER_DIR" \
        cpp_dev \
        /bin/bash
fi
