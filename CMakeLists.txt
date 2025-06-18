cmake_minimum_required(VERSION 3.10)
project(cpp_project)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON) # Enforce the standard

enable_testing()

add_executable(cpp_project src/main.cpp)

add_executable(test_project tests/test_main.cpp)

find_package(GTest REQUIRED) # Use find_package to locate GTest

target_link_libraries(test_project GTest::GTest pthread) # Link against GTest::GTest. Don't link gtest_main if your test file has main.

add_test(NAME SampleTest COMMAND test_project)