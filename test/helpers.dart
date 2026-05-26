/// Test helpers for mocking Ferry GraphQL types and responses.
library;

import 'package:ferry/ferry.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_alarms.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_alarms.var.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.var.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/DPM.schema.gql.dart';

/// Mock [Client] for testing Ferry GraphQL operations.
class MockClient extends Mock implements Client {}

/// Helper function to set up a mock client to return a response value.
void setupMockClientResponse<TData, TVars>(
  MockClient mockClient,
  OperationResponse<TData, TVars> response,
) {
  when(
    () =>
        mockClient.request<TData, TVars>(any<OperationRequest<TData, TVars>>()),
  ).thenAnswer((_) => Stream.value(response));
}

/// Helper function to set up a mock client to return a stream of responses.
void setupMockClientStreamResponse<TData, TVars>(
  MockClient mockClient,
  List<OperationResponse<TData, TVars>> responses,
) {
  when(
    () =>
        mockClient.request<TData, TVars>(any<OperationRequest<TData, TVars>>()),
  ).thenAnswer((_) => Stream.fromIterable(responses));
}

class MockOperationResponse<TData, TVars> extends Mock
    implements OperationResponse<TData, TVars> {}

class MockGraphQLError extends Mock implements GraphQLError {}

class MockLinkException extends Mock implements LinkException {}

class MockOperationRequest extends Fake
    implements OperationRequest<Object?, Object?> {}

/// Initializes fallback values for mocktail matchers. Call this in setUpAll().
void setupAlarmsMockFallbacks() {
  registerFallbackValue(MockOperationRequest());
  registerFallbackValue(MockAlarmsSnapshotRequest());
  registerFallbackValue(MockStreamAlarmsRequest());
}

/// Typed Fake for `OperationRequest<GAlarmsSnapshotData, dynamic>` to
/// avoid runtime generic-cast failures caused by Dart's invariant generics.
class MockAlarmsSnapshotRequest extends Fake
    implements OperationRequest<GAlarmsSnapshotData, GAlarmsSnapshotVars> {}

/// Typed Fake for `OperationRequest<GStreamAlarmsData, GStreamAlarmsVars>`.
class MockStreamAlarmsRequest extends Fake
    implements OperationRequest<GStreamAlarmsData, GStreamAlarmsVars> {}

/// A record representing a structured alarm for use in test helpers.
typedef AlarmRecord =
    ({
      String device,
      GSource source,
      GState state,
      GSeverity severity,
      bool acknowledgeable,
      String? time,
      String epicsType,
      String user,
      String? wake,
    });

/// Default alarm record for tests that don't care about specific field values.
const AlarmRecord defaultAlarmRecord = (
  device: 'TEST:DEVICE',
  source: GSource.ANALOG,
  state: GState.OK,
  severity: GSeverity.LOW,
  acknowledgeable: false,
  time: '2024-01-01T00:00:00.000Z',
  epicsType: '',
  user: '',
  wake: '2024-01-01T00:00:00.000Z',
);

/// Helper to build a [GAlarmsSnapshotData_alarmsSnapshot] from an [AlarmRecord].
GAlarmsSnapshotData_alarmsSnapshot buildSnapshotItem(AlarmRecord alarm) {
  final b =
      GAlarmsSnapshotData_alarmsSnapshotBuilder()
        ..device = alarm.device
        ..source = alarm.source
        ..state = alarm.state
        ..severity = alarm.severity
        ..acknowledgeable = alarm.acknowledgeable
        ..epicsType = alarm.epicsType
        ..user = alarm.user;
  if (alarm.time != null) b.time.value = alarm.time!;
  if (alarm.wake != null) b.wake.value = alarm.wake!;
  return b.build();
}

/// Helper to create a mock [GAlarmsSnapshotData] with given alarm records.
GAlarmsSnapshotData createMockAlarmsSnapshot({
  required List<AlarmRecord> alarms,
}) {
  final snapshotBuilder = GAlarmsSnapshotDataBuilder();
  final alarmSnapshots = alarms.map(buildSnapshotItem).toList();
  snapshotBuilder.alarmsSnapshot.replace(alarmSnapshots);
  return snapshotBuilder.build();
}

/// Helper to build a [GStreamAlarmsData_alarms] from an [AlarmRecord].
GStreamAlarmsData_alarms buildStreamAlarm(AlarmRecord alarm) {
  final b =
      GStreamAlarmsData_alarmsBuilder()
        ..device = alarm.device
        ..source = alarm.source
        ..state = alarm.state
        ..severity = alarm.severity
        ..acknowledgeable = alarm.acknowledgeable
        ..epicsType = alarm.epicsType
        ..user = alarm.user;
  if (alarm.time != null) b.time.value = alarm.time!;
  if (alarm.wake != null) b.wake.value = alarm.wake!;
  return b.build();
}

/// Helper to create a mock [GStreamAlarmsData] with given alarm data.
GStreamAlarmsData createMockStreamAlarmData({required AlarmRecord alarm}) {
  final dataBuilder = GStreamAlarmsDataBuilder();
  dataBuilder.alarms.replace(buildStreamAlarm(alarm));
  return dataBuilder.build();
}

/// Helper to create a mock [OperationResponse] for successful alarm snapshot queries.
OperationResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>
createMockAlarmsSnapshotResponse({
  required List<AlarmRecord> alarms,
  bool loading = false,
}) {
  final data = createMockAlarmsSnapshot(alarms: alarms);
  final response =
      MockOperationResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>();
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
  required AlarmRecord alarm,
  bool loading = false,
}) {
  final data = createMockStreamAlarmData(alarm: alarm);
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
  List<GraphQLError>? graphqlErrors,
}) {
  final response = MockOperationResponse<TData, TVars>();
  when(() => response.data).thenReturn(null);
  when(() => response.loading).thenReturn(false);
  when(() => response.hasErrors).thenReturn(true);
  when(() => response.graphqlErrors).thenReturn(graphqlErrors);
  when(() => response.linkException).thenReturn(null);
  return response;
}

/// Helper to create a mock [OperationResponse] for link (network) errors.
OperationResponse<TData, TVars> createMockLinkErrorResponse<TData, TVars>({
  required LinkException linkException,
}) {
  final response = MockOperationResponse<TData, TVars>();
  when(() => response.data).thenReturn(null);
  when(() => response.loading).thenReturn(false);
  when(() => response.hasErrors).thenReturn(true);
  when(() => response.graphqlErrors).thenReturn(null);
  when(() => response.linkException).thenReturn(linkException);
  return response;
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
