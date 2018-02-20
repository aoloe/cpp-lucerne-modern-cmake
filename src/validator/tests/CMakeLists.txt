cmake_minimum_required(VERSION 3.6 FATAL_ERROR)

enable_testing(true)

# the top level directory has a a find module for catch
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../cmake)
# set(CMAKE_MODULE_PATH ${CMAKE_PROJECT_SOURCE_DIR}/cmake)

# set(Catch_ROOT ${CMAKE_PROJECT_SOURCE_DIR}/third_party/catch)
set(Catch_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../../third_party/catch)
find_package(Catch 2.1.2)

add_executable(roman-validator-unittest
    src/main.cpp
    src/validator_test.cpp
)

add_executable(roman-validator::unittest ALIAS roman-validator-unittest)

add_test(roman-validator-unittest roman-validator-unittest)

target_link_libraries(roman-validator-unittest
    PRIVATE
    Catch::catch
    roman::validator-lib
)

# unit tests are run when the ALL target is given
add_custom_target(run-roman-validator-unittest
    ALL
    roman-validator::unittest --order rand
)

add_custom_target(run-validator-junit
    roman-validator::unittest -r junit; -o ${TESTS_REPORT_DIR}/unit-tests.xml
)
