A core set of widgets, types, and services to create Fermilab applications.

## Features

-   Provides a `ControlsRouterApp` widget to create a base, scaffold widget that
    has a standardized theme.
-   Provides a class that accesses the Fermilab GraphQL API.
-   Provides a widget that authenticates users.

## Getting started

The latest, stable branch is v0.3, which is managed by the `main` branch. To
add this package to your application, add this dependency to your
`pubspec.yaml` file:

```yaml
flutter_controls_core:
    git:
        url: https://github.com/fermi-ad/flutter-controls-core.git
        ref: main
```

_NOTE:_ This project is under very active development so calling this the
"stable" branch is a stretch. With each pull request, we will create a tag to
point to it. If the HEAD of `main` produces a regression, you can temporarily
use a tag as the `git` "ref:" parameter to get back to a more reliable version.

### Mobile Targets

If you are building a native, mobile app, you need to add network permissions
in order to use the GraphQL interface (this library is only useful when using
the network!)

For Android targets, add the following tag to your `AndroidManifest.xml` file,
immediately after the opening `manifest` tag:

```
<uses-permission android:name="android.permission.INTERNET" />
```

For iOS targets, you need to open the `.codeproj` file in `XCode` and add the
permissions for network access in the application's profile. The appropriate
`.xml` files will be modified.

## Usage

TODO: Need to add content here.

## Telemetry/Tracing (OpenTelemetry)

OpenTelemetry tracing is enabled by default (opt-out) for all apps using this package's entrypoints (`runFermiApp`, `runFermiRouterApp`).

- Traces are exported to the console by default (see `ConsoleExporter`).
  - In the future we will need a custom exporter for GraphQL. Good news is that otel is gRPC by default.
- You can override the exporter by calling `initOpenTelemetry(exporter: ...)` before app startup.
- Manual instrumentation is available for custom spans and events.

### Manual Instrumentation Example

```dart
import 'package:flutter_controls_core/flutter_controls_core.dart';

final span = startSpan('operation', attributes: {'key': 'value'});
try {
  // ... your code ...
  addEvent(span, 'eventName', attributes: {'foo': 42});
} finally {
  endSpan(span);
}
```

Or use the convenience wrappers for automatic span management:

```dart
runWithSpan('operation', (span) {
  // ... your code ...
});

await runWithSpanAsync('asyncOp', (span) async {
  // ... your async code ...
});
```

### Dependency Injection and Testing

Use the `AppTracer` interface and the `appTracer` instance for testable code:

```dart
class MyService {
  final AppTracer tracer;
  MyService(this.tracer);
  void doWork() {
    tracer.runWithSpan('work', (span) {
      // ...
    });
  }
}
```

In tests, inject a mock tracer if needed.

### Opting Out

To disable tracing, you can override `initOpenTelemetry` with a no-op exporter or skip calling it (not recommended for most apps).

For more details, see the API documentation in `lib/src/otel_tracing.dart`.

### TODO

- Add metrics
- Add logging
