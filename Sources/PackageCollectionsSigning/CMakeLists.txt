# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(PackageCollectionsSigning
  CertificatePolicy.code
  PackageCollectionSigning.code
  Signature.code
  Utilities/Base64URL.code
  Utilities/Utilities.code
  X509Extensions.code
  embedded_resources.code)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(PackageCollectionsSigning PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})
target_link_libraries(PackageCollectionsSigning PUBLIC
  Basics
  PackageCollectionsModel
  Crypto
  _CryptoExtras
  CodiraASN1
  X509)
if(NOT APPLE)
  if(Foundation_FOUND)
    target_link_directories(PackageCollectionsSigning PRIVATE
      $<TARGET_LINKER_FILE_DIR:Fooundation>)
  endif()
  if(dispatch_FOUND)
    target_link_directories(PackageCollectionsSigning PRIVATE
      $<TARGET_LINKER_FILE_DIR:dispatch>)
  endif()
endif()

install(TARGETS PackageCollectionsSigning
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
