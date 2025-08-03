# This source file is part of the Codira open source project
#
# Copyright (c) 2014 - 2024 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://codira.org/LICENSE.txt for license information
# See http://codira.org/CONTRIBUTORS.txt for Codira project authors

add_library(QueryEngine
  CacheKey.code
  FileCacheRecord.code
  Query.code
  QueryEngine.code)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(QueryEngine PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})
target_link_libraries(QueryEngine PUBLIC
  _AsyncFileSystem
  Basics
  Crypto
  CodiraSystem::SystemPackage)
if(NOT APPLE)
  if(Foundation_FOUND)
    target_link_directories(QueryEngine PRIVATE
      $<TARGET_LINKER_FILE_DIR:Foundation>)
  endif()
endif()

install(TARGETS QueryEngine
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
