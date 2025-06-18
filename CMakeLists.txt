cmake_minimum_required(VERSION 3.10)
project(cpp_project)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable testing
enable_testing()

# Fetch Crow header-only library
include(FetchContent)
FetchContent_Declare(
  crow
  GIT_REPOSITORY https://github.com/CrowCpp/Crow.git
  GIT_TAG v1.0+1 # Use stable release (can upgrade to latest)
)
FetchContent_MakeAvailable(crow)

# Add ASIO include directory manually
include_directories(${CMAKE_SOURCE_DIR}/asio/asio/include)

# Main app
add_executable(cpp_project src/main.cpp)
target_link_libraries(cpp_project PRIVATE crow)

# Tests
add_executable(test_project tests/test_main.cpp)
find_package(GTest REQUIRED)
target_link_libraries(test_project PRIVATE GTest::GTest pthread)

add_test(NAME SampleTest COMMAND test_project)