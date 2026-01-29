// Models and parsers for Alarm message value formats.
//
// Based on "Message Formats" section in:
// https://github.com/ControlSystemStudio/phoebus/blob/master/app/alarm/Readme.md
//
// Notes:
// - Config deletions use a "tombstone" message where the value is JSON null.
// - Before a tombstone, a "config delete message" may be sent with
//   {"user","host","delete"}.

import 'dart:convert';

/// Extract message type from key (format: "type:rest").
/// Returns null if key is null or doesn't contain a colon.
String? _extractMessageTypeFromKey(String? key) {
  if (key == null) return null;
  final colonIndex = key.indexOf(':');
  if (colonIndex == -1) return null;
  return key.substring(0, colonIndex);
}

/// Common title/details entry used by guidance/displays/commands/actions.
class AlarmDocRef {
  final String title;
  final String details;

  const AlarmDocRef({required this.title, required this.details});

  factory AlarmDocRef.fromJson(Map<String, dynamic> json) {
    return AlarmDocRef(
      title: json['title'] as String,
      details: json['details'] as String,
    );
  }
}

/// Timestamp format used in state leaf messages.
class AlarmTime {
  final int seconds;
  final int nano;

  const AlarmTime({required this.seconds, required this.nano});

  factory AlarmTime.fromJson(Map<String, dynamic> json) {
    return AlarmTime(
      seconds: (json['seconds'] as num).toInt(),
      nano: (json['nano'] as num).toInt(),
    );
  }
}

/// Uses heuristics to choose the most appropriate payload type.
sealed class AlarmMessageValue {
  const AlarmMessageValue();
}

/// Parsed config value (payload can be null for tombstone).
final class AlarmConfigValue extends AlarmMessageValue {
  final AlarmConfigPayload? payload;

  const AlarmConfigValue({required this.payload});
}

/// Parsed state value.
final class AlarmStateValue extends AlarmMessageValue {
  final AlarmStatePayload payload;

  const AlarmStateValue({required this.payload});
}

/// Parsed command value.
final class AlarmCommandValue extends AlarmMessageValue {
  final AlarmCommandPayload payload;

  const AlarmCommandValue({required this.payload});
}

/// Parsed talk value.
final class AlarmTalkValue extends AlarmMessageValue {
  final AlarmTalkPayload payload;

  const AlarmTalkValue({required this.payload});
}

/// Unknown or unrecognized value shape.
final class AlarmUnknownValue extends AlarmMessageValue {
  final Object? value;

  const AlarmUnknownValue({required this.value});
}

/// Parse alarm value from a JSON string, using the key to determine message type.
AlarmMessageValue parseAlarmValueJsonString(String raw, {String? key}) {
  final dynamic decoded = jsonDecode(raw);
  return parseAlarmValueJson(decoded as Map<String, dynamic>?, key: key);
}

/// Parse alarm value from a decoded JSON map, using the key to determine message type.
AlarmMessageValue parseAlarmValueJson(
  Map<String, dynamic>? decoded, {
  String? key,
}) {
  final messageType = _extractMessageTypeFromKey(key);

  if (decoded == null) {
    // Tombstone value is only defined for config messages, so return config.
    return const AlarmConfigValue(payload: null);
  }

  // Use key-based message type if available, otherwise label as unknown.
  if (messageType != null) {
    switch (messageType) {
      case 'config':
        return AlarmConfigValue(payload: AlarmConfigPayload.fromJson(decoded));
      case 'state':
        return AlarmStateValue(payload: AlarmStatePayload.fromJson(decoded));
      case 'command':
        return AlarmCommandValue(
          payload: AlarmCommandPayload.fromJson(decoded),
        );
      case 'talk':
        return AlarmTalkValue(payload: AlarmTalkPayload.fromJson(decoded));
    }
  }

  return AlarmUnknownValue(value: decoded);
}

/// -------------------- CONFIG --------------------

sealed class AlarmConfigPayload {
  const AlarmConfigPayload();

  /// Best-effort decode:
  /// - if {"delete": "..."} present => delete-info message
  /// - else if "description" present => leaf config
  /// - else => node config
  factory AlarmConfigPayload.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('delete')) {
      return AlarmConfigDeleteInfo.fromJson(json);
    }
    if (json.containsKey('description')) {
      return AlarmLeafConfig.fromJson(json);
    }
    return AlarmNodeConfig.fromJson(json);
  }
}

/// Config for an alarm tree leaf (PV).
class AlarmLeafConfig extends AlarmConfigPayload {
  final String user;
  final String host;

  final String description;

  final int? delay;
  final int? count;
  final String? filter;

  final List<AlarmDocRef>? guidance;
  final List<AlarmDocRef>? displays;
  final List<AlarmDocRef>? commands;
  final List<AlarmDocRef>? actions;

  const AlarmLeafConfig({
    required this.user,
    required this.host,
    required this.description,
    this.delay,
    this.count,
    this.filter,
    this.guidance,
    this.displays,
    this.commands,
    this.actions,
  });

