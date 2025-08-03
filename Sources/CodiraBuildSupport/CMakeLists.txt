# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(CodiraBuildSupport STATIC
  BuildSystem.code
  DotPIFSerializer.code
  PackagePIFBuilder.code
  PackagePIFBuilder+Helpers.code
  PackagePIFBuilder+Plugins.code
  PackagePIFProjectBuilder.code
  PackagePIFProjectBuilder+Modules.code
  PackagePIFProjectBuilder+Products.code
  PIF.code
  PIFBuilder.code
  CodiraBuildSystem.code)
target_link_libraries(CodiraBuildSupport PUBLIC
  Build
  DriverSupport
  TSCBasic
  TSCUtility
  PackageGraph
  CodiraBuild::CodiraBuild
  CodiraBuild::SWBBuildService
)

set_target_properties(CodiraBuildSupport PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})
