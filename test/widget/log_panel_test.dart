import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_controls_core/flutter_controls_core.dart'
    show AppLog, BisonThemeData, BisonThemeTokens, LogPanel;

Widget _host(AppLog log, {ThemeData? theme, VoidCallback? onClose}) =>
    MaterialApp(
      theme: theme ?? BisonThemeData.dark(),
      home: Scaffold(
        body: Align(
          alignment: Alignment.centerRight,
          child: LogPanel(log: log, onClose: onClose ?? () {}),
        ),
      ),
    );

AppLog _filled() {
  final log = AppLog(mirror: false, now: () => DateTime(2026, 10, 1, 12));
  log
    ..info('link', 'subscription opened')
    ..warn('flood', 'gateway flood')
    ..error('write', 'write failed');
  return log;
}

Color? _colour(WidgetTester tester, String text) =>
    tester.widget<Text>(find.text(text)).style?.color;

void main() {
  testWidgets('lists newest first, coloured from the Bison theme', (
    tester,
  ) async {
    final log = _filled();
    await tester.pumpWidget(_host(log));
    final y = [
      for (final m in ['write failed', 'gateway flood', 'subscription opened'])
        tester.getTopLeft(find.text(m)).dy,
    ];
    expect(y, orderedEquals([...y]..sort()));
    final tokens = BisonThemeData.dark().extension<BisonThemeTokens>()!;
    expect(_colour(tester, 'WARN'), tokens.iconWarning);
    expect(_colour(tester, 'ERROR'), tokens.textError);
    expect(find.text('3 entries'), findsOneWidget);
    log.dispose();
  });

  testWidgets('filters to warnings and errors, then errors', (tester) async {
    final log = _filled();
    await tester.pumpWidget(_host(log));
    await tester.tap(find.byKey(const ValueKey('log-filter-warn')));
    await tester.pump();
    expect(find.text('subscription opened'), findsNothing);
    expect(find.text('2 of 3'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('log-filter-error')));
    await tester.pump();
    expect(find.text('gateway flood'), findsNothing);
    expect(find.text('write failed'), findsOneWidget);
    log.dispose();
  });

  testWidgets('Copy puts the entries shown on the clipboard, oldest first', (
    tester,
  ) async {
    String? copied;
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (call) async {
        if (call.method == 'Clipboard.setData') {
          copied = (call.arguments as Map)['text'] as String?;
        }
        return null;
      },
    );
    final log = _filled();
    await tester.pumpWidget(_host(log));
    await tester.tap(find.byKey(const ValueKey('log-copy')));
    await tester.pump();
    expect(copied, log.asText());
    expect(copied!.split('\n').first, endsWith('subscription opened'));
    log.dispose();
  });

  testWidgets('Clear empties the log; ✕ calls onClose', (tester) async {
    var closed = 0;
    final log = _filled();
    await tester.pumpWidget(_host(log, onClose: () => closed++));
    await tester.tap(find.byKey(const ValueKey('log-clear')));
    await tester.pump();
    expect(log.entries, isEmpty);
    expect(find.text('Nothing logged yet'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('log-close')));
    expect(closed, 1);
    log.dispose();
  });

  testWidgets('works under a plain Material theme too', (tester) async {
    final log = _filled();
    await tester.pumpWidget(_host(log, theme: ThemeData.dark()));
    expect(tester.takeException(), isNull);
    expect(_colour(tester, 'ERROR'), ThemeData.dark().colorScheme.error);
    log.dispose();
  });
}
