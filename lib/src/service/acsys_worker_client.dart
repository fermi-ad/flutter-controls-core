/// Platform-conditional export that selects the appropriate
/// [ACSysWorkerClient] implementation at compile time.
///
/// - On web targets (where `dart:js_interop` is available) the real
///   [Worker]-based implementation is used.
/// - On all other platforms (Android, iOS, macOS, Windows, Linux) a simple
///   synchronous fallback is used instead.
library;

export 'acsys_worker_client_stub.dart'
    if (dart.library.js_interop) 'acsys_worker_client_web.dart';
