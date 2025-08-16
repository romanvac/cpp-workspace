#!/bin/bash
# docker rmi -f cpp_dev    # удаление

# Проверяем, существует ли контейнер (включая остановленные)
if docker ps -a --format '{{.Names}}' | grep -q "^cpp_dev_container$"; then
    echo "Останавливаем и удаляем старый контейнер cpp_dev_container..."
    docker stop cpp_dev_container 2>/dev/null
    docker rm cpp_dev_container 2>/dev/null
else
    echo "Контейнер cpp_dev_container не найден, пропускаем удаление."
fi

# Проверяем, используется ли образ в других контейнерах
if docker ps -a --filter ancestor=cpp_dev --format '{{.ID}}' | grep -q .; then
    echo "Найдены другие контейнеры, использующие образ cpp_dev. Удаляем их..."
    docker stop $(docker ps -a -q --filter ancestor=cpp_dev) 2>/dev/null
    docker rm $(docker ps -a -q --filter ancestor=cpp_dev) 2>/dev/null
fi

# Пересобираем образ (с кешем или без)
# docker build --no-cache -t cpp_dev .  # Полная пересборка
# docker build -t cpp_dev .           # С использованием кеша
echo "Начинаем пересборку образа cpp_dev..."
docker build -t cpp_dev . && echo "Образ cpp_dev успешно пересобран!" || echo "Ошибка при пересборке образа!"
