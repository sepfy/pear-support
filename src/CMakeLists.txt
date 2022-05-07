cmake_minimum_required(VERSION 3.1)
project(webrtc-camera)

file(GLOB SRCS "*.c")

find_package(PkgConfig)
pkg_check_modules(GLIB REQUIRED glib-2.0)
pkg_check_modules(GST REQUIRED gstreamer-1.0>=1.4 gstreamer-base-1.0>=1.4)

set(PEAR_ROOT_DIR ${CMAKE_SOURCE_DIR}/third_party/pear)

include_directories(
  ${PEAR_ROOT_DIR}/src 
  ${PEAR_ROOT_DIR}/third_party/libnice/agent
  ${PEAR_ROOT_DIR}/third_party/libsrtp/include
  ${GST_INCLUDE_DIRS}
)


link_directories(
  ${PEAR_ROOT_DIR}/third_party/libnice/builddir/nice/
  ${PEAR_ROOT_DIR}/third_party/libsrtp/build/
  ${PEAR_ROOT_DIR}/cmake/src
  ${PEAR_ROOT_DIR}/third_party/cJSON
)

add_executable(webrtc-camera ${SRCS})

set(TARGET_LIBS "glib-2.0" "ssl" "crypto" "nice" "srtp2" "cjson" "pthread")
target_link_libraries(webrtc-camera pear ${TARGET_LIBS} ${GST_LIBRARIES})

