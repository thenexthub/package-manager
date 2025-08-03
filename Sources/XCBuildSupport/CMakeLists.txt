# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(XCBuildSupport STATIC
  PIF.code
  PIFBuilder.code
  XCBuildDelegate.code
  XCBuildMessage.code
  XCBuildOutputParser.code
  XcodeBuildSystem.code)
target_link_libraries(XCBuildSupport PUBLIC
  Build
  DriverSupport
  TSCBasic
  TSCUtility
  CodiraCollections::OrderedCollections
  PackageGraph
)

set_target_properties(XCBuildSupport PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})
