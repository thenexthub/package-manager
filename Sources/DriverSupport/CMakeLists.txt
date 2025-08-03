# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(DriverSupport
  DriverSupportUtils.code
  CPMCodiraDriverExecutor.code)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(DriverSupport PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})
target_link_libraries(DriverSupport PUBLIC
  Basics
  PackageModel
  CodiraDriver)

install(TARGETS DriverSupport
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
set_property(GLOBAL APPEND PROPERTY CodiraPM_EXPORTS DriverSupport)
