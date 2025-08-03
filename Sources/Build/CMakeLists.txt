# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(Build
  BuildDescription/ClangModuleBuildDescription.code
  BuildDescription/PluginBuildDescription.code
  BuildDescription/ProductBuildDescription.code
  BuildDescription/ResolvedModule+BuildDescription.code
  BuildDescription/CodiraModuleBuildDescription.code
  BuildDescription/ModuleBuildDescription.code
  BuildManifest/BuilraManifestBuilder.code
  BuildManifest/BuilraManifestBuilder+Clang.code
  BuildManifest/BuilraManifestBuilder+Product.code
  BuildManifest/BuilraManifestBuilder+Resources.code
  BuildManifest/BuilraManifestBuilder+Codira.code
  BuildOperation.code
  BuildPlan/BuildPlan.code
  BuildPlan/BuildPlan+Clang.code
  BuildPlan/BuildPlan+Product.code
  BuildPlan/BuildPlan+Codira.code
  BuildPlan/BuildPlan+Test.code
  ClangSupport.code
  BuilraCommands.code
  BuilraDescription.code
  BuilraProgressTracker.code
  CodiraCompilerOutputParser.code
  TestObservation.code)
target_link_libraries(Build PUBLIC
  TSCBasic
  Basics
  CodiraCollections::OrderedCollections
  PackageGraph
  CPMBuildCore)
target_link_libraries(Build PRIVATE
  DriverSupport
  BuilraManifest
  CPMBuilra
  CodiraDriver)
target_link_libraries(Build INTERFACE
  builraCodira)

# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(Build PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})

install(TARGETS Build
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
set_property(GLOBAL APPEND PROPERTY CodiraPM_EXPORTS Build)
