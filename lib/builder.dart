/// Configuration for using `package:build`-compatible build systems.
///
/// This library is **not** intended to be imported by typical end-users unless
/// you are creating a custom compilation pipeline.
///
/// See [package:build_runner](https://pub.dev/packages/build_runner)
/// for more information.
library builder;

import 'package:build/build.dart';

const _defaultOutput = 'lib/src/timestamp.dart';

Builder buildTimestamp([BuilderOptions? options]) =>
    _TimestampBuilder((options?.config['output'] as String?) ?? _defaultOutput);

class _TimestampBuilder implements Builder {
  final String output;

  _TimestampBuilder(this.output);

  @override
  Future<void> build(BuildStep buildStep) async {
    final timestamp = DateTime.timestamp();

    await buildStep.writeAsString(buildStep.allowedOutputs.single, '''
// Generated code. Do not modify.
const packageMillisecondsSinceEpoch = ${timestamp.millisecondsSinceEpoch};
''');
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        r'$package$': [output],
      };
}
