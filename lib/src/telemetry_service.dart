import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;

class TelemetryService {
  static TelemetryService? _instance;

  final String metricsEndpoint;
  final String serviceName;
  final String serviceVersion;

  TelemetryService._({
    required this.metricsEndpoint,
    this.serviceName = 'plotting-app',
    this.serviceVersion = '1.0.0',
  });

  /// Initialize the singleton instance
  /// Must be called once in main() before using TelemetryService.instance
  static void initialize({
    String? host,
    int? port,
    String? endpoint,
    String serviceName = 'plotting-app',
    String serviceVersion = '1.0.0',
  }) {
    final defaultHost =
        kIsWeb
            ? '10.200.24.113'
            : (Platform.environment['OTEL_COLLECTOR_HOST'] ?? 'localhost');

    final defaultPort =
        kIsWeb
            ? 4318
            : (int.tryParse(
                  Platform.environment['OTEL_COLLECTOR_PORT_HTTP'] ?? '4318',
                ) ??
                4318);

    final metricsEndpoint =
        endpoint ??
        'http://${host ?? defaultHost}:${port ?? defaultPort}/v1/metrics';

    _instance = TelemetryService._(
      metricsEndpoint: metricsEndpoint,
      serviceName: serviceName,
      serviceVersion: serviceVersion,
    );
  }

  /// Get the singleton instance
  /// Throws if not initialized. Call TelemetryService.initialize() first.
  static TelemetryService get instance {
    if (_instance == null) {
      throw StateError(
        'TelemetryService not initialized. Call TelemetryService.initialize() first.',
      );
    }
    return _instance!;
  }

  static bool get isInitialized => _instance != null;

  Future<void> sendCounter({
    required String name,
    required String description,
    required int value,
    String unit = '1',
    Map<String, dynamic>? attributes,
  }) async {
    final metricData = _createCounterMetric(
      name: name,
      description: description,
      value: value,
      unit: unit,
      attributes: attributes ?? {},
    );
    _sendMetricAsync(metricData);
  }

  Future<void> sendGauge({
    required String name,
    required String description,
    dynamic value,
    String unit = '1',
    Map<String, dynamic>? attributes,
  }) async {
    final metricData = _createGaugeMetric(
      name: name,
      description: description,
      value: value,
      unit: unit,
      attributes: attributes ?? {},
    );
    _sendMetricAsync(metricData);
  }

  Future<void> sendHistogram({
    required String name,
    required String description,
    required int count,
    required double sum,
    required List<int> bucketCounts,
    required List<double> explicitBounds,
    double? min,
    double? max,
    String unit = '1',
    Map<String, dynamic>? attributes,
  }) async {
    final metricData = _createHistogramMetric(
      name: name,
      description: description,
      count: count,
      sum: sum,
      bucketCounts: bucketCounts,
      explicitBounds: explicitBounds,
      min: min,
      max: max,
      unit: unit,
      attributes: attributes ?? {},
    );
    _sendMetricAsync(metricData);
  }

  Map<String, dynamic> _createCounterMetric({
    required String name,
    required String description,
    required int value,
    required String unit,
    required Map<String, dynamic> attributes,
  }) {
    final now = DateTime.now();
    final timeNanos = now.microsecondsSinceEpoch * 1000;

    return {
      'resourceMetrics': [
        {
          'resource': _createResourceAttributes(),
          'scopeMetrics': [
            {
              'scope': {
                'name': 'plotting-app-metrics',
                'version': serviceVersion,
              },
              'metrics': [
                {
                  'name': name,
                  'description': description,
                  'unit': unit,
                  'sum': {
                    'dataPoints': [
                      {
                        'attributes': _convertAttributes(attributes),
                        'startTimeUnixNano':
                            (timeNanos - 60000000000).toString(),
                        'timeUnixNano': timeNanos.toString(),
                        'asInt': value,
                      },
                    ],
                    'aggregationTemporality': 2,
                    'isMonotonic': true,
                  },
                },
              ],
            },
          ],
        },
      ],
    };
  }

