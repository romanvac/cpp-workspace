FROM ubuntu:latest

# Устанавливаем нужные пакеты
RUN apt update && apt upgrade -y && \
    apt install -y \
    g++ \
    vim \
    clang-format-19 \
    clangd \
    make \
    cmake \
    git \
    tree \
    gdb \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Симлинк для clang-format
RUN ln -s /usr/bin/clang-format-19 /usr/bin/clang-format

# Создаём пользователя и даём права на sudo без пароля
RUN useradd -m cppuser && \
    echo "cppuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir -p /workspace && \
    chown cppuser:cppuser /workspace

# Оболочка bash по умолчанию
RUN chsh -s /bin/bash cppuser

USER cppuser
WORKDIR /workspace