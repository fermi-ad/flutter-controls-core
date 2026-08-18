import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_controls_core/flutter_controls_core.dart';

void main() {
  group('ParameterPanelRow (smoke)', () {
    testWidgets('builds with static value', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ParameterPanelRow(
              label: 'Temperature',
              value: '25',
              units: 'C',
            ),
          ),
        ),
      );

      expect(find.text('Temperature'), findsOneWidget);
      expect(find.text('25'), findsOneWidget);
      expect(find.text('C'), findsOneWidget);
    });

    testWidgets('builds with valueBuilder', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ParameterPanelRow(
              label: 'Pressure',
              valueBuilder: (_) => '101.3',
              units: 'kPa',
            ),
          ),
        ),
      );

      expect(find.text('Pressure'), findsOneWidget);
      expect(find.text('101.3'), findsOneWidget);
      expect(find.text('kPa'), findsOneWidget);
    });

    testWidgets('builds in editable mode (onValueChanged provided)', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ParameterPanelRow(
              label: 'Setpoint',
              value: '10',
              units: 'A',
              onValueChanged: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('Setpoint'), findsOneWidget);
      expect(find.text('10'), findsOneWidget);
      expect(find.text('A'), findsOneWidget);
    });
  });
}
