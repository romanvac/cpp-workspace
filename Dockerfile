FROM ubuntu:latest

# Устанавливаем нужные пакеты
RUN apt update && apt upgrade -y && \
    apt install -y \
        g++ \
        vim \
        wget \
        make \
        ninja-build \
        cmake \
        git \
        tree \
        gdb \
        sudo \
        software-properties-common \    
        gnupg \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
    
# llvm 20
RUN wget https://apt.llvm.org/llvm.sh && \
    chmod +x llvm.sh && \
    ./llvm.sh 20 all && \
    rm llvm.sh

# include-what-you-use
RUN git clone https://github.com/include-what-you-use/include-what-you-use.git /tmp/iwyu && \
    cd /tmp/iwyu && \
    git checkout clang_20 && \
    cmake -B /tmp/iwyu-build -S /tmp/iwyu -G Ninja -DCMAKE_PREFIX_PATH=/usr/lib/llvm-20 && \
    cmake --build /tmp/iwyu-build -- -j$(nproc) && \
    cmake --install /tmp/iwyu-build && \
    rm -rf /tmp/iwyu /tmp/iwyu-build    
    # cmake --build /tmp/iwyu-build && \

# boost
RUN apt update && apt install -y \
    libboost-all-dev \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# eigen
RUN apt update && \
    apt install -y libeigen3-dev && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Создаём пользователя и даём права на sudo без пароля
RUN useradd -m cppuser && \
    echo "cppuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir -p /workspace && \
    chown cppuser:cppuser /workspace

# Оболочка bash по умолчанию
RUN chsh -s /bin/bash cppuser

# Симлинки
RUN ln -s /usr/bin/clang-format-20 /usr/bin/clang-format && \
    ln -s /usr/bin/clangd-20 /usr/bin/clangd && \
    ln -s /usr/bin/clang-tidy-20 /usr/bin/clang-tidy && \
    ln -s /usr/bin/clang++-20 /usr/bin/clang++

ENV CMAKE_GENERATOR=Ninja

USER cppuser
WORKDIR /workspace