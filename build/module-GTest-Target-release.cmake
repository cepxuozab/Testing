########### VARIABLES #######################################################################
#############################################################################################

set(gtest_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${gtest_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${gtest_COMPILE_OPTIONS_C_RELEASE}>")

set(gtest_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${gtest_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${gtest_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${gtest_EXE_LINK_FLAGS_RELEASE}>")

set(gtest_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(gtest_FRAMEWORKS_FOUND_RELEASE "${gtest_FRAMEWORKS_RELEASE}" "${gtest_FRAMEWORK_DIRS_RELEASE}")

# Gather all the libraries that should be linked to the targets (do not touch existing variables)
set(_gtest_DEPENDENCIES_RELEASE "${gtest_FRAMEWORKS_FOUND_RELEASE} ${gtest_SYSTEM_LIBS_RELEASE} GTest::gtest;GTest::gtest;GTest::gmock")

set(gtest_LIBRARIES_TARGETS_RELEASE "") # Will be filled later
set(gtest_LIBRARIES_RELEASE "") # Will be filled later
conan_package_library_targets("${gtest_LIBS_RELEASE}"    # libraries
                              "${gtest_LIB_DIRS_RELEASE}" # package_libdir
                              "${_gtest_DEPENDENCIES_RELEASE}" # deps
                              gtest_LIBRARIES_RELEASE   # out_libraries
                              gtest_LIBRARIES_TARGETS_RELEASE  # out_libraries_targets
                              "_RELEASE"  # config_suffix
                              "gtest")    # package_name

foreach(_FRAMEWORK ${gtest_FRAMEWORKS_FOUND_RELEASE})
    list(APPEND gtest_LIBRARIES_TARGETS_RELEASE ${_FRAMEWORK})
    list(APPEND gtest_LIBRARIES_RELEASE ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${gtest_SYSTEM_LIBS_RELEASE})
    list(APPEND gtest_LIBRARIES_TARGETS_RELEASE ${_SYSTEM_LIB})
    list(APPEND gtest_LIBRARIES_RELEASE ${_SYSTEM_LIB})
endforeach()

# We need to add our requirements too
set(gtest_LIBRARIES_TARGETS_RELEASE "${gtest_LIBRARIES_TARGETS_RELEASE};GTest::gtest;GTest::gtest;GTest::gmock")
set(gtest_LIBRARIES_RELEASE "${gtest_LIBRARIES_RELEASE};GTest::gtest;GTest::gtest;GTest::gmock")

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${gtest_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH ${gtest_BUILD_DIRS_RELEASE} ${CMAKE_PREFIX_PATH})
########## COMPONENT GTest::gmock_main FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gtest_GTest_gmock_main_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gtest_GTest_gmock_main_FRAMEWORKS_FOUND_RELEASE "${gtest_GTest_gmock_main_FRAMEWORKS_RELEASE}" "${gtest_GTest_gmock_main_FRAMEWORK_DIRS_RELEASE}")

set(gtest_GTest_gmock_main_LIB_TARGETS_RELEASE "")
set(gtest_GTest_gmock_main_NOT_USED_RELEASE "")
set(gtest_GTest_gmock_main_LIBS_FRAMEWORKS_DEPS_RELEASE ${gtest_GTest_gmock_main_FRAMEWORKS_FOUND_RELEASE} ${gtest_GTest_gmock_main_SYSTEM_LIBS_RELEASE} ${gtest_GTest_gmock_main_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gtest_GTest_gmock_main_LIBS_RELEASE}"
                              "${gtest_GTest_gmock_main_LIB_DIRS_RELEASE}"
                              "${gtest_GTest_gmock_main_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gtest_GTest_gmock_main_NOT_USED_RELEASE
                              gtest_GTest_gmock_main_LIB_TARGETS_RELEASE
                              "_RELEASE"
                              "gtest_GTest_gmock_main")

set(gtest_GTest_gmock_main_LINK_LIBS_RELEASE ${gtest_GTest_gmock_main_LIB_TARGETS_RELEASE} ${gtest_GTest_gmock_main_LIBS_FRAMEWORKS_DEPS_RELEASE})
########## COMPONENT GTest::gmock FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gtest_GTest_gmock_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gtest_GTest_gmock_FRAMEWORKS_FOUND_RELEASE "${gtest_GTest_gmock_FRAMEWORKS_RELEASE}" "${gtest_GTest_gmock_FRAMEWORK_DIRS_RELEASE}")

set(gtest_GTest_gmock_LIB_TARGETS_RELEASE "")
set(gtest_GTest_gmock_NOT_USED_RELEASE "")
set(gtest_GTest_gmock_LIBS_FRAMEWORKS_DEPS_RELEASE ${gtest_GTest_gmock_FRAMEWORKS_FOUND_RELEASE} ${gtest_GTest_gmock_SYSTEM_LIBS_RELEASE} ${gtest_GTest_gmock_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gtest_GTest_gmock_LIBS_RELEASE}"
                              "${gtest_GTest_gmock_LIB_DIRS_RELEASE}"
                              "${gtest_GTest_gmock_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gtest_GTest_gmock_NOT_USED_RELEASE
                              gtest_GTest_gmock_LIB_TARGETS_RELEASE
                              "_RELEASE"
                              "gtest_GTest_gmock")

set(gtest_GTest_gmock_LINK_LIBS_RELEASE ${gtest_GTest_gmock_LIB_TARGETS_RELEASE} ${gtest_GTest_gmock_LIBS_FRAMEWORKS_DEPS_RELEASE})
########## COMPONENT GTest::gtest_main FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gtest_GTest_gtest_main_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gtest_GTest_gtest_main_FRAMEWORKS_FOUND_RELEASE "${gtest_GTest_gtest_main_FRAMEWORKS_RELEASE}" "${gtest_GTest_gtest_main_FRAMEWORK_DIRS_RELEASE}")

set(gtest_GTest_gtest_main_LIB_TARGETS_RELEASE "")
set(gtest_GTest_gtest_main_NOT_USED_RELEASE "")
set(gtest_GTest_gtest_main_LIBS_FRAMEWORKS_DEPS_RELEASE ${gtest_GTest_gtest_main_FRAMEWORKS_FOUND_RELEASE} ${gtest_GTest_gtest_main_SYSTEM_LIBS_RELEASE} ${gtest_GTest_gtest_main_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gtest_GTest_gtest_main_LIBS_RELEASE}"
                              "${gtest_GTest_gtest_main_LIB_DIRS_RELEASE}"
                              "${gtest_GTest_gtest_main_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gtest_GTest_gtest_main_NOT_USED_RELEASE
                              gtest_GTest_gtest_main_LIB_TARGETS_RELEASE
                              "_RELEASE"
                              "gtest_GTest_gtest_main")

set(gtest_GTest_gtest_main_LINK_LIBS_RELEASE ${gtest_GTest_gtest_main_LIB_TARGETS_RELEASE} ${gtest_GTest_gtest_main_LIBS_FRAMEWORKS_DEPS_RELEASE})
########## COMPONENT GTest::gtest FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(gtest_GTest_gtest_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(gtest_GTest_gtest_FRAMEWORKS_FOUND_RELEASE "${gtest_GTest_gtest_FRAMEWORKS_RELEASE}" "${gtest_GTest_gtest_FRAMEWORK_DIRS_RELEASE}")

set(gtest_GTest_gtest_LIB_TARGETS_RELEASE "")
set(gtest_GTest_gtest_NOT_USED_RELEASE "")
set(gtest_GTest_gtest_LIBS_FRAMEWORKS_DEPS_RELEASE ${gtest_GTest_gtest_FRAMEWORKS_FOUND_RELEASE} ${gtest_GTest_gtest_SYSTEM_LIBS_RELEASE} ${gtest_GTest_gtest_DEPENDENCIES_RELEASE})
conan_package_library_targets("${gtest_GTest_gtest_LIBS_RELEASE}"
                              "${gtest_GTest_gtest_LIB_DIRS_RELEASE}"
                              "${gtest_GTest_gtest_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              gtest_GTest_gtest_NOT_USED_RELEASE
                              gtest_GTest_gtest_LIB_TARGETS_RELEASE
                              "_RELEASE"
                              "gtest_GTest_gtest")

set(gtest_GTest_gtest_LINK_LIBS_RELEASE ${gtest_GTest_gtest_LIB_TARGETS_RELEASE} ${gtest_GTest_gtest_LIBS_FRAMEWORKS_DEPS_RELEASE})


########## GLOBAL TARGET PROPERTIES Release ########################################
set_property(TARGET gtest::gtest
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${gtest_OBJECTS_RELEASE}
             ${gtest_LIBRARIES_TARGETS_RELEASE}> APPEND)

set_property(TARGET gtest::gtest
             PROPERTY INTERFACE_LINK_OPTIONS
             $<$<CONFIG:Release>:${gtest_LINKER_FLAGS_RELEASE}> APPEND)
set_property(TARGET gtest::gtest
             PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Release>:${gtest_INCLUDE_DIRS_RELEASE}> APPEND)
set_property(TARGET gtest::gtest
             PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Release>:${gtest_COMPILE_DEFINITIONS_RELEASE}> APPEND)
set_property(TARGET gtest::gtest
             PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Release>:${gtest_COMPILE_OPTIONS_RELEASE}> APPEND)########## COMPONENTS TARGET PROPERTIES Release ########################################
########## COMPONENT GTest::gmock_main TARGET PROPERTIES ######################################
set_property(TARGET GTest::gmock_main PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${gtest_GTest_gmock_main_OBJECTS_RELEASE}
             ${gtest_GTest_gmock_main_LINK_LIBS_RELEASE}> APPEND)
set_property(TARGET GTest::gmock_main PROPERTY INTERFACE_LINK_OPTIONS
             $<$<CONFIG:Release>:${gtest_GTest_gmock_main_LINKER_FLAGS_RELEASE}> APPEND)
set_property(TARGET GTest::gmock_main PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Release>:${gtest_GTest_gmock_main_INCLUDE_DIRS_RELEASE}> APPEND)
set_property(TARGET GTest::gmock_main PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Release>:${gtest_GTest_gmock_main_COMPILE_DEFINITIONS_RELEASE}> APPEND)
set_property(TARGET GTest::gmock_main PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Release>:
             ${gtest_GTest_gmock_main_COMPILE_OPTIONS_C_RELEASE}
             ${gtest_GTest_gmock_main_COMPILE_OPTIONS_CXX_RELEASE}> APPEND)
set(gtest_GTest_gmock_main_TARGET_PROPERTIES TRUE)
########## COMPONENT GTest::gmock TARGET PROPERTIES ######################################
set_property(TARGET GTest::gmock PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${gtest_GTest_gmock_OBJECTS_RELEASE}
             ${gtest_GTest_gmock_LINK_LIBS_RELEASE}> APPEND)
set_property(TARGET GTest::gmock PROPERTY INTERFACE_LINK_OPTIONS
             $<$<CONFIG:Release>:${gtest_GTest_gmock_LINKER_FLAGS_RELEASE}> APPEND)
set_property(TARGET GTest::gmock PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Release>:${gtest_GTest_gmock_INCLUDE_DIRS_RELEASE}> APPEND)
set_property(TARGET GTest::gmock PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Release>:${gtest_GTest_gmock_COMPILE_DEFINITIONS_RELEASE}> APPEND)
set_property(TARGET GTest::gmock PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Release>:
             ${gtest_GTest_gmock_COMPILE_OPTIONS_C_RELEASE}
             ${gtest_GTest_gmock_COMPILE_OPTIONS_CXX_RELEASE}> APPEND)
set(gtest_GTest_gmock_TARGET_PROPERTIES TRUE)
########## COMPONENT GTest::gtest_main TARGET PROPERTIES ######################################
set_property(TARGET GTest::gtest_main PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${gtest_GTest_gtest_main_OBJECTS_RELEASE}
             ${gtest_GTest_gtest_main_LINK_LIBS_RELEASE}> APPEND)
set_property(TARGET GTest::gtest_main PROPERTY INTERFACE_LINK_OPTIONS
             $<$<CONFIG:Release>:${gtest_GTest_gtest_main_LINKER_FLAGS_RELEASE}> APPEND)
set_property(TARGET GTest::gtest_main PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Release>:${gtest_GTest_gtest_main_INCLUDE_DIRS_RELEASE}> APPEND)
set_property(TARGET GTest::gtest_main PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Release>:${gtest_GTest_gtest_main_COMPILE_DEFINITIONS_RELEASE}> APPEND)
set_property(TARGET GTest::gtest_main PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Release>:
             ${gtest_GTest_gtest_main_COMPILE_OPTIONS_C_RELEASE}
             ${gtest_GTest_gtest_main_COMPILE_OPTIONS_CXX_RELEASE}> APPEND)
set(gtest_GTest_gtest_main_TARGET_PROPERTIES TRUE)
########## COMPONENT GTest::gtest TARGET PROPERTIES ######################################
set_property(TARGET GTest::gtest PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${gtest_GTest_gtest_OBJECTS_RELEASE}
             ${gtest_GTest_gtest_LINK_LIBS_RELEASE}> APPEND)
set_property(TARGET GTest::gtest PROPERTY INTERFACE_LINK_OPTIONS
             $<$<CONFIG:Release>:${gtest_GTest_gtest_LINKER_FLAGS_RELEASE}> APPEND)
set_property(TARGET GTest::gtest PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Release>:${gtest_GTest_gtest_INCLUDE_DIRS_RELEASE}> APPEND)
set_property(TARGET GTest::gtest PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Release>:${gtest_GTest_gtest_COMPILE_DEFINITIONS_RELEASE}> APPEND)
set_property(TARGET GTest::gtest PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Release>:
             ${gtest_GTest_gtest_COMPILE_OPTIONS_C_RELEASE}
             ${gtest_GTest_gtest_COMPILE_OPTIONS_CXX_RELEASE}> APPEND)
set(gtest_GTest_gtest_TARGET_PROPERTIES TRUE)
