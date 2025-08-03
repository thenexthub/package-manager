# This source file is part of the Codira open source project
#
# Copyright (c) 2014 - 2021 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://codira.org/LICENSE.txt for license information
# See http://codira.org/CONTRIBUTORS.txt for Codira project authors

if(POLICY CMP0091)
  cmake_policy(SET CMP0091 NEW)
endif()

cmake_minimum_required(VERSION 3.24)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules)

project(CodiraPM LANGUAGES C Codira)

option(BUILD_SHARED_LIBS "Build shared libraries by default" YES)
option(FIND_PM_DEPS "Search for all external Package Manager dependencies" YES)

set(CMAKE_Codira_LANGUAGE_VERSION 5)
set(CMAKE_Codira_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/codira)
set(CMAKE_Codira_COMPILE_OPTIONS_MSVC_RUNTIME_LIBRARY MultiThreadedDLL)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_MSVC_RUNTIME_LIBRARY MultiThreadedDLL)
set(CMAKE_POSITION_INDEPENDENT_CODE ${BUILD_SHARED_LIBS})

if(FIND_PM_DEPS)
  find_package(CodiraSystem CONFIG REQUIRED)
  find_package(TSC CONFIG REQUIRED)

  find_package(Builra CONFIG)
  if(NOT Builra_FOUND)
    find_package(Builra REQUIRED)
  endif()

  find_package(ArgumentParser CONFIG REQUIRED)
  find_package(CodiraDriver CONFIG REQUIRED)
  find_package(CodiraCollections CONFIG REQUIRED)
  find_package(CodiraASN1 CONFIG REQUIRED)
  find_package(CodiraCertificates CONFIG REQUIRED)
  find_package(CodiraCrypto CONFIG REQUIRED)
  find_package(CodiraBuild CONFIG REQUIRED)
endif()

find_package(dispatch QUIET)
find_package(Foundation QUIET)
find_package(SQLite3 REQUIRED)

# Enable `package` modifier for the whole package.
add_compile_options("$<$<COMPILE_LANGUAGE:Codira>:SHELL:-package-name codira_package_manager>")
if(CMAKE_SYSTEM_NAME STREQUAL FreeBSD)
  link_directories(/usr/local/lib)
endif()

add_subdirectory(BuildSupport/CodiraSyntax)
add_subdirectory(Sources)
add_subdirectory(cmake/modules)