  Map<String, dynamic> _createGaugeMetric({
    required String name,
    required String description,
    required dynamic value,
    required String unit,
    required Map<String, dynamic> attributes,
  }) {
    final now = DateTime.now();
    final timeNanos = now.microsecondsSinceEpoch * 1000;

    final dataPoint = {
      'attributes': _convertAttributes(attributes),
      'timeUnixNano': timeNanos.toString(),
    };

    if (value is int) {
      dataPoint['asInt'] = value;
    } else if (value is double) {
      dataPoint['asDouble'] = value;
    }

    return {
      'resourceMetrics': [
        {
          'resource': _createResourceAttributes(),
          'scopeMetrics': [
            {
              'scope': {
                'name': 'plotting-app-metrics',
                'version': serviceVersion,
              },
              'metrics': [
                {
                  'name': name,
                  'description': description,
                  'unit': unit,
                  'gauge': {
                    'dataPoints': [dataPoint],
                  },
                },
              ],
            },
          ],
        },
      ],
    };
  }

  Map<String, dynamic> _createHistogramMetric({
    required String name,
    required String description,
    required int count,
    required double sum,
    required List<int> bucketCounts,
    required List<double> explicitBounds,
    double? min,
    double? max,
    required String unit,
    required Map<String, dynamic> attributes,
  }) {
    final now = DateTime.now();
    final timeNanos = now.microsecondsSinceEpoch * 1000;

    final dataPoint = {
      'attributes': _convertAttributes(attributes),
      'startTimeUnixNano': (timeNanos - 60000000000).toString(),
      'timeUnixNano': timeNanos.toString(),
      'count': count,
      'sum': sum,
      'bucketCounts': bucketCounts,
      'explicitBounds': explicitBounds,
    };

    if (min != null) dataPoint['min'] = min;
    if (max != null) dataPoint['max'] = max;

    return {
      'resourceMetrics': [
        {
          'resource': _createResourceAttributes(),
          'scopeMetrics': [
            {
              'scope': {
                'name': 'plotting-app-metrics',
                'version': serviceVersion,
              },
              'metrics': [
                {
                  'name': name,
                  'description': description,
                  'unit': unit,
                  'histogram': {
                    'dataPoints': [dataPoint],
                    'aggregationTemporality': 2,
                  },
                },
              ],
            },
          ],
        },
      ],
    };
  }

  Map<String, dynamic> _createResourceAttributes() {
    return {
      'attributes': [
        {
          'key': 'service.name',
          'value': {'stringValue': serviceName},
        },
        {
          'key': 'service.version',
          'value': {'stringValue': serviceVersion},
        },
        {
          'key': 'host.name',
          'value': {
            'stringValue': kIsWeb ? 'web-browser' : Platform.localHostname,
          },
        },
        {
          'key': 'telemetry.sdk.name',
          'value': {'stringValue': 'opentelemetry'},
        },
        {
          'key': 'telemetry.sdk.language',
          'value': {'stringValue': 'dart'},
        },
      ],
    };
  }

  List<Map<String, dynamic>> _convertAttributes(
    Map<String, dynamic> attributes,
  ) {
    return attributes.entries.map((entry) {
      final value = entry.value;
      Map<String, dynamic> valueMap;

      if (value is String) {
        valueMap = {'stringValue': value};
      } else if (value is int) {
        valueMap = {'intValue': value};
      } else if (value is double) {
        valueMap = {'doubleValue': value};
      } else if (value is bool) {
        valueMap = {'boolValue': value};
      } else {
        valueMap = {'stringValue': value.toString()};
      }

      return {'key': entry.key, 'value': valueMap};
    }).toList();
  }

  /// Send metric asynchronously without blocking caller
  void _sendMetricAsync(Map<String, dynamic> metricsData) {
    _sendMetric(metricsData).catchError((error) {
      // Silent fail
    });
  }

  Future<void> _sendMetric(Map<String, dynamic> metricsData) async {
    final headers = {
      'Content-Type': 'application/json',
      'User-Agent': 'plotting-app-metrics-client/1.0.0',
    };

    final body = jsonEncode(metricsData);

    try {
      final response = await http
          .post(Uri.parse(metricsEndpoint), headers: headers, body: body)
          .timeout(Duration(seconds: 5));
    } catch (e) {
      // Silent fail
    }
  }
}
