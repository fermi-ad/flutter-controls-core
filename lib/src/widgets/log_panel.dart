/// A side panel showing an [AppLog]: newest first, filtered to every entry,
/// warnings and errors, or errors only. Copy puts the entries shown on the
/// clipboard (oldest first, one line each); Clear empties the log.
library;

import 'dart:math' as math;

import 'package:bison_design_system/bison_design_system.dart'
    show BisonThemeTokens, BisonTypographyTokens;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;

import '../logging/app_log.dart';

/// The panel's default width.
const double logPanelWidth = 600;

/// The panel.
class LogPanel extends StatefulWidget {
  /// Creates the panel for [log] (the shared [appLog] when `null`);
  /// [onClose] is its ✕.
  const LogPanel({
    required this.onClose,
    this.log,
    this.width = logPanelWidth,
    super.key,
  });

  /// Closes the panel.
  final VoidCallback onClose;

  /// The log shown, or `null` for [appLog].
  final AppLog? log;

  /// The panel's width.
  final double width;

  @override
  State<LogPanel> createState() => _LogPanelState();
}

class _LogPanelState extends State<LogPanel> {
  LogLevel _min = LogLevel.info;

  AppLog get _log => widget.log ?? appLog;

  Future<void> _copy() async {
    final n = _log.atLeast(_min).length;
    await Clipboard.setData(ClipboardData(text: _log.asText(min: _min)));
    if (!mounted) return;
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      SnackBar(
        content: Text('Copied $n log line${n == 1 ? '' : 's'}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final look = _Look.of(context);
    return Material(
      color: look.surface,
      elevation: 12,
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: look.border)),
        ),
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 6),
        child: ListenableBuilder(
          listenable: _log,
          builder: (context, _) {
            final all = _log.entries;
            final shown = _log.atLeast(_min);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _header(look, all.length, shown.length),
                Divider(height: 9, color: look.border),
                Expanded(
                  child: shown.isEmpty
                      ? Center(
                          child: Text(
                            all.isEmpty
                                ? 'Nothing logged yet'
                                : _min == LogLevel.warn
                                ? 'No warnings or errors'
                                : 'No errors',
                            style: look.body.copyWith(color: look.label),
                          ),
                        )
                      : _list(context, look, shown),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _header(_Look look, int total, int shown) {
    final dropped = _log.dropped;
    final count = [
      _min == LogLevel.info
          ? '$total entr${total == 1 ? 'y' : 'ies'}'
          : '$shown of $total',
      if (dropped > 0) '$dropped older dropped',
    ].join(' · ');
    return Row(
      children: [
        Text(
          'Log',
          style: look.body.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: look.title,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            count,
            key: const ValueKey('log-count'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: look.body.copyWith(color: look.label),
          ),
        ),
        _Filter(
          look: look,
          value: _min,
          onChanged: (l) => setState(() => _min = l),
        ),
        const SizedBox(width: 8),
        _HeaderButton(
          look: look,
          id: 'log-copy',
          icon: Icons.copy,
          label: 'Copy',
          tooltip: 'copy the entries shown, oldest first, one line each',
          onPressed: shown == 0 ? null : _copy,
        ),
        _HeaderButton(
          look: look,
          id: 'log-clear',
          icon: Icons.delete_outline,
          label: 'Clear',
          tooltip: 'empty the log',
          onPressed: total == 0 ? null : _log.clear,
        ),
        IconButton(
          key: const ValueKey('log-close'),
          tooltip: 'close',
          iconSize: 16,
          color: look.text,
          visualDensity: VisualDensity.compact,
          onPressed: widget.onClose,
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }

  /// Newest first; time, level and source in columns as wide as their
  /// widest text, the message wrapping beside them.
  Widget _list(BuildContext context, _Look look, List<LogEntry> shown) {
    final scaler = MediaQuery.textScalerOf(context);
    double width(String text) {
      final p = TextPainter(
        text: TextSpan(text: text, style: look.body),
        textDirection: TextDirection.ltr,
        textScaler: scaler,
        maxLines: 1,
      )..layout();
      final w = p.width;
      p.dispose();
      return w.ceilToDouble();
    }

    final sources = {for (final e in shown) e.source};
    final columns = (
      time: width('00:00:00.000'),
      level: width(LogLevel.error.tag),
      source: sources.map(width).fold<double>(0, math.max),
    );
    return ListView.builder(
      key: const ValueKey('log-list'),
      itemCount: shown.length,
      itemBuilder: (context, i) => _EntryRow(
        look: look,
        entry: shown[shown.length - 1 - i],
        columns: columns,
      ),
    );
  }
}

/// The panel's colours and text style: the Bison tokens when the theme
/// carries them, else the Material colour scheme.
class _Look {
  const _Look({
    required this.surface,
    required this.border,
    required this.title,
    required this.text,
    required this.muted,
    required this.label,
    required this.source,
    required this.warn,
    required this.error,
    required this.selected,
    required this.disabled,
    required this.body,
  });

  factory _Look.of(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.extension<BisonTypographyTokens>();
    final body =
        (typography?.bodySmall ??
                theme.textTheme.bodySmall ??
                const TextStyle())
            .copyWith(
              fontSize: 11,
              fontFeatures: const [FontFeature.tabularFigures()],
            );
    final t = theme.extension<BisonThemeTokens>();
    if (t != null) {
      return _Look(
        surface: t.surfaceDefault,
        border: t.borderPlain,
        title: t.textPrimary,
        text: t.textPlain,
        muted: t.textMuted,
        label: t.textSecondary,
        source: t.textPrimary,
        warn: t.iconWarning,
        error: t.textError,
        selected: t.surfacePressed,
        disabled: t.textDisabled,
        body: body.copyWith(color: t.textPlain),
      );
    }
    final s = theme.colorScheme;
    return _Look(
      surface: s.surface,
      border: s.outlineVariant,
      title: s.primary,
      text: s.onSurface,
      muted: s.onSurfaceVariant,
      label: s.onSurfaceVariant,
      source: s.primary,
      warn: Colors.amber.shade700,
      error: s.error,
      selected: s.primary.withValues(alpha: 0.16),
      disabled: s.onSurface.withValues(alpha: 0.38),
      body: body.copyWith(color: s.onSurface),
    );
  }

  final Color surface;
  final Color border;
  final Color title;
  final Color text;
  final Color muted;
  final Color label;
  final Color source;
  final Color warn;
  final Color error;
  final Color selected;
  final Color disabled;
  final TextStyle body;

  /// The colour an entry's level is drawn in.
  Color level(LogLevel l) => switch (l) {
    LogLevel.info => text,
    LogLevel.warn => warn,
    LogLevel.error => error,
  };
}

/// One entry: `12:00:01.234  WARN  link  message…`.
class _EntryRow extends StatelessWidget {
  const _EntryRow({
    required this.look,
    required this.entry,
    required this.columns,
  });

  final _Look look;
  final LogEntry entry;
  final ({double time, double level, double source}) columns;

  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(width: 8);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: columns.time,
            child: Text(
              logClock(entry.time),
              style: look.body.copyWith(color: look.muted),
            ),
          ),
          gap,
          SizedBox(
            width: columns.level,
            child: Text(
              entry.level.tag,
              style: look.body.copyWith(
                color: look.level(entry.level),
                fontWeight: entry.level == LogLevel.info
                    ? FontWeight.normal
                    : FontWeight.bold,
              ),
            ),
          ),
          gap,
          SizedBox(
            width: columns.source,
            child: Text(
              entry.source,
              style: look.body.copyWith(color: look.source),
            ),
          ),
          gap,
          Expanded(child: Text(entry.message, style: look.body)),
        ],
      ),
    );
  }
}

/// All · Warnings · Errors, joined.
class _Filter extends StatelessWidget {
  const _Filter({
    required this.look,
    required this.value,
    required this.onChanged,
  });