  factory AlarmLeafConfig.fromJson(Map<String, dynamic> json) {
    return AlarmLeafConfig(
      user: json['user'] as String,
      host: json['host'] as String,
      description: json['description'] as String,
      delay: (json['delay'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      filter: json['filter'] as String?,
      guidance: _docListOrNull(json['guidance']),
      displays: _docListOrNull(json['displays']),
      commands: _docListOrNull(json['commands']),
      actions: _docListOrNull(json['actions']),
    );
  }
}

/// Config for an alarm tree node (folder/section).
class AlarmNodeConfig extends AlarmConfigPayload {
  final String user;
  final String host;

  final List<AlarmDocRef>? guidance;
  final List<AlarmDocRef>? displays;
  final List<AlarmDocRef>? commands;
  final List<AlarmDocRef>? actions;

  const AlarmNodeConfig({
    required this.user,
    required this.host,
    this.guidance,
    this.displays,
    this.commands,
    this.actions,
  });

  factory AlarmNodeConfig.fromJson(Map<String, dynamic> json) {
    return AlarmNodeConfig(
      user: json['user'] as String,
      host: json['host'] as String,
      guidance: _docListOrNull(json['guidance']),
      displays: _docListOrNull(json['displays']),
      commands: _docListOrNull(json['commands']),
      actions: _docListOrNull(json['actions']),
    );
  }
}

/// Config delete info message sent before tombstone null.
class AlarmConfigDeleteInfo extends AlarmConfigPayload {
  final String user;
  final String host;
  final String delete;

  const AlarmConfigDeleteInfo({
    required this.user,
    required this.host,
    required this.delete,
  });

  factory AlarmConfigDeleteInfo.fromJson(Map<String, dynamic> json) {
    return AlarmConfigDeleteInfo(
      user: json['user'] as String,
      host: json['host'] as String,
      delete: json['delete'] as String,
    );
  }
}

/// -------------------- STATE --------------------

sealed class AlarmStatePayload {
  const AlarmStatePayload();

  /// Best-effort decode:
  /// - if contains typical leaf fields => leaf
  /// - else => node
  factory AlarmStatePayload.fromJson(Map<String, dynamic> json) {
    // Leaf state in docs includes message/value/time/current_* etc.
    final hasLeafHints =
        json.containsKey('message') ||
        json.containsKey('value') ||
        json.containsKey('time') ||
        json.containsKey('current_severity') ||
        json.containsKey('current_message') ||
        json.containsKey('latch');
    return hasLeafHints
        ? AlarmLeafState.fromJson(json)
        : AlarmNodeState.fromJson(json);
  }
}

/// State for an alarm tree leaf (PV).
class AlarmLeafState extends AlarmStatePayload {
  /// Always present in state updates.
  final String severity;

  final bool? latch;
  final String? message;
  final String? value;
  final AlarmTime? time;

  final String? currentSeverity; // "current_severity"
  final String? currentMessage; // "current_message"

  /// Optional mode, present as "maintenance" (otherwise omitted).
  final String? mode;

  const AlarmLeafState({
    required this.severity,
    this.latch,
    this.message,
    this.value,
    this.time,
    this.currentSeverity,
    this.currentMessage,
    this.mode,
  });

  factory AlarmLeafState.fromJson(Map<String, dynamic> json) {
    return AlarmLeafState(
      severity: json['severity'] as String,
      latch: json['latch'] as bool?,
      message: json['message'] as String?,
      value: json['value'] as String?,
      time:
          (json['time'] is Map<String, dynamic>)
              ? AlarmTime.fromJson(json['time'] as Map<String, dynamic>)
              : null,
      currentSeverity: json['current_severity'] as String?,
      currentMessage: json['current_message'] as String?,
      mode: json['mode'] as String?,
    );
  }
}

/// State for an alarm tree node.
class AlarmNodeState extends AlarmStatePayload {
  final String severity;
  final String? mode;

  const AlarmNodeState({required this.severity, this.mode});

  factory AlarmNodeState.fromJson(Map<String, dynamic> json) {
    return AlarmNodeState(
      severity: json['severity'] as String,
      mode: json['mode'] as String?,
    );
  }
}

/// -------------------- COMMAND --------------------

class AlarmCommandPayload {
  final String user;
  final String host;
  final String command;

  const AlarmCommandPayload({
    required this.user,
    required this.host,
    required this.command,
  });

  factory AlarmCommandPayload.fromJson(Map<String, dynamic> json) {
    return AlarmCommandPayload(
      user: json['user'] as String,
      host: json['host'] as String,
      command: json['command'] as String,
    );
  }
}

/// -------------------- TALK --------------------

class AlarmTalkPayload {
  final String severity;
  final bool standout;

  /// Doc says JSON uses "talk", example shows "message".
  /// To be tolerant, we accept either on decode and emit "talk" by default.
  final String talk;

  const AlarmTalkPayload({
    required this.severity,
    required this.standout,
    required this.talk,
  });

  factory AlarmTalkPayload.fromJson(Map<String, dynamic> json) {
    final talk = (json['talk'] ?? json['message']) as String?;
    if (talk == null) {
      throw FormatException('Talk payload missing "talk" (or "message") field');
    }
    return AlarmTalkPayload(
      severity: json['severity'] as String,
      standout: json['standout'] as bool,
      talk: talk,
    );
  }
}

/// Helper: decode list-of-docrefs or null.
List<AlarmDocRef>? _docListOrNull(Object? value) {
  if (value == null) return null;
  if (value is! List) throw FormatException('Expected a list for doc refs');
  return value
      .map((e) => AlarmDocRef.fromJson(e as Map<String, dynamic>))
      .toList(growable: false);
}
