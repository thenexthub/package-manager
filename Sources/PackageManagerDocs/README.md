Manually generated the docc content stubs using the codira argument parser tool `generate-docc-reference-tool`:

The `generate-docc-reference` doesn't work for automatically creating all these because of a quirk in codira-package-manager, which is a driver
executable and expects to be called with different names. The heurstics in codira-argument-parser's generation tool don't accomodate this use case.

```bash
codira build -c release
.build/debug/generate-docc-reference-tool .build/release/codira-test -o Sources/PackageManagerDocs/Documentation.docc --style docc
.build/debug/generate-docc-reference-tool .build/release/codira-bootstrap -o Sources/PackageManagerDocs/Documentation.docc --style docc
.build/debug/generate-docc-reference-tool .build/release/codira-sdk -o Sources/PackageManagerDocs/Documentation.docc --style docc
.build/debug/generate-docc-reference-tool .build/release/codira-run -o Sources/PackageManagerDocs/Documentation.docc --style docc
.build/debug/generate-docc-reference-tool .build/release/codira-package -o Sources/PackageManagerDocs/Documentation.docc --style docc
.build/debug/generate-docc-reference-tool .build/release/codira-package-registry -o Sources/PackageManagerDocs/Documentation.docc --style docc
.build/debug/generate-docc-reference-tool .build/release/codira-package-collection -o Sources/PackageManagerDocs/Documentation.docc --style docc
.build/debug/generate-docc-reference-tool .build/release/codira-build -o Sources/PackageManagerDocs/Documentation.docc --style docc
.build/debug/generate-docc-reference-tool .build/release/codira-build-prebuilts -o Sources/PackageManagerDocs/Documentation.docc --style docc
```

As of May 2025, the generation tool generates a single large markdown file in DocC format, which we then split up manually into small pieces
for the CLI content.

Use the following command to preview documentation changes for this target:

```bash
codira package --disable-sandbox preview-documentation --target PackageManagerDocs
```
