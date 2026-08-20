import 'package:flutter_controls_core/flutter_controls_core.dart'
    show appTracer;
import 'package:flutter_controls_core/src/otel_tracing.dart'
    show initOpenTelemetry;
import 'package:opentelemetry/sdk.dart' show SpanExporter;
import 'package:test/test.dart';

void main() {
  group('otel_tracing (default tracer)', () {
    setUpAll(() async {
      // Ensure the global tracer is initialized for the default appTracer.
      // Use a no-op exporter so tests don't spam stdout.
      await initOpenTelemetry(exporter: _NoopSpanExporter());
    });

    test('runWithSpan returns callback result', () {
      final result = appTracer.runWithSpan<int>('op', (_) => 123);
      expect(result, 123);
    });

    test('runWithSpan ends span even when callback throws', () {
      expect(
        () => appTracer.runWithSpan<void>('op', (_) {
          throw StateError('boom');
        }),
        throwsA(isA<StateError>()),
      );
    });

    test('runWithSpanAsync returns callback result', () async {
      final result = await appTracer.runWithSpanAsync<String>('op', (_) async {
        return 'ok';
      });
      expect(result, 'ok');
    });

    test('runWithSpanAsync ends span even when callback throws', () async {
      await expectLater(
        () => appTracer.runWithSpanAsync<void>('op', (_) async {
          throw ArgumentError('boom');
        }),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}

final class _NoopSpanExporter implements SpanExporter {
  @override
  Future<void> export(List spans) async {}

  @override
  Future<void> forceFlush() async {}

  @override
  Future<void> shutdown() async {}
}
