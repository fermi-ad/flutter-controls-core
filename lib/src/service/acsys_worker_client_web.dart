// Web implementation of ACSysWorkerClient. JSON decoding is dispatched to a
// dedicated Web Worker so that the main UI thread is never blocked.
//
// Uses dart:js_interop + package:web (WasmGC-compatible; no dart:html).

import 'dart:async';
import 'dart:js_interop';
import 'package:web/web.dart';

/// Decodes ACSys JSON payloads inside a dedicated [Worker], keeping the main
/// UI thread free from synchronous JSON parsing work.
///
/// A single worker instance is created lazily on the first [decode] call and
/// reused for all subsequent calls.
class ACSysWorkerClient {
  /// URL of the compiled worker script.
  ///
  /// Defaults to `'acsys_worker.dart.js'`, which assumes the script was
  /// placed at the root of the web server (e.g. `web/acsys_worker.dart.js`
  /// in the Flutter app's build output).  Set this to a different value if
  /// the script is served from another path.
  final String workerUrl;

  Worker? _worker;
  int _nextId = 0;
  final Map<int, Completer<dynamic>> _pending = {};

  ACSysWorkerClient({this.workerUrl = 'acsys_worker.dart.js'});

  Worker _ensureWorker() {
    if (_worker != null) return _worker!;

    final w = Worker(workerUrl);

    w.onmessage = (MessageEvent event) {
      final data =
          (event.data as JSObject).dartify() as Map<Object?, Object?>;
      final id = (data['id'] as num).toInt();
      final completer = _pending.remove(id);
      if (completer == null) return;

      if (data.containsKey('error')) {
        completer.completeError(
          Exception(data['error'] as String),
        );
      } else {
        completer.complete(data['result']);
      }
    }.toJS;

    w.addEventListener(
      'error',
      (Event event) {
        // Reject all in-flight requests and reset the worker so that a fresh
        // one is created on the next decode() call.
        final err = Exception('ACSys worker error');
        for (final c in _pending.values) {
          c.completeError(err);
        }
        _pending.clear();
        _worker = null;
      }.toJS,
    );

    _worker = w;
    return w;
  }

  /// Decodes [payload] as JSON inside the Web Worker.
  ///
  /// Returns a [Future] that completes with the decoded value once the
  /// worker posts its response.
  Future<dynamic> decode(String payload) {
    final id = _nextId++;
    final completer = Completer<dynamic>();
    _pending[id] = completer;
    _ensureWorker().postMessage(
      {'id': id, 'payload': payload}.jsify(),
    );
    return completer.future;
  }

  /// Terminates the underlying [Worker] and rejects any in-flight requests.
  void dispose() {
    _worker?.terminate();
    _worker = null;
    final err = Exception('ACSysWorkerClient disposed');
    for (final c in _pending.values) {
      c.completeError(err);
    }
    _pending.clear();
  }
}
