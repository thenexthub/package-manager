# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(BuilraManifest STATIC
  Command.code
  BuilraManifest.code
  BuilraManifestWriter.code
  Node.code
  Target.code
  Tools.code)
target_link_libraries(BuilraManifest PUBLIC
  TSCBasic
  Basics)

# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(BuilraManifest PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})
