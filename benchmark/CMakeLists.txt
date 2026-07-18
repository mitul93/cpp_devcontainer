find_package(benchmark CONFIG REQUIRED)

add_executable(cpp_devcontainer_benchmark main.cpp)

target_link_libraries(cpp_devcontainer_benchmark
    PRIVATE
    benchmark::benchmark
)