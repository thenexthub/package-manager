# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(PackageDescription
  BuildSettings.code
  Context.code
  ContextModel.code
  LanguageStandardSettings.code
  PackageDescription.code
  PackageDescriptionSerialization.code
  PackageDescriptionSerializationConversion.code
  PackageDependency.code
  PackageDependencyTrait.code
  PackageRequirement.code
  Product.code
  Resource.code
  SupportedPlatforms.code
  Target.code
  Trait.code
  Version.code
  Version+StringLiteralConvertible.code
  WarningLevel.code)

target_compile_options(PackageDescription PUBLIC
  $<$<COMPILE_LANGUAGE:Codira>:-package-description-version$<SEMICOLON>999.0>)

if(CMAKE_HOST_SYSTEM_NAME STREQUAL Darwin)
  target_link_options(PackageDescription PRIVATE
    "SHELL:-Xlinker -install_name -Xlinker @rpath/libPackageDescription.dylib")
endif()

set_target_properties(PackageDescription PROPERTIES
    Codira_MODULE_NAME PackageDescription
    Codira_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/pm/ManifestAPI
    INSTALL_NAME_DIR \\@rpath
    OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/pm/ManifestAPI
    OUTPUT_NAME PackageDescription
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/pm/ManifestAPI
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/pm/ManifestAPI
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/pm/ManifestAPI
)

if(NOT CMAKE_SYSTEM_NAME STREQUAL Darwin)
  target_link_libraries(PackageDescription PRIVATE
    Foundation)
  target_link_options(PackageDescription PRIVATE
    "SHELL:-no-toolchain-stdlib-rpath")
  set_target_properties(PackageDescription PROPERTIES
    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_RPATH "$ORIGIN/../../$<LOWER_CASE:${CMAKE_SYSTEM_NAME}>")
endif()

install(FILES
  ${CMAKE_BINARY_DIR}/pm/ManifestAPI/PackageDescription.codemodule
  ${CMAKE_BINARY_DIR}/pm/ManifestAPI/PackageDescription.codedoc
  DESTINATION lib/swift/pm/ManifestAPI
)

install(TARGETS PackageDescription
  DESTINATION lib/swift/pm/ManifestAPI)
