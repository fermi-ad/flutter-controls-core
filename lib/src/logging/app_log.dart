/// An app log for notable events (transitions, not readings), mirrored to
/// the console and shown by `LogPanel`.
library;

import 'dart:async' show Timer;
import 'dart:collection' show ListQueue;

import 'package:flutter/foundation.dart'
    show ChangeNotifier, debugPrint, immutable, visibleForTesting;

/// [t] as local `HH:MM:SS.mmm`.
String logClock(DateTime t) {
  final l = t.toLocal();
  String p(int n, [int w = 2]) => '$n'.padLeft(w, '0');
  return '${p(l.hour)}:${p(l.minute)}:${p(l.second)}.${p(l.millisecond, 3)}';
}

enum LogLevel {
  info,
  warn,
  error;

  /// `INFO`, `WARN`, `ERROR`.
  String get tag => name.toUpperCase();
}

@immutable
class LogEntry {
  const LogEntry(this.time, this.level, this.source, this.message);

  final DateTime time;
  final LogLevel level;

  /// Who logged it, e.g. `link`.
  final String source;
  final String message;

  /// `12:00:01.234 WARN link: message`.
  String get line => '${logClock(time)} ${level.tag} $source: $message';

  @override
  String toString() => line;
}

/// Keeps the last [capacity] entries; notifies at most once per
/// [notifyEvery].
class AppLog extends ChangeNotifier {
  AppLog({
    this.name,
    this.capacity = 500,
    this.notifyEvery = const Duration(milliseconds: 250),
    this.mirror = true,
    DateTime Function()? now,
  }) : assert(capacity > 0, 'capacity must be positive'),
       now = now ?? DateTime.now;

  /// Prefix for console lines, e.g. the app's name.
  String? name;
  final int capacity;
  final Duration notifyEvery;

  /// Whether entries also go to `debugPrint`.
  bool mirror;
  final DateTime Function() now;

  /// Longer messages are cut (in Unicode code points).
  static const int maxMessage = 1000;
  static final RegExp _breaks = RegExp(r'\s*[\r\n]+\s*');

  final ListQueue<LogEntry> _entries = ListQueue();
  int _dropped = 0;
  Timer? _notify;
  bool _disposed = false;

  /// Oldest first.
  List<LogEntry> get entries => List.unmodifiable(_entries);

  /// Entries dropped over [capacity] since the last [clear].
  int get dropped => _dropped;

  /// Entries at [min] or above, oldest first.
  List<LogEntry> atLeast(LogLevel min) =>
      List.unmodifiable(_entries.where((e) => e.level.index >= min.index));

  /// Logs [message] on one line, cut to [maxMessage].
  LogEntry add(LogLevel level, String source, String message) {
    var m = message.replaceAll(_breaks, ' ');
    if (m.runes.length > maxMessage) {
      m = '${String.fromCharCodes(m.runes.take(maxMessage))}…';
    }
    final e = LogEntry(now(), level, source, m);
    if (_entries.length >= capacity) {
      _entries.removeFirst();
      _dropped++;
    }
    _entries.addLast(e);
    if (mirror) debugPrint(name == null ? e.line : '$name ${e.line}');
    if (!_disposed && _notify == null && hasListeners) {
      _notify = Timer(notifyEvery, () {
        _notify = null;
        if (!_disposed) notifyListeners();
      });
    }
    return e;
  }

  LogEntry info(String source, String message) =>
      add(LogLevel.info, source, message);

  LogEntry warn(String source, String message) =>
      add(LogLevel.warn, source, message);

  LogEntry error(String source, String message) =>
      add(LogLevel.error, source, message);

  /// One [LogEntry.line] per entry at [min] or above, oldest first.
  String asText({LogLevel min = LogLevel.info}) =>
      atLeast(min).map((e) => e.line).join('\n');

  /// Empties the log and notifies at once.
  void clear() {
    _empty();
    if (!_disposed) notifyListeners();
  }

  /// Empties the log without notifying.
  @visibleForTesting
  void reset() => _empty();

  void _empty() {
    _notify?.cancel();
    _notify = null;
    _entries.clear();
    _dropped = 0;
  }

  @override
  void dispose() {
    _disposed = true;
    _notify?.cancel();
    super.dispose();
  }
}

/// The shared log.
final AppLog appLog = AppLog();
