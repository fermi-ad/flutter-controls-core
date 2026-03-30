/// Entry point for the ACSys JSON-parsing Web Worker.
///
/// Compile this file to JavaScript with:
///
/// ```sh
/// dart compile js -O2 \
///   -o web/acsys_worker.dart.js \
///   path/to/flutter_controls_core/web/acsys_worker.dart
/// ```
///
/// The worker accepts messages with the envelope:
///
/// ```json
/// { "id": <int>, "payload": "<JSON string to decode>" }
/// ```
///
/// It replies with either a success envelope:
///
/// ```json
/// { "id": <int>, "result": <decoded value> }
/// ```
///
/// or an error envelope:
///
/// ```json
/// { "id": <int>, "error": "<error message>" }
/// ```
///
/// Uses `dart:js_interop` + `package:web` so that it is WasmGC-compatible
/// and does **not** depend on `dart:html`.
library;

import 'dart:convert';
import 'dart:js_interop';
import 'package:web/web.dart';

void main() {
  // In a dedicated worker the global scope is DedicatedWorkerGlobalScope,
  // accessible via globalThis.
  final scope = globalThis as DedicatedWorkerGlobalScope;

  scope.onmessage = (MessageEvent event) {
    final data =
        (event.data as JSObject).dartify() as Map<Object?, Object?>;
    final id = (data['id'] as num).toInt();
    final payload = data['payload'] as String;

    try {
      final result = jsonDecode(payload);
      scope.postMessage({'id': id, 'result': result}.jsify());
    } catch (err) {
      scope.postMessage({'id': id, 'error': err.toString()}.jsify());
    }
  }.toJS;
}
