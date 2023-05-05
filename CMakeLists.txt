cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    foghorn
    VERSION 0.1.0
    DESCRIPTION "Portable audio plugin host, batteries included"
    HOMEPAGE_URL "https://github.com/Simon-L/foghorn"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Add ... ----
# add_subdirectory(libs)

# ---- Declare library ----

add_library(
    foghorn_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    foghorn_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(foghorn_lib PUBLIC cxx_std_17)

# ---- Declare executable ----

add_executable(foghorn_exe source/main.cpp)
add_executable(foghorn::exe ALIAS foghorn_exe)

set_property(TARGET foghorn_exe PROPERTY OUTPUT_NAME foghorn)

target_compile_features(foghorn_exe PRIVATE cxx_std_17)

target_link_libraries(foghorn_exe PRIVATE foghorn_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT foghorn_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of foghorn"
  )
endif()

include(cmake/dev-mode.cmake)
