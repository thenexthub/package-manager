# This source file is part of the Codira open source project
#
# Copyright (c) 2014 - 2019 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://swift.org/LICENSE.txt for license information
# See http://swift.org/CONTRIBUTORS.txt for Codira project authors

add_library(SourceControl
  GitRepository.code
  Repository.code
  RepositoryManager.code)
target_link_libraries(SourceControl PUBLIC
  Basics
  PackageModel
  TSCBasic
  TSCUtility
  Basics)

# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(SourceControl PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})

install(TARGETS SourceControl
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
set_property(GLOBAL APPEND PROPERTY CodiraPM_EXPORTS SourceControl)