  final _Look look;
  final LogLevel value;
  final ValueChanged<LogLevel> onChanged;

  static String _label(LogLevel l) => switch (l) {
    LogLevel.info => 'All',
    LogLevel.warn => 'Warnings',
    LogLevel.error => 'Errors',
  };

  static String _tip(LogLevel l) => switch (l) {
    LogLevel.info => 'every entry',
    LogLevel.warn => 'warnings and errors',
    LogLevel.error => 'errors only',
  };

  @override
  Widget build(BuildContext context) => Container(
    height: 24,
    decoration: BoxDecoration(
      border: Border.all(color: look.border),
      borderRadius: BorderRadius.circular(3),
    ),
    clipBehavior: Clip.antiAlias,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final l in LogLevel.values)
          Tooltip(
            message: _tip(l),
            child: InkWell(
              key: ValueKey('log-filter-${l.name}'),
              onTap: () => onChanged(l),
              child: Container(
                color: l == value ? look.selected : null,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.center,
                child: Text(
                  _label(l),
                  style: look.body.copyWith(
                    fontWeight: FontWeight.w500,
                    color: l == value ? look.title : look.text,
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}

/// A small text button with an icon, for the header.
class _HeaderButton extends StatelessWidget {
  const _HeaderButton({
    required this.look,
    required this.id,
    required this.icon,
    required this.label,
    required this.tooltip,
    required this.onPressed,
  });

  final _Look look;
  final String id;
  final IconData icon;
  final String label;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Tooltip(
    message: tooltip,
    child: TextButton.icon(
      key: ValueKey(id),
      style: TextButton.styleFrom(
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: const Size(0, 24),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        foregroundColor: look.text,
        disabledForegroundColor: look.disabled,
        textStyle: look.body,
      ),
      onPressed: onPressed,
      icon: Icon(icon, size: 14),
      label: Text(label),
    ),
  );
}
