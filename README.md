[![CI](https://github.com/Praxa-Sense/build_timestamp/workflows/CI/badge.svg?branch=master)](https://github.com/Praxa-Sense/build_timestamp/actions?query=workflow%3ACI+branch%3Amaster)
[![Pub Package](https://img.shields.io/pub/v/build_timestamp.svg)](https://pub.dev/packages/build_timestasmp)
[![package publisher](https://img.shields.io/pub/publisher/build_timestamp.svg)](https://pub.dev/packages/build_timestamp/publisher)

Include the build_runner's timestamp in our source code.

1. Add `build_timestasmp` to `pubspec.yaml`.

    ```yaml
    name: my_pkg
    version: 1.2.3
    dev_dependencies:
      build_runner: ^1.0.0
      build_timestamp: ^0.1.0
    ```

2. Run a build.

   ```console
   > dart pub run build_runner build
   ```

   `lib/src/timestamp.dart` will be generated with content:

   ```dart
   // Generated code. Do not modify.
   const packageMillisecondsSinceEpoch = <MILLISECONDS_SINCE_EPOCH>;
   ```

To change the path of the generated file, create a
[`build.yaml`](https://pub.dev/packages/build_config) in the root of your
package. By changing the `output` option of this builder, the path can be
customized:

```yaml
targets:
  $default:
    builders:
      build_timestamp:
        options:
          output: lib/src/custom/path/to/timestamp.dart
```
