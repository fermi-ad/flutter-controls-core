// Non-web implementation of ACSysWorkerClient. JSON is decoded synchronously
// on the calling thread since Web Workers are only available in browsers.

import 'dart:convert' as convert;

/// Decodes ACSys JSON payloads. On non-web platforms the work is done
/// synchronously on the calling thread; on web it is offloaded to a dedicated
/// [Worker] (see `acsys_worker_client_web.dart`).
class ACSysWorkerClient {
  ACSysWorkerClient();

  /// Decodes [payload] as JSON and returns the result.
  ///
  /// On non-web platforms this runs synchronously inside a completed
  /// [Future]; on web it is dispatched to a dedicated Web Worker.
  Future<dynamic> decode(String payload) async =>
      convert.jsonDecode(payload);

  /// Releases any resources held by this client.
  void dispose() {}
}
