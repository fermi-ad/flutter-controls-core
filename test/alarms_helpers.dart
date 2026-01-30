/// Test helpers for mocking Ferry GraphQL types and responses.
library;

import 'package:ferry/ferry.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_alarms.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.var.gql.dart';
import 'package:flutter_controls_core/src/service/acsys_service.dart';
import 'package:flutter_controls_core/src/device_values.dart';

/// Mock [Client] for testing Ferry GraphQL operations.
class MockClient extends Mock implements Client {}

/// Mock [OperationResponse] for testing.
class MockOperationResponse<TData, TVars> extends Mock
    implements OperationResponse<TData, TVars> {}

/// Mock [GraphQLError] for testing.
class MockGraphQLError extends Mock {}

/// Helper to create a mock [GAlarmsSnapshotData] with given alarm data.
GAlarmsSnapshotData createMockAlarmsSnapshot({
  required List<(String? key, String value)> alarms,
}) {
  final snapshotBuilder = GAlarmsSnapshotDataBuilder();

  // Build the list of alarm snapshots
  final alarmSnapshots =
      alarms.map((alarm) {
        final (key, value) = alarm;
        final snapshotItemBuilder = GAlarmsSnapshotData_alarmsSnapshotBuilder();
        snapshotItemBuilder
          ..key = key
          ..value = value;
        return snapshotItemBuilder.build();
      }).toList();

  snapshotBuilder.alarmsSnapshot.replace(alarmSnapshots);
  return snapshotBuilder.build();
}

/// Helper to create a mock [GStreamAlarmsData] with given alarm data.
GStreamAlarmsData createMockStreamAlarmData({
  required String? key,
  required String value,
}) {
  final dataBuilder = GStreamAlarmsDataBuilder();
  final alarmBuilder = GStreamAlarmsData_alarmsBuilder();

  alarmBuilder
    ..key = key
    ..value = value;

  dataBuilder.alarms.replace(alarmBuilder.build());
  return dataBuilder.build();
}

/// Helper to create a mock [OperationResponse] for successful alarm snapshot queries.
OperationResponse<GAlarmsSnapshotData, dynamic>
createMockAlarmsSnapshotResponse({
  required List<(String? key, String value)> alarms,
  bool loading = false,
}) {
  final data = createMockAlarmsSnapshot(alarms: alarms);
  final response = MockOperationResponse<GAlarmsSnapshotData, dynamic>();
  when(() => response.data).thenReturn(data);
  when(() => response.loading).thenReturn(loading);
  when(() => response.graphqlErrors).thenReturn(null);
  when(() => response.linkException).thenReturn(null);
  when(() => response.hasErrors).thenReturn(false);
  return response;
}

/// Helper to create a mock [OperationResponse] for successful alarm stream updates.
OperationResponse<GStreamAlarmsData, GStreamAlarmsVars>
createMockStreamAlarmResponse({
  required String? key,
  required String value,
  bool loading = false,
}) {
  final data = createMockStreamAlarmData(key: key, value: value);
  final response =
      MockOperationResponse<GStreamAlarmsData, GStreamAlarmsVars>();
  when(() => response.data).thenReturn(data);
  when(() => response.loading).thenReturn(loading);
  when(() => response.graphqlErrors).thenReturn(null);
  when(() => response.linkException).thenReturn(null);
  when(() => response.hasErrors).thenReturn(false);
  return response;
}

/// Helper to create a mock [OperationResponse] for GraphQL errors.
OperationResponse<TData, TVars> createMockErrorResponse<TData, TVars>({
  List<dynamic>? graphqlErrors,
}) {
  final response = MockOperationResponse<TData, TVars>();
  when(() => response.data).thenReturn(null);
  when(() => response.loading).thenReturn(false);
  when(() => response.hasErrors).thenReturn(true);
  return response;
}

/// Helper to create a mock [OperationResponse] for link (network) errors.
OperationResponse<TData, TVars> createMockLinkErrorResponse<TData, TVars>({
  required Exception linkException,
}) {
  final response = MockOperationResponse<TData, TVars>();
  when(() => response.data).thenReturn(null);
  when(() => response.loading).thenReturn(false);
  when(() => response.hasErrors).thenReturn(true);
  return response;
}

/// Helper to create a mock [GraphQLError].
MockGraphQLError createMockGraphQLError({
  String message = 'Test GraphQL error',
}) {
  final error = MockGraphQLError();
  when(() => error.toString()).thenReturn(message);
  return error;
}

/// Helper to create a loading response (used for filtering).
OperationResponse<TData, TVars> createMockLoadingResponse<TData, TVars>() {
  final response = MockOperationResponse<TData, TVars>();
  when(() => response.loading).thenReturn(true);
  when(() => response.hasErrors).thenReturn(false);
  when(() => response.graphqlErrors).thenReturn(null);
  when(() => response.linkException).thenReturn(null);
  return response;
}

// ============================================================================
// Mock ACSysServiceAPI Implementation for Testing
// ============================================================================

