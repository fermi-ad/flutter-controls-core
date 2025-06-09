import 'package:opentelemetry/api.dart' as otel;
import 'package:opentelemetry/sdk.dart'
    show TracerProviderBase, SimpleSpanProcessor, ConsoleExporter, SpanExporter;
import 'package:opentelemetry/api.dart'
    show registerGlobalTracerProvider, globalTracerProvider, Attribute;

/// OpenTelemetry singleton tracer for manual instrumentation
late final otel.Tracer otelTracer;
bool _otelInitialized = false;

/// More idiomatic Dart 3+ pattern matching for attribute conversion
Attribute _toAttribute(String key, Object? value) => switch (value) {
  String v => Attribute.fromString(key, v),
  bool v => Attribute.fromBoolean(key, v),
  double v => Attribute.fromDouble(key, v),
  int v => Attribute.fromInt(key, v),
  List<String> v => Attribute.fromStringList(key, v),
  List<bool> v => Attribute.fromBooleanList(key, v),
  List<double> v => Attribute.fromDoubleList(key, v),
  List<int> v => Attribute.fromIntList(key, v),
  _ => Attribute.fromString(key, value.toString()),
};

/// Initializes OpenTelemetry auto-instrumentation and tracer provider.
/// Call this early in your app (e.g., in main or before runFermiApp).
Future<void> initOpenTelemetry({
  String serviceName = 'flutter_controls_core',
  SpanExporter? exporter,
}) async {
  if (_otelInitialized) return;
  final tracerProvider = TracerProviderBase(
    processors: [SimpleSpanProcessor(exporter ?? ConsoleExporter())],
  );
  registerGlobalTracerProvider(tracerProvider);
  otelTracer = globalTracerProvider.getTracer(serviceName);
  _otelInitialized = true;  
}

/// Start a manual span. Returns the span, which you must end.
otel.Span startSpan(String name, {Map<String, Object?>? attributes}) {
  final span = otelTracer.startSpan(name);
  if (attributes != null) {
    for (final entry in attributes.entries) {
      span.setAttribute(_toAttribute(entry.key, entry.value));
    }
  }
  return span;
}

/// Add an event to a span (must be provided by the caller).
void addEvent(otel.Span span, String name, {Map<String, Object?>? attributes}) {
  final attrList =
      attributes?.entries.map((e) => _toAttribute(e.key, e.value)).toList() ??
      const [];
  span.addEvent(name, attributes: attrList);
}

/// End the provided span.
void endSpan(otel.Span span) {
  span.end();
}

/// Starts a span, executes a function, and ends the span automatically.
///
/// This is recommended for reliability: the span will always be ended, even if an exception occurs.
///
/// Example usage:
/// ```dart
/// runWithSpan('myOperation', (span) {
///   // Do work
/// });
/// ```
R runWithSpan<R>(
  String name,
  R Function(otel.Span span) fn, {
  Map<String, Object?>? attributes,
}) {
  final span = startSpan(name, attributes: attributes);
  try {
    return fn(span);
  } finally {
    endSpan(span);
  }
}

/// Starts a span, executes an async function, and ends the span automatically.
///
/// Example usage:
/// ```dart
/// await runWithSpanAsync('myAsyncOperation', (span) async {
///   // Do async work
/// });
/// ```
Future<R> runWithSpanAsync<R>(
  String name,
  Future<R> Function(otel.Span span) fn, {
  Map<String, Object?>? attributes,
}) async {
  final span = startSpan(name, attributes: attributes);
  try {
    return await fn(span);
  } finally {
    endSpan(span);
  }
}

/// Abstract tracer interface for testability and flexibility.
abstract class AppTracer {
  otel.Span startSpan(String name, {Map<String, Object?>? attributes});
  void addEvent(
    otel.Span span,
    String name, {
    Map<String, Object?>? attributes,
  });
  void endSpan(otel.Span span);
  R runWithSpan<R>(
    String name,
    R Function(otel.Span span) fn, {
    Map<String, Object?>? attributes,
  });
  Future<R> runWithSpanAsync<R>(
    String name,
    Future<R> Function(otel.Span span) fn, {
    Map<String, Object?>? attributes,
  });
}

/// Default implementation using the global otelTracer.
class GlobalAppTracer implements AppTracer {
  @override
  otel.Span startSpan(String name, {Map<String, Object?>? attributes}) =>
      startSpan(name, attributes: attributes);

  @override
  void addEvent(
    otel.Span span,
    String name, {
    Map<String, Object?>? attributes,
  }) => addEvent(span, name, attributes: attributes);

  @override
  void endSpan(otel.Span span) => endSpan(span);

  @override
  R runWithSpan<R>(
    String name,
    R Function(otel.Span span) fn, {
    Map<String, Object?>? attributes,
  }) => runWithSpan(name, fn, attributes: attributes);

  @override
  Future<R> runWithSpanAsync<R>(
    String name,
    Future<R> Function(otel.Span span) fn, {
    Map<String, Object?>? attributes,
  }) => runWithSpanAsync(name, fn, attributes: attributes);
}

/// The default tracer instance for use in most apps (opt-out global).
final AppTracer appTracer = GlobalAppTracer();

/// ---
/// # OpenTelemetry Usage Guidance
///
/// ## Overview
///
/// OpenTelemetry tracing is enabled by default (opt-out) for all apps using this package's entrypoints.
///
/// - Auto-instrumentation is initialized automatically in `runFermiApp` and `runFermiRouterApp`.
/// - All spans are exported to the console by default (see `ConsoleExporter`).
/// - You can override the exporter by calling `initOpenTelemetry(exporter: ...)` before app startup.
///
/// ## Manual Instrumentation
///
/// Use the helpers below for manual spans and events:
///
/// ```dart
/// final span = startSpan('operation', attributes: {'key': 'value'});
/// try {
///   // ... your code ...
///   addEvent(span, 'eventName', attributes: {'foo': 42});
/// } finally {
///   endSpan(span);
/// }
/// ```
///
/// Or use the convenience wrappers for automatic span management:
///
/// ```dart
/// runWithSpan('operation', (span) {
///   // ... your code ...
/// });
///
/// await runWithSpanAsync('asyncOp', (span) async {
///   // ... your async code ...
/// });
/// ```
///
/// ## Dependency Injection and Testing
///
/// Use the `AppTracer` interface and the `appTracer` instance for testable code:
///
/// ```dart
/// class MyService {
///   final AppTracer tracer;
///   MyService(this.tracer);
///   void doWork() {
///     tracer.runWithSpan('work', (span) {
///       // ...
///     });
///   }
/// }
/// ```
///
/// In tests, inject a mock tracer if needed.
///
/// ## Opting Out
///
/// To disable tracing, you can override `initOpenTelemetry` with a no-op exporter or skip calling it (not recommended for most apps).
/// ---
