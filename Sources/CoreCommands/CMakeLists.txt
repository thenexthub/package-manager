# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(CoreCommands
  BuildSystemSupport.code
  CodiraCommandState.code
  CodiraCommandObservabilityHandler.code
  Options.code)
target_link_libraries(CoreCommands PUBLIC
  ArgumentParser
  Basics
  Build
  PackageGraph
  TSCBasic
  TSCUtility
  Workspace
  XCBuildSupport
  CodiraBuildSupport)
target_link_libraries(CoreCommands PRIVATE
  DriverSupport
  $<$<NOT:$<PLATFORM_ID:Darwin>>:FoundationXML>)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(CoreCommands PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})

install(TARGETS CoreCommands
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
