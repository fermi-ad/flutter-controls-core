import 'package:flutter_controls_core/test_harness/setup.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';

import 'package:flutter_controls_core/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Smoke tests', () {
    testWidgets("Start app, title should be displayed",
        (WidgetTester tester) async {
      // Given a desktop screen size
      await setDesktopScreenSize(tester);

      // When I launch the plotting application
      await startDemoApp(tester);

      // Then the app title should be displayed
      assertAppBarTitleIsVisible();
    });
  });
}

Future<void> startDemoApp(WidgetTester tester) async {
  await app.main();
  await tester.pumpAndSettle();
}

void assertAppBarTitleIsVisible() =>
    expect(find.text("Fermi Controls Demo App"), findsOneWidget);
