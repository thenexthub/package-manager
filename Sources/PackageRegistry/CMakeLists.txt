# This source file is part of the Codira open source project
#
# Copyright (c) 2021-2023 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://codira.org/LICENSE.txt for license information
# See http://codira.org/CONTRIBUTORS.txt for Codira project authors

add_library(PackageRegistry STATIC
  ChecksumTOFU.code  
  RegistryConfiguration.code
  RegistryClient.code
  RegistryDownloadsManager.code
  SignatureValidation.code
  SigningEntityTOFU.code)
target_link_libraries(PackageRegistry PUBLIC
  Basics
  PackageFingerprint
  PackageLoading
  PackageModel
  PackageSigning
  TSCBasic
  TSCUtility)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(PackageRegistry PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})
