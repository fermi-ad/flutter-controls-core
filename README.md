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

## Additional information

If more GraphQL queries are added, the `builder` needs to run to generate the
code. The command to do this is:

```shell
$ dart run build_runner build --delete-conflicting-outputs
```

Then run the formatter:

```shell
$ dart format lib
```

## Web Worker (JSON parsing off the main thread)

On web targets, ACSys plot-configuration JSON is decoded inside a dedicated
[Web Worker](https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API)
so that the main UI thread is never blocked by large JSON payloads.

### Compiling the worker script

The worker source lives at `web/acsys_worker.dart` inside this package.
Add the following step to your app's build pipeline (run it once, or whenever
you update the package):

```shell
dart compile js -O2 \
  -o web/acsys_worker.dart.js \
  $(dart pub cache dir)/hosted/pub.dev/flutter_controls_core-*/web/acsys_worker.dart
```

If you are consuming the package via a `git:` dependency the path will be
inside `~/.pub-cache/git/` instead.  A convenient cross-platform alternative
is to resolve the path from the package config:

```shell
# Resolve package source directory
WORKER_SRC=$(dart run - <<'EOF'
import 'dart:io';
import 'package:package_config/package_config.dart';
void main() async {
  final cfg = await findPackageConfig(Directory.current);
  final pkg = cfg!.packages.firstWhere((p) => p.name == 'flutter_controls_core');
  print('${pkg.root.toFilePath()}web/acsys_worker.dart');
}
EOF
)
dart compile js -O2 -o web/acsys_worker.dart.js "$WORKER_SRC"
```

### Custom worker URL

By default the worker script is expected to be served from the web root as
`acsys_worker.dart.js`.  If your build system places it elsewhere, pass the
`workerUrl` parameter to the `ACSysProvider` factory:

```dart
ACSysProvider.factory(workerUrl: 'assets/workers/acsys_worker.dart.js')
```

### Non-web / mobile targets

On Android, iOS, macOS, Windows, and Linux the worker client falls back to
synchronous `jsonDecode` on the calling thread.  No extra build step is needed
for those targets.

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
