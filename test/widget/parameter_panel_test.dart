import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_controls_core/flutter_controls_core.dart'
    show ParameterPanel;

void main() {
  group('ParameterPanel (smoke)', () {
    testWidgets('builds with title and contents', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ParameterPanel(
              title: 'Device Status',
              contents: [
                Text('Temperature: 25 C'),
                Text('Pressure: 101.3 kPa'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Device Status'), findsOneWidget);
      expect(find.text('Temperature: 25 C'), findsOneWidget);
      expect(find.text('Pressure: 101.3 kPa'), findsOneWidget);
    });
  });
}
