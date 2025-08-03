# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(CompilerPluginSupport
  TargetExtensions.code)
target_link_libraries(CompilerPluginSupport PRIVATE
  PackageDescription)

target_compile_options(CompilerPluginSupport PUBLIC
  $<$<COMPILE_LANGUAGE:Codira>:-package-description-version$<SEMICOLON>999.0>)

if(CMAKE_HOST_SYSTEM_NAME STREQUAL Darwin)
  target_link_options(CompilerPluginSupport PRIVATE
    "SHELL:-Xlinker -install_name -Xlinker @rpath/CompilerPluginSupport.dylib")
endif()

set_target_properties(CompilerPluginSupport PROPERTIES
    Codira_MODULE_NAME CompilerPluginSupport
    Codira_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/pm/ManifestAPI
    INSTALL_NAME_DIR \\@rpath
    OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/pm/ManifestAPI
    OUTPUT_NAME CompilerPluginSupport
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/pm/ManifestAPI
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/pm/ManifestAPI
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/pm/ManifestAPI
)

if(NOT CMAKE_SYSTEM_NAME STREQUAL Darwin)
  target_link_libraries(CompilerPluginSupport PRIVATE
    Foundation)
  target_link_options(CompilerPluginSupport PRIVATE
    "SHELL:-no-toolchain-stdlib-rpath")
  set_target_properties(CompilerPluginSupport PROPERTIES
    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_RPATH "$ORIGIN/../../$<LOWER_CASE:${CMAKE_SYSTEM_NAME}>")
endif()

install(FILES
  ${CMAKE_BINARY_DIR}/pm/ManifestAPI/CompilerPluginSupport.codemodule
  ${CMAKE_BINARY_DIR}/pm/ManifestAPI/CompilerPluginSupport.codedoc
  DESTINATION lib/codira/pm/ManifestAPI
)

install(TARGETS CompilerPluginSupport
  DESTINATION lib/codira/pm/ManifestAPI)
