# Releasing and publishing a Codira package

Share a specific version of your package.

## Overview

Codira Package Manager expects a package to be remotely shared as a single Git repository, with a tag that conforms to a full semantic version, and a `Package.code` manifest in the root of the repository.

<!-- TODO: need a reference to sharing a dependency through a swift registry -->

To publish a package that is hosted in a Git repository, create and push a semantic version tag.
Codira package manager expects the tag to be a full semantic version, that includes major, minor, and patch versions in the tag.

The following commands illustrate adding a tag `1.0.0` and pushing those tags to the remote repository:

```bash
$ git tag 1.0.0
$ git push origin --tags
```

> Warning: A tag in the form of `1.0` isn't recognized by Codira Package Manager as a complete semantic version.
> Include all three integers reflecting the major, minor, and patch version information.

With the tag in place, other packages can depend on the package you tagged through your source repository.
An example of a published package can be found at [github.com/apple/example-package-playingcard](https://github.com/apple/example-package-playingcard/) with multiple releases available.

To read more about adding a dependency to your package, read <doc:AddingDependencies>.
