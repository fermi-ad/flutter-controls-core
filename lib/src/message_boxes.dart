/// Functions for displaying common toast notification message boxes.

library;

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

const _defaultDuration = Duration(seconds: 4);

void _showBox(
  BuildContext context,
  ToastificationType type,
  String title,
  String content,
  Duration? duration,
) {
  final textTheme = Theme.of(context).textTheme;

  toastification.show(
    context: context,
    type: type,
    style: .minimal,
    title: Text(title, style: textTheme.titleSmall),
    description: Text(content, style: textTheme.bodyMedium),
    autoCloseDuration: duration ?? _defaultDuration,
  );
}

/// Displays an error notification.
///
/// - [context] is the [BuildContext] used to display the notification.
/// - [title] is the bold heading of the notification.
/// - [content] is the descriptive body text of the notification.
/// - [duration] controls how long the notification is visible. Defaults to
///   4 seconds if not provided.
void errorBox(
  BuildContext context,
  String title,
  String content, {
  Duration? duration,
}) => _showBox(context, .error, title, content, duration);

/// Displays a warning notification.
///
/// - [context] is the [BuildContext] used to display the notification.
/// - [title] is the bold heading of the notification.
/// - [content] is the descriptive body text of the notification.
/// - [duration] controls how long the notification is visible. Defaults to
///   4 seconds if not provided.
void warningBox(
  BuildContext context,
  String title,
  String content, {
  Duration? duration,
}) => _showBox(context, .warning, title, content, duration);

/// Displays an informational notification.
///
/// - [context] is the [BuildContext] used to display the notification.
/// - [title] is the bold heading of the notification.
/// - [content] is the descriptive body text of the notification.
/// - [duration] controls how long the notification is visible. Defaults to
///   4 seconds if not provided.
void infoBox(
  BuildContext context,
  String title,
  String content, {
  Duration? duration,
}) => _showBox(context, .info, title, content, duration);
