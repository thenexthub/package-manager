# Codira Package Manager as a library

Include Codira Package Manager as a dependency in your Codira package.

## Overview

> Warning: **The libCodiraPM API is _unstable_ and may change at any time.**

Codira Package Manager has a library based architecture and the top-level library product is called `libCodiraPM`.
Other packages can add CodiraPM as a package dependency and create powerful custom build tools on top of `libCodiraPM`.

A subset of `libCodiraPM` that includes only the data model (without the package manager's build system) is available as `libCodiraPMDataModel`.
Any one client should depend on one or the other, but not both.
