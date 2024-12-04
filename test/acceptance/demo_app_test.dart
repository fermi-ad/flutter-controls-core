import 'package:flutter/material.dart';
import 'package:flutter_controls_core/test_harness/setup.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';

import 'package:flutter_controls_core/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Smoke tests', () {
    testWidgets("Start app, title and menu should be displayed",
        (WidgetTester tester) async {
      // Given a desktop screen size
      await setDesktopScreenSize(tester);

      // When I launch the plotting application
      await startDemoApp(tester);

      // Then the app title should be displayed
      assertAppBarTitleIsVisible();

      // ... and so is the menu drawer
      assertMenuIcon(isVisible: true);
    });
  });

  group('Authentication navigation', () {
    testWidgets("Login, should display Test User as logged-in user",
        (WidgetTester tester) async {
      // Given the application has been started and I am not logged in
      await setDesktopScreenSize(tester);
      await startDemoApp(tester);

      // When I login
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Login"));
      await tester.pumpAndSettle();

      // Then the user "Test User" is displayed in the menu header
      expect(
          find.descendant(
              of: find.byType(Drawer), matching: find.text("Test User")),
          findsOneWidget);
    });
  });
}

Future<void> startDemoApp(WidgetTester tester) async {
  await app.main();
  await tester.pumpAndSettle();
}

void assertAppBarTitleIsVisible() =>
    expect(find.text("Fermi Controls Demo App"), findsOneWidget);

void assertMenuIcon({required bool isVisible}) =>
    expect(find.byIcon(Icons.menu), isVisible ? findsOneWidget : findsNothing);
