# This source file is part of the Codira open source project
#
# Copyright (c) 2014 - 2024 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://codira.org/LICENSE.txt for license information
# See http://codira.org/CONTRIBUTORS.txt for Codira project authors

add_library(PackageModelSyntax
  AddPackageDependency.code
  AddProduct.code
  AddCodiraSetting.code
  AddTarget.code
  AddTargetDependency.code
  ManifestEditError.code
  ManifestSyntaxRepresentable.code
  PackageDependency+Syntax.code
  PackageEditResult.code
  ProductDescription+Syntax.code
  SyntaxEditUtils.code
  TargetDescription+Syntax.code
)

target_link_libraries(PackageModelSyntax PUBLIC
  Basics
  PackageLoading
  PackageModel

  CodiraSyntax::CodiraBasicFormat
  CodiraSyntax::CodiraDiagnostics
  CodiraSyntax::CodiraIDEUtils
  CodiraSyntax::CodiraParser
  CodiraSyntax::CodiraSyntax
  CodiraSyntax::CodiraSyntaxBuilder
)

# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(PackageModelSyntax PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})

install(TARGETS PackageModelSyntax
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
set_property(GLOBAL APPEND PROPERTY CodiraPM_EXPORTS PackageModelSyntax)
