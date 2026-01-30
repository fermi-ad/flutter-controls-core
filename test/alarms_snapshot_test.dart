import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_controls_core/src/service/acsys_service.dart';
import 'alarms_helpers.dart';

void main() {
  group('ACSysServiceAPI.getAlarmsSnapshot', () {
    test('successfully returns list of alarms from snapshot', () async {
      // Arrange
      final mockService = MockACSysService(
        alarmsSnapshot: [
          const AlarmMessage(key: 'alarm_1', value: 'ALARM_ON'),
          const AlarmMessage(key: 'alarm_2', value: 'ALARM_OFF'),
          const AlarmMessage(key: null, value: 'ALARM_UNKNOWN'),
        ],
      );

      // Act
      final alarms = await mockService.getAlarmsSnapshot();

      // Assert
      expect(alarms, isNotEmpty);
      expect(alarms, hasLength(3));
      expect(alarms[0].key, equals('alarm_1'));
      expect(alarms[0].value, equals('ALARM_ON'));
      expect(alarms[1].key, equals('alarm_2'));
      expect(alarms[1].value, equals('ALARM_OFF'));
      expect(alarms[2].key, isNull);
      expect(alarms[2].value, equals('ALARM_UNKNOWN'));
    });

    test('returns empty list when no alarms are present', () async {
      // Arrange
      final mockService = MockACSysService(alarmsSnapshot: []);

      // Act
      final alarms = await mockService.getAlarmsSnapshot();

      // Assert
      expect(alarms, isEmpty);
    });

    test('throws ACSysGraphQLException on GraphQL errors', () async {
      // Arrange
      final mockService = ThrowingACSysService(
        exception: const ACSysGraphQLException('Invalid query'),
      );

      // Act & Assert
      expect(
        () => mockService.getAlarmsSnapshot(),
        throwsA(isA<ACSysGraphQLException>()),
      );
    });

    test('throws exception on link errors', () async {
      // Arrange
      final mockService = ThrowingACSysService(
        exception: const ACSysLinkException('Network error'),
      );

      // Act & Assert
      expect(
        () => mockService.getAlarmsSnapshot(),
        throwsA(isA<ACSysLinkException>()),
      );
    });

    test('throws ACSysGraphQLException when response has no data', () async {
      // Arrange
      final mockService = ThrowingACSysService(
        exception: const ACSysGraphQLException('No data in response'),
      );

      // Act & Assert
      expect(
        () => mockService.getAlarmsSnapshot(),
        throwsA(isA<ACSysGraphQLException>()),
      );
    });

    test('converts AlarmMessage objects correctly', () async {
      // Arrange
      final mockService = MockACSysService(
        alarmsSnapshot: [
          const AlarmMessage(key: 'test_key', value: 'test_value'),
        ],
      );

      // Act
      final alarms = await mockService.getAlarmsSnapshot();

      // Assert
      expect(alarms.first, isA<AlarmMessage>());
      expect(alarms.first.key, equals('test_key'));
      expect(alarms.first.value, equals('test_value'));
    });

    test('handles multiple alarms in snapshot', () async {
      // Arrange
      final mockService = MockACSysService(
        alarmsSnapshot: [
          const AlarmMessage(key: 'alarm_1', value: 'value_1'),
          const AlarmMessage(key: 'alarm_2', value: 'value_2'),
          const AlarmMessage(key: 'alarm_3', value: 'value_3'),
        ],
      );

      // Act
      final alarms = await mockService.getAlarmsSnapshot();

      // Assert
      expect(alarms, hasLength(3));
      expect(alarms[0].key, equals('alarm_1'));
      expect(alarms[1].key, equals('alarm_2'));
      expect(alarms[2].key, equals('alarm_3'));
    });
  });
}
