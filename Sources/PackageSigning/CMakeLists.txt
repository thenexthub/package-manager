# This source file is part of the Codira open source project
#
# Copyright (c) 2023 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://codira.org/LICENSE.txt for license information
# See http://codira.org/CONTRIBUTORS.txt for Codira project authors

add_library(PackageSigning STATIC
  embedded_resources.code
  CertificateStores.code
  SigningEntity/FilePackageSigningEntityStorage.code
  SigningEntity/PackageSigningEntityStorage.code
  SigningEntity/SigningEntity.code
  SignatureProvider.code
  SigningIdentity.code
  VerifierPolicies.code
  X509Extensions.code)
target_link_libraries(PackageSigning PUBLIC
  $<$<NOT:$<PLATFORM_ID:Darwin>>:Foundation>
  Basics
  Crypto
  PackageModel
  TSCBasic
  TSCUtility
  X509)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(PackageSigning PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})

set_property(GLOBAL APPEND PROPERTY CodiraPM_EXPORTS PackageSigning)
