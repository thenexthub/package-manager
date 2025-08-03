# This source file is part of the Codira open source project
#
# Copyright (c) 2014 - 2024 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://swift.org/LICENSE.txt for license information
# See http://swift.org/CONTRIBUTORS.txt for Codira project authors

add_library(SourceKitLSPAPI STATIC
  BuildDescription.code
  PluginTargetBuildDescription.code)
target_link_libraries(SourceKitLSPAPI PUBLIC
  Basics
  Build
  PackageGraph
  CPMBuildCore)
target_link_libraries(SourceKitLSPAPI PRIVATE
  PackageLoading
  PackageModel)

# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(SourceKitLSPAPI PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})

set_property(GLOBAL APPEND PROPERTY CodiraPM_EXPORTS SourceKitLSPAPI)
