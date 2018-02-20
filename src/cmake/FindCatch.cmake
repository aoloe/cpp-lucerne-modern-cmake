# FindCatch
# ---------
#
# Locate the Catch header-only Testing Framework.
#
# Imported targets
# ^^^^^^^^^^^^^^^^
#
# This module defines the following :prop_tgt:`IMPORTED` targets:
#
# ``Catch::catch``
#
# Result variables
# ^^^^^^^^^^^^^^^^
#
# This module will set the following variables in your project:
#
# ``Catch_FOUND``
#   Found the Catch Testing framework
# ``Catch_INCLUDE_DIRS``
#   the directory containing the Catch headers
#
#
# Cache variables
# ^^^^^^^^^^^^^^^
#
# The following cache variables may also be set:
#
# ``Catch_ROOT``
#   The root directory of the Catch installation (may also be
#   set as an environment variable)
#
# Example usage
# ^^^^^^^^^^^^^
#
# ::
#
#     enable_testing()
#     find_package(Catch 2.1.2)
#
#     add_executable(foo foo.cc)
#     target_link_libraries(foo Catch::catch)
#
#     add_tests(AllTestsInFoo foo)

function(catch_add_tests executable extra_args)
    if(NOT ARGN)
        message(FATAL_ERROR "Missing ARGN: Read the documentation for CATCH_ADD_TESTS")
    endif()
    foreach(source ${ARGN})
        file(READ "${source}" contents)
        string(REGEX MATCHALL "TEST_CASE *\\( *\"([ A-Za-z_0-9]+)\" *, *\"\\[[ A-Za-z_0-9]*\\]\" *\\)" found_tests ${contents})
        foreach(hit ${found_tests})
            string(REGEX REPLACE "TEST_CASE *\\( *\"([ A-Za-z_0-9]+)\".*" "\\1" test_name ${hit})
            string(REPLACE " " "_" test_name_underscore ${test_name})
            add_test(${test_name_underscore} ${executable} ${extra_args})
        endforeach()

        # Test alternative
        string(REGEX MATCHALL "SCENARIO *\\( *\"([ A-Za-z_0-9]+)\" *, *\"\\[[ A-Za-z_0-9]*\\]\" *\\)" found_tests ${contents})
        foreach(hit ${found_tests})
            string(REGEX REPLACE "SCENARIO *\\( *\"([ A-Za-z_0-9]+)\".*" "\\1" test_name ${hit})
            string(REPLACE " " "_" test_name_underscore ${test_name})
            add_test(${test_name_underscore} ${executable} ${extra_args})
        endforeach()
    endforeach()
endfunction()


find_path(Catch_INCLUDE_DIR NAMES
    catch.hpp
    HINTS
    $ENV{Catch_ROOT}/single_include
    ${Catch_ROOT}/single_include
    $ENV{Catch_ROOT}/include
    ${Catch_ROOT}/include
    PATH_SUFFIXES catch)

if(NOT TARGET Catch::catch)
    add_library(Catch::catch INTERFACE IMPORTED)
    add_dependencies(Catch::catch catch)
    if(EXISTS "${Catch_INCLUDE_DIR}")
        set_target_properties(Catch::catch PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${Catch_INCLUDE_DIR}"
            )
    endif()
    set_target_properties(Catch::catch PROPERTIES
        INTERFACE_COMPILE_FEATURES cxx_noexcept
        INTERFACE_COMPILE_FEATURES cxx_std_11
        )
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Catch DEFAULT_MSG Catch_INCLUDE_DIR)
