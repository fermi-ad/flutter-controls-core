import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_controls_core/src/service/acsys_service.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/DPM.schema.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.var.gql.dart';
import 'helpers.dart';

void main() {
  setUpAll(() {
    setupAlarmsMockFallbacks();
  });

  group('ACSysService.monitorAlarms', () {
    late MockClient mockClient;
    late ACSysService service;

    setUp(() {
      mockClient = MockClient();

      // Create service instance with mocked subscription client
      service = ACSysService(
        // The client we're actually testing.
        alarmsSubscriptionClient: mockClient,
        // Throwaway clients to override the defaults.
        queryClient: MockClient(),
        subscriptionClient: MockClient(),
        devDbClient: MockClient(),
        alarmsQueryClient: MockClient(),
      );
    });

    test('yields AlarmMessage for each stream event', () async {
      // Arrange
      final alarmRecords = [
        defaultAlarmRecord,
        (
          device: 'TEST:DEVICE:2',
          source: GSource.DIGITAL,
          state: GState.BYPASSED,
          severity: GSeverity.HIGH,
          acknowledgeable: true,
          time: '2024-01-02T00:00:00.000Z',
          epicsType: 'epics-2',
          user: 'user-2',
          wake: '2024-01-02T01:00:00.000Z',
        ),
        (
          device: 'TEST:DEVICE:3',
          source: GSource.EPICS,
          state: GState.ACKNOWLEDGED,
          severity: GSeverity.LOW,
          acknowledgeable: false,
          time: null,
          epicsType: 'epics-3',
          user: 'user-3',
          wake: null,
        ),
      ];

      final alarmResponses =
          alarmRecords
              .map((alarm) => createMockStreamAlarmResponse(alarm: alarm))
              .toList();

      setupMockClientStreamResponse(mockClient, alarmResponses);

      // Act
      final stream = service.monitorAlarms();
      final alarms = await stream.toList();

      // Assert
      expect(alarms, hasLength(3));
      for (var i = 0; i < alarmRecords.length; i++) {
        final expectedTime =
            alarmRecords[i].time != null
                ? DateTime.parse(alarmRecords[i].time!)
                : DateTime(0);
        final expectedWake =
            alarmRecords[i].wake != null
                ? DateTime.parse(alarmRecords[i].wake!)
                : DateTime(0);

        expect(alarms[i].device, equals(alarmRecords[i].device));
        expect(
          alarms[i].source,
          equals(_convertSourceForTest(alarmRecords[i].source)),
        );
        expect(
          alarms[i].state,
          equals(_convertStateForTest(alarmRecords[i].state)),
        );
        expect(
          alarms[i].severity,
          equals(_convertSeverityForTest(alarmRecords[i].severity)),
        );
        expect(
          alarms[i].acknowledgeable,
          equals(alarmRecords[i].acknowledgeable),
        );
        expect(alarms[i].time, equals(expectedTime));
        expect(alarms[i].epicsType, equals(alarmRecords[i].epicsType));
        expect(alarms[i].user, equals(alarmRecords[i].user));
        expect(alarms[i].wake, equals(expectedWake));
      }
    });

    test('skips loading state responses', () async {
      // Arrange
      final alarmRecords = [
        defaultAlarmRecord,
        (
          device: 'TEST:DEVICE:2',
          source: GSource.DIGITAL,
          state: GState.BYPASSED,
          severity: GSeverity.HIGH,
          acknowledgeable: true,
          time: '2024-01-02T00:00:00.000Z',
          epicsType: 'epics-2',
          user: 'user-2',
          wake: '2024-01-02T01:00:00.000Z',
        ),
      ];

      final alarmResponses = [
        createMockLoadingResponse<GStreamAlarmsData, GStreamAlarmsVars>(),
        ...alarmRecords.expand(
          (alarm) => [createMockStreamAlarmResponse(alarm: alarm)],
        ),
        createMockLoadingResponse<GStreamAlarmsData, GStreamAlarmsVars>(),
      ];

      setupMockClientStreamResponse(mockClient, alarmResponses);

      // Act
      final stream = service.monitorAlarms();
      final alarms = await stream.toList();

      // Assert - should only have non-loading responses
      expect(alarms, hasLength(2));

      for (var i = 0; i < alarmRecords.length; i++) {
        final expected = alarmRecords[i];
        expect(alarms[i].device, equals(expected.device));
        expect(alarms[i].acknowledgeable, equals(expected.acknowledgeable));
        expect(alarms[i].epicsType, equals(expected.epicsType));
      }
    });

    test('propagates GraphQL errors as exceptions', () async {
      // Arrange
      final graphQLError = MockGraphQLError();
      final errorResponse =
          createMockErrorResponse<GStreamAlarmsData, GStreamAlarmsVars>(
            graphqlErrors: [graphQLError],
          );

      setupMockClientStreamResponse(mockClient, [errorResponse]);

      // Act
      final stream = service.monitorAlarms();

      // Assert
      expect(() => stream.toList(), throwsA(isA<ACSysGraphQLException>()));
    });

    test('propagates link errors as exceptions', () async {
      // Arrange
      final linkException = MockLinkException();
      final errorResponse =
          createMockLinkErrorResponse<GStreamAlarmsData, GStreamAlarmsVars>(
            linkException: linkException,
          );

      setupMockClientStreamResponse(mockClient, [errorResponse]);

      // Act
      final stream = service.monitorAlarms();

      // Assert
      expect(() => stream.toList(), throwsA(isA<MockLinkException>()));
    });

    test(
      'includes errors in filtered responses (even with loading state)',
      () async {
        // Arrange
        final errorResponse =
            MockOperationResponse<GStreamAlarmsData, GStreamAlarmsVars>();

        when(() => errorResponse.loading).thenReturn(true);
        when(() => errorResponse.hasErrors).thenReturn(true);

        setupMockClientStreamResponse(mockClient, [errorResponse]);

        // Act
        final stream = service.monitorAlarms();

        // Assert
        expect(() => stream.toList(), throwsA(isA<ACSysException>()));
      },
    );

    test('continues emitting when new events come in', () async {
      // Arrange
      final alarmEvents = [
        createMockStreamAlarmResponse(
          alarm: (
            device: 'TEST:DEVICE:1',
            source: GSource.ANALOG,
            state: GState.OK,
            severity: GSeverity.LOW,
            acknowledgeable: false,
            time: '2024-01-01T00:00:00.000Z',
            epicsType: 'FIRST',
            user: 'user-1',
            wake: '2024-01-01T00:30:00.000Z',
          ),
        ),
        createMockStreamAlarmResponse(
          alarm: (
            device: 'TEST:DEVICE:2',
            source: GSource.DIGITAL,
            state: GState.LATCHED,
            severity: GSeverity.HIGH,
            acknowledgeable: true,
            time: '2024-01-02T00:00:00.000Z',
            epicsType: 'SECOND',
            user: 'user-2',
            wake: '2024-01-02T00:30:00.000Z',
          ),
        ),
      ];

      setupMockClientStreamResponse(mockClient, alarmEvents);

      // Act
      final stream = service.monitorAlarms();
      final initialAlarms = await stream.toList();

      // After stream completes, listening again should work on the new stream
      final thirdAlarmEvent = createMockStreamAlarmResponse(
        alarm: (
          device: 'TEST:DEVICE:3',
          source: GSource.EPICS,
          state: GState.ACKNOWLEDGED,
          severity: GSeverity.LOW,
          acknowledgeable: false,
          time: '2024-01-03T00:00:00.000Z',
          epicsType: 'THIRD',
          user: 'user-3',
          wake: '2024-01-03T00:30:00.000Z',
        ),
      );
      setupMockClientStreamResponse(mockClient, [thirdAlarmEvent]);

      final moreAlarms = await service.monitorAlarms().toList();

      // Assert
      expect(initialAlarms, hasLength(2));
      expect(moreAlarms, hasLength(1));
      expect(moreAlarms.first.device, equals('TEST:DEVICE:3'));
    });

    test('handles rapid succession of alarm updates', () async {
      // Arrange - simulate rapid updates
      final alarmEvents = List.generate(
        100,
        (i) => createMockStreamAlarmResponse(
          alarm: (
            device: 'TEST:DEVICE:$i',
            source: GSource.ANALOG,
            state: GState.OK,
            severity: GSeverity.LOW,
            acknowledgeable: false,
            time: '2024-01-01T00:00:00.000Z',
            epicsType: 'rapid_$i',
            user: 'user-$i',
            wake: '2024-01-01T01:00:00.000Z',
          ),
        ),
      );

      setupMockClientStreamResponse(mockClient, alarmEvents);

      // Act
      final stream = service.monitorAlarms();
      final alarms = await stream.toList();

      // Assert
      expect(alarms, hasLength(100));
      for (var i = 0; i < 100; i++) {
        expect(alarms[i].device, equals('TEST:DEVICE:$i'));
        expect(alarms[i].epicsType, equals('rapid_$i'));
      }
    });
  });
}

AlarmSource _convertSourceForTest(GSource source) => switch (source) {
  GSource.ANALOG => AlarmSource.analog,
  GSource.DIGITAL => AlarmSource.digital,
  GSource.EPICS => AlarmSource.epics,
  _ => AlarmSource.unknown,
};

AlarmState _convertStateForTest(GState state) => switch (state) {
  GState.OK => AlarmState.ok,
  GState.BYPASSED => AlarmState.bypassed,
  GState.LATCHED => AlarmState.latched,
  GState.ACKNOWLEDGED => AlarmState.acknowledged,
  GState.UNBYPASSED => AlarmState.unbypassed,
  _ => AlarmState.unknown,
};

AlarmSeverity _convertSeverityForTest(GSeverity severity) => switch (severity) {
  GSeverity.LOW => AlarmSeverity.low,
  GSeverity.HIGH => AlarmSeverity.high,
  _ => AlarmSeverity.unknown,
};
