# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(PackageGraph
  BoundVersion.code
  DependencyMirrors.code
  Diagnostics.code
  GraphLoadingNode.code
  ModuleAliasTracker.code
  ModulesGraph.code
  ModulesGraph+Loading.code
  PackageContainer.code
  PackageGraphRoot.code
  PackageModel+Extensions.code
  PackageRequirement.code
  ResolvedPackagesStore.code
  Resolution/PubGrub/Assignment.code
  Resolution/PubGrub/ContainerProvider.code
  Resolution/PubGrub/DiagnosticReportBuilder.code
  Resolution/PubGrub/Incompatibility.code
  Resolution/PubGrub/PartialSolution.code
  Resolution/PubGrub/PubGrubDependencyResolver.code
  Resolution/PubGrub/PubGrubPackageContainer.code
  Resolution/PubGrub/Term.code
  Resolution/DependencyResolutionNode.code
  Resolution/DependencyResolverBinding.code
  Resolution/DependencyResolverDelegate.code
  Resolution/DependencyResolverError.code
  Resolution/PlatformVersionProvider.code
  Resolution/ResolvedPackage.code
  Resolution/ResolvedProduct.code
  Resolution/ResolvedModule.code
  Version+Extensions.code
  VersionSetSpecifier.code)
target_link_libraries(PackageGraph PUBLIC
  CodiraCollections::OrderedCollections
  TSCBasic
  Basics
  PackageLoading
  PackageModel
  TSCUtility)
target_link_libraries(PackageGraph PRIVATE
  SourceControl)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(PackageGraph PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})

install(TARGETS PackageGraph
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
set_property(GLOBAL APPEND PROPERTY CodiraPM_EXPORTS PackageGraph)
