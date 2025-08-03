# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(CodiraSDKCommand
  Configuration/ConfigurationSubcommand.code
  Configuration/DeprecatedCodiraSDKConfigurationCommand.code
  Configuration/ResetConfiguration.code
  Configuration/SetConfiguration.code
  Configuration/ShowConfiguration.code
  ConfigureCodiraSDK.code
  CodiraSDKSubcommand.code
  InstallCodiraSDK.code
  ListCodiraSDKs.code
  RemoveCodiraSDK.code
  CodiraSDKCommand.code)
target_link_libraries(CodiraSDKCommand PUBLIC
  ArgumentParser
  Basics
  CoreCommands
  CPMBuildCore
  PackageModel)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(CodiraSDKCommand PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})

install(TARGETS CodiraSDKCommand
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
