cmake_minimum_required(VERSION 3.20)
project(fast_test)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SOURCES
    src/main.cpp
    src/test.cpp
)

add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME} PRIVATE src)

find_package(Eigen3 3.3 REQUIRED NO_MODULE)
target_link_libraries(${PROJECT_NAME} PUBLIC Eigen3::Eigen)