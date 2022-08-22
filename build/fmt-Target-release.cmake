########### VARIABLES #######################################################################
#############################################################################################

set(fmt_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${fmt_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${fmt_COMPILE_OPTIONS_C_RELEASE}>")

set(fmt_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${fmt_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${fmt_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${fmt_EXE_LINK_FLAGS_RELEASE}>")

set(fmt_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(fmt_FRAMEWORKS_FOUND_RELEASE "${fmt_FRAMEWORKS_RELEASE}" "${fmt_FRAMEWORK_DIRS_RELEASE}")

# Gather all the libraries that should be linked to the targets (do not touch existing variables)
set(_fmt_DEPENDENCIES_RELEASE "${fmt_FRAMEWORKS_FOUND_RELEASE} ${fmt_SYSTEM_LIBS_RELEASE} ")

set(fmt_LIBRARIES_TARGETS_RELEASE "") # Will be filled later
set(fmt_LIBRARIES_RELEASE "") # Will be filled later
conan_package_library_targets("${fmt_LIBS_RELEASE}"    # libraries
                              "${fmt_LIB_DIRS_RELEASE}" # package_libdir
                              "${_fmt_DEPENDENCIES_RELEASE}" # deps
                              fmt_LIBRARIES_RELEASE   # out_libraries
                              fmt_LIBRARIES_TARGETS_RELEASE  # out_libraries_targets
                              "_RELEASE"  # config_suffix
                              "fmt")    # package_name

foreach(_FRAMEWORK ${fmt_FRAMEWORKS_FOUND_RELEASE})
    list(APPEND fmt_LIBRARIES_TARGETS_RELEASE ${_FRAMEWORK})
    list(APPEND fmt_LIBRARIES_RELEASE ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${fmt_SYSTEM_LIBS_RELEASE})
    list(APPEND fmt_LIBRARIES_TARGETS_RELEASE ${_SYSTEM_LIB})
    list(APPEND fmt_LIBRARIES_RELEASE ${_SYSTEM_LIB})
endforeach()

# We need to add our requirements too
set(fmt_LIBRARIES_TARGETS_RELEASE "${fmt_LIBRARIES_TARGETS_RELEASE};")
set(fmt_LIBRARIES_RELEASE "${fmt_LIBRARIES_RELEASE};")

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${fmt_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH ${fmt_BUILD_DIRS_RELEASE} ${CMAKE_PREFIX_PATH})
########## COMPONENT fmt::fmt FIND LIBRARIES & FRAMEWORKS / DYNAMIC VARS #############

set(fmt_fmt_fmt_FRAMEWORKS_FOUND_RELEASE "")
conan_find_apple_frameworks(fmt_fmt_fmt_FRAMEWORKS_FOUND_RELEASE "${fmt_fmt_fmt_FRAMEWORKS_RELEASE}" "${fmt_fmt_fmt_FRAMEWORK_DIRS_RELEASE}")

set(fmt_fmt_fmt_LIB_TARGETS_RELEASE "")
set(fmt_fmt_fmt_NOT_USED_RELEASE "")
set(fmt_fmt_fmt_LIBS_FRAMEWORKS_DEPS_RELEASE ${fmt_fmt_fmt_FRAMEWORKS_FOUND_RELEASE} ${fmt_fmt_fmt_SYSTEM_LIBS_RELEASE} ${fmt_fmt_fmt_DEPENDENCIES_RELEASE})
conan_package_library_targets("${fmt_fmt_fmt_LIBS_RELEASE}"
                              "${fmt_fmt_fmt_LIB_DIRS_RELEASE}"
                              "${fmt_fmt_fmt_LIBS_FRAMEWORKS_DEPS_RELEASE}"
                              fmt_fmt_fmt_NOT_USED_RELEASE
                              fmt_fmt_fmt_LIB_TARGETS_RELEASE
                              "_RELEASE"
                              "fmt_fmt_fmt")

set(fmt_fmt_fmt_LINK_LIBS_RELEASE ${fmt_fmt_fmt_LIB_TARGETS_RELEASE} ${fmt_fmt_fmt_LIBS_FRAMEWORKS_DEPS_RELEASE})


########## GLOBAL TARGET PROPERTIES Release ########################################
set_property(TARGET fmt::fmt
             PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${fmt_OBJECTS_RELEASE}
             ${fmt_LIBRARIES_TARGETS_RELEASE}> APPEND)

set_property(TARGET fmt::fmt
             PROPERTY INTERFACE_LINK_OPTIONS
             $<$<CONFIG:Release>:${fmt_LINKER_FLAGS_RELEASE}> APPEND)
set_property(TARGET fmt::fmt
             PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Release>:${fmt_INCLUDE_DIRS_RELEASE}> APPEND)
set_property(TARGET fmt::fmt
             PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Release>:${fmt_COMPILE_DEFINITIONS_RELEASE}> APPEND)
set_property(TARGET fmt::fmt
             PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Release>:${fmt_COMPILE_OPTIONS_RELEASE}> APPEND)########## COMPONENTS TARGET PROPERTIES Release ########################################
########## COMPONENT fmt::fmt TARGET PROPERTIES ######################################
set_property(TARGET fmt::fmt PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${fmt_fmt_fmt_OBJECTS_RELEASE}
             ${fmt_fmt_fmt_LINK_LIBS_RELEASE}> APPEND)
set_property(TARGET fmt::fmt PROPERTY INTERFACE_LINK_OPTIONS
             $<$<CONFIG:Release>:${fmt_fmt_fmt_LINKER_FLAGS_RELEASE}> APPEND)
set_property(TARGET fmt::fmt PROPERTY INTERFACE_INCLUDE_DIRECTORIES
             $<$<CONFIG:Release>:${fmt_fmt_fmt_INCLUDE_DIRS_RELEASE}> APPEND)
set_property(TARGET fmt::fmt PROPERTY INTERFACE_COMPILE_DEFINITIONS
             $<$<CONFIG:Release>:${fmt_fmt_fmt_COMPILE_DEFINITIONS_RELEASE}> APPEND)
set_property(TARGET fmt::fmt PROPERTY INTERFACE_COMPILE_OPTIONS
             $<$<CONFIG:Release>:
             ${fmt_fmt_fmt_COMPILE_OPTIONS_C_RELEASE}
             ${fmt_fmt_fmt_COMPILE_OPTIONS_CXX_RELEASE}> APPEND)
set(fmt_fmt_fmt_TARGET_PROPERTIES TRUE)
