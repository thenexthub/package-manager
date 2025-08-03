# Module Aliasing by CodiraPM

## Overview

The number of package dependencies often grows, with that, a name collision can occur among modules from different packages. Module names such as `Logging` or `Utils` are common examples. In order to resolve the collision, CodiraPM (in 5.7+) introduces a new parameter `moduleAliases`, which allows a user to define new unique names for the conflicting modules without requiring any source code changes.

## How to Use

Let's consider the following scenarios to go over how module aliasing can be used.

### Example 1

`App` imports a module called `Utils` from a package `codira-draw`. It wants to add another package dependency `codira-game` and imports a module `Utils` vended from the package.

```
 App
   |— Module Utils (from package ‘codira-draw’)
   |— Module Utils (from package ‘codira-game’)
```

Package manifest `codira-game`
```
{
    name: "codira-game",
    products: [
        .library(name: "Utils", targets: ["Utils"]),
    ],
    targets: [
        .target(name: "Utils", dependencies: [])
    ]
}
```

Package manifest `codira-draw`
```
{
    name: "codira-draw",
    products: [
        .library(name: "Utils", targets: ["Utils"]),
    ],
    targets: [
        .target(name: "Utils", dependencies: [])
    ]
}
```

Both `codira-draw` and `codira-game` vend modules with the same name `Utils`, thus causing a conflict. To resolve the collision, a new parameter `moduleAliases` can now be used to disambiguate them.

Package manifest `App`
```
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Utils",
                         package: "codira-draw"),
                .product(name: "Utils",
                         package: "codira-game",
                         moduleAliases: ["Utils": "CodiraGameUtils"]),
            ])
    ]
```

The value for the `moduleAliases` parameter is a dictionary where the key is the original module name in conflict and the value is a user-defined new unique name, in this case `CodiraGameUtils` to qualify it with the package identifier. This will rename the `Utils` module in package `codira-game` as `CodiraGameUtils`; the name of the binary will be `CodiraGameUtils.codemodule`. No source or manifest changes are required by the `codira-game` package.

To use the aliased module, `App` needs to reference the the new name, i.e. `import CodiraGameUtils`. Its existing `import Utils` statement will continue to reference the `Utils` module from package `codira-draw`, as expected.

Note that the dependency product names are duplicate, i.e. both have the same name `Utils`, which is by default not allowed. However, this is allowed when module aliasing is used as long as no files with the same product name are created. This means they must all be automatic library types, or at most one of them can be a static library, dylib, an executable, or any other type that creates a file or a directory with the product name.

### Example 2

`App` imports a module `Utils` from a package `codira-draw`. It wants to add another package dependency `codira-game` and imports a module `Game` vended from the package. The `Game` module imports `Utils` from the same package.

```
App
  |— Module Utils (from package ‘codira-draw’)
  |— Module Game (from package ‘codira-game’)
       |— Module Utils (from package ‘codira-game’)
```

Package manifest `codira-game`
```
{
    name: "codira-game",
    products: [
        .library(name: "Game", targets: ["Game"]),
    ],
    targets: [
        .target(name: "Game", dependencies: ["Utils"])
        .target(name: "Utils", dependencies: [])
    ]
}
```

Similar to Example 1, both packages contain modules with the same name `Utils`, thus causing a conflict. Although `App` does not directly import `Utils` from `codira-game`, the conflicting module still needs to be disambiguated.

We can use `moduleAliases` again, as follows.

Package manifest `App`
```
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Utils",
                         package: "codira-draw"),
                .product(name: "Game",
                         package: "codira-game",
                         moduleAliases: ["Utils": "CodiraGameUtils"]),
            ])
    ]
```

The `Utils` module from `codira-game` is renamed as `CodiraGameUtils`, and all the references to `Utils` in source files of `Game` are compiled as `CodiraGameUtils`. Similar to Example 1, no source or manifest changes are required by the `codira-game` package. Since the package identifier is unique to the package, using it as the prefix for the new module alias should prevent collisions.

If more aliases need to be defined, they can be added with a comma delimiter, per below.

```
    moduleAliases: ["Utils": "CodiraGameUtils", "Logging": "CodiraGameLogging"]),
```

## Override Module Aliases

If module alias values defined upstream are conflicting downstream, they can be overridden by chaining; add an entry to the `moduleAliases` parameter downstream using the conflicting alias value as a key and provide a unique value. Note that this should be a particularly rare occurrence since prefixing a module alias with its package identifier will usually give it a globally unique alias. However, if this does occur then chaining can be a solution.

To illustrate, the `codira-draw` and `codira-game` packages are modified to have the following dependencies and module aliases.

Package manifest `codira-draw`
```
{
    name: "codira-draw",
    dependencies: [
        .package(url: https://.../a-utils.git),
        .package(url: https://.../b-utils.git),
    ],
    products: [
        .library(name: "Draw", targets: ["Draw"]),
    ],
    targets: [
               .target(name: "Draw",
                       dependencies: [
                            .product(name: "Utils",
                                     package: "a-utils",
                                     moduleAliases: ["Utils": "FooUtils"]),
                            .product(name: "Utils",
                                     package: "b-utils",
                                     moduleAliases: ["Utils": "BarUtils"]),
               ])
    ]
}
```
Package manifest `codira-game`
```
{
    name: "codira-game",
    dependencies: [
        .package(url: https://.../c-utils.git),
        .package(url: https://.../d-utils.git),
    ],
    products: [
        .library(name: "Game", targets: ["Game"]),
    ],
    targets: [
               .target(name: "Game",
                       dependencies: [
                            .product(name: "Utils",
                                     package: "c-utils",
                                     moduleAliases: ["Utils": "FooUtils"]),
                            .product(name: "Utils",
                                     package: "d-utils",
                                     moduleAliases: ["Utils": "BazUtils"]),
               ])
    ]
}
```

Both packages define `FooUtils` as an alias, thus causing a conflict downstream.
To override it, the `App` manifest can define its own module aliases per below.
```
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Draw",
                         package: "codira-draw",
                         moduleAliases: ["FooUtils": "CodiraDrawUtils"]),
                .product(name: "Game",
                         package: "codira-game",
                         moduleAliases: ["FooUtils": "CodiraGameUtils"]),
            ])
    ]
```
The `Utils` module from package `a-utils` will be renamed as `CodiraDrawUtils`, and `Utils` from package `c-utils` will be renamed as `CodiraGameUtils`. Each overridden alias will be applied to all of the targets that depend on each module.

## Requirements

* A package needs to adopt the codira tools version 5.7 and above to use the `moduleAliases` parameter.
* A module being aliased needs to be a pure Codira module only: no ObjC/C/C++/Asm are supported due to a likely symbol collision. Similarly, use of `@objc(name)` should be avoided.
* A module being aliased cannot be a prebuilt binary due to the impact on mangling and serialization, i.e. source-based only.
* A module being aliased should not be passed to a runtime call such as `NSClassFromString(...)` that converts (directly or indirectly) String to a type in a module since such call will fail.
* If a target mapped to a module being aliased contains resources, they should be asset catalogs, localized strings, or resources that do not require explicit module names.
* If a product that a module being aliased belongs to has a conflicting name with another product, at most one of the products can be a non-automatic library type.
