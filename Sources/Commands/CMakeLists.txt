# Copyright (c) NeXTHub Corporation. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

# Author(-s): Tunjay Akbarli

add_library(Commands
  PackageCommands/AddDependency.code
  PackageCommands/AddProduct.code
  PackageCommands/AddTarget.code
  PackageCommands/AddTargetDependency.code
  PackageCommands/AddSetting.code
  PackageCommands/APIDiff.code
  PackageCommands/ArchiveSource.code
  PackageCommands/AuditBinaryArtifact.code
  PackageCommands/CompletionCommand.code
  PackageCommands/ComputeChecksum.code
  PackageCommands/Config.code
  PackageCommands/Describe.code
  PackageCommands/DumpCommands.code
  PackageCommands/EditCommands.code
  PackageCommands/Format.code
  PackageCommands/Init.code
  PackageCommands/Install.code
  PackageCommands/Learn.code
  PackageCommands/Migrate.code
  PackageCommands/PluginCommand.code
  PackageCommands/ResetCommands.code
  PackageCommands/Resolve.code
  PackageCommands/ShowDependencies.code
  PackageCommands/ShowExecutables.code
  PackageCommands/CodiraPackageCommand.code
  PackageCommands/ToolsVersionCommand.code
  PackageCommands/Update.code
  Snippets/CardEvent.code
  Snippets/Cards/SnippetCard.code
  Snippets/Cards/SnippetGroupCard.code
  Snippets/Cards/TopCard.code
  Snippets/CardStack.code
  Snippets/Card.code
  Snippets/Colorful.code
  CodiraBuildCommand.code
  CodiraRunCommand.code
  CodiraTestCommand.code
  CommandWorkspaceDelegate.code
  Utilities/APIDigester.code
  Utilities/DependenciesSerializer.code
  Utilities/DescribedPackage.code
  Utilities/DOTManifestSerializer.code
  Utilities/MermaidPackageSerializer.code
  Utilities/MultiRootSupport.code
  Utilities/PlainTextEncoder.code
  Utilities/PluginDelegate.code
  Utilities/SymbolGraphExtract.code
  Utilities/TestingSupport.code
  Utilities/XCTEvents.code)
target_link_libraries(Commands PUBLIC
  CodiraCollections::OrderedCollections
  ArgumentParser
  Basics
  BinarySymbols
  Build
  CoreCommands
  BuilraManifest
  PackageGraph
  PackageModelSyntax
  SourceControl
  CodiraFixIt
  TSCBasic
  TSCUtility
  Workspace
  XCBuildSupport)
target_link_libraries(Commands PRIVATE
  DriverSupport
  $<$<NOT:$<PLATFORM_ID:Darwin>>:FoundationXML>)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(Commands PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})

install(TARGETS Commands
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
