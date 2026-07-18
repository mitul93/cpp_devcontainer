cmake_minimum_required(VERSION 3.16)

if(DEFINED ENV{VCPKG_ROOT} AND NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
        CACHE STRING "Vcpkg toolchain file")
endif()

set(CMAKE_CXX_COMPILER clang++)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(cpp_devcontainer LANGUAGES CXX)

# --- toggle for benchmarks ---
option(BUILD_BENCHMARKS "Build the benchmark suite" OFF)

add_subdirectory(example/hello_world)

if(BUILD_BENCHMARKS)
    add_subdirectory(benchmark)
endif()