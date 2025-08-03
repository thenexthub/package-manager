# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(PackageCollections
  API.code
  Model/CVE.code
  Model/Collection.code
  Model/License.code
  Model/PackageList.code
  Model/PackageTypes.code
  Model/Search.code
  Model/TargetListResult.code
  PackageCollections+CertificatePolicy.code
  PackageCollections+Configuration.code
  PackageCollections+Storage.code
  PackageCollections+Validation.code
  PackageCollections.code
  PackageIndex+Configuration.code
  PackageIndex.code
  PackageIndexAndCollections.code
  Providers/GitHubPackageMetadataProvider.code
  Providers/JSONPackageCollectionProvider.code
  Providers/PackageCollectionProvider.code
  Providers/PackageMetadataProvider.code
  Storage/FilePackageCollectionsSourcesStorage.code
  Storage/PackageCollectionsSourcesStorage.code
  Storage/PackageCollectionsStorage.code
  Storage/SQLitePackageCollectionsStorage.code
  Storage/Trie.code
  Utility.code)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(PackageCollections PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})
target_link_libraries(PackageCollections PUBLIC
  Basics
  PackageCollectionsModel
  PackageCollectionsSigning
  PackageModel
  SourceControl
  TSCBasic
  TSCUtility)
if(NOT APPLE)
  if(Foundation_FOUND)
    target_link_directories(PackageCollections PRIVATE
      $<TARGET_LINKER_FILE_DIR:Fooundation>)
  endif()
  if(dispatch_FOUND)
    target_link_directories(PackageCollections PRIVATE
      $<TARGET_LINKER_FILE_DIR:Dispatch>)
  endif()
endif()

install(TARGETS PackageCollections
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
