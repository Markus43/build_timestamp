import 'dart:convert';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:build_timestamp/builder.dart';
import 'package:test/test.dart';

final _expectedOutput =
    RegExp(r'^const packageMillisecondsSinceEpoch = \d+;$', multiLine: true);

void main() {
  test('valid input', () async {
    await testBuilder(
      buildTimestamp(),
      _createPackageStub({'name': 'pkg', 'version': '1.0.0'}),
      outputs: {
        'pkg|lib/src/timestamp.dart': predicate(
          (List<int> binOut) => _expectedOutput.hasMatch(utf8.decode(binOut)),
        ),
      },
    );
  });

  test('valid input, custom output location', () async {
    await testBuilder(
      buildTimestamp(const BuilderOptions({'output': 'bin/timestamp.dart'})),
      _createPackageStub({'name': 'pkg', 'version': '1.0.0'}),
      outputs: {
        'pkg|bin/timestamp.dart': predicate(
          (List<int> binOut) => _expectedOutput.hasMatch(utf8.decode(binOut)),
        ),
      },
    );
  });
}

Map<String, String> _createPackageStub(Map<String, dynamic> pubspecContent) => {
      'pkg|pubspec.yaml': jsonEncode(pubspecContent),
    };
