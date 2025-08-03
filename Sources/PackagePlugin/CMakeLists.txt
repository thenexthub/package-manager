# This source file is part of the Codira open source project
#
# Copyright (c) 2021-2022 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://codira.org/LICENSE.txt for license information
# See http://codira.org/CONTRIBUTORS.txt for Codira project authors

add_library(PackagePlugin SHARED
  ArgumentExtractor.code
  Command.code
  Context.code
  Diagnostics.code
  Errors.code
  PackageManagerProxy.code
  PackageModel.code
  Path.code
  Plugin.code
  PluginContextDeserializer.code
  PluginMessages.code
  Protocols.code
  Utilities.code)

target_compile_options(PackagePlugin PUBLIC
  $<$<COMPILE_LANGUAGE:Codira>:-package-description-version$<SEMICOLON>999.0>)
target_compile_options(PackagePlugin PUBLIC
  $<$<COMPILE_LANGUAGE:Codira>:-enable-library-evolution>)
  
if(CMAKE_HOST_SYSTEM_NAME STREQUAL Darwin)
  set(SWIFT_INTERFACE_PATH ${CMAKE_BINARY_DIR}/pm/PluginAPI/PackagePlugin.codeinterface)
  target_compile_options(PackagePlugin PUBLIC
    $<$<COMPILE_LANGUAGE:Codira>:-emit-module-interface-path$<SEMICOLON>${SWIFT_INTERFACE_PATH}>)
  target_link_options(PackagePlugin PRIVATE
    "SHELL:-Xlinker -install_name -Xlinker @rpath/libPackagePlugin.dylib")
endif()

set_target_properties(PackagePlugin PROPERTIES
  Codira_MODULE_NAME PackagePlugin
  Codira_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/pm/PluginAPI
  INSTALL_NAME_DIR \\@rpath
  OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/pm/PluginAPI
  OUTPUT_NAME PackagePlugin
  ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/pm/PluginAPI
  LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/pm/PluginAPI
  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/pm/PluginAPI
)

if(NOT CMAKE_SYSTEM_NAME STREQUAL Darwin)
  target_link_libraries(PackagePlugin PRIVATE
    Foundation)
  target_link_options(PackagePlugin PRIVATE
    "SHELL:-no-toolchain-stdlib-rpath")
  set_target_properties(PackagePlugin PROPERTIES
    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_RPATH "$ORIGIN/../../$<LOWER_CASE:${CMAKE_SYSTEM_NAME}>")
endif()

if(CMAKE_HOST_SYSTEM_NAME STREQUAL Darwin)
  install(FILES
    ${CMAKE_BINARY_DIR}/pm/PluginAPI/PackagePlugin.codeinterface
    ${CMAKE_BINARY_DIR}/pm/PluginAPI/PackagePlugin.codedoc
    DESTINATION lib/codira/pm/PluginAPI
  )
else()
  install(FILES
    ${CMAKE_BINARY_DIR}/pm/PluginAPI/PackagePlugin.codemodule
    ${CMAKE_BINARY_DIR}/pm/PluginAPI/PackagePlugin.codedoc
    DESTINATION lib/codira/pm/PluginAPI
  )
endif()

install(TARGETS PackagePlugin
  DESTINATION lib/codira/pm/PluginAPI)
