import 'package:flutter_controls_core/flutter_controls_core.dart';
import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:opentelemetry/api.dart' as otel;
import 'package:test/test.dart';

void main() {
  group('otel_tracing', () {
    test('appTracer can be swapped for tests and restored', () {
      final original = appTracer;
      final fake = _FakeTracer();

      appTracer = fake;
      expect(identical(appTracer, fake), isTrue);

      // Restore to avoid leaking state across tests.
      appTracer = original;
      expect(identical(appTracer, original), isTrue);
    });

    test('runWithSpan ends span on success', () {
      final original = appTracer;
      final fake = _FakeTracer();
      appTracer = fake;

      final result = appTracer.runWithSpan<int>('op', (span) {
        expect(span, isA<_FakeSpan>());
        return 123;
      });

      expect(result, 123);
      expect(fake.started, 1);
      expect(fake.ended, 1);

      appTracer = original;
    });

    test('runWithSpan ends span even when callback throws', () {
      final original = appTracer;
      final fake = _FakeTracer();
      appTracer = fake;

      expect(
        () => appTracer.runWithSpan<void>('op', (span) {
          throw StateError('boom');
        }),
        throwsA(isA<StateError>()),
      );

      expect(fake.started, 1);
      expect(fake.ended, 1);

      appTracer = original;
    });

    test('runWithSpanAsync ends span on success', () async {
      final original = appTracer;
      final fake = _FakeTracer();
      appTracer = fake;

      final result = await appTracer.runWithSpanAsync<String>('op', (
        span,
      ) async {
        return 'ok';
      });

      expect(result, 'ok');
      expect(fake.started, 1);
      expect(fake.ended, 1);

      appTracer = original;
    });

    test('runWithSpanAsync ends span even when callback throws', () async {
      final original = appTracer;
      final fake = _FakeTracer();
      appTracer = fake;

      await expectLater(
        () => appTracer.runWithSpanAsync<void>('op', (span) async {
          throw ArgumentError('boom');
        }),
        throwsA(isA<ArgumentError>()),
      );

      expect(fake.started, 1);
      expect(fake.ended, 1);

      appTracer = original;
    });
  });
}

final class _FakeTracer implements AppTracer {
  int started = 0;
  int ended = 0;

  @override
  otel.Span startSpan(String name, {Map<String, Object?>? attributes}) {
    started++;
    return _FakeSpan();
  }

  @override
  void addEvent(
    otel.Span span,
    String name, {
    Map<String, Object?>? attributes,
  }) {
    // No-op for this Dart-only suite.
  }

  @override
  void endSpan(otel.Span span) {
    ended++;
  }

  @override
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

  @override
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
}

/// Minimal fake span for tests.
///
/// The OpenTelemetry Dart API uses an abstract `Span` with a fairly large
/// surface area. We only need it to be a concrete type.
final class _FakeSpan implements otel.Span {
  @override
  void addEvent(
    String name, {
    List<otel.Attribute> attributes = const [],
    fixnum.Int64? timestamp,
  }) {}

  @override
  void end({fixnum.Int64 endTime = fixnum.Int64.ZERO}) {}

  bool get isRecording => false;

  @override
  otel.SpanContext get spanContext => otel.SpanContext.invalid();

  @override
  otel.SpanId get parentSpanId => otel.SpanId.invalid();

  @override
  void recordException(
    exception, {
    List<otel.Attribute> attributes = const [],
    bool escaped = false,
    StackTrace stackTrace = StackTrace.empty,
  }) {}

  @override
  void setAttribute(otel.Attribute attribute) {}

  @override
  void setAttributes(List<otel.Attribute> attributes) {}

  @override
  void setName(String name) {}

  @override
  void setStatus(otel.StatusCode status, [String description = '']) {}

  void updateName(String name) {}
}
