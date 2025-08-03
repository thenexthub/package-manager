# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_compile_definitions(USE_IMPL_ONLY_IMPORTS)

add_subdirectory(_AsyncFileSystem)
add_subdirectory(Basics)
add_subdirectory(BinarySymbols)
add_subdirectory(Build)
add_subdirectory(Commands)
add_subdirectory(CompilerPluginSupport)
add_subdirectory(CoreCommands)
add_subdirectory(DriverSupport)
add_subdirectory(BuilraManifest)
add_subdirectory(PackageCollections)
add_subdirectory(PackageCollectionsModel)
add_subdirectory(PackageCollectionsSigning)
add_subdirectory(PackageDescription)
add_subdirectory(PackageFingerprint)
add_subdirectory(PackageGraph)
add_subdirectory(PackageLoading)
add_subdirectory(PackageModel)
add_subdirectory(PackageModelSyntax)
add_subdirectory(PackagePlugin)
add_subdirectory(PackageRegistry)
add_subdirectory(PackageRegistryCommand)
add_subdirectory(PackageSigning)
add_subdirectory(QueryEngine)
add_subdirectory(SourceControl)
add_subdirectory(SourceKitLSPAPI)
add_subdirectory(CPMBuildCore)
add_subdirectory(CPMBuilra)
add_subdirectory(CPMSQLite3)
add_subdirectory(CodiraFixIt)
add_subdirectory(codira-bootstrap)
add_subdirectory(codira-build)
add_subdirectory(codira-experimental-sdk)
add_subdirectory(codira-sdk)
add_subdirectory(codira-package)
add_subdirectory(codira-run)
add_subdirectory(codira-test)
add_subdirectory(CodiraSDKCommand)
add_subdirectory(Workspace)
add_subdirectory(XCBuildSupport)
add_subdirectory(CodiraBuildSupport)
add_subdirectory(tsan_utils)
