#!/bin/bash

# Получаем UID и GID текущего пользователя
CURRENT_UID=$(id -u)
CURRENT_GID=$(id -g)
IMAGE_NAME="cpp_dev"
CONTAINER_NAME="cpp_dev_container"

# Проверяем, существует ли контейнер (включая остановленные)
if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "Останавливаем и удаляем старый контейнер ${CONTAINER_NAME}..."
    docker stop "$CONTAINER_NAME" 2>/dev/null
    docker rm "$CONTAINER_NAME" 2>/dev/null
else
    echo "Контейнер ${CONTAINER_NAME} не найден, пропускаем удаление."
fi

# Проверяем, используется ли образ в других контейнерах
if docker ps -a --filter ancestor="$IMAGE_NAME" --format '{{.ID}}' | grep -q .; then
    echo "Найдены другие контейнеры, использующие образ $IMAGE_NAME. Удаляем их..."
    docker stop $(docker ps -a -q --filter ancestor="$IMAGE_NAME") 2>/dev/null
    docker rm $(docker ps -a -q --filter ancestor="$IMAGE_NAME") 2>/dev/null
fi

# Пересобираем образ с передачей UID/GID
echo "Начинаем пересборку образа $IMAGE_NAME"
docker build \
    --build-arg USER_UID="$CURRENT_UID" \
    --build-arg USER_GID="$CURRENT_GID" \
    --build-arg USERNAME="cppuser" \
    -t "$IMAGE_NAME" . 

if [ $? -eq 0 ]; then
    echo "Образ $IMAGE_NAME успешно пересобран"
else
    echo "Ошибка при пересборке образа"
    exit 1
fi