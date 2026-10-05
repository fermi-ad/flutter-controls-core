import 'package:flutter/foundation.dart' show DebugPrintCallback, debugPrint;
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_controls_core/flutter_controls_core.dart'
    show AppLog, LogLevel, appLog;

void main() {
  late DateTime clock;
  late AppLog log;

  setUp(() {
    clock = DateTime(2026, 10, 1, 12, 0, 1, 234);
    log = AppLog(mirror: false, now: () => clock);
  });

  tearDown(() => log.dispose());

  test('keeps the last capacity entries, oldest first, and counts what '
      'it dropped', () {
    final small = AppLog(capacity: 3, mirror: false, now: () => clock);
    for (var k = 1; k <= 5; k++) {
      small.info('app', 'entry $k');
    }
    expect(
      [for (final e in small.entries) e.message],
      ['entry 3', 'entry 4', 'entry 5'],
    );
    expect(small.dropped, 2);
    expect(
      () => small.entries.add(small.entries.first),
      throwsUnsupportedError,
      reason: 'unmodifiable',
    );
    small.clear();
    expect(small.entries, isEmpty);
    expect(small.dropped, 0);
    small.dispose();
  });

  test('the default capacity is 500', () {
    for (var k = 0; k < 520; k++) {
      log.info('app', '$k');
    }
    expect(log.entries, hasLength(500));
    expect(log.entries.first.message, '20');
    expect(log.dropped, 20);
  });

  test('levels: the helpers, the filter and the text to copy', () {
    log
      ..info('app', 'started')
      ..warn('flood', 'gateway flood')
      ..error('write', 'TBT ON failed')
      ..add(LogLevel.warn, 'link', 'stream error');
    expect(
      [for (final e in log.entries) e.level],
      [LogLevel.info, LogLevel.warn, LogLevel.error, LogLevel.warn],
    );
    expect(log.atLeast(LogLevel.info), hasLength(4));
    expect(
      [for (final e in log.atLeast(LogLevel.warn)) e.source],
      ['flood', 'write', 'link'],
    );
    expect(log.atLeast(LogLevel.error).single.source, 'write');
    expect(
      log.asText(),
      '12:00:01.234 INFO app: started\n'
      '12:00:01.234 WARN flood: gateway flood\n'
      '12:00:01.234 ERROR write: TBT ON failed\n'
      '12:00:01.234 WARN link: stream error',
    );
    expect(
      log.asText(min: LogLevel.error),
      '12:00:01.234 ERROR write: TBT ON failed',
    );
    expect(log.entries.first.toString(), '12:00:01.234 INFO app: started');
  });

  test('a message is kept on one line, and a huge one is cut', () {
    log.info('link', 'stream error: socket closed\n  at line 3\r\nend');
    expect(
      log.entries.single.message,
      'stream error: socket closed at line 3 end',
    );
    log.info('link', 'x' * 5000);
    expect(log.entries.last.message, hasLength(AppLog.maxMessage + 1));
    expect(log.entries.last.message, endsWith('…'));
    log.info('link', '${'a' * 999}😀😀');
    expect(log.entries.last.message, '${'a' * 999}😀…', reason: 'whole emoji');
  });

  testWidgets('a burst of entries is one notification, at most every '
      '250 ms', (tester) async {
    var notified = 0;
    log.addListener(() => notified++);
    for (var k = 0; k < 50; k++) {
      log.info('pv', 'entry $k');
    }
    expect(notified, 0, reason: 'nothing before the interval');
    await tester.pump(const Duration(milliseconds: 249));
    expect(notified, 0);
    await tester.pump(const Duration(milliseconds: 1));
    expect(notified, 1);
    log.warn('flood', 'one more');
    await tester.pump(const Duration(milliseconds: 100));
    log.warn('flood', 'and another');
    await tester.pump(const Duration(milliseconds: 150));
    expect(notified, 2);
    await tester.pump(const Duration(seconds: 1));
    expect(notified, 2, reason: 'quiet: nothing more');
    log.clear();
    expect(notified, 3, reason: 'Clear is shown at once');
  });

  testWidgets('with nobody listening nothing is scheduled', (tester) async {
    log.info('app', 'quiet');
    // No timer may be left pending: the test would fail if one were.
    expect(log.entries, hasLength(1));
  });

  test('every entry is mirrored to the console, unless turned off', () {
    final printed = <String?>[];
    final DebugPrintCallback saved = debugPrint;
    debugPrint = (message, {wrapWidth}) => printed.add(message);
    try {
      final loud = AppLog(name: 'my-app', now: () => clock)
        ..warn('flood', 'gateway flood: 1500 junk rows/s');
      expect(printed, [
        'my-app 12:00:01.234 WARN flood: gateway flood: 1500 junk rows/s',
      ]);
      loud.mirror = false;
      loud.info('app', 'quiet');
      log.error('write', 'not printed either');
      expect(printed, hasLength(1));
      expect(loud.entries, hasLength(2), reason: 'still logged');
      loud.dispose();
      final plain = AppLog(now: () => clock)..info('app', 'no name');
      expect(printed.last, '12:00:01.234 INFO app: no name');
      plain.dispose();
    } finally {
      debugPrint = saved;
    }
  });

  test('reset empties the shared log without a notification', () {
    var notified = 0;
    void count() => notified++;
    appLog
      ..addListener(count)
      ..info('app', 'from an earlier test')
      ..reset();
    expect(appLog.entries, isEmpty);
    expect(notified, 0);
    appLog.removeListener(count);
  });
}
