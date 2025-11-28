FROM ubuntu:latest

# https://github.com/devcontainers/images/issues/1056
RUN userdel -r ubuntu || true && \
    groupmod -g 1000 somegroup || true && \
    usermod -u 1000 someuser || true

# Устанавливаем нужные пакеты
RUN apt update && apt upgrade -y && \
    apt install -y \
    g++ \
    valgrind \
    libtbb-dev \
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
    bash-completion \
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

# Симлинки
RUN ln -s /usr/bin/clang-format-20 /usr/bin/clang-format && \
    ln -s /usr/bin/clangd-20 /usr/bin/clangd && \
    ln -s /usr/bin/clang-tidy-20 /usr/bin/clang-tidy && \
    ln -s /usr/bin/clang++-20 /usr/bin/clang++

ENV CMAKE_GENERATOR=Ninja

ARG USER_UID=1000
ARG USER_GID=1000
ARG USERNAME=cppuser

RUN set -eux; \
    userdel -r ubuntu || true

RUN set -eux; \
    groupadd -g "${USER_GID}" "${USERNAME}"; \
    useradd -m -u "${USER_UID}" -g "${USER_GID}" -s /bin/bash "${USERNAME}"; \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/90-${USERNAME}; \
    chmod 0440 /etc/sudoers.d/90-${USERNAME}; \
    mkdir -p /workspace && chown -R "${USER_UID}:${USER_GID}" /workspace

WORKDIR /workspace