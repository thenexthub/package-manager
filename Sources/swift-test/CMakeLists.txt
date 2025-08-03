# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_executable(codira-test
  Entrypoint.code)
target_link_libraries(codira-test PRIVATE
  Commands)

target_compile_options(codira-test PRIVATE
  -parse-as-library)

install(TARGETS codira-test
  RUNTIME DESTINATION bin)
