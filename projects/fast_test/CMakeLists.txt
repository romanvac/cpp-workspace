cmake_minimum_required(VERSION 3.20)
project(fast_test)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Eigen3 3.3 REQUIRED NO_MODULE)
find_package(TBB REQUIRED)
find_package(Boost 1.70 REQUIRED COMPONENTS filesystem system thread)

set(SOURCES
    src/main.cpp
)

add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME} PRIVATE src)

target_link_libraries(${PROJECT_NAME} PUBLIC 
    Eigen3::Eigen 
    TBB::tbb
    Boost::filesystem 
    Boost::system
    Boost::thread
)