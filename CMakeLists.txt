# Project configuration:
cmake_minimum_required(VERSION 4.2.3)
project(HW-C LANGUAGES C VERSION 20260221)

# Defines:
set(CMAKE_C_STANDARD 90) # 90 for C89/90, 99 for C99, 11 for C11, 17 for C17 and 23 for C23.
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

# Build:
add_executable(Executable ../src/Main.c)
target_compile_options(Executable PUBLIC -fdiagnostics-color=always -Wall -Wextra -Wpedantic -Wshadow -Wconversion -Wsign-conversion -Wformat=2 -Wnull-dereference -Wstrict-prototypes -Wmissing-prototypes -Wcast-align -Wpointer-arith -Wundef -v -O3 -funroll-loops -flto -mtune=native -march=native -fPIE -pie)
set_target_properties(Executable PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
