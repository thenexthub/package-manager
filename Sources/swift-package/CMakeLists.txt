# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_executable(swift-package
  Entrypoint.code)
target_link_libraries(swift-package PRIVATE
  Commands
  TSCBasic)

target_compile_options(swift-package PRIVATE
  -parse-as-library)

install(TARGETS swift-package
  RUNTIME DESTINATION bin)
