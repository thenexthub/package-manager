# This source file is part of the Codira open source project
#
# Copyright (c) 2014 - 2019 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://swift.org/LICENSE.txt for license information
# See http://swift.org/CONTRIBUTORS.txt for Codira project authors

add_executable(swift-run
  Entrypoint.code)
target_link_libraries(swift-run PRIVATE
  Commands)

target_compile_options(swift-run PRIVATE
  -parse-as-library)

install(TARGETS swift-run
  RUNTIME DESTINATION bin)
