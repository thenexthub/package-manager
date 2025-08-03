# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(Basics
  Archiver/Archiver.code
  Archiver/TarArchiver.code
  Archiver/ZipArchiver.code
  Archiver/UniversalArchiver.code
  AuthorizationProvider.code
  Cancellator.code
  Collections/ByteString+Extensions.code
  Collections/Dictionary+Extensions.code
  Collections/IdentifiableSet.code
  Collections/String+Extensions.code
  Concurrency/AsyncProcess.code
  Concurrency/ConcurrencyHelpers.code
  Concurrency/NSLock+Extensions.code
  Concurrency/SendableBox.code
  Concurrency/ThreadSafeArrayStore.code
  Concurrency/ThreadSafeBox.code
  Concurrency/ThreadSafeKeyValueStore.code
  Concurrency/ThrowingDefer.code
  Concurrency/TokenBucket.code
  DispatchTimeInterval+Extensions.code
  Environment/Environment.code
  Environment/EnvironmentKey.code
  Environment/EnvironmentShims.code
  Errors.code
  FileSystem/AbsolutePath.code
  FileSystem/FileSystem+Extensions.code
  FileSystem/InMemoryFileSystem.code
  FileSystem/NativePathExtensions.code
  FileSystem/RelativePath.code
  FileSystem/TemporaryFile.code
  FileSystem/TSCAdapters.code
  FileSystem/VirtualFileSystem.code
  FileSystem/VFSOverlay.code
  Graph/AdjacencyMatrix.code
  Graph/DirectedGraph.code
  Graph/GraphAlgorithms.code
  Graph/UndirectedGraph.code
  SourceControlURL.code
  HTTPClient/HTTPClient.code
  HTTPClient/HTTPClientConfiguration.code
  HTTPClient/HTTPClientError.code
  HTTPClient/HTTPClientHeaders.code
  HTTPClient/HTTPClientRequest.code
  HTTPClient/HTTPClientResponse.code
  HTTPClient/HTTPMethod.code
  HTTPClient/LegacyHTTPClient.code
  HTTPClient/LegacyHTTPClientRequest.code
  HTTPClient/URLSessionHTTPClient.code
  ImportScanning.code
  JSON+Extensions.code
  JSONDecoder+Extensions.code
  Netrc.code
  Observability.code
  OSSignpost.code
  Process.code
  ProgressAnimation/NinjaProgressAnimation.code
  ProgressAnimation/PercentProgressAnimation.code
  ProgressAnimation/ProgressAnimationProtocol.code
  ProgressAnimation/SingleLinePercentProgressAnimation.code
  ProgressAnimation/ThrottledProgressAnimation.code
  SQLite.code
  Sandbox.code
  SendableTimeInterval.code
  Serialization/SerializedJSON.code
  CodiraVersion.code
  SQLiteBackedCache.code
  TestingLibrary.code
  Triple+Basics.code
  URL.code
  Version+Extensions.code
  WritableByteStream+Extensions.code
  Vendor/Triple.code
  Vendor/Triple+Platforms.code)
target_link_libraries(Basics PUBLIC
  _AsyncFileSystem
  CodiraCollections::OrderedCollections
  TSCBasic
  TSCUtility)
target_link_libraries(Basics PRIVATE
  CodiraCollections::DequeModule
  CPMSQLite3
  TSCclibc)

# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(Basics PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})
target_link_options(Basics PRIVATE
    "$<$<PLATFORM_ID:Darwin>:SHELL:-Xlinker -framework -Xlinker Security>")

install(TARGETS Basics
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
set_property(GLOBAL APPEND PROPERTY CodiraPM_EXPORTS Basics)
