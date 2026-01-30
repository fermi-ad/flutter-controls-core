import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_controls_core/src/service/acsys_service.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.data.gql.dart';
import 'package:flutter_controls_core/src/service/acsys/schema/__generated__/stream_alarms.var.gql.dart';
import 'alarms_helpers.dart';

void main() {
  group('ACSysService.monitorAlarms', () {
    late MockClient mockClient;
    late ACSysService service;

    setUp(() {
      mockClient = MockClient();

      // Create service instance
      service = ACSysService(port: 8000);

      // Register fallback values for mocktail
      registerFallbackValue(
        MockOperationResponse<GStreamAlarmsData, GStreamAlarmsVars>(),
      );
    });

    test('yields AlarmMessage for each stream event', () async {
      // Arrange
      final alarmEvents = [
        createMockStreamAlarmResponse(key: 'alarm_1', value: 'ACTIVE'),
        createMockStreamAlarmResponse(key: 'alarm_2', value: 'CLEAR'),
        createMockStreamAlarmResponse(key: null, value: 'UNKNOWN'),
      ];

      when(
        () => mockClient.request(any()),
      ).thenAnswer((_) => Stream.fromIterable(alarmEvents));

      // Act
      final stream = service.monitorAlarms();
      final alarms = await stream.toList();

      // Assert
      expect(alarms, hasLength(3));
      expect(alarms[0].key, equals('alarm_1'));
      expect(alarms[0].value, equals('ACTIVE'));
      expect(alarms[1].key, equals('alarm_2'));
      expect(alarms[1].value, equals('CLEAR'));
      expect(alarms[2].key, isNull);
      expect(alarms[2].value, equals('UNKNOWN'));
    });

    test('skips loading state responses', () async {
      // Arrange
      final alarmEvents = [
        createMockLoadingResponse<GStreamAlarmsData, GStreamAlarmsVars>(),
        createMockStreamAlarmResponse(key: 'alarm_1', value: 'ACTIVE'),
        createMockLoadingResponse<GStreamAlarmsData, GStreamAlarmsVars>(),
        createMockStreamAlarmResponse(key: 'alarm_2', value: 'CLEAR'),
      ];

      when(
        () => mockClient.request(any()),
      ).thenAnswer((_) => Stream.fromIterable(alarmEvents));

      // Act
      final stream = service.monitorAlarms();
      final alarms = await stream.toList();

      // Assert - should only have non-loading responses
      expect(alarms, hasLength(2));
      expect(alarms[0].key, equals('alarm_1'));
      expect(alarms[1].key, equals('alarm_2'));
    });

    test('emits multiple alarms from a single subscription', () async {
      // Arrange
      final alarmSequence = List.generate(
        5,
        (index) => createMockStreamAlarmResponse(
          key: 'alarm_$index',
          value: 'STATUS_$index',
        ),
      );

      when(
        () => mockClient.request(any()),
      ).thenAnswer((_) => Stream.fromIterable(alarmSequence));

      // Act
      final stream = service.monitorAlarms();
      final alarms = await stream.toList();

      // Assert
      expect(alarms, hasLength(5));
      for (var i = 0; i < 5; i++) {
        expect(alarms[i].key, equals('alarm_$i'));
        expect(alarms[i].value, equals('STATUS_$i'));
      }
    });

    test(
      'returns an AlarmMessage with null key when key is not provided',
      () async {
        // Arrange
        final mockResponse = createMockStreamAlarmResponse(
          key: null,
          value: 'ALARM_VALUE',
        );

        when(
          () => mockClient.request(any()),
        ).thenAnswer((_) => Stream.value(mockResponse));

        // Act
        final stream = service.monitorAlarms();
        final alarms = await stream.toList();

        // Assert
        expect(alarms, hasLength(1));
        expect(alarms.first.key, isNull);
        expect(alarms.first.value, equals('ALARM_VALUE'));
      },
    );

    test('returns stream that can be listened to multiple times', () async {
      // Arrange
      final mockResponse = createMockStreamAlarmResponse(
        key: 'test_alarm',
        value: 'TEST_VALUE',
      );

      when(
        () => mockClient.request(any()),
      ).thenAnswer((_) => Stream.value(mockResponse));

      // Act
      final stream = service.monitorAlarms();
      final firstListen = await stream.toList();

      // Reset mock for second listen
      when(
        () => mockClient.request(any()),
      ).thenAnswer((_) => Stream.value(mockResponse));

      final secondListen = await stream.toList();

      // Assert - both should work independently
      expect(firstListen, hasLength(1));
      expect(secondListen, hasLength(1));
      expect(firstListen.first.key, equals('test_alarm'));
    });

    test('propagates GraphQL errors as exceptions', () async {
      // Arrange
      final graphQLError = createMockGraphQLError(
        message: 'Subscription failed',
      );
      final errorResponse =
          createMockErrorResponse<GStreamAlarmsData, GStreamAlarmsVars>(
            graphqlErrors: [graphQLError],
          );

      when(
        () => mockClient.request(any()),
      ).thenAnswer((_) => Stream.value(errorResponse));

      // Act
      final stream = service.monitorAlarms();

      // Assert
      expect(() => stream.toList(), throwsA(isA<ACSysGraphQLException>()));
    });

    test('propagates link errors as exceptions', () async {
      // Arrange
      final linkException = Exception('WebSocket connection failed');
      final errorResponse =
          createMockLinkErrorResponse<GStreamAlarmsData, GStreamAlarmsVars>(
            linkException: linkException,
          );

      when(
        () => mockClient.request(any()),
      ).thenAnswer((_) => Stream.value(errorResponse));

      // Act
      final stream = service.monitorAlarms();

      // Assert
      expect(() => stream.toList(), throwsA(isA<ACSysGraphQLException>()));
    });

    test(
      'includes errors in filtered responses (even with loading state)',
      () async {
        // Arrange
        final errorResponse =
            MockOperationResponse<GStreamAlarmsData, GStreamAlarmsVars>();

        when(() => errorResponse.loading).thenReturn(true);
        when(() => errorResponse.hasErrors).thenReturn(true);

        when(
          () => mockClient.request(any()),
        ).thenAnswer((_) => Stream.value(errorResponse));

        // Act
        final stream = service.monitorAlarms();

        // Assert - should throw because of the filter that includes errors
        expect(() => stream.toList(), throwsA(isA<ACSysGraphQLException>()));
      },
    );

    test('stops emitting after stream completes', () async {
      // Arrange
      final alarmEvents = [
        createMockStreamAlarmResponse(key: 'alarm_1', value: 'FIRST'),
        createMockStreamAlarmResponse(key: 'alarm_2', value: 'SECOND'),
      ];

      when(
        () => mockClient.request(any()),
      ).thenAnswer((_) => Stream.fromIterable(alarmEvents));

      // Act
      final stream = service.monitorAlarms();
      final alarms = await stream.toList();

      // After stream completes, listening again should work on the new stream
      when(() => mockClient.request(any())).thenAnswer(
        (_) => Stream.value(
          createMockStreamAlarmResponse(key: 'alarm_3', value: 'THIRD'),
        ),
      );

      final secondAlarms = await service.monitorAlarms().toList();

      // Assert
      expect(alarms, hasLength(2));
      expect(secondAlarms, hasLength(1));
      expect(secondAlarms.first.key, equals('alarm_3'));
    });

    test('handles rapid succession of alarm updates', () async {
      // Arrange - simulate rapid updates
      final alarmEvents = List.generate(
        100,
        (i) =>
            createMockStreamAlarmResponse(key: 'rapid_$i', value: 'VALUE_$i'),
      );

      when(
        () => mockClient.request(any()),
      ).thenAnswer((_) => Stream.fromIterable(alarmEvents));

      // Act
      final stream = service.monitorAlarms();
      final alarms = await stream.toList();

      // Assert
      expect(alarms, hasLength(100));
      for (var i = 0; i < 100; i++) {
        expect(alarms[i].key, equals('rapid_$i'));
        expect(alarms[i].value, equals('VALUE_$i'));
      }
    });

    test(
      'correctly implements expand() semantics with sync* generator',
      () async {
        // Arrange - ensure expand doesn't duplicate events
        final mockResponse = createMockStreamAlarmResponse(
          key: 'single_alarm',
          value: 'SINGLE_VALUE',
        );

        when(
          () => mockClient.request(any()),
        ).thenAnswer((_) => Stream.value(mockResponse));

        // Act
        final stream = service.monitorAlarms();
        final alarms = await stream.toList();

        // Assert - should yield exactly one AlarmMessage per OperationResponse
        expect(alarms, hasLength(1));
        expect(alarms.first.key, equals('single_alarm'));
        expect(alarms.first.value, equals('SINGLE_VALUE'));
      },
    );
  });
}
