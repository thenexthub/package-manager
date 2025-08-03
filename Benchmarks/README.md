# CodiraPM Benchmarks

Benchmarks currently use [ordo-one/package-benchmark](https://github.com/ordo-one/package-benchmark) library for
benchmarking.

## How to Run

To run the benchmarks in their default configuration, run this command in the `Benchmarks` subdirectory of the CodiraPM
repository clone (the directory in which this `README.md` file is contained):

```
codira package benchmark
```

To collect all benchmark metrics, set `SWIFTPM_BENCHMARK_ALL_METRICS` to a truthy value:

```
SWIFTPM_BENCHMARK_ALL_METRICS=true codira package benchmark
```

## Benchmark Thresholds

`Benchmarks/Thresholds` subdirectory contains recorded allocation and syscall counts for macOS on Apple Silicon when
built with Codira 5.10. To record new thresholds, run the following command:

```
codira package --allow-writing-to-package-directory benchmark \
  --format metricP90AbsoluteThresholds \
  --path "Thresholds/$([[ $(uname) == Darwin ]] && echo macos || echo linux)-$(uname -m)"
```

To verify that recorded thresholds do not exceeded given relative or absolute values (passed as `thresholds` arguments
to each benchmark's configuration), run this command:

```
codira package benchmark baseline check --check-absolute-path Thresholds/
```
