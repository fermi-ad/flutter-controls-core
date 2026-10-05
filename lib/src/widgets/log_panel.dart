/// A side panel listing an [AppLog], newest first, with a level filter,
/// Copy and Clear.
library;

import 'dart:math' as math;

import 'package:bison_design_system/bison_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;

import '../logging/app_log.dart';

const double logPanelWidth = 600;

class LogPanel extends StatefulWidget {
  const LogPanel({
    required this.onClose,
    this.log,
    this.width = logPanelWidth,
    super.key,
  });

  /// Called by the close button.
  final VoidCallback onClose;

  /// Defaults to [appLog].
  final AppLog? log;
  final double width;

  @override
  State<LogPanel> createState() => _LogPanelState();
}

class _LogPanelState extends State<LogPanel> {
  static const _filters = [
    (LogLevel.info, 'All', 'Every entry'),
    (LogLevel.warn, 'Warnings', 'Warnings and errors'),
    (LogLevel.error, 'Errors', 'Errors only'),
  ];

  LogLevel _min = LogLevel.info;

  AppLog get _log => widget.log ?? appLog;

  Future<void> _copy(int n) async {
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
    final look = _lookOf(context);
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
            final total = _log.entries.length;
            final shown = _log.atLeast(_min).reversed.toList();
            final empty = total == 0
                ? 'Nothing logged yet'
                : _min == LogLevel.warn
                ? 'No warnings or errors'
                : 'No errors';
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _header(look, total, shown.length),
                Divider(height: 9, color: look.border),
                Expanded(
                  child: shown.isEmpty
                      ? Center(
                          child: Text(
                            empty,
                            style: look.body.copyWith(color: look.muted),
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
    final count = [
      if (_min == LogLevel.info)
        '$total entr${total == 1 ? 'y' : 'ies'}'
      else
        '$shown of $total',
      if (_log.dropped > 0) '${_log.dropped} older dropped',
    ].join(' · ');
    Widget button(String id, IconData icon, String tip, VoidCallback? f) =>
        IconButton(
          key: ValueKey(id),
          tooltip: tip,
          iconSize: 16,
          color: look.text,
          disabledColor: look.disabled,
          visualDensity: VisualDensity.compact,
          onPressed: f,
          icon: Icon(icon),
        );
    return Row(
      children: [
        Text(
          'Log',
          style: look.body.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: look.accent,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            count,
            key: const ValueKey('log-count'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: look.body.copyWith(color: look.muted),
          ),
        ),
        _filter(look),
        const SizedBox(width: 8),
        button(
          'log-copy',
          Icons.copy,
          'Copy the entries shown',
          shown == 0 ? null : () => _copy(shown),
        ),
        button(
          'log-clear',
          Icons.delete_outline,
          'Clear the log',
          total == 0 ? null : _log.clear,
        ),
        button('log-close', Icons.close, 'Close', widget.onClose),
      ],
    );
  }

  Widget _filter(_Look look) => Container(
    height: 24,
    decoration: BoxDecoration(
      border: Border.all(color: look.border),
      borderRadius: BorderRadius.circular(3),
    ),
    clipBehavior: Clip.antiAlias,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final (level, label, tip) in _filters)
          Tooltip(
            message: tip,
            child: InkWell(
              key: ValueKey('log-filter-${level.name}'),
              onTap: () => setState(() => _min = level),
              child: Container(
                color: level == _min ? look.selected : null,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: look.body.copyWith(
                    fontWeight: FontWeight.w500,
                    color: level == _min ? look.accent : look.text,
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
  );

  /// Time, level and source columns sized to their widest text.
  Widget _list(BuildContext context, _Look look, List<LogEntry> shown) {
    final scaler = MediaQuery.textScalerOf(context);
    double width(String text) {
      final p = TextPainter(
        text: TextSpan(text: text, style: look.body),
        textDirection: TextDirection.ltr,
        textScaler: scaler,
      )..layout();
      final w = p.width.ceilToDouble();
      p.dispose();
      return w;
    }

    final time = width('00:00:00.000');
    final level = width(LogLevel.error.tag);
    final source = {for (final e in shown) e.source}
        .map(width)
        .fold(0.0, math.max);
    Widget cell(double w, String text, TextStyle style) => SizedBox(
      width: w,
      child: Text(text, style: style),
    );
    return ListView.builder(
      key: const ValueKey('log-list'),
      itemCount: shown.length,
      itemBuilder: (context, i) {
        final e = shown[i];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              cell(
                time,
                logClock(e.time),
                look.body.copyWith(color: look.muted),
              ),
              cell(
                level,
                e.level.tag,
                look.body.copyWith(
                  color: switch (e.level) {
                    LogLevel.info => look.text,
                    LogLevel.warn => look.warn,
                    LogLevel.error => look.error,
                  },
                  fontWeight: e.level == LogLevel.info ? null : FontWeight.bold,
                ),
              ),
              cell(source, e.source, look.body.copyWith(color: look.accent)),
              Expanded(child: Text(e.message, style: look.body)),
            ],
          ),
        );
      },
    );
  }
}

typedef _Look = ({
  Color surface,
  Color border,
  Color accent,
  Color text,
  Color muted,
  Color warn,
  Color error,
  Color selected,
  Color disabled,
  TextStyle body,
});

/// Bison tokens when the theme has them, else the Material colour scheme.
_Look _lookOf(BuildContext context) {
  final theme = Theme.of(context);
  final body =
      (theme.extension<BisonTypographyTokens>()?.bodySmall ??
              theme.textTheme.bodySmall ??
              const TextStyle())
          .copyWith(
            fontSize: 11,
            fontFeatures: const [FontFeature.tabularFigures()],
          );
  final t = theme.extension<BisonThemeTokens>();
  if (t != null) {
    return (
      surface: t.surfaceDefault,
      border: t.borderPlain,
      accent: t.textPrimary,
      text: t.textPlain,
      muted: t.textSecondary,
      warn: t.iconWarning,
      error: t.textError,
      selected: t.surfacePressed,
      disabled: t.textDisabled,
      body: body.copyWith(color: t.textPlain),
    );
  }
  final s = theme.colorScheme;
  return (
    surface: s.surface,
    border: s.outlineVariant,
    accent: s.primary,
    text: s.onSurface,
    muted: s.onSurfaceVariant,
    warn: Colors.amber.shade700,
    error: s.error,
    selected: s.primary.withValues(alpha: 0.16),
    disabled: s.onSurface.withValues(alpha: 0.38),
    body: body.copyWith(color: s.onSurface),
  );
}
