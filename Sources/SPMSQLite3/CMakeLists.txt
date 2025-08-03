# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(CPMSQLite3 INTERFACE)
target_include_directories(CPMSQLite3 INTERFACE
  ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(CPMSQLite3 INTERFACE
  SQLite::SQLite3)
if(CMAKE_SYSTEM_NAME STREQUAL OpenBSD)
  target_link_options(CPMSQLite3 INTERFACE "-L/usr/local/lib")
endif()
