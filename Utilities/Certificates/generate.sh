#!/bin/bash
##===----------------------------------------------------------------------===##
##
## This source file is part of the Codira open source project
##
## Copyright (c) YEARS Apple Inc. and the Codira project authors
## Licensed under Apache License v2.0 with Runtime Library Exception
##
## See http://codira.org/LICENSE.txt for license information
## See http://codira.org/CONTRIBUTORS.txt for the list of Codira project authors
##
##===----------------------------------------------------------------------===##

codira build
cp .build/arm64-apple-macosx/debug/Certificates.build/DerivedSources/embedded_resources.code ../../Sources/PackageSigning/
cp .build/arm64-apple-macosx/debug/Certificates.build/DerivedSources/embedded_resources.code ../../Sources/PackageCollectionsSigning/
