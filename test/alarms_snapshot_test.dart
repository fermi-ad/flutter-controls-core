import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_controls_core/src/service/acsys_service.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_alarms.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/read_alarms.var.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/DPM.schema.gql.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ferry/ferry.dart';
import 'helpers.dart';

void main() {
  setUpAll(() {
    setupAlarmsMockFallbacks();
  });

  group('ACSysService.getAlarmsSnapshot', () {
    test('successfully returns list of alarms from snapshot', () async {
      // Arrange
      const alarm1 = (
        device: 'ALARM:ONE',
        source: GSource.ANALOG,
        state: GState.OK,
        severity: GSeverity.LOW,
        acknowledgeable: false,
        time: '2024-01-01T00:00:00.000Z',
        epicsType: '',
        user: '',
        wake: '2024-01-01T00:00:00.000Z',
      );
      const alarm2 = (
        device: 'ALARM:TWO',
        source: GSource.DIGITAL,
        state: GState.BYPASSED,
        severity: GSeverity.HIGH,
        acknowledgeable: true,
        time: '2024-01-02T00:00:00.000Z',
        epicsType: '',
        user: '',
        wake: '2024-01-02T00:00:00.000Z',
      );
      const alarm3 = (
        device: 'ALARM:THREE',
        source: GSource.EPICS,
        state: GState.UNKNOWN,
        severity: GSeverity.UNKNOWN,
        acknowledgeable: false,
        time: null,
        epicsType: '',
        user: '',
        wake: null,
      );

      final mockClient = MockClient();
      final mockResponse = createMockAlarmsSnapshotResponse(
        alarms: [alarm1, alarm2, alarm3],
      );

      setupMockClientResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
        mockClient,
        mockResponse,
      );

      final service = ACSysService(
        // The client we're actually testing.
        alarmsQueryClient: mockClient,
        // Throwaway clients to override the defaults.
        queryClient: MockClient(),
        subscriptionClient: MockClient(),
        devDbClient: MockClient(),
        alarmsSubscriptionClient: MockClient(),
      );

      // Act
      final alarms = await service.getAlarmsSnapshot();

      // Assert
      expect(alarms, isNotEmpty);
      expect(alarms, hasLength(3));
      expect(alarms[0].device, equals('ALARM:ONE'));
      expect(alarms[0].source, equals(AlarmSource.analog));
      expect(alarms[0].state, equals(AlarmState.ok));
      expect(alarms[0].severity, equals(AlarmSeverity.low));
      expect(alarms[1].device, equals('ALARM:TWO'));
      expect(alarms[1].source, equals(AlarmSource.digital));
      expect(alarms[1].state, equals(AlarmState.bypassed));
      expect(alarms[1].severity, equals(AlarmSeverity.high));
      expect(alarms[2].device, equals('ALARM:THREE'));
      expect(alarms[2].source, equals(AlarmSource.epics));
      expect(alarms[2].state, equals(AlarmState.unknown));
      expect(alarms[2].severity, equals(AlarmSeverity.unknown));
    });

    test('returns empty list when no alarms are present', () async {
      // Arrange
      final mockClient = MockClient();
      final mockResponse = createMockAlarmsSnapshotResponse(alarms: []);

      setupMockClientResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
        mockClient,
        mockResponse,
      );

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

      setupMockClientResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
        mockClient,
        mockResponse,
      );

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

      setupMockClientResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
        mockClient,
        mockResponse,
      );

      final service = ACSysService(alarmsQueryClient: mockClient);

      // Act & Assert
      expect(() => service.getAlarmsSnapshot(), throwsA(equals(linkException)));
    });

    test('throws ACSysGraphQLException when response has no data', () async {
      // Arrange
      final mockClient = MockClient();
      final mockResponse =
          createMockErrorResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>();

      setupMockClientResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
        mockClient,
        mockResponse,
      );

      final service = ACSysService(alarmsQueryClient: mockClient);

      // Act & Assert
      expect(
        () => service.getAlarmsSnapshot(),
        throwsA(isA<ACSysGraphQLException>()),
      );
    });

    test('converts Alarm objects correctly', () async {
      // Arrange
      const testAlarm = (
        device: 'TEST:DEVICE',
        source: GSource.EPICS,
        state: GState.LATCHED,
        severity: GSeverity.HIGH,
        acknowledgeable: true,
        time: '2024-06-01T12:00:00.000Z',
        epicsType: 'hihi',
        user: 'testuser',
        wake: '2024-06-01T12:00:00.000Z',
      );
      final mockClient = MockClient();
      final mockResponse = createMockAlarmsSnapshotResponse(
        alarms: [testAlarm],
      );

      setupMockClientResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>(
        mockClient,
        mockResponse,
      );

      final service = ACSysService(alarmsQueryClient: mockClient);

      // Act
      final alarms = await service.getAlarmsSnapshot();

      // Assert
      expect(alarms.first, isA<Alarm>());
      expect(alarms.first.device, equals('TEST:DEVICE'));
      expect(alarms.first.source, equals(AlarmSource.epics));
      expect(alarms.first.state, equals(AlarmState.latched));
      expect(alarms.first.severity, equals(AlarmSeverity.high));
      expect(alarms.first.acknowledgeable, isTrue);
      expect(alarms.first.epicsType, equals('hihi'));
      expect(alarms.first.user, equals('testuser'));
    });

    test('filters out loading responses', () async {
      // Arrange
      const testAlarm = (
        device: 'ALARM:ONE',
        source: GSource.ANALOG,
        state: GState.OK,
        severity: GSeverity.LOW,
        acknowledgeable: false,
        time: '2024-01-01T00:00:00.000Z',
        epicsType: '',
        user: '',
        wake: '2024-01-01T00:00:00.000Z',
      );
      final mockClient = MockClient();
      final loadingResponse =
          createMockLoadingResponse<GAlarmsSnapshotData, GAlarmsSnapshotVars>();
      final dataResponse = createMockAlarmsSnapshotResponse(
        alarms: [testAlarm],
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
      expect(alarms[0].device, equals('ALARM:ONE'));
    });
  });
}
