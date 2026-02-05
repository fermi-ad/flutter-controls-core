import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_controls_core/src/service/acsys_service.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_alarms.data.gql.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_alarms.var.gql.dart';
import 'alarms_helpers.dart';

void main() {
  setUpAll(() {
    setupAlarmsMockFallbacks();
  });

  group('ACSysService.getAlarmsSnapshot', () {
    test('successfully returns list of alarms from snapshot', () async {
      // Arrange
      const alarmOnValue = '{"status":"ALARM_ON","timestamp":1234567890}';
      const alarmOffValue = '{"status":"ALARM_OFF","timestamp":1234567889}';
      const alarmUnknownValue =
          '{"status":"ALARM_UNKNOWN","timestamp":1234567888}';

      final mockClient = MockClient();
      final mockResponse = createMockAlarmsSnapshotResponse(
        alarms: [
          ('alarm_1', alarmOnValue),
          ('alarm_2', alarmOffValue),
          (null, alarmUnknownValue),
        ],
      );

      setupMockClientResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
        mockClient,
        mockResponse,
      );

      final service = ACSysService(alarmsQueryClient: mockClient);

      // Act
      final alarms = await service.getAlarmsSnapshot();

      // Assert
      expect(alarms, isNotEmpty);
      expect(alarms, hasLength(3));
      expect(alarms[0].key, equals('alarm_1'));
      expect(alarms[0].value, equals(alarmOnValue));
      expect(alarms[1].key, equals('alarm_2'));
      expect(alarms[1].value, equals(alarmOffValue));
      expect(alarms[2].key, isNull);
      expect(alarms[2].value, equals(alarmUnknownValue));
    });

    test('returns empty list when no alarms are present', () async {
      // Arrange
      final mockClient = MockClient();
      final mockResponse = createMockAlarmsSnapshotResponse(alarms: []);

      when(
        () => mockClient.request<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
          any<OperationRequest<GAlarmsSnapshotData, GAlarmsSnapshotVars>>(),
        ),
      ).thenAnswer((_) => Stream.value(mockResponse));

      final service = ACSysService(alarmsQueryClient: mockClient);

      // Act
      final alarms = await service.getAlarmsSnapshot();

      // Assert
      expect(alarms, isEmpty);
    });

    test('throws ACSysGraphQLException on GraphQL errors', () async {
      // Arrange
      final mockClient = MockClient();
      final mockResponse =
          createMockErrorResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
            graphqlErrors: [MockGraphQLError()],
          );

      when(
        () => mockClient.request<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
          any<OperationRequest<GAlarmsSnapshotData, GAlarmsSnapshotVars>>(),
        ),
      ).thenAnswer((_) => Stream.value(mockResponse));

      final service = ACSysService(alarmsQueryClient: mockClient);

      // Act & Assert
      expect(
        () => service.getAlarmsSnapshot(),
        throwsA(isA<ACSysGraphQLException>()),
      );
    });

    test('throws LinkException on link errors', () async {
      // Arrange
      final mockClient = MockClient();
      final linkException = MockLinkException();
      final mockResponse =
          createMockLinkErrorResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
            linkException: linkException,
          );

      when(
        () => mockClient.request<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
          any<OperationRequest<GAlarmsSnapshotData, GAlarmsSnapshotVars>>(),
        ),
      ).thenAnswer((_) => Stream.value(mockResponse));

      final service = ACSysService(alarmsQueryClient: mockClient);

      // Act & Assert
      expect(() => service.getAlarmsSnapshot(), throwsA(equals(linkException)));
    });

    test('throws ACSysGraphQLException when response has no data', () async {
      // Arrange
      final mockClient = MockClient();
      final mockResponse =
          createMockErrorResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>();

      when(
        () => mockClient.request<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
          any<OperationRequest<GAlarmsSnapshotData, GAlarmsSnapshotVars>>(),
        ),
      ).thenAnswer((_) => Stream.value(mockResponse));

      final service = ACSysService(alarmsQueryClient: mockClient);

      // Act & Assert
      expect(
        () => service.getAlarmsSnapshot(),
        throwsA(isA<ACSysGraphQLException>()),
      );
    });

    test('converts AlarmMessage objects correctly', () async {
      // Arrange
      const testValue = '{"data":"test_value"}';
      final mockClient = MockClient();
      final mockResponse = createMockAlarmsSnapshotResponse(
        alarms: [('test_key', testValue)],
      );

      when(
        () => mockClient.request<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
          any<OperationRequest<GAlarmsSnapshotData, GAlarmsSnapshotVars>>(),
        ),
      ).thenAnswer((_) => Stream.value(mockResponse));

      final service = ACSysService(alarmsQueryClient: mockClient);

      // Act
      final alarms = await service.getAlarmsSnapshot();

      // Assert
      expect(alarms.first, isA<AlarmMessage>());
      expect(alarms.first.key, equals('test_key'));
      expect(alarms.first.value, equals(testValue));
    });

    test('filters out loading responses', () async {
      // Arrange
      const alarmValue = '{"status":"ALARM_ON","timestamp":1234567890}';
      final mockClient = MockClient();
      final loadingResponse =
          createMockLoadingResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>();
      final dataResponse = createMockAlarmsSnapshotResponse(
        alarms: [('alarm_1', alarmValue)],
      );

      when(
        () => mockClient.request<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
          any<OperationRequest<GAlarmsSnapshotData, GAlarmsSnapshotVars>>(),
        ),
      ).thenAnswer((_) => Stream.fromIterable([loadingResponse, dataResponse]));

      final service = ACSysService(alarmsQueryClient: mockClient);

      // Act
      final alarms = await service.getAlarmsSnapshot();

      // Assert
      expect(alarms, hasLength(1));
      expect(alarms[0].key, equals('alarm_1'));
    });
  });
}
