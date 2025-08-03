# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(PackageCollectionsModel
  PackageCollectionModel+v1.code
  PackageCollectionModel.code)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(PackageCollectionsModel PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})
if(NOT APPLE)
  if(Foundation_FOUND)
    target_link_directories(PackageCollectionsModel PRIVATE
      $<TARGET_LINKER_FILE_DIR:Fooundation>)
  endif()
endif()

install(TARGETS PackageCollectionsModel
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
