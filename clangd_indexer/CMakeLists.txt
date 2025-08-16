cmake_minimum_required(VERSION 3.10)
project(clangd_indexer)

set(CMAKE_CXX_STANDARD 20)

# Список проектов
set(PROJECTS
    CPP1_s21_matrixplus.ID_353533-1
    fast_test
    # another_project
)

foreach(P ${PROJECTS})
    # set(PACKAGE_DIR "projects/${CMAKE_SOURCE_DIR}/../${P}")
    set(PACKAGE_DIR "${CMAKE_SOURCE_DIR}/../projects/${P}")

    if(EXISTS "${PACKAGE_DIR}/src")
        message(STATUS "Добавляю проект: ${P}")
        include_directories(
            ${PACKAGE_DIR}/src/include
            ${PACKAGE_DIR}/src
        )
        file(GLOB_RECURSE PROJECT_SOURCES
            ${PACKAGE_DIR}/src/*.cpp
        )
        add_executable(dummy_${P} ${PROJECT_SOURCES})
    else()
        message(WARNING "Пропущен: ${P} (нет папки src)")
    endif()
endforeach()