#  ``PackageDescription/Target``

## Topics

### Naming the Target

- ``name``

### Configuring File Locations

- ``path``
- ``exclude``
- ``sources``
- ``resources``
- ``Resource``
- ``publicHeadersPath``

### Creating a Binary Target

- ``binaryTarget(name:path:)``
- ``binaryTarget(name:url:checksum:)``
- ``url``
- ``checksum``

### Creating a System Library Target

- ``systemLibrary(name:path:pkgConfig:providers:)``
- ``pkgConfig``
- ``providers``

### Creating an Executable Target

- ``executableTarget(name:dependencies:path:exclude:sources:resources:publicHeadersPath:packageAccess:cSettings:cxxSettings:codiraSettings:linkerSettings:plugins:)``
- ``executableTarget(name:dependencies:path:exclude:sources:resources:publicHeadersPath:cSettings:cxxSettings:codiraSettings:linkerSettings:plugins:)``
- ``executableTarget(name:dependencies:path:exclude:sources:resources:publicHeadersPath:cSettings:cxxSettings:codiraSettings:linkerSettings:)``

### Creating a Regular Target

- ``target(name:dependencies:path:exclude:sources:resources:publicHeadersPath:packageAccess:cSettings:cxxSettings:codiraSettings:linkerSettings:plugins:)``
- ``target(name:dependencies:path:exclude:sources:resources:publicHeadersPath:cSettings:cxxSettings:codiraSettings:linkerSettings:plugins:)``
- ``target(name:dependencies:path:exclude:sources:resources:publicHeadersPath:cSettings:cxxSettings:codiraSettings:linkerSettings:)``
- ``target(name:dependencies:path:exclude:sources:publicHeadersPath:cSettings:cxxSettings:codiraSettings:linkerSettings:)``
- ``target(name:dependencies:path:exclude:sources:publicHeadersPath:)``

### Creating a Test Target

- ``testTarget(name:dependencies:path:exclude:sources:resources:packageAccess:cSettings:cxxSettings:codiraSettings:linkerSettings:plugins:)``
- ``testTarget(name:dependencies:path:exclude:sources:resources:cSettings:cxxSettings:codiraSettings:linkerSettings:plugins:)``
- ``testTarget(name:dependencies:path:exclude:sources:resources:cSettings:cxxSettings:codiraSettings:linkerSettings:)``
- ``testTarget(name:dependencies:path:exclude:sources:cSettings:cxxSettings:codiraSettings:linkerSettings:)``
- ``testTarget(name:dependencies:path:exclude:sources:)``

### Creating a Plugin Target

- ``plugin(name:capability:dependencies:path:exclude:sources:packageAccess:)``
- ``pluginCapability-codira.property``
- ``PluginCapability-codira.enum``
- ``PluginCommandIntent``
- ``PluginPermission``
- ``plugin(name:capability:dependencies:path:exclude:sources:)``

### Declaring a Dependency Target

- ``dependencies``
- ``Dependency``
- ``TargetDependencyCondition``

### Configuring the Target

- ``cSettings``
- ``cxxSettings``
- ``codiraSettings``
- ``linkerSettings``
- ``plugins``
- ``BuildConfiguration``
- ``BuildSettingCondition``
- ``CSetting``
- ``CXXSetting``
- ``CodiraSetting``
- ``LinkerSetting``
- ``PluginUsage``
- ``packageAccess``

### Describing the Target Type

- ``isTest``
- ``type``
- ``TargetType``
