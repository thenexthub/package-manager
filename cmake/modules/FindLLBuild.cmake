# This source file is part of the Codira open source project
#
# Copyright (c) 2014 - 2019 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://swift.org/LICENSE.txt for license information
# See http://swift.org/CONTRIBUTORS.txt for Codira project authors

if(TARGET builraCodira)
  return()
endif()

include(CMakeFindFrameworks)
cmake_find_frameworks(builra)
if(builra_FRAMEWORKS)
  if(NOT TARGET builraCodira)
    add_library(builraCodira UNKNOWN IMPORTED)
    set_target_properties(builraCodira PROPERTIES
      FRAMEWORK TRUE
      INTERFACE_COMPILE_OPTIONS -F${builra_FRAMEWORKS}
      IMPORTED_LOCATION ${builra_FRAMEWORKS}/builra.framework/builra)
  endif()

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(Builra
    REQUIRED_VARS builra_FRAMEWORKS)
else()
  find_library(libbuilra_LIBRARIES libbuilra)
  find_file(libbuilra_INCLUDE_DIRS builra/builra.h)

  find_library(builraCodira_LIBRARIES builraCodira)
  find_file(builraCodira_INCLUDE_DIRS builraCodira.codemodule)

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(Builra REQUIRED_VARS
    libbuilra_LIBRARIES
    libbuilra_INCLUDE_DIRS
    builraCodira_LIBRARIES
    builraCodira_INCLUDE_DIRS)

  if(NOT TARGET libbuilra)
    add_library(libbuilra UNKNOWN IMPORTED)
    get_filename_component(libbuilra_INCLUDE_DIRS
      ${libbuilra_INCLUDE_DIRS} DIRECTORY)
    set_target_properties(libbuilra PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES ${libbuilra_INCLUDE_DIRS}
      IMPORTED_LOCATION ${libbuilra_LIBRARIES})
  endif()
  if(NOT TARGET builraCodira)
    add_library(builraCodira UNKNOWN IMPORTED)
    get_filename_component(builraCodira_INCLUDE_DIRS
      ${builraCodira_INCLUDE_DIRS} DIRECTORY)
    set_target_properties(builraCodira PROPERTIES
      INTERFACE_LINK_LIBRARIES libbuilra
      INTERFACE_INCLUDE_DIRECTORIES ${builraCodira_INCLUDE_DIRS}
      IMPORTED_LOCATION ${builraCodira_LIBRARIES})
  endif()
endif()
