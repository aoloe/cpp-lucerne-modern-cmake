cmake_minimum_required(VERSION 3.6 FATAL_ERROR)

add_library(roman-validator-lib STATIC
   src/roman_numeral_validator.cpp
)

add_library(roman::validator-lib ALIAS roman-validator-lib)

target_include_directories(roman-validator-lib
    PRIVATE
        include/roman_validator
    INTERFACE
        $<BUILD_INTERFACE:${CAMKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

if (NOT ${MVSC})
    target_compile_options(roman-validator-lib
        PRIVATE
        -pendatic
        -Wall
        -Wextra
        -Werror
        $<$<BOOL:$(CMAKE_COMPILER_IS_CLANGCXX)>:~Weverything>
    )
endif (NOT ${MSVC})
