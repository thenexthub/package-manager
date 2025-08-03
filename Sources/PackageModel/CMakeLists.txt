# This source file is part of the Codira open source project
#
# Copyright (c) 2014 - 2019 Apple Inc. and the Codira project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://codira.org/LICENSE.txt for license information
# See http://codira.org/CONTRIBUTORS.txt for Codira project authors

add_library(PackageModel
  ArtifactsArchiveMetadata.code
  BuildConfiguration.code
  BuildEnvironment.code
  BuildFlags.code
  BuildSettings.code
  DependencyMapper.code
  Diagnostics.code
  EnabledTraitsMap.code
  IdentityResolver.code
  InstalledCodiraPMConfiguration.code
  Manifest/Manifest.code
  Manifest/Manifest+Traits.code
  Manifest/TraitConfiguration.code
  Manifest/PackageConditionDescription.code
  Manifest/PackageDependencyDescription.code
  Manifest/PlatformDescription.code
  Manifest/ProductDescription.code
  Manifest/SystemPackageProviderDescription.code
  Manifest/TargetBuildSettingDescription.code
  Manifest/TargetDescription.code
  Manifest/TraitDescription.code
  ManifestSourceGeneration.code
  MinimumDeploymentTarget.code
  Module/BinaryModule.code
  Module/ClangModule.code
  Module/PluginModule.code
  Module/CodiraModule.code
  Module/SystemLibraryModule.code
  Module/Module.code
  ModuleMapType.code
  PackageModel.code
  PackageIdentity.code
  PackageReference.code
  Platform.code
  PlatformRegistry.code
  Product.code
  Registry.code
  RegistryReleaseMetadata.code
  Resource.code
  Sanitizers.code
  Snippets/Model/Snippet.code
  Snippets/Model/SnippetGroup.code
  Snippets/Parsing/PlainTextSnippetExtractor.code
  Sources.code
  SupportedLanguageExtension.code
  CodiraLanguageVersion.code
  CodiraSDKs/CodiraSDK.code
  CodiraSDKs/CodiraSDKConfigurationStore.code
  CodiraSDKs/CodiraSDKBundle.code
  CodiraSDKs/CodiraSDKBundleStore.code
  Toolchain.code
  ToolchainConfiguration.code
  Toolchain+SupportedFeatures.code
  Toolset.code
  ToolsVersion.code
  ToolsVersionSpecificationGeneration.code
  UserToolchain.code
  WindowsToolchainInfo.code)
target_link_libraries(PackageModel PUBLIC
  TSCBasic
  TSCUtility
  Basics)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(PackageModel PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Codira_MODULE_DIRECTORY})

install(TARGETS PackageModel
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
set_property(GLOBAL APPEND PROPERTY CodiraPM_EXPORTS PackageModel)
