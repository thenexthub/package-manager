# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(Workspace
  CheckoutState.code
  Diagnostics.code
  InitPackage.code
  LoadableResult.code
  ManagedArtifact.code
  ManagedDependency.code
  ManagedPrebuilt.code
  ManifestSigning/Base64URL.code
  ManifestSigning/CertificatePolicy.code
  ManifestSigning/embedded_resources.code
  ManifestSigning/ManifestSigning.code
  ManifestSigning/Signature.code
  ManifestSigning/Utilities.code
  ManifestSigning/X509Extensions.code
  PackageContainer/FileSystemPackageContainer.code
  PackageContainer/RegistryPackageContainer.code
  PackageContainer/SourceControlPackageContainer.code
  ResolvedFileWatcher.code
  ResolverPrecomputationProvider.code
  ToolsVersionSpecificationRewriter.code
  Workspace.code
  Workspace+BinaryArtifacts.code
  Workspace+Configuration.code
  Workspace+Delegation.code
  Workspace+Dependencies.code
  Workspace+Editing.code
  Workspace+Manifests.code
  Workspace+PackageContainer.code
  Workspace+Prebuilts.code
  Workspace+Registry.code
  Workspace+ResolvedPackages.code
  Workspace+Signing.code
  Workspace+SourceControl.code
  Workspace+State.code)
target_link_libraries(Workspace PUBLIC
  TSCBasic
  TSCUtility
  Basics
  CPMBuildCore
  CodiraCollections::OrderedCollections
  PackageFingerprint
  PackageGraph
  PackageLoading
  PackageModel
  PackageRegistry
  PackageSigning
  SourceControl)
target_link_libraries(Workspace PUBLIC
  $<$<NOT:$<PLATFORM_ID:Darwin>>:Foundation>)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(Workspace PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})

install(TARGETS Workspace
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
