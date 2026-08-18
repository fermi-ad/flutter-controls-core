import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_controls_core/flutter_controls_core.dart'
    show NonAuthRouterApp, StandardApp;
import 'package:go_router/go_router.dart' show GoRoute, GoRouter;

void main() {
  group('App scaffolds (smoke)', () {
    testWidgets('StandardApp builds (no auth)', (tester) async {
      await tester.pumpWidget(
        StandardApp<ChangeNotifier?>(
          title: 'Test App',
          body: const Center(child: Text('Hello')),
        ),
      );

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('NonAuthRouterApp builds', (tester) async {
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Home'))),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: NonAuthRouterApp(title: 'Router App', router: router),
        ),
      );

      // Let router settle.
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
    });
  });
}
