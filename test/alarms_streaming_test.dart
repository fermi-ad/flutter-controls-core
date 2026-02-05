import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_controls_core/src/service/acsys_service.dart';
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
      final List<({String? key, String value})> alarmMessages = [
        (key: 'alarm_1', value: '{"status":"ACTIVE"}'),
        (key: 'alarm_2', value: '{"status":"CLEAR"}'),
        (key: null, value: '{"status":"UNKNOWN"}'),
      ];

      final alarmResponses =
          alarmMessages
              .map(
                (kv) =>
                    createMockStreamAlarmResponse(key: kv.key, value: kv.value),
              )
              .toList();

      setupMockClientStreamResponse(mockClient, alarmResponses);

      // Act
      final stream = service.monitorAlarms();
      final alarms = await stream.toList();

      // Assert
      expect(alarms, hasLength(3));
      for (var i = 0; i < alarmMessages.length; i++) {
        expect(alarms[i].key, equals(alarmMessages[i].key));
        expect(alarms[i].value, equals(alarmMessages[i].value));
      }
    });

    test('skips loading state responses', () async {
      // Arrange
      final alarmMessages = [
        (key: 'alarm_1', value: '{"status":"ACTIVE"}'),
        (key: 'alarm_2', value: '{"status":"CLEAR"}'),
      ];

      final alarmResponses = [
        createMockLoadingResponse<GStreamAlarmsData, GStreamAlarmsVars>(),
        ...alarmMessages.expand(
          (kv) => [createMockStreamAlarmResponse(key: kv.key, value: kv.value)],
        ),
        createMockLoadingResponse<GStreamAlarmsData, GStreamAlarmsVars>(),
      ];

      setupMockClientStreamResponse(mockClient, alarmResponses);

      // Act
      final stream = service.monitorAlarms();
      final alarms = await stream.toList();

      // Assert - should only have non-loading responses
      expect(alarms, hasLength(2));

      for (var i = 0; i < alarmMessages.length; i++) {
        final expected = alarmMessages[i];
        expect(alarms[i].key, equals(expected.key));
        expect(alarms[i].value, equals(expected.value));
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
          key: 'alarm_1',
          value: '{"status":"FIRST"}',
        ),
        createMockStreamAlarmResponse(
          key: 'alarm_2',
          value: '{"status":"SECOND"}',
        ),
      ];

      setupMockClientStreamResponse(mockClient, alarmEvents);

      // Act
      final stream = service.monitorAlarms();
      final initialAlarms = await stream.toList();

      // After stream completes, listening again should work on the new stream
      final thirdAlarmEvent = createMockStreamAlarmResponse(
        key: 'alarm_3',
        value: '{"status":"THIRD"}',
      );
      setupMockClientStreamResponse(mockClient, [thirdAlarmEvent]);

      final moreAlarms = await service.monitorAlarms().toList();

      // Assert
      expect(initialAlarms, hasLength(2));
      expect(moreAlarms, hasLength(1));
      expect(moreAlarms.first.key, equals('alarm_3'));
    });

    test('handles rapid succession of alarm updates', () async {
      // Arrange - simulate rapid updates
      final alarmEvents = List.generate(
        100,
        (i) => createMockStreamAlarmResponse(
          key: 'rapid_$i',
          value: '{"index":$i}',
        ),
      );

      setupMockClientStreamResponse(mockClient, alarmEvents);

      // Act
      final stream = service.monitorAlarms();
      final alarms = await stream.toList();

      // Assert
      expect(alarms, hasLength(100));
      for (var i = 0; i < 100; i++) {
        expect(alarms[i].key, equals('rapid_$i'));
        expect(alarms[i].value, equals('{"index":$i}'));
      }
    });
  });
}
