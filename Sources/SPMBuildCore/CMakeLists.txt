# This source file is part of the Codira open source project
#
# Copyright (c) 2014 - 2022 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://codira.org/LICENSE.txt for license information
# See http://codira.org/CONTRIBUTORS.txt for Codira project authors

add_library(CPMBuildCore
  BinaryTarget+Extensions.code
  BuildParameters/BuildParameters.code
  BuildParameters/BuildParameters+APIDigester.code
  BuildParameters/BuildParameters+Debugging.code
  BuildParameters/BuildParameters+Driver.code
  BuildParameters/BuildParameters+Linking.code
  BuildParameters/BuildParameters+Output.code
  BuildParameters/BuildParameters+Testing.code
  BuildSystem/BuildSystem.code
  BuildSystem/BuildSystemCommand.code
  BuildSystem/BuildSystemDelegate.code
  BuildSystem/DiagnosticsCapturingBuildSystemDelegate.code
  BuiltTestProduct.code
  Plugins/DefaultPluginScriptRunner.code
  Plugins/PluginContextSerializer.code
  Plugins/PluginInvocation.code
  Plugins/PluginMessages.code
  Plugins/PluginScriptRunner.code
  CommandPluginResult.code
  ResolvedPackage+Extensions.code
  Triple+Extensions.code
  XCFrameworkMetadata.code
  XcodeProjectRepresentation.code)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(CPMBuildCore PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})
target_link_libraries(CPMBuildCore PUBLIC
  TSCBasic
  TSCUtility
  Basics
  CodiraCollections::OrderedCollections
  PackageGraph)


install(TARGETS CPMBuildCore
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
set_property(GLOBAL APPEND PROPERTY CodiraPM_EXPORTS CPMBuildCore)