/// Mock implementation of ACSysServiceAPI for testing alarm functionality.
///
/// This provides a simple way to test code that depends on ACSysServiceAPI
/// without needing to mock GraphQL clients or network operations.
class MockACSysService implements ACSysServiceAPI {
  final List<AlarmMessage> _alarmsSnapshot;
  final Stream<AlarmMessage> _alarmsStream;

  MockACSysService({
    List<AlarmMessage>? alarmsSnapshot,
    Stream<AlarmMessage>? alarmsStream,
  }) : _alarmsSnapshot = alarmsSnapshot ?? [],
       _alarmsStream = alarmsStream ?? const Stream.empty();

  @override
  Future<List<AlarmMessage>> getAlarmsSnapshot() async {
    return _alarmsSnapshot;
  }

  @override
  Stream<AlarmMessage> monitorAlarms() {
    return _alarmsStream;
  }

  @override
  Future<List<DeviceInfo>> getDeviceInfo(List<String> devices) async {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Stream<Reading> monitorDevices(List<String> drfs) {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Future<List<Reading>> readDevices(List<String> devices) async {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Stream<Reading> monitorSettingProperty(List<String> drfs) {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Stream<DigitalStatus> monitorDigitalStatusDevices(List<String> devices) {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Stream<AnalogAlarmStatus> monitorAnalogAlarmProperty(List<String> drfs) {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Stream<PlotReply> startPlot(
    List<String> drfs, {
    double? xMin,
    double? xMax,
    double? startTime,
    double? endTime,
    int? windowSize,
    int? updateRate,
    int? nAcquisitions,
    int? triggerEvent,
    int? sampleOnEvent,
    String? chXAxis,
  }) {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Future<PlotConfigurationSnapshot> savePlotConfiguration({
    required PlotConfigurationSnapshot snapshot,
  }) async {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Future<PlotConfigurationSnapshot?> retrievePlotConfiguration({
    required PlotConfigId configurationId,
  }) async {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Future<List<PlotConfigurationListing>> listPlotConfigurations() async {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Future<void> removePlotConfiguration({
    required PlotConfigId configurationId,
  }) async {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Future<PlotConfigurationSnapshot?> retrieveLastUserConfiguration() async {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Future<void> saveUserConfiguration({
    required PlotConfigurationSnapshot snapshot,
  }) async {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Future<SettingStatus> submit({
    required String forDRF,
    required DeviceValue newSetting,
  }) async {
    throw UnimplementedError('Not needed for alarm tests');
  }

  @override
  Future<SettingStatus> sendCommand({
    required String toDRF,
    required String value,
  }) async {
    throw UnimplementedError('Not needed for alarm tests');
  }
}

/// Mock implementation that throws exceptions for testing error handling.
class ThrowingACSysService implements ACSysServiceAPI {
  final Exception exception;

  ThrowingACSysService({required this.exception});

  @override
  Future<List<AlarmMessage>> getAlarmsSnapshot() async {
    throw exception;
  }

  @override
  Stream<AlarmMessage> monitorAlarms() {
    return Stream.error(exception);
  }

  @override
  Future<List<DeviceInfo>> getDeviceInfo(List<String> devices) async {
    throw exception;
  }

  @override
  Stream<Reading> monitorDevices(List<String> drfs) {
    return Stream.error(exception);
  }

  @override
  Future<List<Reading>> readDevices(List<String> devices) async {
    throw exception;
  }

  @override
  Stream<Reading> monitorSettingProperty(List<String> drfs) {
    return Stream.error(exception);
  }

  @override
  Stream<DigitalStatus> monitorDigitalStatusDevices(List<String> devices) {
    return Stream.error(exception);
  }

  @override
  Stream<AnalogAlarmStatus> monitorAnalogAlarmProperty(List<String> drfs) {
    return Stream.error(exception);
  }

  @override
  Stream<PlotReply> startPlot(
    List<String> drfs, {
    double? xMin,
    double? xMax,
    double? startTime,
    double? endTime,
    int? windowSize,
    int? updateRate,
    int? nAcquisitions,
    int? triggerEvent,
    int? sampleOnEvent,
    String? chXAxis,
  }) {
    return Stream.error(exception);
  }

  @override
  Future<PlotConfigurationSnapshot> savePlotConfiguration({
    required PlotConfigurationSnapshot snapshot,
  }) async {
    throw exception;
  }

  @override
  Future<PlotConfigurationSnapshot?> retrievePlotConfiguration({
    required PlotConfigId configurationId,
  }) async {
    throw exception;
  }

  @override
  Future<List<PlotConfigurationListing>> listPlotConfigurations() async {
    throw exception;
  }

  @override
  Future<void> removePlotConfiguration({
    required PlotConfigId configurationId,
  }) async {
    throw exception;
  }

  @override
  Future<PlotConfigurationSnapshot?> retrieveLastUserConfiguration() async {
    throw exception;
  }

  @override
  Future<void> saveUserConfiguration({
    required PlotConfigurationSnapshot snapshot,
  }) async {
    throw exception;
  }

  @override
  Future<SettingStatus> submit({
    required String forDRF,
    required DeviceValue newSetting,
  }) async {
    throw exception;
  }

  @override
  Future<SettingStatus> sendCommand({
    required String toDRF,
    required String value,
  }) async {
    throw exception;
  }
}
