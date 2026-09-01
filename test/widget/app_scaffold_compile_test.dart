import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Verifies the compile-time contract of `StandardApp<T extends ChangeNotifier>`.
///
/// A runtime test cannot assert "this line does not compile" because the test
/// runner would fail to build the whole suite. Instead we generate an
/// intentionally invalid fixture into a temporary directory and run the Dart
/// analyzer against it, asserting that it reports a type-argument bound
/// violation. Generating (rather than committing) the fixture keeps the
/// project's own `flutter analyze` clean -- there is no permanently broken
/// source file in the tree.
void main() {
  test(
    'StandardApp rejects a type argument that does not extend ChangeNotifier',
    () async {
      // The fixture must live inside the project tree so the analyzer can
      // resolve `package:flutter_controls_core` via the project's
      // `.dart_tool/package_config.json`. A temp dir outside the project would
      // fail with `uri_does_not_exist` instead of the bound violation we want.
      //
      // It is generated (and torn down) rather than committed so the project's
      // own `flutter analyze` never sees a permanently broken source file. The
      // name lacks a `_test.dart` suffix so the test runner ignores it.
      final tempDir = await Directory(
        '${Directory.current.path}/test/widget',
      ).createTemp('standard_app_bound_');

      addTearDown(() async {
        if (tempDir.existsSync()) {
          await tempDir.delete(recursive: true);
        }
      });

      // `NotAChangeNotifier` violates `T extends ChangeNotifier`.
      final fixture = File('${tempDir.path}/bound_violation.dart');
      await fixture.writeAsString('''
import 'package:flutter_controls_core/flutter_controls_core.dart'
    show StandardApp;

class NotAChangeNotifier {}

void main() {
  // ignore: unused_local_variable
  final app = StandardApp<NotAChangeNotifier>(title: 'Illegal');
  print(app.title);
}
''');

      final result = await Process.run(
        'dart',
        ['analyze', '--format', 'json', fixture.path],
        workingDirectory: Directory.current.path,
        stdoutEncoding: utf8,
      );

      final codes = _diagnosticCodes(result.stdout as String);

      expect(
        codes,
        contains('type_argument_not_matching_bounds'),
        reason:
            'Expected the analyzer to reject `StandardApp<NotAChangeNotifier>` '
            'with a `type_argument_not_matching_bounds` error.\n'
            'Exit code: ${result.exitCode}\nstdout:\n${result.stdout}',
      );
    },
    // Spawning the analyzer is slow relative to a widget test.
    timeout: const Timeout(Duration(minutes: 2)),
  );
}

/// Extracts diagnostic codes from `dart analyze --format json` output.
///
/// Schema: `{ "diagnostics": [ { "code": ... }, ... ] }`. Fields are read
/// defensively so minor schema drift doesn't crash the test.
Set<String> _diagnosticCodes(String stdout) {
  if (stdout.trim().isEmpty) return const {};

  final decoded = jsonDecode(stdout);
  if (decoded is! Map<String, dynamic>) return const {};

  final raw = decoded['diagnostics'];
  if (raw is! List) return const {};

  return {
    for (final entry in raw)
      if (entry is Map<String, dynamic> && entry['code'] is String)
        entry['code'] as String,
  };
}
