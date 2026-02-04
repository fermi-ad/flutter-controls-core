/// Test helpers for mocking Ferry GraphQL types and responses.
library;

import 'package:ferry/ferry.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_alarms.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_alarms.var.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.var.gql.dart';

/// Mock [Client] for testing Ferry GraphQL operations.
class MockClient extends Mock implements Client {}

/// Helper function to set up a mock client to return a response stream.
void setupMockClientResponse<TData, TVars>(
  MockClient mockClient,
  OperationResponse<TData, TVars> response,
) {
  when(
    () =>
        mockClient.request<TData, TVars>(any<OperationRequest<TData, TVars>>()),
  ).thenAnswer((_) => Stream.value(response));
}

/// Mock [OperationResponse] for testing.
class MockOperationResponse<TData, TVars> extends Mock
    implements OperationResponse<TData, TVars> {}

/// Mock [GraphQLError] for testing.
class MockGraphQLError extends Mock implements GraphQLError {}

/// Mock [LinkException] for testing.
class MockLinkException extends Mock implements LinkException {}

/// Mock [OperationRequest] for testing.
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
OperationResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>
createMockAlarmsSnapshotResponse({
  required List<(String? key, String value)> alarms,
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

/// Helper to create a mock [GraphQLError].
MockGraphQLError createMockGraphQLError({
  String message = 'Test GraphQL error',
}) {
  final error = MockGraphQLError();
  return error;
}

/// Helper to create a mock [LinkException].
MockLinkException createMockLinkException({
  String message = 'Test link error',
}) {
  final error = MockLinkException();
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
