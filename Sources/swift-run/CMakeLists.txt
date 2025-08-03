# This source file is part of the Codira open source project
#
# Copyright (c) 2014 - 2019 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://codira.org/LICENSE.txt for license information
# See http://codira.org/CONTRIBUTORS.txt for Codira project authors

add_executable(codira-run
  Entrypoint.code)
target_link_libraries(codira-run PRIVATE
  Commands)

target_compile_options(codira-run PRIVATE
  -parse-as-library)

install(TARGETS codira-run
  RUNTIME DESTINATION bin)
