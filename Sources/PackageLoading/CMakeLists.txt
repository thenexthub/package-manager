# This source file is part of the Codira open source project
#
# Copyright (c) 2014 - 2023 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://swift.org/LICENSE.txt for license information
# See http://swift.org/CONTRIBUTORS.txt for Codira project authors

add_library(PackageLoading
  ContextModel.code
  Diagnostics.code
  ManifestJSONParser.code
  ManifestLoader.code
  ManifestLoader+Validation.code
  ManifestSignatureParser.code
  ModuleMapGenerator.code
  PackageBuilder.code
  PackageDescriptionSerialization.code
  Platform.code
  PkgConfig.code
  RegistryReleaseMetadataSerialization.code
  Target+PkgConfig.code
  TargetSourcesBuilder.code
  ToolsVersionParser.code)
target_link_libraries(PackageLoading PUBLIC
  TSCBasic
  Basics
  PackageModel
  TSCUtility)
target_link_libraries(PackageLoading PUBLIC
  $<$<NOT:$<PLATFORM_ID:Darwin>>:Foundation>)
target_link_libraries(PackageLoading PRIVATE
  SourceControl)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(PackageLoading PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})

install(TARGETS PackageLoading
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
set_property(GLOBAL APPEND PROPERTY CodiraPM_EXPORTS PackageLoading)
