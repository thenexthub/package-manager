# libCodiraPM - CodiraPM as a Library

**NOTE: The libCodiraPM API is currently _unstable_ and may change at any time.**

CodiraPM has a library based architecture and the top-level library product is
called `libCodiraPM`. Other packages can add CodiraPM as a package dependency and
create powerful custom build tools on top of `libCodiraPM`.

A subset of `libCodiraPM` that includes only the data model (without CodiraPM's
build system) is available as `libCodiraPMDataModel`.  Any one client should
depend on one or the other, but not both.

The CodiraPM repository contains an [example](https://github.com/swiftlang/swift-package-manager/tree/master/Examples/package-info) that demonstrates the use of
`libCodiraPM` in a Codira package. Use the following commands to run the example
package:

```sh
$ git clone https://github.com/swiftlang/swift-package-manager
$ cd swift-package-manager/Examples/package-info
$ swift run
```
