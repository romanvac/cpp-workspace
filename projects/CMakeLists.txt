cmake_minimum_required(VERSION 3.20)
project(onMyWorkspace)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 20)

# Общие настройки для всех подпроектов
# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# Явное подключение каждого проекта
add_subdirectory(CPP1_s21_matrixplus.ID_353533-1/src)
add_subdirectory(fast_test)
