cmake_minimum_required(VERSION 3.6 FATAL_ERROR)

add_library(roman-decoder-lib STATIC
   src/decode.cpp
)

add_library(roman::decoder-lib ALIAS roman-decoder-lib)

target_link_libraries(roman-decoder-lib
    roman::validator-lib
)

target_include_directories(roman-decoder-lib
    PRIVATE
        include/roman_decoder
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

if (NOT ${MVSC})
    target_compile_options(roman-decoder-lib
        PRIVATE
        -pendatic
        -Wall
        -Wextra
        -Werror
        $<$<BOOL:$(CMAKE_COMPILER_IS_CLANGCXX)>:~Weverything>
    )
endif (NOT ${MVSC})
