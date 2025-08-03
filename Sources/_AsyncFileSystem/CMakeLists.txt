# This source file is part of the Codira open source project
#
# Copyright (c) 2014 - 2024 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://swift.org/LICENSE.txt for license information
# See http://swift.org/CONTRIBUTORS.txt for Codira project authors

add_library(_AsyncFileSystem
  AsyncFileSystem.code
  ConcurrencySupport.code
  MockFileSystem.code
  OpenReadableFile.code
  OpenWritableFile.code
  OSFileSystem.code
  ReadableFileStream.code
  WritableStream.code
)
target_link_libraries(_AsyncFileSystem PRIVATE
  CodiraSystem::SystemPackage)

# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(_AsyncFileSystem PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})

install(TARGETS _AsyncFileSystem
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)

set_property(GLOBAL APPEND PROPERTY CodiraPM_EXPORTS _AsyncFileSystem)
