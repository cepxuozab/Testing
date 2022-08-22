########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND fmt_COMPONENT_NAMES fmt::fmt)
list(REMOVE_DUPLICATES fmt_COMPONENT_NAMES)
set(fmt_FIND_DEPENDENCY_NAMES "")

########### VARIABLES #######################################################################
#############################################################################################
set(fmt_PACKAGE_FOLDER_RELEASE "C:/Users/Dell/.conan/data/fmt/8.1.1/_/_/package/8c0a53bc9b0a08b9311ca89254091ba7fb4f89b4")
set(fmt_INCLUDE_DIRS_RELEASE "${fmt_PACKAGE_FOLDER_RELEASE}/include")
set(fmt_RES_DIRS_RELEASE )
set(fmt_DEFINITIONS_RELEASE )
set(fmt_SHARED_LINK_FLAGS_RELEASE )
set(fmt_EXE_LINK_FLAGS_RELEASE )
set(fmt_OBJECTS_RELEASE )
set(fmt_COMPILE_DEFINITIONS_RELEASE )
set(fmt_COMPILE_OPTIONS_C_RELEASE )
set(fmt_COMPILE_OPTIONS_CXX_RELEASE )
set(fmt_LIB_DIRS_RELEASE "${fmt_PACKAGE_FOLDER_RELEASE}/lib")
set(fmt_LIBS_RELEASE fmt)
set(fmt_SYSTEM_LIBS_RELEASE )
set(fmt_FRAMEWORK_DIRS_RELEASE )
set(fmt_FRAMEWORKS_RELEASE )
set(fmt_BUILD_MODULES_PATHS_RELEASE )
set(fmt_BUILD_DIRS_RELEASE )

set(fmt_COMPONENTS_RELEASE fmt::fmt)
########### COMPONENT fmt::fmt VARIABLES #############################################
set(fmt_fmt_fmt_INCLUDE_DIRS_RELEASE "${fmt_PACKAGE_FOLDER_RELEASE}/include")
set(fmt_fmt_fmt_LIB_DIRS_RELEASE "${fmt_PACKAGE_FOLDER_RELEASE}/lib")
set(fmt_fmt_fmt_RES_DIRS_RELEASE )
set(fmt_fmt_fmt_DEFINITIONS_RELEASE )
set(fmt_fmt_fmt_OBJECTS_RELEASE )
set(fmt_fmt_fmt_COMPILE_DEFINITIONS_RELEASE )
set(fmt_fmt_fmt_COMPILE_OPTIONS_C_RELEASE "")
set(fmt_fmt_fmt_COMPILE_OPTIONS_CXX_RELEASE "")
set(fmt_fmt_fmt_LIBS_RELEASE fmt)
set(fmt_fmt_fmt_SYSTEM_LIBS_RELEASE )
set(fmt_fmt_fmt_FRAMEWORK_DIRS_RELEASE )
set(fmt_fmt_fmt_FRAMEWORKS_RELEASE )
set(fmt_fmt_fmt_DEPENDENCIES_RELEASE )
set(fmt_fmt_fmt_SHARED_LINK_FLAGS_RELEASE )
set(fmt_fmt_fmt_EXE_LINK_FLAGS_RELEASE )
set(fmt_fmt_fmt_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${fmt_fmt_fmt_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${fmt_fmt_fmt_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${fmt_fmt_fmt_EXE_LINK_FLAGS_RELEASE}>
)
list(APPEND fmt_BUILD_MODULES_PATHS_RELEASE )