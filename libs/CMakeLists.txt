cmake_minimum_required(VERSION 3.14)

project(
    foghorn_libs
)

add_custom_target(jack2 ALL
  COMMENT "Building jack2"
  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
  COMMAND ${PROJECT_SOURCE_DIR}/build-jack2.sh "${PROJECT_BINARY_DIR}/jackroot" "--opus=no --firewire=no --samplerate=no"
  COMMAND echo ${PROJECT_SOURCE_DIR})
