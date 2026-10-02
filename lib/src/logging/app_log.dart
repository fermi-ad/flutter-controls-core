/// An application log: what the app saw, in order, for the operator.
///
/// Apps write transitions (a link lost, a write that failed), never every
/// reading, to the shared [appLog] or to their own [AppLog]. The last
/// [AppLog.capacity] entries are kept, and each is mirrored to the terminal
/// or browser console. [LogPanel] shows them.
library;

import 'dart:async' show Timer;
import 'dart:collection' show ListQueue;

import 'package:flutter/foundation.dart'
    show ChangeNotifier, debugPrint, immutable, visibleForTesting;

/// `12:00:01.234`, local time.
String logClock(DateTime t) {
  String two(int n) => n.toString().padLeft(2, '0');
  final l = t.toLocal();
  return '${two(l.hour)}:${two(l.minute)}:${two(l.second)}.'
      '${l.millisecond.toString().padLeft(3, '0')}';
}

/// How much an entry matters.
enum LogLevel {
  /// Something that happened (a subscription opened, a write confirmed).
  info,

  /// Something to look at (a lost link, a gateway flood, PVs failing).
  warn,

  /// Something that failed (a write that did not land).
  error;

  /// `INFO`, `WARN`, `ERROR`.
  String get tag => name.toUpperCase();
}

/// One line of the log.
@immutable
class LogEntry {
  /// Creates an entry.
  const LogEntry(this.time, this.level, this.source, this.message);

  /// When it was logged.
  final DateTime time;

  /// How much it matters.
  final LogLevel level;

  /// What logged it, chosen by the app (`app`, `link`, `write`, …).
  final String source;

  /// What happened, on one line.
  final String message;

  /// `12:00:01.234 WARN flood: booster: …`, local time.
  String get line => '${logClock(time)} ${level.tag} $source: $message';

  @override
  String toString() => line;
}

/// A bounded, ordered log the UI can watch.
///
/// Listeners hear at most one notification per [notifyEvery], so a burst
/// of entries rebuilds a panel once.
class AppLog extends ChangeNotifier {
  /// Creates a log keeping the last [capacity] entries; [now] replaces the
  /// wall clock (tests).
  AppLog({
    this.name,
    this.capacity = 500,
    this.notifyEvery = const Duration(milliseconds: 250),
    this.mirror = true,
    DateTime Function()? now,
  }) : assert(capacity > 0, 'capacity must be positive'),
       now = now ?? DateTime.now;

  /// Put before every mirrored line (the app's name), or nothing.
  String? name;

  /// How many entries are kept; the oldest is dropped beyond it.
  final int capacity;

  /// Listeners hear at most one notification per this interval.
  final Duration notifyEvery;

  /// Whether every entry is also printed (`debugPrint`), after [name] if
  /// set: the terminal off the web, the browser console on it. Tests turn
  /// it off.
  bool mirror;

  /// The clock entries are stamped with.
  final DateTime Function() now;

  /// A message longer than this is cut (an exception's text can be long).
  static const int maxMessage = 1000;

  final ListQueue<LogEntry> _entries = ListQueue<LogEntry>();
  List<LogEntry>? _view;
  int _dropped = 0;
  Timer? _notify;
  bool _disposed = false;

  /// The entries, oldest first (unmodifiable).
  List<LogEntry> get entries => _view ??= List.unmodifiable(_entries);

  /// How many entries were dropped for [capacity] since the last [clear].
  int get dropped => _dropped;

  /// The entries at [min] or above, oldest first.
  List<LogEntry> atLeast(LogLevel min) => min == LogLevel.info
      ? entries
      : [
          for (final e in _entries)
            if (e.level.index >= min.index) e,
        ];

  /// Logs [message] from [source] at [level] and returns the entry. Line
  /// breaks in [message] become spaces.
  LogEntry add(LogLevel level, String source, String message) {
    final e = LogEntry(now(), level, source, _oneLine(message));
    if (_entries.length >= capacity) {
      _entries.removeFirst();
      _dropped++;
    }
    _entries.addLast(e);
    _view = null;
    if (mirror) debugPrint(name == null ? e.line : '$name ${e.line}');
    _schedule();
    return e;
  }

  /// [add] at [LogLevel.info].
  LogEntry info(String source, String message) =>
      add(LogLevel.info, source, message);

  /// [add] at [LogLevel.warn].
  LogEntry warn(String source, String message) =>
      add(LogLevel.warn, source, message);

  /// [add] at [LogLevel.error].
  LogEntry error(String source, String message) =>
      add(LogLevel.error, source, message);

  /// Drops every entry; listeners hear of it at once.
  void clear() {
    _entries.clear();
    _view = null;
    _dropped = 0;
    _notify?.cancel();
    _notify = null;
    if (!_disposed) notifyListeners();
  }

  /// The entries at [min] or above as text to copy: one
  /// [LogEntry.line] per entry, oldest first.
  String asText({LogLevel min = LogLevel.info}) =>
      [for (final e in atLeast(min)) e.line].join('\n');

  /// Empties the log without telling anyone and forgets a pending
  /// notification (tests: each starts from an empty log).
  @visibleForTesting
  void reset() {
    _notify?.cancel();
    _notify = null;
    _entries.clear();
    _view = null;
    _dropped = 0;
  }

  static final RegExp _breaks = RegExp(r'\s*[\r\n]+\s*');

  static String _oneLine(String message) {
    final m = message.replaceAll(_breaks, ' ');
    return m.length > maxMessage ? '${m.substring(0, maxMessage)}…' : m;
  }

  /// Nobody listening (the panel is closed): nothing to schedule; a panel
  /// that opens later reads [entries] as it builds.
  void _schedule() {
    if (_disposed || _notify != null || !hasListeners) return;
    _notify = Timer(notifyEvery, () {
      _notify = null;
      if (!_disposed) notifyListeners();
    });
  }

  @override
  void dispose() {
    _disposed = true;
    _notify?.cancel();
    _notify = null;
    super.dispose();
  }
}

/// The shared application log (set [AppLog.name] to the app's name).
final AppLog appLog = AppLog();
